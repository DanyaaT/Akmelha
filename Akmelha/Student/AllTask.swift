//
//  AllTask.swift
//  Akmelha
//
//  Created by H on 29/05/1444 AH.
//

import SwiftUI

struct AllTask: View {
    var user: User
    var courseTasks : [CourseTask]
    var studentOwnTasks : [StudentOwnTask]
    @EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
    @EnvironmentObject var dbCourse: CourseDB
    @State private var showSheet = false

    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView{
                
                HStack{
                    
                    
                    Text("المهام المدرسية")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                        .font(.system(size: 20))
                    
                    Rectangle().frame(height: 1,alignment: .center)
                        .foregroundColor(Color("title"))
                    
                    
                }.padding(.horizontal)
                
               
            
                ForEach(courseTasks.indices, id: \.self){index in
                    let CourseNameColor = CourseNameLevel(id: courseTasks[index].taskCourse ?? "", courses: dbCourse.courses)
                    courseTask(user: user,courseTask: courseTasks[index], courseName: CourseNameColor[0],courseColor: CourseNameColor[1], completedButon:  courseTasks[index].iscompleted ?? false )
                }
                
                
                
                HStack{
                    
                    
                    Text("مهامي")
                        .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                        .font(.system(size: 20))
                    
                    Rectangle().frame(height: 1,alignment: .center)
                        .foregroundColor(Color("title"))
                    
                    
                }.padding(.horizontal)
                //start
                
                ForEach(studentOwnTasks.indices, id: \.self) {index in
                  
                        StudentTask(task : studentOwnTasks[index], user: user, completedButon: studentOwnTasks[index].iscompleted ?? false)
                    
                }
            }
            
            
            //end
            
            Button(action: {
                showSheet = true
            }) {
                ZStack{
                    Rectangle().frame(width:60 , height:60).cornerRadius(23).foregroundColor(Color("green"))
                    Image(systemName: "plus").font(.title).foregroundColor(.white)
                }
                    
            }
        }//  Zstack
         
        
            .sheet(isPresented: $showSheet){
                SheetView(showSheet:$showSheet, user: user)
                    .presentationDetents([.medium])
            }
                
        
    }
}




struct courseTask: View{
    @State var showCourseTaskCardSheet = false
    var user: User
    var courseTask : CourseTask
    @EnvironmentObject var dbCourseTasks: CourseTaskDB
    @EnvironmentObject var dbCourse: CourseDB
    @EnvironmentObject var dbUsers: UserDB
    var courseName = ""
    var courseColor = ""
    @State var completedButon = false
    var body: some View{
        Button {
            showCourseTaskCardSheet = true
        }
    label: {
        ZStack{
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
            VStack{
                HStack{
                    Text(courseName).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(courseColor)))
                    Spacer()
                    Text(getTaskDate(date:courseTask.taskDeadline ?? Date()))
                        .foregroundColor(.gray)
                }
                HStack{
                    ZStack {
                        Button{
                            completedButon.toggle()
                            courseTask.iscompleted = completedButon
                            dbCourseTasks.changeCourseTaskStatus(courseTask)
                            
                            if courseTask.iscompleted ?? false {
                                if var credit = user.studentCredit {
                                    credit = credit + (courseTask.taskScore ?? 10)
                                    user.studentCredit = credit
                                }
                                
                                dbUsers.changeStudentCredit(user)
                                
                            }else{
                                if var credit = user.studentCredit {
                                    credit = credit - (courseTask.taskScore ?? 10)
                                    user.studentCredit = credit
                                }
                                dbUsers.changeStudentCredit(user)
                            }
                            
                        }
                    label: {
                        Image(systemName: completedButon ?  "checkmark.circle.fill":"circle" ).font(.system(size: 26))
                        
                    }
                        
                    }
                    ZStack{
                        
                        Text(courseTask.taskName ?? "").font(.title3).foregroundColor(.black)
                        
                        
                        Rectangle().frame(width: CGFloat((courseTask.taskName?.count ?? 0 )*10) ,height: 1,alignment: .leading)
                            .foregroundColor(completedButon ? Color( "pink") : .clear)
                    }
                    Spacer()
                }
                
                HStack{
                    
                    Spacer()
                    Text("\(courseTask.taskScore ?? 10) نقاط").foregroundColor(.gray)
                }
                
                
                
            }.padding()
        }.padding(.horizontal)
    }.sheet(isPresented: $showCourseTaskCardSheet){
        
        courseTaskCard(showCourseTaskCardSheet: $showCourseTaskCardSheet, courseTask: courseTask, taskName: courseTask.taskName ?? "", taskDesc: courseTask.taskDesc ?? "",courseName: courseName, taskScore: courseTask.taskScore ?? 5).presentationDetents([.medium])
        
        
     }
    }
}

struct courseTaskCard: View{
    @Binding var showCourseTaskCardSheet : Bool
    var courseTask: CourseTask
    @State var taskName = ""
    @State var taskDesc = ""
    @State var courseName = ""
    @State var taskScore = 10
    
    var body: some View{
        NavigationView{
            Form{
                
                Section{
                    HStack{
                        Text("اسم المهمة:")
                        Text(taskName)
                    }
                    HStack{
                        Text("المادة:")
                        Text(courseName)
                    }
                    
                    
                    //                TextView(placeholderText: "الوصف", text: self.$taskDesc, minHeight: self.textHeight,maxHeight: self.textHeight, calculatedHeight: self.$textHeight)
                    //                    .frame(minHeight: self.textHeight, maxHeight: self.textHeight).environment(\.layoutDirection,.rightToLeft)
                    
                    HStack{
                        Text("الوصف:")
                        Text(taskDesc)
                    }
                    
                    
                }
                Section{
    
                    HStack{
                        Text("النقاط المكتسبة:")
                        Text("\(taskScore)")
                    }
                }
                Section(footer:
                            HStack {
                    Spacer()
                    
                    Button {
                        
                        
                        showCourseTaskCardSheet = false
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text("إغلاق").font(.title2)
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
            .environment(\.layoutDirection,.rightToLeft)
                .scrollContentBackground(.hidden)
                .background(Color("sheet"))
                .navigationTitle("تفاصيل المهمة")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {showCourseTaskCardSheet = false}){
                            Image(systemName: "xmark.circle").foregroundColor(.gray)
                        }
                    }
                }
        }
    }
}










struct SheetView:View{

@Binding var showSheet : Bool
@State var taskName : String = ""
@State var disc : String = ""
@EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
@EnvironmentObject var dbCourse: CourseDB
@State var taskScore = 5
@State var Message = ""

var user: User




var body: some View{
    
    VStack{
        NavigationView{
            Form {
    
                Section(header:Text(Message).foregroundColor(.red)){
                    TextField("اسم المهمة", text: $taskName)
                        .environment(\.layoutDirection, .rightToLeft)
                        .frame(width: 300)
                        .frame(alignment: .top)
                        
                    
                    TextField("الوصف", text: $disc)
                        .environment(\.layoutDirection, .rightToLeft)
                        .frame(width: 300,height: 160,alignment: .top)
                        .lineLimit(3)
                }
                
                
                Section(footer:
                            HStack {
                    Spacer()
                    Button {
                        if (taskName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                            Message = "الرجاء إدخال اسم المهمة "
                        }
                        
                        else{
                        dbStudentOwnTasks.addStudentOwnTasks(StudentOwnTask(taskName: taskName, taskDesc: disc,taskScore: taskScore, iscompleted: false, student: user.id ))
                            showSheet = false
                        }
                  
                    } label: {
                        HStack{
                            Spacer()
                            Text("إضافة").font(.title2)
                            Spacer()
                        }
                    }.tint(Color("green"))
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .cornerRadius(10)
               
    
                }
                ) {
                    EmptyView()
                }
            }
            .environment(\.layoutDirection,.rightToLeft)
            .scrollContentBackground(.hidden)
            .background(Color("sheet"))
            .navigationTitle("إضافة مهمة جديدة")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{showSheet=false}){
                        Image(systemName:"xmark.circle")
                            .foregroundColor(.gray)
                    }// end button
                }// end toolbar item
                
            }//end toolbar
        }// end NavigationView

    } // end first Vstack
    

    }// body
    }// struct


struct StudentTask: View {
    @State var showTaskCardSheet = false
    var task :StudentOwnTask
    var user: User
    @EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
    @State var completedButon = false
    @EnvironmentObject var dbUsers: UserDB
    var body: some View {
        Button {
            showTaskCardSheet = true
        }
    label: {
        ZStack{
            
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
            VStack{
                Spacer()
                Spacer()
                
                HStack{
                    ZStack {
                        Button{
                            completedButon.toggle()
                            task.iscompleted = completedButon
                            dbStudentOwnTasks.changeTaskStatus(task)
                            
                            if task.iscompleted ?? false {
                                if var credit = user.studentCredit {
                                    credit = credit + (task.taskScore ?? 5)
                                    user.studentCredit = credit
                                }
                               
                                dbUsers.changeStudentCredit(user)
                               
                            }else{
                                if var credit = user.studentCredit {
                                    
                                    credit = credit - (task.taskScore ?? 5)
                                    if credit < 0 {
                                        credit = 0
                                    }
                                    user.studentCredit = credit
                                }
                                dbUsers.changeStudentCredit(user)
                            }
                            
                        }
                    label: {
                        Image(systemName: completedButon ?  "checkmark.circle.fill":"circle" ).font(.system(size: 26))
                       
                        }
                        
                    }
                    ZStack{
                        
                        Text(task.taskName ?? "").font(.title3).foregroundColor(.black)
                        
                        
                        Rectangle().frame(width: CGFloat((task.taskName?.count ?? 0 )*10) ,height: 1,alignment: .leading)
                            .foregroundColor(completedButon ? Color( "pink") : .clear)
                    }
                    Spacer()
                }
                HStack{
                    
                    Spacer()
                    Text("٥ نقاط").foregroundColor(.gray)
                }
            }.padding()
        }.padding(.horizontal)
    }.sheet(isPresented: $showTaskCardSheet){
        
        StudentTaskCard(showTaskCardSheet: $showTaskCardSheet, task: task, taskName: task.taskName ?? "", taskDesc: task.taskDesc ?? "", taskScore: task.taskScore ?? 5).presentationDetents([.medium])
    }

        
    }
}
struct StudentTaskCard: View{
    @EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
    @Binding var showTaskCardSheet : Bool
    var task: StudentOwnTask
    
    @State var taskName = ""
    @State var taskDesc = ""
    @State  var taskScore = 5
    @State  var Message = ""

    @State private var showDeleteAlert = false
    var body: some View{
        
        NavigationView{
            Form{
                Section(header:Text(Message).foregroundColor(.red)){
                    TextField("اسم المهمة", text: $taskName)
                    //                TextView(placeholderText: "الوصف", text: self.$taskDesc, minHeight: self.textHeight,maxHeight: self.textHeight, calculatedHeight: self.$textHeight)
                    //                    .frame(minHeight: self.textHeight, maxHeight: self.textHeight).environment(\.layoutDirection,.rightToLeft)
                    
                    TextField("الوصف", text: $taskDesc).lineLimit(5)
                    
                    
                }
                Section{
    
                    HStack{
                        Text("النقاط المكتسبة:")
                        Text("\(taskScore)")
                    }
                }
                Section(footer:
                            HStack {
                    Spacer()
                    
                    Button {
                        if (taskName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty){
                            Message = "الرجاء إدخال اسم المهمة "
                        }
                        else{
                            task.taskName = taskName
                            task.taskDesc = taskDesc
                            task.taskScore = taskScore
                            dbStudentOwnTasks.updateStudentOwnTasks(task)
                            showTaskCardSheet = false
                        }
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
            .navigationTitle("تفاصيل المهمة")
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
                     
                    } .alert( isPresented: $showDeleteAlert) {
                        
                        Alert(
                            title: Text("حذف المهمة؟"),
                            message: Text(""),
                            primaryButton: .destructive(Text("حذف"), action: {
                                dbStudentOwnTasks.deleteStudentOwnTasks(task)
                                showTaskCardSheet = false
                            }),
                            secondaryButton: .cancel(Text("إلغاء"), action: { // 1
                                
                                
                            })
                        )
                        
                    }
                }
                
            }
        }
    }
}

//struct AllTask_Previews: PreviewProvider {
//    static var previews: some View {
//        AllTask() .environment(\.layoutDirection,.rightToLeft)
//    }
//}

func CourseNameLevel(id: String, courses: [Course]) ->[String]{
    var name = ""
    var color = ""
    var level = ""
    for course in courses{
        if course.id == id{
            name = course.courseName ?? ""
            color = course.courseColor ?? "pink"
            level = course.courseLevel ?? ""
            break
        }
    }
    return [name, color, level]
}
