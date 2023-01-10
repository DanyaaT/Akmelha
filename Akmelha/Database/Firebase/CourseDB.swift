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
    
    func deleteCourse(_ course :Course){
        do{
            var _ = try dbCourses.collection("Courses").document(course.id ?? "").delete()
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }
    
    
    func changeCourseDescription( _ course :Course){
        do {
            guard let id = course.id else {return}                 //"name of feild": "new value"
            try dbCourses.collection("Courses").document(id).setData(from: ["courseDesc": course.courseDesc],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }


    }
    
    func addCoursesStudents( _ course :Course){
        do {
            guard let id = course.id else {return}                 //"name of feild": "new value"
            try dbCourses.collection("Courses").document(id).setData(from: ["coureseStudents": course.coureseStudents],merge: true)
        } catch {
            print("Unable to encode task: \(error.localizedDescription)")
        }


    }

    
    
    
    
}


