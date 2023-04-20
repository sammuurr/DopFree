import SwiftUI

struct HomeContentView: View {
    
    @State var progress: Double = 0.0
    @Binding var user: UserModel
    @State var habits: [HabitModel] = []
    @State var weekStat: WeekStatModel = WeekStatModel(Sunday: 0,
                                                       Saturday: 0,
                                                       Friday: 0,
                                                       Thursday: 0,
                                                       Wednesday: 0,
                                                       Tuesday: 0,
                                                       Monday: 0)
    
    let columns = [
        GridItem(.fixed(200), spacing: 66),
    ]
    
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Spacer(minLength: 50)
                VStack {
                    WeakChart(stat: $weekStat)
                    
                    Spacer(minLength: 50)
                    HomeProgresBar(progress: progress)
                        .frame(width: 100, height: 100)
                    
                    Spacer(minLength: 50)
                    
                    LazyVGrid(columns: columns) {
                        ForEach($habits) {habit in
                            NavigationLink(destination: HabitContentView(habit: habit)) {
                                HabitCells(habit: habit)
                            }
                        }
                    }
                    NavigationLink {
                        NewHabitContentView(habit: $habits)
                    } label: {
                        VStack{
                            Spacer()
                            Text("+")
                                .font(.system(size: 25, weight: .heavy, design: .default))
                                .foregroundColor(.black)
                            Text("Add new habit")
                                .padding(.bottom, 35)
                                .padding(.top, 5)
                                .font(.system(size: 18, weight: .bold, design: .default))
                                .foregroundColor(.black)
                        }
                        .frame(width: 320, height: 164)
                        .background(RoundedRectangle(cornerRadius: 8).stroke(.black, lineWidth: 2))
                        .padding(.bottom)
                    }
                }
            }
            .navigationTitle("Hi, \(user.name)")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: {
                ProfileContentView(name: $user.name, email: $user.email, age: $user.age, logo: $user.logo)
            }, label: {
                ZStack{
                    Circle()
                        .foregroundColor(.gray)
                    Text(user.logo.uppercased())
                        .font(.system(size: 14, weight: .light, design: .default))
                        .frame(alignment: .bottom)
                        .foregroundColor(.white)
                }
                .frame(width: 35, height: 35)
                
            })
            )
        }
        .navigationViewStyle(.stack)
        .onChange(of: habits) { newValue in
            progress = calculateProgress(habits: habits)
            
            Stat().getWeekStat { stat in
                if stat != nil{
                    self.weekStat = stat!
                }
            }
            Habit().getHabits { habits in
                if habits != nil{
                    self.habits = habits!
                }
            }
        }
        .onAppear(){
            Habit().getHabits { habits in
                if habits != nil{
                    self.habits = habits!
                }
            }
            Stat().getWeekStat { stat in
                if stat != nil{
                    self.weekStat = stat!
                }
            }
        }
    }
    
    func calculateProgress(habits: [HabitModel]) -> Double{
        var completed = 0.0
        let allHabit = Double(habits.count)
        
        for habit in habits {
            if habit.completed{
                completed += 1.0
            }
        }
        
        return (completed / allHabit)
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView(user: .constant(UserModel(name: "",
                                                  age: "",
                                                  email: "",
                                                  logo: "")))
    }
}

