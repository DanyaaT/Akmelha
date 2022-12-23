//
//  User.swift
//  Akmelha
//
//  Created by Danya T on 29/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class User: Codable, Identifiable{
    @DocumentID var id : String?
    var userEmail : String?
    var userPassword :String?
    var userName: String?
    var userType: String?
    var studentCredit: Int?
    
    
    init( userEmail: String? = "", userPassword :String? = "", userName: String? = "",  userType: String? = "",studentCredit: Int? = 0){
       
        self.userEmail = userEmail
        self.userPassword = userPassword
        self.userName = userName
        self.userType = userType
        self.studentCredit = studentCredit
       
    }
    
    init(userEmail: String? = "", userPassword :String? = "", userName: String? = "",  userType: String? = ""){
      
        self.userEmail = userEmail
        self.userPassword = userPassword
        self.userName = userName
        self.userType = userType
     
       
    }
}

