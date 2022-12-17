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
    
   
}


