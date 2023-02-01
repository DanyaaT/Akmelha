//
//  Zamanlayıcı.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//
import SwiftUI
class Zamanlayıcı : ObservableObject{
    @Published var mod: ZamanlayıcıModu = .durdu
    @Published var geçenSaniye = 0.0
    
    var zamanlayıcı = Timer()
    
    init(){
        
    }
    func start(){
        mod = .çalışıyor
        zamanlayıcı = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){ zamanlayıcı in
            self.geçenSaniye += 0.1
        }
    }
    func stop(){
        zamanlayıcı.invalidate()
        self.geçenSaniye = 0
        mod = .durdu

    }
    func paused(){
        zamanlayıcı.invalidate()
        mod = .duraklatıldı
    }
}
enum ZamanlayıcıModu{
    case çalışıyor
    case durdu
    case duraklatıldı
}
