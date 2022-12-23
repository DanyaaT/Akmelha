//
//  AboutTeacherSubjetc.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct AboutTeacherSubject: View {
    @State private var showDeleteAlert = false
    @State var subjectDesc =  ""
    @State var edit = false
    let course : Course
    @EnvironmentObject var dbCourse: CourseDB
    @Environment(\.dismiss) var dismiss
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
            Text("الأستادة/ جواهر محمد").padding(.vertical)
            HStack(spacing: 2){
                Text("الرقم التعريفي")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            Text("441g34662hh78").padding(.vertical)
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

