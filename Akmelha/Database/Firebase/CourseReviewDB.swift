//
//  CourseReviews.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 03/06/1444 AH.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CourseReviewDB: ObservableObject {
    let dbCourseReview = Firestore.firestore()

    @Published var reviews = [CourseReview]()
    
    

    init(){
        loadData()
    }

    func loadData(){
        dbCourseReview.collection("CourseReviews").addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.reviews = querySnapshot.documents.compactMap { document in
                    do{
                        let x =  try document.data(as: CourseReview.self)
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


    func addCourseReview(_ courseReview :CourseReview){
        do{
            var _ = try dbCourseReview.collection("CourseReviews").addDocument(from: courseReview)
        }
        catch{
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }

    }
    
    
    
    
    func deleteCourseReview(_ courseReview :CourseReview) {
        guard let id = courseReview.id else {return}
        var _  = dbCourseReview.collection("CourseReviews").document(id).delete() { err in
            if let err = err {
              print("Error removing document: \(err)")
            }
            else {
              print("Document successfully removed!")
            }
        }
    }
    
    
    
   
}


