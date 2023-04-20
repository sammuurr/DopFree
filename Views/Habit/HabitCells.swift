import SwiftUI

struct HabitCells: View {
    @Binding var habit: HabitModel
    
    var body: some View {
        Group{
            HStack{
                VStack{
                    Text(habit.name)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 5)
                        .multilineTextAlignment(TextAlignment.leading)
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
                    Spacer()
                    Button(habit.completed ? "completed" : "complete") {
                        Habit().completeHabit(id: String(habit.apID)) { isCompleted in
                            habit.completed = isCompleted
                        }
                    }
                    .font(.system(size: 14, weight: .bold, design: .default))
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 24, maxHeight: 24, alignment: .center)
                    .background(.black)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    
                }
                .padding(.all, 25)
                Spacer()
                VStack{
                    Image(habit.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Spacer()
                }
                .padding(.all, 25)
            }
        }
        .frame(width: 320, height: 164)
        .background(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 2))
        .padding(.bottom)

    }
}

struct HabitCells_Previews: PreviewProvider {
    static var previews: some View {
        HabitCells(habit: .constant(HabitModel(apID: 2,
                                               name: "",
                                               imageName: "",
                                               minDescp: "",
                                               streak: 2,
                                               completed: false))
        )
    }
}
