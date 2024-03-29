//
//  AboutTeacherSubjetc.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth


struct AboutTeacherSubject: View {
    var user: User
    @EnvironmentObject var dbUsers: UserDB
    @State private var showDeleteAlert = false
    @State var subjectDesc =  ""
    @State var edit = false
    var course : Course
    @EnvironmentObject var dbCourse: CourseDB
    @EnvironmentObject var dbEvent: EventDB
    @Environment(\.dismiss) var dismiss
    let id = Auth.auth().currentUser?.uid
    
    var body: some View {
        VStack(alignment: .leading){
         
        
          
            HStack(spacing: 2){
                Text("وصف المادة")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.bottom)
           
           
                

         
                
                TextField("الوصف", text: $subjectDesc).disabled(!edit).padding(.horizontal).background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)).frame( height: 50).background(Color("bg")))
                                                                                                       
            .padding(.vertical)
            
            
            HStack(spacing: 2){
                Text("معلم المادة")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            Text(user.userName ?? "").padding(.vertical)
            HStack(spacing: 2){
                Text("الرقم التعريفي")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            
            Text(String(course.courseNumber ?? 0)).padding(.vertical)
            Spacer()
            VStack{
            if edit{
                Button(action:{
                    showDeleteAlert = true
                }){
                    VStack{
                    HStack{
                        Spacer()
                        Image(systemName: "trash").font(.title).foregroundColor(.red)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("حذف المادة").foregroundColor(.gray)
                        Spacer()
                    }
                    }
                }.alert( isPresented: $showDeleteAlert) {
                    
                    Alert(
                        title: Text("حذف المادة؟"),
                        message: Text(""),
                        primaryButton: .destructive(Text("حذف"), action: {
                            
                            for event in dbEvent.events {
                                if (event.eventCourse == course.id){
                                    dbEvent.deleteEvent(event)
                                }
                            }
                            dbCourse.deleteCourse(course)
                            dismiss()
                        }),
                        secondaryButton: .cancel(Text("الغاء"), action: { // 1
                            
                            
                        })
                    )
                    
                }
                
            }
            }
            
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action:{edit.toggle()
                    course.courseDesc = subjectDesc
                    
                    dbCourse.changeCourseDescription(course)
                }){
                    if !edit{
                     
                           
                        Text("تحرير").foregroundColor(Color("purple"))
                           
                        
                    }else{
                       
                          
                        Text("حفظ").foregroundColor(Color("purple"))
                       
                     }
                        
                    }
                
                }
            }
         
    }
}

