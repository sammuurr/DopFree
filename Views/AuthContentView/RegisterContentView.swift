import SwiftUI

struct RegisterContentView: View {
    @ObservedObject var screen: ScreenController
    @State private var userName: String = ""
    @State private var userEmail: String = ""
    @State private var userPassword: String = ""
    @State private var sliderAge =  18.0
    @State private var showingAlert = false
    @State var errorMessage: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            
            TextFieldView(textFieldText: $userName, title: "Name:", placeholder: "Your name")
            TextFieldView(textFieldText: $userEmail, title: "Email:", placeholder: "Your email")
            TextFieldView(textFieldText: $userPassword, title: "Password:", placeholder: "")
            
            Text("Age: \(Int(sliderAge))")
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 27, maxHeight: 27, alignment: .leading)
                .padding(.leading, 21)
                .font(.system(size: 14, weight: .light, design: .default))
            
            
            Slider(
                value: $sliderAge,
                in: 18...100,
                step: 1
            )
            .tint(.black)
            .padding(.horizontal, 14)
            
            Spacer()
            
            Button("REGISTER") {
                if userEmail != "", userPassword != "", userPassword != ""{
                    Authorization().registration(name: userName, email: userEmail, age: String(Int(sliderAge)), password: userPassword){ data, error in
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
            
            Button("LOGIN") {
                screen.rootScreen = .loginScreen
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 27, maxHeight: 27, alignment: .center)
            .padding(.all, 12)
            .foregroundColor(.black)
            .cornerRadius(15)
            .padding(.horizontal, 14)
            
        }
    }
}

struct RegisterContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterContentView(screen: ScreenController())
    }
}

