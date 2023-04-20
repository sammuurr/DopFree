import SwiftUI

struct LoginContentView: View {
    
    @State private var showingAlert = false
    @ObservedObject var screen: ScreenController
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State var errorMessage: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            
            TextFieldView(textFieldText: $userEmail, title: "Email:", placeholder: "Your email")
            TextFieldView(textFieldText: $userPassword, title: "Password:", placeholder: "")
            
            Spacer()
            
            Button("LOGIN") {
                if userEmail != "", userPassword != ""{
                    Authorization().login(email: userEmail,
                                          password: userPassword) { data, error in
                        if data != nil{
                            DispatchQueue.main.async {
                                screen.rootScreen = .tabContentView
                            }
                        }else{
                            errorMessage = error?.detail ?? "Unknown error"
                            showingAlert = true
                        }
                    }
                }else{
                    errorMessage = "Fill in all the fields"
                    showingAlert = true
                }
                
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK!")))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 27, maxHeight: 27, alignment: .center)
            .padding(.all, 12)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.horizontal, 14)
            
            Button("REGISTER") {
                screen.rootScreen = .registerScreen
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 27, maxHeight: 27, alignment: .center)
            .padding(.all, 12)
            .foregroundColor(.black)
            .cornerRadius(15)
            .padding(.horizontal, 14)
            
            
        }
    }
}

struct LoginContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginContentView(screen: ScreenController())
    }
}
