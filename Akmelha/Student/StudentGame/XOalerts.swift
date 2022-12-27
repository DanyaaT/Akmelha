//
//  XOalerts.swift
//  Akmelha
//
//  Created by Deema on 03/06/1444 AH.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
}

struct AlertContext {
    static let humanWin     = AlertItem(title: Text("تهانينا!"),
                                        message: Text("استمر يابطل"),
                                        buttonTitle: Text("إعادة اللعب"))
    
    static let computerWin  = AlertItem(title: Text("حاول مرة أخرى"),
                                        message: Text("لاتستسلم"),
                                        buttonTitle: Text("إعادة اللعب"))

    
    static let draw         = AlertItem(title: Text("تعادل!"),
                                        message: Text("لاتستسلم"),
                                        buttonTitle: Text("إعادة اللعب"))
}
