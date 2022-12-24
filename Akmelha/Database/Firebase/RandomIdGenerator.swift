//
//  RandomIdGenerator.swift
//  Akmelha
//
//  Created by Danya T on 30/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class RandomId: Codable, Identifiable{
    @DocumentID var id : String?
    var number : Int
  
    init( number: Int ) {
        
        self.number = number
  
    }
}




class RandomIdGenerator: ObservableObject {
    let dbRandomId = Firestore.firestore()
    
    @Published var randomIds = [RandomId]()
    
    
    
    init(){
        loadData()
       
    }
    
    func loadData(){
        dbRandomId.collection("RandomId").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.randomIds = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: RandomId.self)
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
    

    
    func incrementCounter(){
        do {
            var x = (randomIds.first?.number ?? 0 ) + 1
         
             let id = "Tyd7ptWaVkafjjAFXKU9"                  //"name of feild": "new value"
            try dbRandomId.collection("RandomId").document(id).setData(from: ["number": x],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }


    }

    
}
