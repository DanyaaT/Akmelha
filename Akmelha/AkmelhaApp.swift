//
//  AkmelhaApp.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

@main
struct AkmelhaApp: App {
    
    init(){
        UITableView.appearance().backgroundColor = UIColor(named: "bg")
        UINavigationBar.appearance().tintColor = UIColor(named: "purple")

    }
    var body: some Scene {
        WindowGroup {
            TeacherTabBar()
        }
    }
}
