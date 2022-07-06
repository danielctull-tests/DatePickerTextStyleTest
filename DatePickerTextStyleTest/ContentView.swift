
import SwiftUI

struct ContentView: View {
    @State private var date: Date = .now

    var body: some View {
        Form {
            DatePicker(selection: $date) {
                Text("Date")
            }
        }
        .datePickerStyle(MyDatePickerStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MyDatePickerStyle: DatePickerStyle {

    @State private var showPicker = false

    func makeBody(configuration: Configuration) -> some View {

        HStack {
            configuration.label
            Button {
                showPicker.toggle()
            } label: {
                Text(configuration.selection.formatted(date: .long, time: .omitted))
                    .bold()
                    .padding(6)
                    .background {
                        RoundedRectangle(cornerRadius: 6).fill(.orange)
                    }
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $showPicker) {
                DatePicker(selection: configuration.$selection, displayedComponents: .date, label: EmptyView.init)
                    .datePickerStyle(.graphical)

            }
        }
    }
}
