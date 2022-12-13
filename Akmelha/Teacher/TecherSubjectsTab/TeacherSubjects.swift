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
                        
                    }
                    
                }
                
                ZStack{
                    NavigationLink(destination:InsideTeacherSubject()) {
                   
                    Rectangle()
                        .foregroundColor(Color("pink"))
                        .cornerRadius(50)
                        .frame(height:61)
                    }
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
                        
                    }// end h
                    .padding(.leading)
                        
               
                } // end z
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
                    
                }
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("green"))
                            .frame(width:56,height:56)
                            .cornerRadius(21.8)
                        
                        ZStack{
                            Button("+"){
                                showSheet.toggle()
                            }
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            
                        }
                    }
                    Spacer()
                    
                }
                
                //                .padding()// should i keep it or not?
            } // end v
        }//end z


        
                .sheet(isPresented: $showSheet){
                    buttonSheetView(showSheet:$showSheet)
                       .presentationDetents([.medium])
                    
                }
        }
        
        

    }



struct buttonSheetView:View{

@Binding var showSheet : Bool
@State var disc : String = ""
@State var selectedCourse = 0
@State var selectedLevel = 0
@State var courses: [String] = ["الرياضيات", "العلوم","لغتي الجميلة","لغتي الخالدة","الدراسات الإسلامية","اللغة الإنجليزية","المهارات الرقمية","الدراسات الاجتماعية","التربية المهنية","التربية الفنية","التفكير الناقد",]
@State var levels = ["الأول ابتدائي", "الثاني ابتدائي","الثالث ابتدائي", "الرابع ابتدائي"," الخامس ابتدائي"," السادس ابتدائي","الأول متوسط","الثاني متوسط","الثالث متوسط"]




var body: some View{
    
    VStack{
        NavigationView{
            Form {
                //
                Picker(selection: $selectedCourse, label: Text("اسم المادة")){
                    ForEach(0..<courses.count){
                        Text(self.courses[$0]).tag($0)
                    }
                }
                //                Text("Selected color: \(selectedCourse)")
                
                Section{
                    TextField("وصف المادة", text: $disc)
                }
                
                Section{
                    Picker(selection: $selectedLevel, label: Text("الصف الدراسي")){
                        ForEach(0..<levels.count){
                            Text(self.levels[$0]).tag($0)
                        }
                    }
                }
                
                //                Section{
                //                    Picker(selection: $selectedLevel, label: Text("الصف الدراسي")){
                //                        ForEach(levels,id:\.self){levels in
                //                            Text(levels)
                //                                .tag(levels)
                //                        }
                //                    }
                //                }
                
            }//Form
            
            .environment(\.layoutDirection,.rightToLeft)
            .navigationTitle("إضافة مادة جديدة")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{showSheet=false}){
                        Image(systemName:"xmark.circle")
                            .foregroundColor(.gray)
                    }
                }
                
            }
            //            .padding()
        }

    }
    
    Button(action:{
        print("Submit button tapped")
    }, label:{
        Text("إضافة")
            .padding()
            .frame(height: 44)
            .background(Color("green"))
            .foregroundColor(.white)
            .cornerRadius(10)
        
    }
        
        
    )

            
            
        }
      
    }

   
struct TeacherSubjects_Previews: PreviewProvider {
    static var previews: some View {
        TeacherSubjects()
            .environment(\.layoutDirection,.rightToLeft)

    }
}
