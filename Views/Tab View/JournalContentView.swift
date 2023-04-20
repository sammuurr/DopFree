import SwiftUI

struct JournalContentView: View {
    
    var date: Date = Date()
    @Binding var userName: String
    @State var selectedButton = 0
    @State var mind = ""
    @State private var showingAlert = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    var body: some View {
        VStack{
            Text("TODAY - \(getDate())")
                .font(.system(size: 24, weight: .bold, design: .default))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 5)
                .multilineTextAlignment(TextAlignment.center)
                .padding(.top, 20)
                .padding(.bottom, 40)
            Text("Hi, \(userName)")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 5)
                .padding(.leading, 25)
                .multilineTextAlignment(TextAlignment.center)
                
            Text("How are you feeling today?")
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.black)
                .padding(.leading, 25)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(TextAlignment.center)
            
            HStack{
                Button("😀") {
                    selectedButton = 1
                }
                .font(.system(size: 90))
                .background(selectedButton == 1 ? RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2) : nil)
                Button("😔") {
                    selectedButton = 2
                }
                .font(.system(size: 90))
                .background(selectedButton == 2 ? RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2) : nil)
                Button("😫") {
                    selectedButton = 3
                }
                .font(.system(size: 90))
                .background(selectedButton == 3 ? RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2) : nil)

            }
            .padding(.vertical)
            
            TextFieldView(textFieldText: $mind,
                          title: "Share what’s on your mind:",
                          placeholder: "Text")
            Button("Send") {
                if mind != ""{
                    Comment().addComent(commenet: mind,
                                        status: selectedButton) { success in
                        if success{
                            alertTitle = "Success"
                            alertMessage = "Saved your wellness, you can view it in the history section"
                            showingAlert = true
                        }else{
                            alertTitle = "Error"
                            alertMessage = "Unknown error!"
                            showingAlert = true
                        }
                        selectedButton = 0
                        mind = ""
                    }
                }else{
                    alertTitle = "Error"
                    alertMessage = "Fill in all the fields"
                    showingAlert = true
                }
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK!")))
            }
            .font(.system(size: 14, weight: .medium, design: .default))
            .frame(width: 150, height: 10)
            .padding(.all, 12)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(20)
            
            Spacer()
        }
    }
    
    func getDate() -> String{
        let dateFormatter = DateFormatter()
                
        dateFormatter.setLocalizedDateFormatFromTemplate("MMMM")
        let month = dateFormatter.string(from: Date())
        
        dateFormatter.setLocalizedDateFormatFromTemplate("d")
        let day = dateFormatter.string(from: Date())
        
        
        return "\(day) \(month)".uppercased()
    }
                 
}

struct JournalContentView_Previews: PreviewProvider {
    static var previews: some View {
        JournalContentView(userName: .constant("Gleb"))
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
