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
                            HStack{
                                Text("\n"+"الألعاب")
                                    .font(.system(size: 40))
                                    .foregroundColor(Color("title"))
                                
                            }
                            
                        } // Vstack
                        
                    } //Zstac

                    ZStack {
                        Image("medal")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                        .padding([.top, .leading], -25.0)
                        Text("   ٢٠")
                    }
                    
                    
                    ScrollView {
                        
                        VStack(spacing:-90){
                            HStack(spacing:-30){
                                Button(action: {}){
                                    Image("game1")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:300)
                                }
                            
                                Button(action: {}){
                                    Image("game2")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:300)
                                }
                                
                            }.padding(.horizontal)
                            
                            HStack(spacing:-30){
                                Button(action: {}){
                                    Image("game3")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:300)
                                }
                                
                                Button(action: {}){
                                    Image("game4")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height:300)
                                }
                                
                            }.padding()
                            
                        }
                    }// scroll
                    
                    
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


