//
//  TeacherTasks.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherTasks: View{
    @State var pickerColor = "pink"
    @State var title = "الرياضيات"
    @State var showAddTaskSheet = false
    
    var body: some View{
        VStack{
            ZStack(alignment: .bottom) {
                        
                        ScrollView {
                            VStack{
                            TeacherTaskCell()
                            TeacherTaskCell()
                            TeacherTaskCell()
                        
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
        AddTeacherTask(showAddTaskSheet: .constant(true)).environment(\.layoutDirection, .rightToLeft)
    }
}



struct AddTeacherTask: View{
    
    @Binding var showAddTaskSheet: Bool
    @State var taskName = ""
    @State var taskDesc = ""
    @State var deadlineToggle = false
    @State var points = 10
    @State private var textHeight: CGFloat = 80
    @State private var taskPoints = 10
    var body: some View{
        NavigationView{
            Form{
                Section{
                TextField("اسم المهمة", text: $taskName)
//                TextView(placeholderText: "الوصف", text: self.$taskDesc, minHeight: self.textHeight,maxHeight: self.textHeight, calculatedHeight: self.$textHeight)
//                    .frame(minHeight: self.textHeight, maxHeight: self.textHeight).environment(\.layoutDirection,.rightToLeft)
                    TextField("وصف المهمة", text: $taskName).lineLimit(5)
                
                }
                Section{
                    Toggle("الموعد النهائي", isOn: $deadlineToggle)
                    HStack{
                        Text("النقاط المكتسبة:")
                    Stepper("\(taskPoints)", value: $taskPoints)
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
    @State var pickerColor = "pink"
    @State var title = "الرياضيات"
    var body: some View{
        
        
        ZStack{
            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 95).background(Color.white).shadow(radius: 0.6)
            VStack{
                HStack{
                    Text(title).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                    Spacer()
                    Text("الأثنين ٣/٤").foregroundColor(.gray)
                }
                HStack{
                    Text("تمارين نهاية الفصل").font(.title3)
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


