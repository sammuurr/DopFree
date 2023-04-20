import SwiftUI

struct HomeProgresBar: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .stroke(
                        Color.gray.opacity(0.5),
                        lineWidth: 8
                    )
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(
                        Color.black,
                        style: StrokeStyle(
                            lineWidth: 8,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(-90))
                    .animation(.easeOut, value: progress)
            }
            Text("\(progress * 100, specifier: "%.0f")%")
                .font(.init(.title2))
                .bold()
        }
    }
}

struct HomeProgresBar_Previews: PreviewProvider {
    static var previews: some View {
        HomeProgresBar(progress: 0.1)
    }
}

