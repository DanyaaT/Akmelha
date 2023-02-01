//
//  PuanlamaView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//

import SwiftUI
struct PuanlamaView: View {
    let rekorName: String
    let rekorPuan: Double
    let geçenSüre: Double
    let hareketSayacı: Int
    
    var body: some View {
        VStack{

            HStack{
                Text(rekorName)
                Text(String(format: "Rekor: %.2f" , rekorPuan))
            }
            VStack {
                HStack{
                    Text(String(format: "Geçen Süre: %.2f", geçenSüre))
                    Spacer()
                    Text("\(hareketSayacı)")
                }
            }
        }.padding(.horizontal)
    }
}
struct PuanlamaView_Previews: PreviewProvider {
    static var previews: some View {
        PuanlamaView(rekorName: "rekon", rekorPuan: 23.5, geçenSüre: 3.5, hareketSayacı: 3).previewLayout(.sizeThatFits)
    }
}
