//
//  AkmelhaApp.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth
@main



struct AkmelhaApp: App {
    
   
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var viewModel: AppViewModel
    @ObservedObject var dbCourseTasks: CourseTaskDB
    @ObservedObject var dbCourses: CourseDB
    @ObservedObject var dbEvents: EventDB
   

   
    
    init(){
        FirebaseApp.configure()
        viewModel = AppViewModel()
        dbCourseTasks = CourseTaskDB()
        dbCourses = CourseDB()
        dbEvents = EventDB()
     
    }
    var body: some Scene {
        WindowGroup {
            /*TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
                .environmentObject(viewModel)
                .environmentObject(dbCourseTasks)
                .environmentObject(dbCourses)
                .environmentObject(dbEvents)*/
            
           //
           // StudentTabBar().environment(\.layoutDirection, .rightToLeft)
             //  .environmentObject(dbEvents)
 
             TeacherCards().environment(\.layoutDirection, .rightToLeft)
               .environmentObject(dbEvents)
              
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       
       

        
        return true
    }
    
    
}
