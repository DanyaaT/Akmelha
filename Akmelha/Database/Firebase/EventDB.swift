//
//  EventDB.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class EventDB: ObservableObject {
    let dbEvents = Firestore.firestore()

    @Published var events = [Event]()
    
    

    init(){
        loadData()
    }

    func loadData(){
        dbEvents.collection("Events").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.events = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: Event.self)
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


    func addEvent(_ event :Event){
        do{
            var _ = try dbEvents.collection("Events").addDocument(from: event)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }
    
    func deleteEvent(_ event :Event){
        do{
            var _ = try dbEvents.collection("Events").document(event.id ?? "").delete()
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }

}




