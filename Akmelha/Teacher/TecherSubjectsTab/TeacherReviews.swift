//
//  TeacherReviews.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherReviews: View {
    @State private var searchText = ""
//    @State var student = "نورة محمد"
    let course : Course
    @EnvironmentObject var dbUsers: UserDB
    var body: some View {
            ZStack{
                Color("bg").ignoresSafeArea()
                VStack{
//                    ZStack(alignment: .bottom){
                        ForEach(course.coureseStudents ?? [""], id: \.self) {index in
                            let student = user(id: index, users: dbUsers.users)

                            ZStack{
                                NavigationLink(destination:insideTeacherReviews(student: student, course : course)) {
                                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.1), lineWidth: 1).frame( height: 58).background(Color.white).shadow(radius:0.1)
                                 } // end NavigationLink
                                    HStack{
                                        Image(student.studentImage ?? "")
                                            .resizable()
                                            .overlay(Circle()
                                                .stroke(Color("photoFrame"), lineWidth: 5))
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 37, height: 37, alignment: .center)
                                            .clipShape(Circle())
                                        Text(student.userName ?? "").font(.system(size: 20))
                                        Spacer()
                                    } // end Hstack
                                    
                                    .padding()
                                }// end Zstack
                            }
                   // } //ZStack
                    
                    Spacer()
                } // end Vstack
            }// end Zstack
      
        
    }// body
} // struct

 
/*struct TeacherReviews_Previews: PreviewProvider {
    static var previews: some View {
        
        TeacherReviews()
            .environment(\.layoutDirection, .rightToLeft)
        
        
    }
}*/

