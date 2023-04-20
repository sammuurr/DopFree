import SwiftUI

struct TabContentView: View {
    
    @State var user: UserModel = UserModel(name: UserDefaults.standard.string(forKey: "name") ?? "",
                                           age: UserDefaults.standard.string(forKey: "age") ?? "",
                                           email: UserDefaults.standard.string(forKey: "email") ?? "",
                                           logo: UserDefaults.standard.string(forKey: "logo") ?? "")
    
    var body: some View {
        TabView {
            HomeContentView(user: $user)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("HOME")
                }
            
            JournalContentView(userName: $user.name)
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "bookmark.circle.fill")
                    Text("JOURNAL")
                }
            
            HistoryContentView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "clock")
                    Text("HISTORY")
                }
            
        }
        .tint(.black)
    }
}

struct TabContentView_Previews: PreviewProvider {
    static var previews: some View {
        TabContentView()
    }
}
