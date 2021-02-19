import FioriSwiftUICore
import Foundation
import SwiftUI

struct FioriButtonExample: View {
    var body: some View {
        Button(action: { print("add tapped") }, label: {
            HStack {
                Image(systemName: "plus")
                Text("Add")
            }
        })
            .buttonStyle(FioriButtonStyle())
//            .disabled(true)
            .padding()
    }
}
