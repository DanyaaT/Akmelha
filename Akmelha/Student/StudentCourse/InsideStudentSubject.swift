//
//  InsideStudentSubject.swift
//  Akmelha
//
//  Created by Danya T on 22/06/1444 AH.
//

import SwiftUI

struct InsideStudentSubject: View {
 var user: User
 var course : Course
 var courseTasks : [CourseTask]
 @State var selectedSection = "المهام"
 
    
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack{
                HStack{

                    Text(course.courseName ?? "").font(.title).background(Rectangle().frame( height: 13 ).foregroundColor(Color(course.courseColor ?? "pink"))).padding(.horizontal)
                    Spacer()
                }
                PickerView(characters: ["المهام", "تقييم المعلم","عن المادة"], selectedCharacter: $selectedSection, color: course.courseColor ?? "pink").padding(.horizontal)
                Spacer()
            if selectedSection == "المهام"{
                StudentCourseTasks(user: user,course: course, courseTasks: courseTasks)
                
            }
                if selectedSection == "تقييم المعلم"{
                    StudentTeacherReview(user: user,course: course)
             }
                if selectedSection == "عن المادة"{
                    AboutStudentSubject(user: user, course : course)
          }
                
            }
        }.navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
     
    }
  }

//struct InsideStudentSubject_Previews: PreviewProvider {
//    static var previews: some View {
//        InsideStudentSubject()
//    }
//}


struct StudentCourseTasks: View {
    var user: User
    var course : Course
    var courseTasks : [CourseTask]
    var body: some View{
        ScrollView{
            
                HStack{
                    
                    
                    Text("غير مكتملة")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                        .font(.system(size: 20))
                    
                    Rectangle().frame(height: 1,alignment: .center)
                        .foregroundColor(Color("title"))
                    
                    
                }.padding(.horizontal)
            let courseOwnTasks = courseOwnTasks()
                
            if courseOwnTasks.isEmpty{
                
                Rectangle().frame(height: 100).foregroundColor(.clear)
            }
            else{
                ForEach(courseOwnTasks.indices, id: \.self){index in
                    if !(courseOwnTasks[index].iscompleted ?? true) {
                        courseTask(user: user,courseTask: courseOwnTasks[index], courseName: course.courseName ?? "",courseColor: course.courseColor ?? "pink", completedButon:  courseOwnTasks[index].iscompleted ?? false )
                    }
                }
            }
                
                
                HStack{
                    
                    
                    Text("مكتملة")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                        .font(.system(size: 20))
                    
                    Rectangle().frame(height: 1,alignment: .center)
                        .foregroundColor(Color("title"))
                    
                    
                }.padding(.horizontal)
                //start
                
            ForEach(courseOwnTasks.indices, id: \.self){index in
                if courseOwnTasks[index].iscompleted ?? true {
                    courseTask(user: user,courseTask: courseOwnTasks[index], courseName: course.courseName ?? "",courseColor: course.courseColor ?? "pink", completedButon:  courseOwnTasks[index].iscompleted ?? false )
                }
            }
            
            
            
        }
    }
    
    func courseOwnTasks() -> [CourseTask]{
        var courseOwnTasks = [CourseTask]()
        for task in courseTasks{
            if task.taskCourse == course.id{
                courseOwnTasks.append(task)
            }
        }
        return courseOwnTasks
    }
}



struct StudentTeacherReview: View {
    var user: User
    var course : Course
    var body: some View{
        VStack{
            
        }
    }
}



struct AboutStudentSubject: View {
    var user: User
    var course : Course
    @EnvironmentObject var dbUsers: UserDB
    @EnvironmentObject var dbCourse: CourseDB
 
    
    var body: some View {
        VStack(alignment: .leading){
         
        
          
            HStack(spacing: 2){
                Text("وصف المادة")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.bottom)
           
           
                
            Text(course.courseDesc ?? "")
                                                                                                       
            .padding(.vertical)
            
            
            HStack(spacing: 2){
                Text("معلم المادة")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            Text(userName(id: course.courseTeacher ?? "" , users: dbUsers.users)).padding(.vertical)
            HStack(spacing: 2){
                Text("الرقم التعريفي")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            
            Text(String(course.courseNumber ?? 0)).padding(.vertical)
            Spacer()
          
            
        }.padding()
         
    }
}

