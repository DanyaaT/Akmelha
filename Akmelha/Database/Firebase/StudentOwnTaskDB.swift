//
//  StudentOwnTaskDB.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 03/06/1444 AH.
//
import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class StudentOwnTaskDB: ObservableObject {
    let dbStudentOwnTasks = Firestore.firestore()

    @Published var tasks = [StudentOwnTask]()
    
    

    init(){
        loadData()
    }

    func loadData(){
        dbStudentOwnTasks.collection("StudentOwnTasks").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: StudentOwnTask.self)
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


    func addStudentOwnTasks(_ courseTask :StudentOwnTask){
        do{
            var _ = try dbStudentOwnTasks.collection("StudentOwnTasks").addDocument(from: courseTask)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }
    
    
    func updateStudentOwnTasks(_ studentOwnTask :StudentOwnTask){
        do {
            guard let id = studentOwnTask.id else {return}
            try dbStudentOwnTasks.collection("StudentOwnTasks").document(id).setData(from: studentOwnTask)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }


    }

    
    func changeTaskStatus( _ studentOwnTask :StudentOwnTask){
        do {
            guard let id = studentOwnTask.id else {return}
            try dbStudentOwnTasks.collection("StudentOwnTasks").document(id).setData(from: ["iscompleted": studentOwnTask.iscompleted],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }
        
        
    }
    
    
    
    func deleteStudentOwnTasks(_ courseTask :StudentOwnTask) {
        guard let id = courseTask.id else {return}
        var _  = dbStudentOwnTasks.collection("StudentOwnTasks").document(id).delete() { err in
            if let err = err {
              print("Error removing document: \(err)")
            }
            else {
              print("Document successfully removed!")
            }
        }
    }
    
    
    
   
}


