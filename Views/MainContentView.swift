import SwiftUI

struct MainContentView: View {
    
    @ObservedObject var screen: ScreenController
    
    var body: some View {
        VStack {

                
            Spacer()
            
            Image("Untitled-1")
                .resizable()
                .frame(width: 184, height: 184)
                
                .padding(.bottom, 50)
            
            Button("LOGIN") {
                screen.rootScreen = .loginScreen
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 27, maxHeight: 27, alignment: .center)
            .padding(.all, 15)
            .background(.black)
            .foregroundColor(.white)
            .cornerRadius(15)
            .padding(.bottom, 5)
            .transition( AnyTransition.move(edge: .leading).combined(with: AnyTransition.opacity).combined(with: .scale) )


            
            Button("REGISTER") {
                screen.rootScreen = .registerScreen
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 25, maxHeight: 25, alignment: .center)
            .padding(.all, 15)
            .background(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2))
            .foregroundColor(.black)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainContentView(screen: ScreenController())
    }
}
