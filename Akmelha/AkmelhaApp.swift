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
    @ObservedObject var dbUsers: UserDB
    @ObservedObject var dbCourseTasks: CourseTaskDB
    @ObservedObject var dbCourses: CourseDB
    @ObservedObject var dbEvents: EventDB
    @ObservedObject var dbRandomId: RandomIdGenerator
    @ObservedObject var dbCourseReviews: CourseReviewDB
    @ObservedObject var dbStudentOwnTasks: StudentOwnTaskDB

   
    
    init(){
        
        FirebaseApp.configure()
        viewModel = AppViewModel()
        dbCourseTasks = CourseTaskDB()
        dbCourses = CourseDB()
        dbEvents = EventDB()
        dbUsers = UserDB()
        dbRandomId = RandomIdGenerator()
        dbCourseReviews = CourseReviewDB()
        dbStudentOwnTasks = StudentOwnTaskDB()
        UITabBar.appearance().backgroundColor = UIColor(.white)
     
    }
    var body: some Scene {
        WindowGroup {
          
            SwiftUIView().environment(\.layoutDirection, .rightToLeft)
                    .environmentObject(viewModel)
                    .environmentObject(dbCourseTasks)
                    .environmentObject(dbCourses)
                    .environmentObject(dbEvents)
                    .environmentObject(dbUsers)
                    .environmentObject(dbRandomId)
                    .environmentObject(dbStudentOwnTasks)

//                WelcomePage().environment(\.layoutDirection, .rightToLeft)
//                    .environmentObject(viewModel)
//                    .environmentObject(dbCourseTasks)
//                    .environmentObject(dbCourses)
//                    .environmentObject(dbEvents)
//                    .environmentObject(dbUsers)
            
            }
       // StudentTabBar().environment(\.layoutDirection, .rightToLeft)
       //    .environmentObject(dbEvents)
           
 
//            SignUP().environment(\.layoutDirection, .rightToLeft)
//               .environmentObject(dbEvents)
              
        
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
       
       

        
        return true
    }
    
    
}
