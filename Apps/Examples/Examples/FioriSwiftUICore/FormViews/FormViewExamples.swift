import SwiftUI

struct FormViewExamples: View {
    var body: some View {
        List {
            NavigationLink(
                destination: NoteFormViewExample())
            {
                Text("NoteFormView Example")
            }
            NavigationLink(
                destination: KeyValueFormViewExample())
            {
                Text("KeyValueFormView Example")
            }
            NavigationLink(
                destination: TitleFormViewExample())
            {
                Text("TitleFormView Example")
            }
            NavigationLink(
                destination: TextFieldFormViewExample())
            {
                Text("TextFieldFormView Example")
            }
            NavigationLink(
                destination: RatingControlFormViewExample())
            {
                Text("RatingControlFormView Example")
            }
            NavigationLink {
                FilterFormViewExamples()
            } label: {
                Text("FilterFormView Example")
            }
            NavigationLink {
                CurrencyInputExampleView()
            } label: {
                Text("CurrencyInput Example")
            }
        }
    }
}

#Preview {
    FormViewExamples()
}
