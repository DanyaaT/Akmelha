//
//  UserDB.swift
//  Akmelha
//
//  Created by Danya T on 29/05/1444 AH.
//


import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseAuth

class UserDB: ObservableObject {
    let dbUsers = Firestore.firestore()
    
    @Published var users = [User]()
    
    
    init(){
        loadData()
    }
    
    func loadData(){
        dbUsers.collection("Users").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.users = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: User.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
                }
            }
            
        }
    }
    
    
    func addUser(_ user :User){
        do{
            if let id = Auth.auth().currentUser?.uid{
                print("now id:" + id)
                var _ = try self.dbUsers.collection("Users").document(id).setData(from: user)
                
            }
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
        
    }
    
    func deleteUser(_ user :User){
        do{
            var _ = try dbUsers.collection("Users").document(user.id ?? "").delete()
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
        
    }
    
    
    
    func changeUserName( _ userId :String, userName: String){
        do {
           
            try dbUsers.collection("Users").document(userId).setData(from: ["userName": userName],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }
        
        
    }
    
    func changeStudentCredit( _ user :User){
        do {
            guard let id = user.id else {return}
            try dbUsers.collection("Users").document(id).setData(from: ["studentCredit": user.studentCredit],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }
        
        
    }
}

