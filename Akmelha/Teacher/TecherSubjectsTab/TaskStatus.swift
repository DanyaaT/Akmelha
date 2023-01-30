//
//  TaskStatus.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 26/05/1444 AH.
//

import SwiftUI

struct TaskStatus: View {
    var student : User
    var course : Course
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            ScrollView {
                
                VStack {
                    ForEach(dbCourseTasks.tasks.indices, id: \.self) {index in
                        if dbCourseTasks.tasks[index].taskCourse == course.id && dbCourseTasks.tasks[index].taskStudent == student.id{
                            ZStack{
                                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.1), lineWidth: 1).frame( height: 60).background(Color.white).shadow(radius:0.1)
                                HStack{
                                    Image(systemName:  dbCourseTasks.tasks[index].iscompleted ?? true ?  "checkmark.circle.fill":"circle" ).font(.system(size: 26)).foregroundColor(Color("purple"))
                                    Text(dbCourseTasks.tasks[index].taskName ?? "").font(.system(size: 20))
                                    Spacer()
                                }.padding()
                                .environment(\.layoutDirection, .rightToLeft)
                            }
                        }
                        
                    }
                }
            }
        }
    }
}

//struct TaskStatus_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskStatus()
//    }
//}
