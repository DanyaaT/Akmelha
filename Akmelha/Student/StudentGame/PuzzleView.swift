import SwiftUI

struct ContentView: View {
    @ObservedObject var yapBozVM : YapBozViewModel = YapBozViewModel()
    @ObservedObject var rekorlarVM = RekorlarViewModel()
    @State private var oyunBitti = false
    @ObservedObject var zamanlayıcı = Zamanlayıcı()
    @State var rekorSahibi : String = ""
    
    var body: some View {
        
        VStack {
            PuanlamaView(rekorName: rekorlarVM.rekor?.name ?? "ad",
                         rekorPuan: rekorlarVM.rekor?.puan ?? 100,
                         geçenSüre: zamanlayıcı.geçenSaniye,
                         hareketSayacı: yapBozVM.hareketSayacı)
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75, maximum: 120))]){
                    ForEach(yapBozVM.yapBozlar){ yapBoz in
                        YapBozView(yapBoz: yapBoz, foregroundColor: yapBoz.yerindeMi ? Color.green : Color.red)
                            .onTapGesture {
                                if zamanlayıcı.mod == .durdu{
                                    zamanlayıcı.start()
                                }
                                withAnimation(.easeOut(duration: 0.2)) {
                                    yapBozVM.seç(seçilenYapBoz: yapBoz)
                                    oyunBitti = yapBozVM.oyunBittiMi
                                    if oyunBitti {
                                        zamanlayıcı.paused()
                                    }
                                }
                            }.sheet(isPresented: $oyunBitti) {
                                OyunBitti(puan: yapBozVM.puanHesapla(süre: zamanlayıcı.geçenSaniye, rekorSahibi: rekorSahibi, forKey: "rekor"), rekorSahibi: $rekorSahibi)
                            }
                    }
                }.padding()
                    //.background(Image("yaprak")
                                    //.resizable()
                                    //.aspectRatio(contentMode: .fit)
                                    //.opacity(0.20))
            }
            
            Spacer()
            newGameButton
        }
}
var newGameButton : some View{
    Button {
        withAnimation(.linear){
            yapBozVM.yeniOyun()
            self.zamanlayıcı.stop()
        }
    } label: {
        Text("Yeni Oyun").fontWeight(.bold)
            .padding()
            .padding(.horizontal)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
    }
}
struct YapBozView : View{
    var yapBoz : YapBozModel<String>.YapBoz
    var foregroundColor : Color
    var body: some View{
        ZStack(){
            if yapBoz.id != 0 {
                //RoundedRectangle(cornerRadius: 20).foregroundColor(foregroundColor)
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                    .aspectRatio(2/3, contentMode: .fit)
                    .foregroundColor(foregroundColor)
                    
                Text(yapBoz.içerik)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .foregroundColor(foregroundColor)
                VStack {
                    Spacer()
                    HStack (alignment: .bottom){
                        Spacer()
                        Text("\(yapBoz.hareketSayacı)")
                            .font(.footnote)
                            .padding()
                    }
                }
            }
        }
    }
}

//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(rekorSahibi: "")
//    }
//}
//
//
