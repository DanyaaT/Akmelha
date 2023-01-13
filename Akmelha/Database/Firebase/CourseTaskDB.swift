//
//  CourseTaskDB.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CourseTaskDB: ObservableObject {
    let dbCourseTasks = Firestore.firestore()

    @Published var tasks = [CourseTask]()
    
    

    init(){
        loadData()
    }

    func loadData(){
        dbCourseTasks.collection("CourseTasks").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: CourseTask.self)
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


    func addCourseTask(_ courseTask :CourseTask){
        do{
            var _ = try dbCourseTasks.collection("CourseTasks").addDocument(from: courseTask)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }
    
    func changeCourseTaskStatus( _ courseTask :CourseTask){
        do {
            guard let id = courseTask.id else {return}
            try dbCourseTasks.collection("CourseTasks").document(id).setData(from: ["iscompleted": courseTask.iscompleted],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }
        
        
    }
    
    
    
    
    
    func updateCourseTask(_ courseTask :CourseTask){
        do {
            guard let id = courseTask.id else {return}
            try dbCourseTasks.collection("CourseTasks").document(id).setData(from: courseTask)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }


    }
    
    
    func deleteCourseTask(_ courseTask :CourseTask) {
        guard let id = courseTask.id else {return}
        var _  = dbCourseTasks.collection("CourseTasks").document(id).delete() { err in
            if let err = err {
              print("Error removing document: \(err)")
            }
            else {
              print("Document successfully removed!")
            }
        }
    }
    
    
    
   
}


