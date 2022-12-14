//
//  TeacherReviews.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherReviews: View {
    @State private var searchText = ""
    @State var student = "نورة محمد"

    var body: some View {
        
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack{
                NavigationStack {
                    Text(" \(searchText)")
                    
                } //NavigationStack
                .searchable(text:$searchText,prompt: "بحث")
                .navigationBarHidden(true)

                HStack{
                    
                    ZStack{
                        NavigationLink(destination:InsideTeacherSubject()) {
                            RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.1), lineWidth: 1).frame( height: 52).background(Color.white).shadow(radius:0.1)
                        }// end NavigationLink
                        .environment(\.layoutDirection,.rightToLeft)
                        
                        HStack{

                            Image("girl")
                                .resizable()
                                .overlay(Circle()
                                .stroke(Color("photoFrame"), lineWidth: 5))
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 37, height: 37, alignment: .center)
                                .clipShape(Circle())
                            
                            Text(student)                            .font(.system(size: 20))

                            Spacer()

                        } // end Hstack
                        .padding()

                    } // end Zstack
                
                }//Hstack
                .padding()
                } // end Zstack
            } // end Vstack
        
    }// body
} // struct

struct TeacherReviews_Previews: PreviewProvider {
    static var previews: some View {
        TeacherReviews().environment(\.layoutDirection, .rightToLeft)
    }
}

 
//
//struct InsideStudentReview: View {
//    var body: some View {
//
//
//
//    }
//
//}
