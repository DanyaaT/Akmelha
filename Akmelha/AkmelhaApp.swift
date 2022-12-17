//
//  AkmelhaApp.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI
import FirebaseCore
@main
struct AkmelhaApp: App {
    @ObservedObject var dbCourseTasks: CourseTaskDB
    @ObservedObject var dbCourses: CourseDB
    @ObservedObject var dbEvents: EventDB
    
    init(){
        FirebaseApp.configure()
        dbCourseTasks = CourseTaskDB()
        dbCourses = CourseDB()
        dbEvents = EventDB()
        
    }
    var body: some Scene {
        WindowGroup {
            TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
                .environmentObject(dbCourseTasks)
                .environmentObject(dbCourses)
                .environmentObject(dbEvents)
        }
    }
}
