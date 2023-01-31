//
//  TeacherTabBar.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

enum TeacherTabs: String{
    case المواد
    case التقويم
    case البطاقات
}

struct TeacherTabBar: View {
    var user: User
    @EnvironmentObject var dbCourse: CourseDB
    @State var selectedTab : TeacherTabs = .المواد
    
    
    
    var body: some View {
        
        NavigationView{
            
            TabView(selection: $selectedTab){
                
                TeacherSubjects(user: user)
                    .tabItem{
                        Image(systemName: "doc.text.image")
                        Text("المواد")
                        
                    }.tag(TeacherTabs.المواد)
                
                
                let cArr = studentCourse()
                TeacherCalendar(user: user, course: cArr )
                    .tabItem{
                        Image(systemName: "align.vertical.top")
                        Text("التقويم")
                        
                    }.tag(TeacherTabs.التقويم)
                    .toolbarBackground(.white, for: .tabBar)
                
                TeacherCards(user: user)
                    .tabItem{
                        Image(systemName: "calendar")
                        Text("البطاقات")
                    }.tag(TeacherTabs.البطاقات)
                
                
            }
            
            
            .navigationTitle(selectedTab.rawValue)
            
            
            
        }         .navigationViewStyle(.stack)
        
            .tint(Color("purple"))
        
        
    }
    
    func studentCourse() -> [Course]{
        var courses = [Course]()
        for course in dbCourse.courses{
            if course.courseTeacher == user.id{
                courses.append(course)
            }
        }
        return courses
    }
}
//struct TabBar_Previews: PreviewProvider {
//  static var previews: some View {
//    TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
//  }
//}

