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
                    
                    VStack{
                        
                        
                        Text("\n"+"موادي")
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                        
                    }// Vstack
                    
                }//Zstack
                
                ZStack{
                    NavigationLink(destination:InsideTeacherSubject()) {
                   
                    Rectangle()
                        .foregroundColor(Color("pink"))
                        .cornerRadius(50)
                        .frame(height:61)
                    }//NavigationLink
                    .environment(\.layoutDirection,.rightToLeft)
                    .navigationBarHidden(true)
                    
                    HStack{
                        
                        
                        Text("الرياضيات")
                            .font(.system(size: 25))
                        
                        
                        Text("الثالث ابتدائي")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                        Spacer()
                        
                        
                    
                        Image("math")
                        
                            .resizable()
                            .overlay(Circle().stroke(Color("pink"), lineWidth: 15))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80, alignment: .center)
                            .clipShape(Circle())
                        
                    }// end Hstack
                    .padding(.leading)
                        
               
                } // end Zstack
                .padding()
                Spacer()
                
                
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
@State var courses = ["الرياضيات", "العلوم","لغتي الجميلة","لغتي الخالدة","الدراسات الإسلامية","اللغة الإنجليزية","المهارات الرقمية","الدراسات الاجتماعية","التربية المهنية","التربية الفنية","التفكير الناقد",]
@State var levels = ["الأول ابتدائي", "الثاني ابتدائي","الثالث ابتدائي", "الرابع ابتدائي"," الخامس ابتدائي"," السادس ابتدائي","الأول متوسط","الثاني متوسط","الثالث متوسط"]




var body: some View{
    
    VStack{
        NavigationView{
            Form {
                //
                Picker(selection: $selectedCourse, label: Text("اسم المادة")){
                    Text("").tag("")
                    ForEach(courses, id:\.self){ course in
                        Text(course)
                            .tag(course)
                    }// foreach
                }// end picker
                
                Section{
                    TextField("وصف المادة", text: $disc)
                }
                Section{
                    Picker(selection: $selectedLevel, label: Text("الصف الدراسي")){
                        Text("").tag("")
                        ForEach(levels, id:\.self){ level in
                            Text(level)
                                .tag(level)
                        } //foreach
                    } // end picker
                } // end section
            }//Form
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
    
    Button(action:{
        print("Submit button tapped")
    }, label:{
        Text("إضافة")
            .padding()
            .frame(height: 44)
            .background(Color("green"))
            .foregroundColor(.white)
            .cornerRadius(10)

        

    }// label
    )// button
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
      color = "pink"
      image = "math"
    }
   else if courseName == "العلوم"{
      color = ""
      image = ""
    }
    else if courseName == "لغتي الجميلة"{
       color = ""
       image = ""
     }
    else if courseName == "لغتي الخالدة"{
       color = ""
       image = ""
     }
    else if courseName == "الدراسات الإسلامية"{
       color = ""
       image = ""
     }
    else if courseName == "اللغة الإنجليزية"{
       color = ""
       image = ""
     }
    else if courseName == "الدراسات الاجتماعية"{
       color = ""
       image = ""
     }
    else if courseName == "المهارات الرقمية"{
       color = ""
       image = ""
     }
    else if courseName == "التربية المهنية"{
       color = ""
       image = ""
     }
    else if courseName == "التربية الفنية"{
       color = ""
       image = ""
     }
    else{
        color = ""
        image = ""
    }
    
    colorAndImage = [color, image]
    
    return colorAndImage
}
