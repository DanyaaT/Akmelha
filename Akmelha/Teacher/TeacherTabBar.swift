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

    @State var selectedTab : TeacherTabs = .المواد
    
    init() {
        
        
        UITabBar.appearance().backgroundColor = UIColor(.white)
    }
    
    var body: some View {
   
        NavigationView{

            TabView(selection: $selectedTab){
                
                TeacherSubjects()
                    .tabItem{
                        Image(systemName: "doc.text.image")
                        Text("المواد")
                        
                    }.tag(TeacherTabs.المواد)
         
                   
                
                TeacherCalendar()
                    .tabItem{
                        Image(systemName: "align.vertical.top")
                        Text("التقويم")
                        
                    }.tag(TeacherTabs.التقويم)
                    .toolbarBackground(.white, for: .tabBar)
                
                TeacherCards()
                    .tabItem{
                        Image(systemName: "calendar")
                        Text("البطاقات")
                    }.tag(TeacherTabs.البطاقات)
                    
                
            }
           
            
            .navigationTitle(selectedTab.rawValue)
           
        
            
        }         .navigationViewStyle(.stack)
           
            .tint(Color("purple"))
        

    }
}


struct TabBar_Previews: PreviewProvider {
  static var previews: some View {
    TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
  }
}

