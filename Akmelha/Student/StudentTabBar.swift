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

    @State var selectedTab : StudentTabs = .المهام
    
   
    
    var body: some View {
   
        NavigationView{

            TabView(selection: $selectedTab){
                
                StudentTaskView()
                    .tabItem{
                        Image(systemName: "list.bullet.rectangle.portrait")
                        Text("المهام")
                        
                    }.tag(StudentTabs.المهام)
                   
                StudentCourseView()
                    .tabItem{
                        Image(systemName: "doc.text.image")
                        Text("المواد")
                        
                    }.tag(StudentTabs.المواد)
                   
                
               StudentCalendarView()
                    .tabItem{
                        Image(systemName: "align.vertical.top")
                        Text("التقويم")
                        
                    }.tag(StudentTabs.التقويم)
                
                StudentGameView()
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
}


struct StudentTabBar_Previews: PreviewProvider {
  static var previews: some View {
    TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
  }
}

