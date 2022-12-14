//
//  insideTeacherReviews.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 26/05/1444 AH.
//

import SwiftUI

struct insideTeacherReviews: View {
    @State var student = "ريما محمد"
    @State var selectedSection = "تقييم الطالب"
 
    @State private var showDeleteAlert = false
    var course : Course
    var body: some View {

            ZStack {
                Color("bg").ignoresSafeArea()
                VStack{
                    HStack{
                        Image("girl")
                            .resizable()
                        
                            .overlay(Circle()
                                .stroke(Color("photoFrame"), lineWidth: 5))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                        Text(" "+student).font(.system(size: 27))
                        Spacer()
                    }.padding(.leading)
                    
                    PickerView(characters: ["تقييم الطالب","حالة المهام المسندة"], selectedCharacter: $selectedSection, color: course.courseColor ?? "pink").padding(.vertical)
                    Spacer()
                          if selectedSection == "حالة المهام المسندة" {
                              TaskStatus()
                              
                          }
                          if selectedSection == "تقييم الطالب"{
                              StudentReviews(course : course)
                         
                      }
                }
            }.padding(.horizontal)

        }
    }
    
struct StudentReviews: View {
    @State var student = "ريما محمد"
    @State var selectedSection = "تقييم الطالب"
    @State var pickerColor = "pink"
    @State private var showDeleteAlert = false
    @State private var showAddReviews = false
    @EnvironmentObject var dbCourseReviews: CourseReviewDB
    var course : Course
    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            ScrollView {
                VStack{
                    
                    ForEach(dbCourseReviews.reviews.indices, id: \.self) {index in
                        if(dbCourseReviews.reviews[index].reviewCourse == course.id){
                            ReviewtList(course:course, review : dbCourseReviews.reviews[index])
                        }
                    }
                }
            }
        }
        HStack(spacing: -3){
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("green")).ignoresSafeArea()
                    .cornerRadius(3)
                    .frame(width: 98,height:29, alignment: .bottomLeading)
                
                Text("اضافة تقييم")
                    .font(.system(size: 15))
                
            } // end Zstack
            
            ZStack {
                Rectangle()
                    .foregroundColor(Color("green"))
                    .frame(width:56,height:56)
                    .cornerRadius(21.8)
                
                ZStack{
                    Button("+"){
                        showAddReviews.toggle()
                    }// end Button
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    
                }// end Zstack
            } // end Zstack
            Spacer()
            
        } //End Hstack
        
        .sheet(isPresented: $showAddReviews){
            
            AddReviewsSheet(showAddReviews: $showAddReviews , course: course).presentationDetents([.fraction(0.4)])
            
        }
        
    }
}
struct AddReviewsSheet: View {
    @Binding var showAddReviews : Bool
    @State var review = ""
    @EnvironmentObject var dbCourseReviews: CourseReviewDB
    var course : Course
    var body: some View {
        NavigationView{
            ZStack{
                Form{
                    Section{
                        TextField("التقييم", text: $review,  axis: .vertical)
                            .lineLimit(5...10)
                    }.environment(\.layoutDirection,.rightToLeft)
                    Section(footer:
                                HStack {
                        Spacer()
                        Button {
                            //action
                            dbCourseReviews.addCourseReview(CourseReview (reviewDesc:review , reviewCourse: course.id , reviewDate: Date.now))

                            showAddReviews = false
                            
                        } label: {
                            HStack{
                                Spacer()
                                Text("اضافة").font(.title2)
                                Spacer()
                            }
                        }.tint(Color("green"))
                            .buttonStyle(.borderedProminent)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    ) { EmptyView()}
                }.scrollContentBackground(.hidden)
                    .background(Color("sheet"))
            }.navigationTitle("اضافة تقييم جديد")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{showAddReviews=false}){
                        Image(systemName:"xmark.circle")
                            .foregroundColor(.gray)
                    } // end button
                } // end toolbar item
            }
        }
    }
    
}
