//
//  StudentGameView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI
import Neumorphic
struct StudentGameView: View {
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
                        
                        
                        Text("\n"+"الألعاب")
                            .font(.system(size: 40))
                            .foregroundColor(Color("title"))
                   
                    }// Vstack
                }//Zstac
                Spacer()
                HStack{
                ZStack {
                
                        RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main).softOuterShadow().frame(width : 150 , height: 150)
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("science")).softOuterShadow().frame(width : 150 , height: 150)
  
                    VStack{
                        
                        Image("XO")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                        Text("إكس- أو")
                    }.padding(.horizontal)
                   
                    }.padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.darkShadow).softOuterShadow().frame(width : 150 , height: 150)
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("checkColor")).softOuterShadow().frame(width : 150 , height: 150)
                        
                        VStack{
                            
                            Image("hh")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                            Text("ترتيب الأحجيات")
                        }
                       
                        }.padding()
      
                    
                }
                HStack{
                ZStack {
                
                        RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.darkShadow).softOuterShadow().frame(width : 150 , height: 150)
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("math")).softOuterShadow().frame(width : 150 , height: 150)
                    VStack {
                        Image(systemName: "lock.circle")
                                .resizable()
                                .foregroundColor(.gray)
                            .frame(width : 100 , height: 100)
                        Text("انتظرونا قريبًا")
                    }
                    }.padding()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.darkShadow).softOuterShadow().frame(width : 150 , height: 150)
                        RoundedRectangle(cornerRadius: 20).foregroundColor(Color("arabic")).softOuterShadow().frame(width : 150 , height: 150)
                        VStack {
                            Image(systemName: "lock.circle")
                                    .resizable()
                                    .foregroundColor(.gray)
                                .frame(width : 100 , height: 100)
                            Text("انتظرونا قريبًا")
                        }
                    }.padding()
                    
                }
                Spacer()
                HStack(spacing: -3){
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("green")).ignoresSafeArea()
                            .cornerRadius(3)
                            .frame(width: 98,height:29, alignment: .bottomLeading)
                        
                        Text("اضافة نقاط")
                            .font(.system(size: 15))
                        
                    } // end Zstack
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(Color("green"))
                            .frame(width:56,height:56)
                            .cornerRadius(21.8)
                        
                        ZStack{
                            Button("+"){
                              //action
                            }// end Button
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                            
                        }// end Zstack
                    }// end Zstack
                    Spacer()
                } //End Hstack}
            }
        } // first z
    }
}

struct StudentGameView_Previews: PreviewProvider {
    static var previews: some View {
        StudentGameView().environment(\.layoutDirection,.rightToLeft)
    }
}
