//
//  CourseDB.swift
//  Akmelha
//
//  Created by Danya T on 23/05/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CourseDB: ObservableObject {
    let dbCourses = Firestore.firestore()

    @Published var courses = [Course]()
    
  
    init(){
        loadData()
    }

    func loadData(){
        dbCourses.collection("Courses").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.courses = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: Course.self)
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


    func addCourse(_ course :Course){
        do{
            var _ = try dbCourses.collection("Courses").addDocument(from: course)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }
    
   
}

