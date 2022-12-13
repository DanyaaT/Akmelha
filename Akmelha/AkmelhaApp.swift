//
//  AkmelhaApp.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

@main
struct AkmelhaApp: App {

   
    var body: some Scene {
        WindowGroup {
            TeacherTabBar().environment(\.layoutDirection, .rightToLeft)
        }
    }
}
