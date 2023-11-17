// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension FilterFeedbackBarItem where LeftIcon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder rightIcon: () -> RightIcon,
		isSelected: Bool
    ) {
        self.init(
            leftIcon: { EmptyView() },
			title: title,
			rightIcon: rightIcon,
			isSelected: isSelected
        )
    }
}

extension FilterFeedbackBarItem where RightIcon == EmptyView {
    public init(
    @ViewBuilder leftIcon: () -> LeftIcon,
		@ViewBuilder title: () -> Title,
		isSelected: Bool
    ) {
        self.init(
            leftIcon: leftIcon,
			title: title,
			rightIcon: { EmptyView() },
			isSelected: isSelected
        )
    }
}

extension FilterFeedbackBarItem where LeftIcon == EmptyView, RightIcon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		isSelected: Bool
    ) {
        self.init(
            leftIcon: { EmptyView() },
			title: title,
			rightIcon: { EmptyView() },
			isSelected: isSelected
        )
    }
}
