//
//  YapBozModel.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//
import Foundation
import SwiftUI
struct YapBozModel<YapBozİçerik> {
    private(set) var oyunBittiMi = false
    private(set) var yapBozlar : Array<YapBoz>
    private var yapBozSayısı = 16
    init(yapBozİçerikOluşturucu: (Int)->YapBozİçerik){
        yapBozlar = Array<YapBoz>()
        for yapBozIndex in 0..<yapBozSayısı {
            let içerik = yapBozİçerikOluşturucu(yapBozIndex)
            yapBozlar.append(YapBoz(id : yapBozIndex, içerik: içerik))
        }
        yapBozlar.shuffle()//MARK: Yapbozlar karıştırılıyor
        yapBozYerİşaretleyicisi()
    }
    
    mutating func seç(seçilenYapBoz: YapBoz){
        if let gizliYapBozunDizidekiIndisi = yapBozunDizidekiYeriniBul(id: 0){
            if let seçilenYapBozunDizidekiIndisi = yapBozunDizidekiYeriniBul(id: seçilenYapBoz.id){
                yapBozlar.swapAt(gizliYapBozunDizidekiIndisi, seçilenYapBozunDizidekiIndisi)
                yapBozlar[yapBozunDizidekiYeriniBul(id: seçilenYapBoz.id)!].hareketSayacı += 1//TODO: Buradki "!" işaretinin bi çaresine bakılacak
                yapBozYerİşaretleyicisi()
            }
        }
    }
    
    func yapBozunDizidekiYeriniBul(id : Int)->Int?{
        for index in yapBozlar.indices{
            if yapBozlar[index].id == id{
                 return index
            }
        }
        return nil
    }
    
    mutating func yapBozYerİşaretleyicisi(){//MARK: Yapbozların doğru yerde olup olmadıkları işaretleniyor.
        //var tümYapBozlarYerinde = false
        for index in yapBozlar.indices{
            yapBozlar[index].yerindeMi = yapBozlar[index].id == index+1 ? true : false
        }
        if yapBozlar.filter({$0.yerindeMi == true}).count == yapBozSayısı-1 {
            oyunBittiMi = true
        }
    }
    struct YapBoz: Identifiable{
        let id : Int
        var yerindeMi : Bool = false
        var hareketSayacı : Int = 0
        var içerik : YapBozİçerik
    }
}
