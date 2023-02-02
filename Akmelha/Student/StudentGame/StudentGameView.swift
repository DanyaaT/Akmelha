//
//  StudentGameView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI
import Neumorphic


struct StudentGameView: View {
    @EnvironmentObject var dbUsers: UserDB
    var user: User
    @State var insideGame = false
    @State var showeAlert = false
    @State var showeAlertNotEnough = false
    @State var scores = "   20"
    @State var medal = ""
    
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
                    .toolbar(.hidden) //end overlay
                    
                    ZStack {
                        Image(medalType())
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                        .padding(.top, -25.0)
                        Text("\n\(user.studentCredit ?? 0)")
                    }
                    
                    
                    ScrollView {
                        
                        VStack(spacing:-90){
                            HStack(spacing:-30){
                                NavigationLink(destination:XOView() , isActive: $insideGame) {
                                    Button(action: {
                                        showeAlert = true
  
                                    })
                                    {
                                       
                                        Image("game1")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height:300)
            
                                        }.alert( isPresented: $showeAlert) {
                                            
                                            Alert(
                                                title: Text("هل أنت متأكد من انضمامك إلى اللعبة بمقابل ٣٠ نقطة؟"),
                                                message: Text(""),
                                                primaryButton: .destructive(Text("موافق"), action: {
                                                    if var credit = user.studentCredit {
                                                        if credit >= 30 {
                                                            credit = credit - (30)
                                                            user.studentCredit = credit
                                                            insideGame = true
                                                        }else {
                                                            insideGame = false
                                                            showeAlertNotEnough = true
                                                        }
                                                    }
                                                    dbUsers.changeStudentCredit(user)
                                                }),
                                                secondaryButton: .cancel(Text("إلغاء"), action: { // 1
                                                    
                                                    
                                                })
                                            )
                                            
                                        }
                                        .alert("نقاطك لا تكفي ، سارع لكسب المزيد من النقاط!", isPresented: $showeAlertNotEnough) {
                                            Button("موافق", role: .cancel) { }
                                        }
                                }//.disabled(insideGame)
                               
//                                NavigationLink(destination: ResimView()) {
                                    Image("game2")
                                            .resizable()
                                            .scaledToFit()
                                        .frame(height:300)
//                                }
                                
                                
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
                            
                            Text("إضافة نقاط")
                                .font(.system(size: 15))
                            
                        } // end Zstack
                        
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color("green"))
                                .frame(width:56,height:56)
                                .cornerRadius(21.8)
                            
                            ZStack{
                                
                                NavigationLink("+",destination:  Camera_View(user: user))
                                    .font(.system(size: 30))
                                    .foregroundColor(Color.white)
//                                Button("+"){
//                                  //action
//                                }// end Button
//                                .font(.system(size: 30))
//                                .foregroundColor(.white)
                                
                            }// end Zstack
                        }// end Zstack
                        Spacer()
                    } //End Hstack}
                }
            
        } // first z
    }
    func medalType()-> String {
        var medal = "bronze"
        if user.studentCredit ?? 0 >= 601{
            medal = "bronze"
            user.studentCredit = 0
            dbUsers.changeStudentCredit(user)
            
        }else if  user.studentCredit ?? 0 >= 499{
            medal = "gold"
        
        }else if  user.studentCredit ?? 0 >= 199{
            medal = "silver"
        }else {
            medal = "bronze"
        }
           return medal
            
    }
}

//struct StudentGameView_Previews: PreviewProvider {
//    static var previews: some View {
//        StudentGameView().environment(\.layoutDirection,.rightToLeft)
//    }
//}


