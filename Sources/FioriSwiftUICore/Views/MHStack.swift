import SwiftUI

/// A view that arranges its children in a multiple horizontal lines.
///
/// The following example shows a simple horizontal stack of five text views:
///
///     MHStack(spacing: 10, lineSpacing: 8) {
///         Tag("Started")
///
///         Tag("PM01")
///
///         Tag("103-Repair")
///     }
public struct MHStack<T: TagViewList>: View {
    let tags: T
    let spacing: CGFloat
    let lineSpacing: CGFloat
    
    @Environment(\.tagLimit) var tagLimit
    @Environment(\.tagLineLimit) var tagLineLimit
    @Environment(\.moreTagBuilder) var moreTagBuilder
    
    @State private var mainViewSize = CGSize(width: -1, height: -1)
    @State private var measuredSizes: [Int: CGSize] = [:]
    @State private var moreTagSize: CGSize = .init(width: 40, height: 20)
    
    init(tags: T, spacing: CGFloat? = 10, lineSpacing: CGFloat? = 10) {
        self.tags = tags
        self.spacing = spacing!
        self.lineSpacing = lineSpacing!
    }
    
    /// Creates a multiple line horizontal stack with the given spacing and line spacing
    ///
    /// - Parameters:
    ///   - spacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - lineSpacing: The distance between adjacent subviews, or `nil` if you
    ///     want the stack to choose a default distance for each pair of
    ///     subviews.
    ///   - content: A view builder that creates the content of this stack.
    public init(spacing: CGFloat? = 8, lineSpacing: CGFloat? = 10, @TagBuilder content: () -> T) {
        self.tags = content()
        self.spacing = spacing!
        self.lineSpacing = lineSpacing!
    }
    
    public var body: some View {
        if self.tagCount == 0 {
            EmptyView()
        } else {
            GeometryReader { geometry in
                self.makeBody(in: geometry.size.width)
            }
            .frame(height: self.mainViewSize.height < 0 ? nil : self.mainViewSize.height)
        }
    }
    
    private var tagCount: Int {
        guard let limit = self.tagLimit else { return self.tags.count }
        return min(limit, self.tags.count)
    }
    
    func makeBody(in containerWidth: CGFloat) -> some View {
        var layouts: [ItemLayout] = []
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var currentLineMaxHeight: CGFloat = 0
        var currentLine = 0
        
        let maxLines = self.tagLineLimit ?? Int.max
        let hasLimit = self.tagLineLimit != nil
        
        // Use the actual measured MoreTag size
        let currentMoreTagSize = self.moreTagSize.width > 0 ? self.moreTagSize : CGSize(width: 40, height: 20)
        
        for index in 0 ..< self.tagCount {
            let tagSize = self.measuredSizes[index] ?? CGSize(width: 60, height: 30)
            
            // --- Step 1: Handle oversized tags (occupy entire line) ---
            if tagSize.width > containerWidth {
                if currentX > 0 {
                    currentX = 0
                    currentY += currentLineMaxHeight + self.lineSpacing
                    currentLineMaxHeight = 0
                    currentLine += 1
                }
                
                if hasLimit, currentLine >= maxLines {
                    break
                }
                
                layouts.append(ItemLayout(index: index, x: containerWidth / 2, y: currentY + tagSize.height / 2, size: tagSize))
                
                currentY += tagSize.height + self.lineSpacing
                currentX = 0
                currentLineMaxHeight = 0
                currentLine += 1
                continue
            }
            
            // --- Step 2: Check if line break is needed ---
            if currentX > 0, (currentX + tagSize.width) > containerWidth {
                currentX = 0
                currentY += currentLineMaxHeight + self.lineSpacing
                currentLineMaxHeight = 0
                currentLine += 1
            }
            
            // --- Step 3: Check if maximum line count is exceeded ---
            if hasLimit, currentLine >= maxLines {
                break
            }
            
            // --- Step 4: Special logic - Last line handling (reserve space for MoreTag) ---
            let isLastLine = hasLimit && (currentLine + 1 == maxLines)
            
            if isLastLine {
                // Check if MoreTag is wider than container
                if currentMoreTagSize.width >= containerWidth {
                    // If MoreTag is wider than container, only show MoreTag on this line
                    layouts.append(ItemLayout(index: -1, x: currentMoreTagSize.width / 2, y: currentY + currentMoreTagSize.height / 2, size: currentMoreTagSize))
                    break
                }
                
                // Calculate remaining available width on current line
                // If we place the current tag, is there enough space for (spacing + MoreTag)?
                let spaceAfterTag = containerWidth - (currentX + tagSize.width)
                let needSpacing = currentX > 0 ? self.spacing : 0
                
                // If (remaining space) < (MoreTag width + spacing), we can't fit this tag
                if spaceAfterTag < (currentMoreTagSize.width + needSpacing) {
                    // Don't display current tag, break.
                    break
                }
                
                // If it fits, place it normally
                layouts.append(ItemLayout(index: index, x: currentX + tagSize.width / 2, y: currentY + tagSize.height / 2, size: tagSize))
                currentLineMaxHeight = max(currentLineMaxHeight, tagSize.height)
                currentX += tagSize.width + self.spacing
            } else {
                // --- Step 5: Not the last line, place normally ---
                layouts.append(ItemLayout(index: index, x: currentX + tagSize.width / 2, y: currentY + tagSize.height / 2, size: tagSize))
                currentLineMaxHeight = max(currentLineMaxHeight, tagSize.height)
                currentX += tagSize.width + self.spacing
            }
        }
        
        // --- Step 6: Handle final placement of MoreTag ---
        let hiddenCount = self.tagCount - layouts.filter { $0.index >= 0 }.count
        if hiddenCount > 0 {
            let hasMoreTag = layouts.contains { $0.index == -1 }
            
            if !hasMoreTag {
                var moreX: CGFloat = 0
                var moreY: CGFloat = 0
                
                if let lastLayout = layouts.last {
                    let lastTagRight = lastLayout.x + lastLayout.size.width / 2
                    moreX = lastTagRight + self.spacing + currentMoreTagSize.width / 2
                    moreY = lastLayout.y
                } else {
                    moreX = currentMoreTagSize.width / 2
                    moreY = currentY + currentMoreTagSize.height / 2
                }
                
                // Boundary protection
                if moreX + currentMoreTagSize.width / 2 > containerWidth {
                    moreX = containerWidth - currentMoreTagSize.width / 2
                }
                
                layouts.append(ItemLayout(index: -1, x: moreX, y: moreY, size: currentMoreTagSize))
            }
        }
        
        // Calculate final height
        let finalHeight = layouts.map { $0.y + $0.size.height / 2 }.max() ?? 0
        self.updateMainViewSize(width: containerWidth, height: finalHeight)
        
        return self.renderContent(layouts: layouts, moreTagSize: currentMoreTagSize)
    }
    
    private func updateMainViewSize(width: CGFloat, height: CGFloat) {
        DispatchQueue.main.async {
            self.mainViewSize = CGSize(width: width, height: height)
        }
    }
    
    private func renderContent(layouts: [ItemLayout], moreTagSize: CGSize) -> some View {
        ZStack(alignment: .topLeading) {
            ForEach(layouts, id: \.index) { layout in
                if layout.index >= 0 {
                    Measurable(content: {
                        self.tags.view(at: layout.index)
                    }) { size in
                        self.measuredSizes[layout.index] = size
                    }
                    .position(x: layout.x, y: layout.y)
                } else {
                    self.moreTagBuilder.build(self.tagCount - layouts.filter { $0.index >= 0 }.count)
                        .fixedSize()
                        .background(
                            GeometryReader { geo in
                                Color.clear
                                    .onAppear {
                                        if geo.size != self.moreTagSize {
                                            self.moreTagSize = geo.size
                                        }
                                    }
                            }
                        )
                        .position(x: layout.x, y: layout.y)
                }
            }
        }
    }
    
    struct ItemLayout: Identifiable {
        let id = UUID()
        let index: Int
        let x, y: CGFloat
        let size: CGSize
    }
}

// MARK: - Measurable View

struct Measurable<Content: View>: View {
    let content: Content
    let onMeasure: (CGSize) -> Void
    
    init(@ViewBuilder content: () -> Content, onMeasure: @escaping (CGSize) -> Void) {
        self.content = content()
        self.onMeasure = onMeasure
    }
    
    var body: some View {
        self.content
            .background(
                GeometryReader { geo in
                    Color.clear
                        .preference(key: SizePreferenceKey.self, value: geo.size)
                }
            )
            .onPreferenceChange(SizePreferenceKey.self) { size in
                DispatchQueue.main.async {
                    self.onMeasure(size)
                }
            }
    }
}
