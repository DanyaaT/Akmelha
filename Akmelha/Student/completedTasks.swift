//
//  completedTasks.swift
//  Akmelha
//
//  Created by H on 29/05/1444 AH.
//

import SwiftUI

struct completedTasks: View {
    var user: User
    var courseTasks : [CourseTask]
    var studentOwnTasks : [StudentOwnTask]
    @EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
    @EnvironmentObject var dbCourse: CourseDB
    @State private var showSheet = false

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView{
                
                HStack{
                    
                    
                    Text("المهام المدرسية")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                        .font(.system(size: 20))
                    
                    Rectangle().frame(height: 1,alignment: .center)
                        .foregroundColor(Color("title"))
                    
                    
                }.padding(.horizontal)
                
               
            
                ForEach(courseTasks.indices, id: \.self){index in
                    if courseTasks[index].iscompleted ?? true{
                        let CourseNameColor = taskCourseName(id: courseTasks[index].taskCourse ?? "", courses: dbCourse.courses)
                        courseTask(user: user,courseTask: courseTasks[index], courseName: CourseNameColor[0],courseColor: CourseNameColor[1], completedButon:  courseTasks[index].iscompleted ?? false )
                    }
                }
                
                
                
                HStack{
                    
                    
                    Text("مهامي")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                        .font(.system(size: 20))
                    
                    Rectangle().frame(height: 1,alignment: .center)
                        .foregroundColor(Color("title"))
                    
                    
                }.padding(.horizontal)
                //start
                
                ForEach(studentOwnTasks.indices, id: \.self) {index in
                    if studentOwnTasks[index].iscompleted ?? true{
                        StudentTask(task : studentOwnTasks[index], user: user, completedButon: studentOwnTasks[index].iscompleted ?? false)
                    }
                    
                }
            }
            
            
            //end
            
            Button(action: {
                showSheet = true
            }) {
                ZStack{
                    Rectangle().frame(width:60 , height:60).cornerRadius(23).foregroundColor(Color("green"))
                    Image(systemName: "plus").font(.title).foregroundColor(.white)
                }
                    
            }
        }//  Zstack
         
        
            .sheet(isPresented: $showSheet){
                SheetView(showSheet:$showSheet, user: user)
                    .presentationDetents([.medium])
            }
                
        
    }
}

//struct completedTasks_Previews: PreviewProvider {
//    static var previews: some View {
//        completedTasks()
//    }
//}
