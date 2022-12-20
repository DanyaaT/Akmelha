//
//  subjectList.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct subjectList: View {
    let course: Course
    var body: some View {

                ZStack{
                    NavigationLink(destination:InsideTeacherSubject(course: course)) {
                                    Rectangle()
                            .foregroundColor(Color(course.courseColor ?? ""))
                            .cornerRadius(50)
                            .frame(height:61)
                    }//NavigationLink
                    .environment(\.layoutDirection,.rightToLeft)
                    .navigationBarHidden(true)
                    
                    HStack{
                        Text(course.courseName ?? "")
                            .font(.system(size: 25))
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
