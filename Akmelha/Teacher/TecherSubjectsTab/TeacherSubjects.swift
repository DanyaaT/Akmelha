//
//  TeacherSubjects.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI
struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


struct TeacherSubjects: View {
    @State private var showSheet = false
    @EnvironmentObject var dbCourse: CourseDB
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
           
            VStack{
                ZStack{
                    Rectangle()
                        .cornerRadius(radius:50, corners: [.bottomRight, .bottomLeft])
                        .foregroundColor(Color("top")).ignoresSafeArea()
                        .frame(height:99)
                    Spacer()
                    HStack{
                                            NavigationLink(destination:TeacherProfile()) {
                                                Image("teacherProfile")
                                                    .resizable()
                                                    .frame(width: 64, height: 60)
                                                    .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                                            } //NavigationLink
                                            Spacer()
                                        }// hstack
                                        .padding()
                    VStack{
                        
                        
                        Text("\n"+"موادي")
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                        
                    }// Vstack
                    
                }//Zstack
                
                ScrollView {
                    VStack{
                        ForEach(dbCourse.courses.indices, id: \.self) {index in
                            subjectList(course : dbCourse.courses[index])
                        }
                        
                    }
                }


                HStack(spacing: -3){
                    
                    ZStack {
                    Rectangle()
                        .foregroundColor(Color("green")).ignoresSafeArea()
                        .cornerRadius(3)
                        .frame(width: 98,height:29, alignment: .bottomLeading)
                    
                    Text("إضافة مادة")
                        .font(.system(size: 15))
                    
                } // end Zstack
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("green"))
                            .frame(width:56,height:56)
                            .cornerRadius(21.8)
                        
                        ZStack{
                            Button("+"){
                                showSheet.toggle()
                            }// end Button
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            
                        }// end Zstack
                    }// end Zstack
                    Spacer()
                    
                } //End Hstack
            
            } // end Vstack
        }//end First Zstack
                .sheet(isPresented: $showSheet){
                    buttonSheetView(showSheet:$showSheet)
                       .presentationDetents([.medium])
                    
                } //End .sheet
        }// end body
    }//end struct



struct buttonSheetView:View{

@Binding var showSheet : Bool
@State var disc : String = ""
@State var selectedCourse = ""
@State var selectedLevel = ""
@EnvironmentObject var dbCourse: CourseDB
@State var courseColor = ""
@State var courseImage = ""
@State var courseTeacher = ""

@State var courses = ["الرياضيات", "العلوم","لغتي الجميلة","لغتي الخالدة","الدراسات الإسلامية","اللغة الإنجليزية","المهارات الرقمية","الدراسات الاجتماعية","التربية الأسرية","التربية الفنية","التفكير الناقد",]
@State var levels = ["الأول ابتدائي", "الثاني ابتدائي","الثالث ابتدائي", "الرابع ابتدائي"," الخامس ابتدائي"," السادس ابتدائي","الأول متوسط","الثاني متوسط","الثالث متوسط"]




var body: some View{
    
    VStack{
        NavigationView{
            Form {

                TextField("الوصف", text: $disc, axis: .vertical)
                    .environment(\.layoutDirection, .rightToLeft)

                Section{
                    Picker(selection: $selectedLevel, label: Text("الصف الدراسي")){
                        Text("").tag("")
                        ForEach(levels, id:\.self){ level in
                            Text(level)
                                .tag(level)
                        } //foreach
                    } // end picker
                }
                Section {
                    Picker(selection: $selectedCourse, label: Text("اسم المادة")){
                        Text("").tag("")
                        ForEach(courses, id:\.self){ course in
                            Text(course)
                                .tag(course)
                        }// foreach
                    }// end picker
                }
                
                
                
                Section(footer:
                            HStack {
                    Spacer()
                    Button {
                        courseColor = courseColorAndImage(courseName: selectedCourse)[0]
                        courseImage = courseColorAndImage(courseName: selectedCourse)[1]
                        
                        dbCourse.addCourse(Course(courseName: selectedCourse, courseDesc: disc, courseTeacher: courseTeacher, courseColor: courseColor, courseImage: courseImage, courseLevel: selectedLevel))
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
            .navigationTitle("إضافة مادة جديدة")
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
    
//    Button(action:{
//        print("Submit button tapped")
//    }, label:{
//        Text("إضافة")
//            .padding()
//            .frame(height: 44)
//            .background(Color("green"))
//            .foregroundColor(.white)
//            .cornerRadius(10)

        
//    )// button
    }// body
    }// struct


struct TeacherSubjects_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSubjects()
            .environment(\.layoutDirection,.rightToLeft)
    }
}

func courseColorAndImage(courseName: String) -> [String]{
    var colorAndImage = [""]
    var color = ""
    var image = ""
    
    if courseName == "الرياضيات"{
      color = "math"
      image = "math"
    }
   else if courseName == "العلوم"{
      color = "science"
      image = "science"
    }
    else if courseName == "لغتي الجميلة"{
       color = "arabic"
       image = "arabic"
     }
    else if courseName == "لغتي الخالدة"{
       color = "arabic"
       image = "arabic"
     }
    else if courseName == "الدراسات الإسلامية"{
       color = "islamic"
       image = "islamic"
     }
    else if courseName == "اللغة الإنجليزية"{
       color = "english"
       image = "english"
     }
    else if courseName == "الدراسات الاجتماعية"{
       color = "geo"
       image = "geo"
     }
    else if courseName == "المهارات الرقمية"{
       color = "computer"
       image = "computer"
     }
    else if courseName == "التربية الأسرية"{
       color = "family"
       image = "family"
     }
    else if courseName == "التربية الفنية"{
       color = "art"
       image = "art"
     }
    else if courseName == "التفكير الناقد"{
       color = "think"
       image = "think"
     }
    else{
        color = ""
        image = ""
    }
    
    colorAndImage = [color, image]
    
    return colorAndImage
}
