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


func userName(id: String, users: [User]) -> String{
        var userName = ""
        for user in users{
            if user.id == id {
             
                userName = user.userName ?? ""
            }
        }
      
       return userName
    }

func userNameAndEmail(id: String, users: [User]) -> [String]{
        var userName = ""
        var userEmail = ""
        for user in users{
            if user.id == id {
             
                userName = user.userName ?? ""
                userEmail = user.userEmail ?? ""
                
            }
        }
      
       return [userName,userEmail]
    }
