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
    @State  var showSheet = false
    @State var rekorSahibi : String = ""
    
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack {
                Spacer()
                ZStack{
                    
                    Rectangle()
                        .frame(width: 200, height: 20)
                        .foregroundColor(Color("arabic")).opacity(0.7)
                    
                    Text("ترتيب الأحجيات")
                        .font(.system(size: 40))
                        .foregroundColor(Color("title"))
                    
                }
                Spacer()
                PuanlamaView(geçenSüre: zamanlayıcı.geçenSaniye, hareketSayacı: yapBozVM.hareketSayacı)
                
                let dörtlüKolon = [GridItem(.flexible(),spacing: 0),
                                   GridItem(.flexible(),spacing: 0),
                                   GridItem(.flexible(),spacing: 0),
                                   GridItem(.flexible(),spacing: 0)]
                ZStack{
                    Rectangle()
                        .cornerRadius(20)
                        .foregroundColor(Color("top")).ignoresSafeArea().frame( height: 430)
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
                               
                            } .alert( String(format: "رائع! لقد انهيتها في %.2f ثانية", zamanlayıcı.geçenSaniye), isPresented: $oyunBitti) {
                              Button("موافق", role: .cancel) { }
                            }

                    }
                }.environment(\.layoutDirection, .leftToRight)
            }
                Spacer()
                Button {
                    showSheet.toggle()
                } label: {
                    
                    HStack{
                        Spacer()
                        Text("اظهار الصورة").font(.title2)
                        Spacer()
                    }
                }.tint(Color("green"))
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .sheet(isPresented: $showSheet){
                        
                        ImageDetile().presentationDetents([.medium])
                    }
                  
                Button {
                    withAnimation(.linear){
                        yapBozVM.yeniOyun()
                        self.zamanlayıcı.stop()
                    }
                } label: {
                    
                    HStack{
                        Spacer()
                        Text("العب مرة أخرى").font(.title2)
                        Spacer()
                    }
                }.tint(Color("green"))
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            } .padding()
        }
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
