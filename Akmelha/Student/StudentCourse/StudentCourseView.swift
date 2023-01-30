//
//  StudentCourseView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct CornerRadiusShapee: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStylee: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadiuss(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}


struct StudentCourseView: View {
    var user: User
    var courseTasks : [CourseTask]
    @EnvironmentObject var dbCourse: CourseDB
    @EnvironmentObject var dbUsers: UserDB
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
                }//Zstac
                .toolbar(.hidden) //end overlay
                
                
                ScrollView {
                    VStack{
                        let studentCourses = studentCourses(studentCourses: user.studentCourses , courses: dbCourse.courses)
                        ForEach(studentCourses.indices, id: \.self) {index in
                            NavigationLink(destination: InsideStudentSubject(user: user, course: studentCourses[index], courseTasks: courseTasks)){
                                subjectCell(course:studentCourses[index])
                            }
                        }
                      
                            
                    }
                }
                
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
                } //End Hstack}
            }
        } // first z
        .sheet(isPresented: $showSheet){
            addCourseSheetView(user: user,showSheet:$showSheet)
                .presentationDetents([.fraction(0.3)])
            
        }
    }
    
}

func studentCourses(studentCourses: [String], courses: [Course]) -> [Course]{
 
    var array : [Course] = [Course]()
        for i in studentCourses{
            for j in courses{
                if i == j.id{
                    array.append(j)
                    break
                }
            }
        
           
    }
    return array
}


    
struct addCourseSheetView:View{
var user: User
@EnvironmentObject var dbCourse: CourseDB
@EnvironmentObject var dbUsers: UserDB
@Binding var showSheet : Bool
@State var number : String = ""
@State var found = ""

    
    var body: some View{
        NavigationView{
            
            Form{
                Section(header:Text(found).foregroundColor(.red)){
                    
                    TextField("الرقم التعريفي", text: $number)
                        .environment(\.layoutDirection, .rightToLeft)
                }
                Section(footer:
                            HStack {
                    Spacer()
                    Button {
                        for course in dbCourse.courses{
                            if course.courseNumber?.description == number{
                                course.coureseStudents?.append(user.id ?? "")
                                user.studentCourses.append(course.id ?? "")
                                showSheet=false
                                dbUsers.addStudentCourse(user)
                                dbCourse.addCoursesStudents(course)
                                
                            }else{
                                found = "الرقم التعريفي غير صحيح"
                                
                            }
                        }
                      
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
            
        }
        
        
        
    }
}
    
    
    
    
struct subjectCell: View {
    let course: Course
    var body: some View {

                ZStack{
//                    NavigationLink(destination:InsideTeacherSubject(course: course)) {
                                    Rectangle()
                            .foregroundColor(Color(course.courseColor ?? ""))
                            .cornerRadius(50)
                            .frame(height:61)
                 //   }//NavigationLink
                    .environment(\.layoutDirection,.rightToLeft)
                    .navigationBarHidden(true)
                    
                    HStack{
                        Text(course.courseName ?? "")
                            .font(.system(size: 25))
                            .foregroundColor(.black)
                       Text(course.courseLevel ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 12))
                        Spacer()
                       Image(course.courseImage ?? "")
                            .resizable()
                            .overlay(Circle().stroke(Color(course.courseColor ?? ""), lineWidth: 15))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80, alignment: .center)
                            .clipShape(Circle())
                        
                    }// end Hstack
                    .padding(.leading)
                  
                } // end Zstack
                .padding(.horizontal)
    }
}

    
    
    
    
    
    
    
    
//
//struct StudentCourseView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentCourseView()
//            .environment(\.layoutDirection,.rightToLeft)
//
//    }
//}
//
