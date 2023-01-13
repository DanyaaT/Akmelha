//
//  StudentTabBar.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

enum StudentTabs: String{
    case المهام
    case المواد
    case التقويم
    case الألعاب
}

struct StudentTabBar: View {
    var user: User
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    @EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
    @State var selectedTab : StudentTabs = .المهام
   
    var body: some View {
   
        NavigationView{

            TabView(selection: $selectedTab){
                
                StudentTaskView(user: user, courseTasks: studentOwnCourseTasks(), studentOwnTasks: studentOwnStudentTasks())
                    .tabItem{
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("المهام")
                        
                    }.tag(StudentTabs.المهام)
                   
                StudentCourseView(user: user)
                    .tabItem{
                        Image(systemName: "doc.text.image")
                        Text("المواد")
                        
                    }.tag(StudentTabs.المواد)
                   
                
                StudentCalendarView(user: user)
                    .tabItem{
                        Image(systemName: "align.vertical.top")
                        Text("التقويم")
                        
                    }.tag(StudentTabs.التقويم)
                
                StudentGameView(user: user)
                    .tabItem{
                        Image(systemName: "gamecontroller")
                        Text("الألعاب")
                    }.tag(StudentTabs.الألعاب)
                
            }
                
               
                
            
           
            
            .navigationTitle(selectedTab.rawValue)
           
        
            
        }         .navigationViewStyle(.stack)
           
            .tint(Color("purple"))
            .background(Color(.white))
            

    }
    func studentOwnCourseTasks() -> [CourseTask]{
        var courseTasks = [CourseTask]()
        for task in dbCourseTasks.tasks{
            if task.taskStudent == user.id{
                courseTasks.append(task)
            }
        }
       return courseTasks
    }
    
    func studentOwnStudentTasks() -> [StudentOwnTask]{
        var studentTask = [StudentOwnTask]()
        for task in dbStudentOwnTasks.tasks{
            if task.student == user.id{
                studentTask.append(task)
            }
        }
       return studentTask
    }
    
}




//struct StudentTabBar_Previews: PreviewProvider {
//  static var previews: some View {
//    TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
//  }
//}
//
