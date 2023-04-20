import UniformTypeIdentifiers
import SwiftUI

struct HabitContentView: View {
    @Binding var habit: HabitModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        Group{
            ScrollView{
                VStack{
                    VStack{
                        VStack{
                            Image(habit.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 280, height: 150)
                        }
                        .padding(.all, 25)
                        
                        VStack{
                            Text(habit.name)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 5)
                                .multilineTextAlignment(TextAlignment.leading)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = habit.name
                                    }) {
                                        Text("Copy to clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            
                            Text(habit.minDescp)
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(TextAlignment.leading)
                            Text("\(habit.streak) day streak")
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(TextAlignment.leading)
                            Text("Description:")
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.bottom, 5)
                                .multilineTextAlignment(TextAlignment.leading)
                                .padding(.top, 30)
                            Text(habit.description)
                                .font(.system(size: 14, weight: .light, design: .default))
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(TextAlignment.leading)
                                .contextMenu {
                                    Button(action: {
                                        UIPasteboard.general.string = habit.description
                                    }) {
                                        Text("Copy to clipboard")
                                        Image(systemName: "doc.on.doc")
                                    }
                                }
                            
                            Spacer()
                        }
                        .padding(.all, 25)
                        
                    }
                    .frame(width: 320)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 2))
                    
                }
                .padding(.top, 30)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                },
                                                     label: {
                    Text("X")
                        .foregroundColor(.black)
                }))
            }
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
        }
    }
}

struct HabitContentView_Previews: PreviewProvider {
    static var previews: some View {
        HabitContentView(habit: .constant(HabitModel(apID: 2,
                                                     name: "",
                                                     imageName: "",
                                                     minDescp: "",
                                                     streak: 2,
                                                     completed: false))
        )
    }
}
