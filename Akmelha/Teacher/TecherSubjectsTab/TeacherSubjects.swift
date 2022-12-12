//
//  TeacherSubjects.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherSubjects: View {
    var body: some View {
        NavigationLink(destination:InsideTeacherSubject()) {
            Text("الرياضايات")
        }
        .navigationBarHidden(true)
    }
}

struct TeacherSubjects_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSubjects().environment(\.layoutDirection, .rightToLeft)
    }
}
