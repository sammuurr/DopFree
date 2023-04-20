import SwiftUI
import Charts

struct Product: Identifiable {
    let id = UUID()
    let category: String
    let numberOfSell: Int
}

struct HistoryContentView: View {
    @State var winterProducts:  [Product] = []
    
    @State var selectedDate: Date = Date()
    @State var comment: ComentModel? = nil
    
    @available(iOS 16.0, *)
    var body: some View {
        VStack{
            DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                .padding(.horizontal)
                .datePickerStyle(.graphical)
                .onChange(of: selectedDate) { newValue in
                    Comment().getComment(dataT: selectedDate) { comment in
                        self.comment = comment
                    }
                }
            Chart (winterProducts) {
                LineMark(
                    x: .value ("Category", $0.category),
                    y: .value ("Number of sell", $0.numberOfSell)
                )
            }
            .frame (height:  200)
            Spacer()
            
            if comment != nil{
                HStack{
                    let smile = forSmile(smileNumber: comment!.user_status)
                    
                    Text(smile)
                        .font(.system(size: 80, weight: .bold, design: .default))
                    Text(comment!.comment)
                }
                .padding(.horizontal, 20)
                .background(RoundedRectangle(cornerRadius: 15).stroke(.black, lineWidth: 2))
            }
        }
        .padding ()
        .onAppear(){
            Stat().getMonthStat { stat in
                var monthStat:  [Product] = []
                
                if stat != nil{
                    for month in stat!{
                        monthStat.append(.init(category: String(month.month.prefix(3)),
                                               numberOfSell: Int(month.percent)))
                    }
                }
                winterProducts = monthStat
            }
            
            Comment().getComment(dataT: selectedDate) { comment in
                self.comment = comment
            }
        }
    }
    
    func forSmile(smileNumber: Int) -> String{
        var smile = ""
        
        switch smileNumber{
        case 1:
            smile = "😀"
        case 2:
            smile = "😔"
        case 3:
            smile = "😔"
        default:
            smile = ""
        }
        
        return smile
    }
}

struct HistoryContentView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryContentView()
    }
}

