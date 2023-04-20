import SwiftUI

struct TextFieldView: View {
    @Binding var textFieldText: String
    var title: String
    var placeholder: String
    
    var body: some View {
        VStack{
            Text(title)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 27, maxHeight: 27, alignment: .leading)
                .padding(.leading, 21)
                .font(.system(size: 14, weight: .light, design: .default))
            
            
            TextField(
                placeholder,
                text: $textFieldText,
                prompt: .none
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .autocorrectionDisabled(true)
            .padding(.all, 12)
            .background(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
            .padding(.horizontal, 21)
            .font(.system(size: 14, weight: .light, design: .default))
        }
    }
}

struct TextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldView(textFieldText: .constant(""), title: "Test", placeholder: "Enter text")
    }
}
