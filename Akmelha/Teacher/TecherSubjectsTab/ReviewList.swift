//
//  ReviewList.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 03/06/1444 AH.
//

import SwiftUI

struct ReviewtList: View {
    @State private var showDeleteAlert = false
    @State private var showAddReviews = false
    let course: Course
    var review: CourseReview
    @EnvironmentObject var dbCourseReviews: CourseReviewDB
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 90).background(Color.white).shadow(radius: 0.6)
            VStack{
                HStack{
                    HStack{
                        Circle()
                            .frame(width: 30, height: 20)
                            .foregroundColor(Color(course.courseColor ?? ""))
                        Text(review.reviewDate ?? Date(), style: .date).font(.system(size: 15)).foregroundColor(.gray)
                    }
                    Spacer()
                    Button(action: {showDeleteAlert = true}){
                        Image(systemName: "trash").foregroundColor(.red)
                    } .alert( isPresented: $showDeleteAlert) {
                        Alert(
                            title: Text("حذف التقييم ؟"),
                            message: Text(""),
                            primaryButton: .destructive(Text("حذف"), action: {
                                dbCourseReviews.deleteCourseReview(review)
                                
                            }),
                            secondaryButton: .cancel(Text("الغاء"), action: { // 1
                            })
                        )
                    }
                }
                HStack{
                    Text(review.reviewDesc ?? "").font(.system(size :19)).foregroundColor(.black)
                    Spacer()
                }
                
            }.padding(.horizontal)
        }
        .environment(\.layoutDirection, .rightToLeft)
    }
}
