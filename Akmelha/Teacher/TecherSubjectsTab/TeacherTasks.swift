//
//  TeacherTasks.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherTasks: View{
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    
    @State var pickerColor = "pink"
    @State var title = "الرياضيات"
    @State var showAddTaskSheet = false
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom) {
                        
                        ScrollView {
                            VStack{
                                ForEach(dbCourseTasks.tasks.indices, id: \.self) {index in
                                    TeacherTaskCell(task : dbCourseTasks.tasks[index])
                                }
                                
                            }
                        }
                        
                        Button(action: {
                            showAddTaskSheet = true
                        }) {
                            ZStack{
                                Rectangle().frame(width:60 , height:60).cornerRadius(23).foregroundColor(Color("green"))
                                Image(systemName: "plus").font(.largeTitle).foregroundColor(.white)
                            }
                                
                        }
                        
                    }
           
           Spacer()
        }
        .sheet(isPresented: $showAddTaskSheet){
          
                AddTeacherTask(showAddTaskSheet: $showAddTaskSheet).presentationDetents([.medium])
            
        }
    }
}


struct TeacherTasks_Previews: PreviewProvider {
   
    static var previews: some View {
//        AddTeacherTask(showAddTaskSheet: .constant(true)).environment(\.layoutDirection, .rightToLeft)
        TeacherTasks().environment(\.layoutDirection, .rightToLeft)
           
    }
}



struct AddTeacherTask: View{
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    
    @Binding var showAddTaskSheet: Bool
    @State var taskName = ""
    @State var taskDesc = ""
    @State var taskCourse = "الرياضايات"
    @State var taskDeadline = Date()
      
    @State private var textHeight: CGFloat = 80
    @State private var taskScore = 10
    var body: some View{
        NavigationView{
            Form{
                Section{
                TextField("اسم المهمة", text: $taskName)
//                TextView(placeholderText: "الوصف", text: self.$taskDesc, minHeight: self.textHeight,maxHeight: self.textHeight, calculatedHeight: self.$textHeight)
//                    .frame(minHeight: self.textHeight, maxHeight: self.textHeight).environment(\.layoutDirection,.rightToLeft)

                    TextField("الوصف", text: $taskDesc).lineLimit(5)

                
                }
                Section{
             
                        
                        DatePicker("الموعد النهائي",
                                   selection: $taskDeadline,
                                   displayedComponents: .date)
                        
                            .accentColor(Color("purple"))
                    
                    HStack{
                        Text("النقاط المكتسبة:")
                    Stepper("\(taskScore)", value: $taskScore)
                    }
                }
                Button(action: {
                    dbCourseTasks.addCourseTask(CourseTask(taskName: taskName, taskDesc: taskDesc, taskCourse:taskCourse, taskDeadline: taskDeadline, taskScore: taskScore ))
                    showAddTaskSheet = false
                    
                }){
                    HStack{
                        Spacer()
                        Text("اضافة").font(.title2)
                        Spacer()
                    }
                    
                }
                
                
                
                
            }.scrollContentBackground(.hidden)
                .background(Color("sheet"))
            
            
            
        .environment(\.layoutDirection,.rightToLeft)
        .navigationTitle("إضافة مهمة جديدة")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {showAddTaskSheet = false}){
                    Image(systemName: "xmark.circle").foregroundColor(.gray)
                }
            }
         }
       }
    }
}





struct TeacherTaskCell: View{
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    
    var task: CourseTask
    @State var pickerColor = "pink"
    @State var title = "الرياضيات"
    var body: some View{
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 95).background(Color.white).shadow(radius: 0.6)
            VStack{
                HStack{
                    Text(task.taskCourse ?? "").background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                    Spacer()
                    Text(task.taskDeadline ?? Date(), style: .date).foregroundColor(.gray)
                }
                HStack{
                    Text(task.taskName ?? "").font(.title3)
                    Spacer()
                }
                VStack(alignment:.trailing){
                    Text("أكمل المهمة").font(.caption)
                ProgressView(value: 50.0, total: 100).progressViewStyle(LinearProgressViewStyle(tint: .green))
              
                }
            }.padding(.all)
            
        }
    }
}
