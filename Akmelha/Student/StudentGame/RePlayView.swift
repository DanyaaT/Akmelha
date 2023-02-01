//
//  RePlayView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//

import SwiftUI


struct ResimView: View {
    @ObservedObject var yapBozVM : YapBozViewModel = YapBozViewModel()
    @ObservedObject var rekorlarVM = RekorlarViewModel()
    @ObservedObject var zamanlayıcı = Zamanlayıcı()
    @State private var oyunBitti = false
    @State var rekorSahibi : String = ""
    
    var body: some View {
        VStack {
//
//            PuanlamaView(rekorName: rekorlarVM.rekorResim!.name , rekorPuan: rekorlarVM.rekorResim!.puan, geçenSüre: zamanlayıcı.geçenSaniye, hareketSayacı: yapBozVM.hareketSayacı)
//
            let dörtlüKolon = [GridItem(.flexible(),spacing: 0),
                               GridItem(.flexible(),spacing: 0),
                               GridItem(.flexible(),spacing: 0),
                               GridItem(.flexible(),spacing: 0)]
            
            LazyVGrid(columns: dörtlüKolon, spacing: 0){
                ForEach(yapBozVM.yapBozlar){ yapBoz in
                    ResimYapBozView(yapBoz: yapBoz)
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
                            OyunBitti(puan: yapBozVM.puanHesapla(süre: zamanlayıcı.geçenSaniye, rekorSahibi: rekorSahibi, forKey: "rekorResim"), rekorSahibi: $rekorSahibi)
                        }
                }
            }
            Spacer()
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
        }.padding()
    }
}

struct ResimYapBozView : View{
    var yapBoz : YapBozModel<String>.YapBoz
    var body: some View{
        ZStack(alignment: .bottom){
            if yapBoz.id != 0 {
                Image(yapBoz.içerik)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}


struct ResimView_Previews: PreviewProvider {
    static var previews: some View {
        ResimView()
    }
}
