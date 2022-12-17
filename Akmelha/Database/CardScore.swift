//
//  CardScore.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation


class CardScore: Codable, Identifiable{
   
    var scoreAmount: Int?
    var cardCode: String?
   
    
    init(scoreAmount: Int? = 10, cardCode: String? = "") {
        self.scoreAmount = scoreAmount
        self.cardCode = cardCode
        
    }
}
