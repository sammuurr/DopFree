import SwiftUI

struct WeakChart: View {
    
    @Binding var stat: WeekStatModel
    
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 35){
                Divider()
                Divider()
                Divider()
                Divider()
                Divider()
            }
            HStack(alignment: .bottom, spacing: 25){
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Monday / 100)
                    Text("MO")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Tuesday / 100)
                    Text("TU")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Wednesday / 100)
                    Text("WE")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Thursday / 100)
                    Text("TH")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Friday / 100)
                    Text("FR")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Saturday / 100)
                    Text("SA")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                VStack{
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 15, height: 140 * stat.Sunday / 100)
                    Text("SU")
                        .font(.system(size: 14, weight: .light, design: .default))
                }
                .frame(height: 165, alignment: .bottom)
            }
            .frame(height: 140, alignment: .top)
        }
    }
}

struct WeakChart_Previews: PreviewProvider {
    static var previews: some View {
        WeakChart(stat: .constant(WeekStatModel(Sunday: 11,
                                                Saturday: 33,
                                                Friday: 1,
                                                Thursday: 55,
                                                Wednesday: 66,
                                                Tuesday: 27,
                                                Monday: 44)))
    }
}
