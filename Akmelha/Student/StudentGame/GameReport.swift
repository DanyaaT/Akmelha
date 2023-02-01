//
//  GameReport.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//

import SwiftUI

import SwiftUI
struct OyunBitti : View{
    var puan : Double
    @Binding var rekorSahibi : String
    var body: some View{
        VStack{
            Text("Oyun Bitti")
            Text(String(format: "Puanınız: %.2f", puan))
            Form{
                HStack{
                    Text("Adınız:")
                    TextField("Adınız", text: $rekorSahibi)
                }
                Button {
                    
                } label: {
                    Text("Kaydet")
                }

            }
        }.padding().font(.largeTitle)
    }
}
