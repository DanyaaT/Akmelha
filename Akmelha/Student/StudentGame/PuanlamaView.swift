//
//  PuanlamaView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 12/07/1444 AH.
//


import SwiftUI
struct PuanlamaView: View {
   
 
    let geçenSüre: Double
    let hareketSayacı: Int
    let heighestScore: Double
    var body: some View {
        VStack{

            VStack {
                HStack{
                   Spacer()
                    Text(String(format: "الرقم القياسي : %.2f", heighestScore))
                    Spacer()
                }
                HStack{
                    Text(String(format: "عدد الثواني : %.2f", geçenSüre))
                    Spacer()
                    Text("عدد الحركات : \(hareketSayacı)")
                }
            }
        }.padding(.horizontal)
    }
}

