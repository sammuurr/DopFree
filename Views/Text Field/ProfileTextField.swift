import SwiftUI

struct ProfileTextField: View {
    @Binding var textFieldText: String
    var title: String
    
    var body: some View {
        HStack{
            Text(title)
                .multilineTextAlignment(.leading)
                .padding(.leading, 25)
                .font(.system(size: 14, weight: .light, design: .default))
            
            
            TextField(
                "Write here",
                text: $textFieldText,
                prompt: .none
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .autocorrectionDisabled(true)
            .padding(.leading, 12)
            .font(.system(size: 14, weight: .light, design: .default))
            
            Spacer()
        }
    }
}

struct ProfileTextField_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTextField(textFieldText: .constant(""), title: "Name:")
    }
}
