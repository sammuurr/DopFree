import SwiftUI

struct ProfileContentView: View {
    
    @Binding var name: String
    @Binding var email: String
    @Binding var age: String
    @Binding var logo: String
    
    @State var password: String = ""
    @State var repaetPassword: String = ""
    
    @State private var showingAlert = false
    @State var alertTitle: String = ""
    @State var alertMessage: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        VStack{
            ProfileTextField(textFieldText: $name, title: "Name:")
                .padding(.top, 30)
            ProfileTextField(textFieldText: $email, title: "Email:")
            ProfileTextField(textFieldText: $age, title: "Age:")
            Button("Save") {
                if name != "", email != "", age != ""{
                    if Int(age) != nil{
                        User().userSetParametrs(name: name,
                                                email: email,
                                                age: age) { success in
                            if success{
                                logo = String(name.prefix(2))
                                alertTitle = "Success"
                                alertMessage = "Saved your new data!!"
                                showingAlert = true
                            }else{
                                alertTitle = "Error"
                                alertMessage = "Unknown error!"
                                showingAlert = true
                            }
                        }
                    }else{
                        alertTitle = "Error"
                        alertMessage = "In the age field, you need to enter a number"
                        showingAlert = true
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
            .padding(.bottom, 50)
            
            ProfileTextField(textFieldText: $password, title: "New Password:")
            ProfileTextField(textFieldText: $repaetPassword, title: "Repeat New Password:")
            Button("Reset password") {
                if password != "", repaetPassword != ""{
                    if password == repaetPassword{
                        User().userSetPassword(password: password) { success in
                            if success{
                                logo = String(name.prefix(2))
                                alertTitle = "Success"
                                alertMessage = "Saved your new PASSWORD!!"
                                showingAlert = true
                            }else{
                                alertTitle = "Error"
                                alertMessage = "Unknown error!"
                                showingAlert = true
                            }
                        }
                    }else{
                        alertTitle = "Error"
                        alertMessage = "the password field must match the repeat password"
                        showingAlert = true
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
            .padding(.bottom, 5)
            
            Spacer()
            
        }
        .navigationTitle("My profile")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Button(action: {
            presentationMode.wrappedValue.dismiss()
        },
                                             label: {
            Text("X")
                .foregroundColor(.black)
        }))
    }
}

struct ProfileContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileContentView(name: .constant(""), email: .constant(""), age: .constant(""), logo: .constant(""))
    }
}

