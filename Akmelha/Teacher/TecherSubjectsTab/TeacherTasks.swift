//
//  TeacherTasks.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherTasks: View{
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    var course : Course
    @State var pickerColor = "pink"
    @State var title = "الرياضيات"
    @State var showAddTaskSheet = false
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom) {
                        
                        ScrollView {
                            VStack{
                                ForEach(dbCourseTasks.tasks.indices, id: \.self) {index in
                                    if(dbCourseTasks.tasks[index].taskCourse == course.id){
                                        TeacherTaskCell(task : dbCourseTasks.tasks[index], course:course)
                                    }
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
          
            AddTeacherTask(course: course, showAddTaskSheet: $showAddTaskSheet).presentationDetents([.medium])
            
        }
    }
}


//struct TeacherTasks_Previews: PreviewProvider {
//
//    static var previews: some View {
////        AddTeacherTask(showAddTaskSheet: .constant(true)).environment(\.layoutDirection, .rightToLeft)
////        TeacherTasks().environment(\.layoutDirection, .rightToLeft)
//
//    }
//}



struct AddTeacherTask: View{
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    var course: Course
    @Binding var showAddTaskSheet: Bool
    @State var taskName = ""
    @State var taskDesc = ""
    @State var taskDeadline = Date()
    
    @State private var textHeight: CGFloat = 80
    @State  var taskScore = 10
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
                Section(footer:
                            HStack {
                    Spacer()
                    
                    Button {
                        dbCourseTasks.addCourseTask(CourseTask(taskName: taskName, taskDesc: taskDesc, taskCourse:course.id, taskDeadline: taskDeadline, taskScore: taskScore ))
                        showAddTaskSheet = false
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text("اضافة").font(.title2)
                            Spacer()
                        }
                    }.tint(Color("green"))
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                ){
                EmptyView()
            }
                
            }
            
            
            
            
            .scrollContentBackground(.hidden)
            .background(Color("sheet"))
            .tint(Color("green"))
            .buttonStyle(.borderedProminent)
            
            
            
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
   
    var course: Course
    @State var showTaskCardSheet = false

    var body: some View{
        
        Button (action:{showTaskCardSheet = true}){
            ZStack{
                
                
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 95).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text(course.courseName ?? "").foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(course.courseColor ?? "pink")))
                        Spacer()
                        Text(task.taskDeadline ?? Date(), style: .date).foregroundColor(.gray)
                    }
                    HStack{
                        Text(task.taskName ?? "").font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    VStack(alignment:.trailing){
                        Text("أكمل المهمة").font(.caption).foregroundColor(.black)
                        ProgressView(value: 50.0, total: 100).progressViewStyle(LinearProgressViewStyle(tint: .green))
                        
                    }
                }.padding(.all)
                
            }
        }.sheet(isPresented: $showTaskCardSheet){
            
            TaecherTaskCard(showTaskCardSheet: $showTaskCardSheet, task: task, taskName: task.taskName ?? "", taskDesc: task.taskDesc ?? "", taskDeadline: task.taskDeadline ?? Date(), taskScore: task.taskScore ?? 10).presentationDetents([.medium])
        }
    }
}


struct TaecherTaskCard: View{
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    @Binding var showTaskCardSheet : Bool
    var task: CourseTask
    
    @State var taskName = ""
    @State var taskDesc = ""
    @State var taskDeadline = Date()
    @State  var taskScore = 10
    @State private var showDeleteAlert = false
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
                Section(footer:
                            HStack {
                    Spacer()
                    
                    Button {
                        task.taskName = taskName
                        task.taskDesc = taskDesc
                        task.taskDeadline = taskDeadline
                        task.taskScore = taskScore
                        dbCourseTasks.updateCourseTask(task)
                        showTaskCardSheet = false
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text("حفظ").font(.title2)
                            Spacer()
                        }
                    }.tint(Color("green"))
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                ){
                    EmptyView()
                }
                
            }
            
            
            
            
            .scrollContentBackground(.hidden)
            .background(Color("sheet"))
            .tint(Color("green"))
            .buttonStyle(.borderedProminent)
            
            
            
            .environment(\.layoutDirection,.rightToLeft)
            .navigationTitle("إضافة مهمة جديدة")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {showTaskCardSheet = false}){
                        Image(systemName: "xmark.circle").foregroundColor(.gray)
                    }
                }
                ToolbarItem(placement:.navigationBarLeading){
                    Button(action: {showDeleteAlert = true}){
                        Image(systemName: "trash").foregroundColor(.red)
                     
                    }.alert( isPresented: $showDeleteAlert) {
                        
                        Alert(
                            title: Text("حذف المهمة؟"),
                            message: Text(""),
                            primaryButton: .destructive(Text("حذف"), action: {
                                dbCourseTasks.deleteCourseTask(task)
                            }),
                            secondaryButton: .cancel(Text("الغاء"), action: { // 1
                                
                                
                            })
                        )
                        
                    }
                }
                
            }
        }
    }
}
