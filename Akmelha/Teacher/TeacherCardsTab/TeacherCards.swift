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
            Color(red: 1.00, green: 1.00, blue: 0.98)
                .ignoresSafeArea()
            NavigationView(){
            VStack{
                Spacer()
                AppBarView()
                Spacer()
                TitleView()
                CardsView()
                
                ZStack{
                    Rectangle()
                        .frame( width: 390 ,height: 98)
                        .foregroundColor(.white)
                    VStack{
                      //  TapBar section //
                    }
                }
                
                Rectangle()
                    .frame( width: 290 ,height: 24)
                    .foregroundColor(.white)
            }
        }//nav
        }    }
}

struct TeacherCards_Previews: PreviewProvider {
    static var previews: some View {
        TeacherCards().environment(\.layoutDirection, .rightToLeft)
    }
}

struct AppBarView: View {
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius:50)
                .frame( width: 390 ,height: 135)
                .foregroundColor(.init(red: 0.95, green: 0.94, blue: 0.91))
                
            
            
            HStack {
                
                VStack {
                    Image(systemName: "person.fill")
                    
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 45, height: 40.83)
                        .clipShape(Circle())
                        .overlay(
                            Circle().stroke(.gray, lineWidth: 1))
                    .padding()
                    
                }
                Spacer()
            }
            
        }
    }
}
struct TitleView: View {
    var body: some View {
        ZStack {
           
                Rectangle()
                .foregroundColor(.init(red: 0.54, green: 0.76, blue: 0.64 ,opacity: 0.25))
                    .frame(width: 270 , height: 11)
                    .cornerRadius(4)
                    

            Text("البطاقات التحفيزية")
                .font(.system(size:40))
                .foregroundColor(Color.gray)
                .padding(.horizontal)
                
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

