//
//  StudentTaskView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct StudentTaskView: View {
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
                        NavigationLink(destination:StudentProfile()) {
                            Image("teacherProfile")
                                .resizable()
                                .frame(width: 64, height: 60)
                                .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                        } //NavigationLink
                        Spacer()
                    }// hstack
                    .padding()
                    VStack{
                        
                        
                        Text("\n"+"مهامي")
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                    }// Vstack
                }//Zstac
                .toolbar(.hidden) //end overlay
                Spacer()
            }
        }
    }
}
struct StudentTaskView_Previews: PreviewProvider {
    static var previews: some View {
        StudentTaskView()
            .environment(\.layoutDirection,.rightToLeft)

    }
}
