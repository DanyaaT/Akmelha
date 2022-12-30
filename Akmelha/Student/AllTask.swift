//
//  AllTask.swift
//  Akmelha
//
//  Created by H on 29/05/1444 AH.
//

import SwiftUI

struct AllTask: View {
    @EnvironmentObject var dbStudentOwnTasks: StudentOwnTaskDB
    @State private var showSheet = false

    var body: some View {
        ScrollView{
            
            HStack{
                
                
                Text("المهام المدرسية")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                    .font(.system(size: 20))
                
                Rectangle().frame(height: 1,alignment: .center)
                    .foregroundColor(Color("title"))
                
                
            }.padding(.horizontal)
            
            Button {
                
            }
        label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text("الرياضيات").foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color("pink")))
                        Spacer()
                        Text("الأربعاء ٣/٢٨")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        ZStack {
                            Circle().strokeBorder(.black, lineWidth: 1)
                                .frame(width: 30, height: 30)
                            
                            
                        }
                        
                        Text("مطوية الفصل الرابع").font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    
                    HStack{
                        
                        Spacer()
                        Text("١٠ نقاط").foregroundColor(.gray)
                    }
                    
                    
                    
                }.padding()
            }.padding(.horizontal)
        }
            
            Button {
                
            }
        label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text("الدراسات الإسلامية").foregroundColor(.black).background(
                            Rectangle()
                                .frame( height: 8 )
                                .foregroundColor(Color("green"))
                        )
                        Spacer()
                        Text("الخميس ٣/٢٩ ")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("checkColor"))
                            
                            Image(systemName: "checkmark").foregroundColor(.white)
                        }
                        
                        ZStack{
                            
                            Text("مراجعة سورة البيّنة").font(.title3).foregroundColor(.black)
                            
                            Rectangle().frame(width: 180,height: 1,alignment: .leading)
                                .foregroundColor(Color("pink"))
                        }
                        Spacer()
                    }
                    HStack{
                        
                        Spacer()
                        Text("١٥ نقاط").foregroundColor(.gray)
                    }
                    
                    
                    
                }.padding()
            }.padding(.horizontal)
        }
            
            
            HStack{
                
                
                Text("مهامي")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                    .font(.system(size: 20))
                
                Rectangle().frame(height: 1,alignment: .center)
                    .foregroundColor(Color("title"))
                
                
            }.padding(.horizontal)
            //start
               
                ForEach(dbStudentOwnTasks.tasks.indices, id: \.self) {index in
                    StudentTask(task : dbStudentOwnTasks.tasks[index])
                }
            
            //end
         
            ZStack {
                
                Rectangle()
                    .foregroundColor(Color("green"))
                    .frame(width:56,height:56, alignment: .bottom)
                    .cornerRadius(21.8)
                
                Button("+"){
                    showSheet = true                }// end Button
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 56 , height: 56 ,alignment: .center)
                
            }//  Zstack
            .frame(alignment: .bottom)
        } //scroolview
        
            .sheet(isPresented: $showSheet){
                SheetView(showSheet:$showSheet)
                    .presentationDetents([.medium])
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





var body: some View{
    
    VStack{
        NavigationView{
            Form {

                TextField("اسم المهمة", text: $taskName, axis: .vertical)
                    .environment(\.layoutDirection, .rightToLeft)
                   .frame(width: 300)
                   .frame(alignment: .top)

                
             

                
                TextField("الوصف", text: $disc, axis: .vertical)
                    .environment(\.layoutDirection, .rightToLeft)
                    .frame(width: 300,height: 200,alignment: .top)
                
                
                
                
                Section(footer:
                            HStack {
                    Spacer()
                    Button {
                        dbStudentOwnTasks.addStudentOwnTasks(StudentOwnTask(taskName: taskName, taskDesc: disc,taskScore: taskScore, iscomleted: false ))
                        showSheet = false
                  
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
                ) {
                    EmptyView()
                }
            }
            .environment(\.layoutDirection,.rightToLeft)
            .scrollContentBackground(.hidden)
            .background(Color("sheet"))
            .navigationTitle("اضافة مهمة جديدة")
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
    
    var body: some View {
        Button {
            showTaskCardSheet = true
        }
    label: {
        ZStack{
            
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
            VStack{
                Spacer()
                Spacer()
                
                HStack{
                    ZStack {
                        Button{
                          //  task.iscomleted?.toggle()
                        }
                    label: {
                      //  task.iscomleted! ? Image(systemName: "checkmark.circle.fill") : Image(systemName: "circle")
                        Circle().strokeBorder(.black, lineWidth: 1)
                               .frame(width: 30, height: 30)
                        }
                        
                    }
                    
                    Text(task.taskName ?? "").font(.title3).foregroundColor(.black)
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
    
                    HStack{
                        Text("النقاط المكتسبة:")
                        Text("\(taskScore)")
                    }
                }
                Section(footer:
                            HStack {
                    Spacer()
                    
                    Button {
                        task.taskName = taskName
                        task.taskDesc = taskDesc
                        task.taskScore = taskScore
                        dbStudentOwnTasks.updateStudentOwnTasks(task)
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
                     
                    } .alert( isPresented: $showDeleteAlert) {
                        
                        Alert(
                            title: Text("حذف المهمة؟"),
                            message: Text(""),
                            primaryButton: .destructive(Text("حذف"), action: {
                                dbStudentOwnTasks.deleteStudentOwnTasks(task)
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

struct AllTask_Previews: PreviewProvider {
    static var previews: some View {
        AllTask() .environment(\.layoutDirection,.rightToLeft)
    }
}
