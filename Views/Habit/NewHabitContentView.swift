import SwiftUI

struct NewHabitContentView: View {
    
    @State private var habitTitle: String = ""
    @State private var habitMinDesc: String = ""
    @State private var habitDescription: String = ""
    
    @State private var showingAlert = false
    @State var errorMessage: String = ""
    
    @Binding var habit: [HabitModel]
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            TextFieldView(textFieldText: $habitTitle, title: "Title:", placeholder: "Title")
                .padding(.top, 50)
            TextFieldView(textFieldText: $habitMinDesc, title: "Brief description:", placeholder: "Write a brief description")
            TextFieldView(textFieldText: $habitDescription, title: "Full description:", placeholder: "Write a full description")
            Button("Save") {
                if habitTitle != "", habitMinDesc != "", habitDescription != ""{
                    Habit().addHabit(name: habitTitle,
                                     description: habitDescription,
                                     min_description: habitMinDesc) { success in
                        if success{
                            DispatchQueue.main.async {
                                habit = []
                                presentationMode.wrappedValue.dismiss()
                            }
                        }else{
                            errorMessage = "Unknown error"
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
            .font(.system(size: 14, weight: .medium, design: .default))
            .frame(width: 240, height: 20)
            .padding(.all, 12)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.top, 50)
            Spacer()
        }
        .navigationTitle("Add new Habit")
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

struct NewHabitContentView_Previews: PreviewProvider {
    static var previews: some View {
        NewHabitContentView(habit: .constant([HabitModel(apID: 2,
                                                         name: "",
                                                         imageName: "",
                                                         minDescp: "",
                                                         streak: 2,
                                                         completed: true)
        ]))
    }
}

