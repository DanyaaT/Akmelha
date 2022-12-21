//
//  TeacherCards.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherCards: View {
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            
           
            VStack{
                ZStack{
                    Spacer()
                    
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
                        
                        
                        Text("\n"+"البطاقات")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                        
                        
                            
                        
                    }
                    
                }
               
                CardsView()
                Spacer()
                
                
                
            }
       
        }.navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct TeacherCards_Previews: PreviewProvider {
    static var previews: some View {
        TeacherCards().environment(\.layoutDirection, .rightToLeft)
    }
}

struct AppBarView: View {
    var body: some View {
        ZStack{
            Spacer()
            
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
                
                Text("\n")
                
                Text("\n"+"البطاقات التحفيزية")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 40))
                    .foregroundColor(Color("title"))
                
            }
            
        }
        
        
    }
}



struct CardsView: View {
    var body: some View {
        
       
        
            VStack{
                HStack{
                    VStack( spacing: 1){
                        NavigationLink {
                            
                         Card1ContentView()
                            
                        } label: {
                            Image("blueCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:130 , height: 262)
                                .padding(.horizontal)
                        }
                        
                        
                    }
                    VStack( spacing: 1){
                        NavigationLink {
                            Card2ContentView()
                        } label: {
                            Image("yellowCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:130 , height: 262)
                                .padding(.horizontal)
                        }
                        
                    }
                }
                
                HStack{
                    VStack( spacing: 1){
                        NavigationLink {
                           Card3ContentView()
                                
                        } label: {
                            Image("orangeCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:130 , height: 262)
                                .padding(.horizontal)
                        }
                        
                        
                        
                    }
                    VStack( spacing: 1){
                        NavigationLink {
                          Card4ContentView()
                        } label: {
                            Image("purpleCard")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:130 , height: 262)
                                .padding(.horizontal)
                        }
                        
                        
                        
                    }
                }
                
            }
        }
         
        }


