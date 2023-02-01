//
//  YapBozViewModel.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//

import Foundation
import SwiftUI
class YapBozViewModel: ObservableObject{
    static var sayılar = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19"]
    //static var resimler = ["0", "istanbul_001", "istanbul_002", "istanbul_003", "istanbul_004", "istanbul_005", "istanbul_006", "istanbul_007", "istanbul_008", "istanbul_009", "istanbul_010", "istanbul_011", "istanbul_012", "istanbul_013", "istanbul_014", "istanbul_015", "istanbul_016", ]
    @Published private var yapBozModel : YapBozModel<String>
    @State var gameOver = false
    var hareketSayacı : Int = 0
    init(){
        yapBozModel = YapBozViewModel.yapBozModelOluştur()
    }
    static func yapBozModelOluştur()->YapBozModel<String>{
        return YapBozModel<String>(yapBozİçerikOluşturucu:  { yapBozIndex in
            YapBozViewModel.sayılar[yapBozIndex]
            //YapBozViewModel.resimler[yapBozIndex]

        })
    }
    func seç(seçilenYapBoz: YapBozModel<String>.YapBoz) {
        hareketSayacı += 1
        yapBozModel.seç(seçilenYapBoz: seçilenYapBoz)
    }
    func yeniOyun(){
        yapBozModel = YapBozViewModel.yapBozModelOluştur()
        hareketSayacı = 0
    }
    func puanHesapla(süre: Double, rekorSahibi: String, forKey: String)->Double{
        let puan = Double(50-hareketSayacı)*(100.0-süre)
        //if puan > rekor!.puan{
        rekorKaydet(yeniRekor: puan, rekorSahibi: rekorSahibi, forKey: forKey)
        //}
        return puan
    }
    func rekorKaydet(yeniRekor: Double, rekorSahibi: String, forKey: String){
        let user = User1(name: rekorSahibi, puan: yeniRekor)
        let encoder = JSONEncoder()
        if let encoderUser = try? encoder.encode(user){
            UserDefaults.standard.set(encoderUser, forKey: forKey)
        }
            
    }
   
    var yapBozlar: Array<YapBozModel<String>.YapBoz>{
        yapBozModel.yapBozlar
    }
    var oyunBittiMi:Bool{
        yapBozModel.oyunBittiMi
    }
    
}
