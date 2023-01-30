

import SwiftUI

struct Camera_View: View {
    var user: User
    @EnvironmentObject var dbUsers: UserDB
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            VStack{
                Rectangle().ignoresSafeArea()
                    .cornerRadius(50)
                    .foregroundColor(Color("top")).ignoresSafeArea()
                    .frame(height:50)
                Spacer()
                Spacer()
                
                
                HStack{
                    Text("وجه الكاميرا نحو بطاقة النقاط")
                        .font(.system(size: 30))
                        .foregroundColor(Color("title"))
                        .frame(alignment: .center)
                }
                .padding()
                
                ZStack{
                    Rectangle()
                        .frame(width: 350,height:450)
                        .cornerRadius(50)
                        .foregroundColor(Color(red: 0.947, green: 0.937, blue: 0.916))
                        .frame(alignment: .center)
                    
                    CameraView()
                        .frame(width: 350,height:450)
                        .frame(alignment: .center)
                        .cornerRadius(50)
                    
                    
                }
                .padding()
                Spacer()
                
                
               
                    
                    Button{
                        
                       let cardName = GeometryUtils.addScore()
                        
                        if cardsName == "blue"{
                            if var credit = user.studentCredit {
                                credit = credit + 20
                                user.studentCredit = credit
                            }
                           
                            dbUsers.changeStudentCredit(user)
                            dismiss()
                            

                        }
    
                        else if cardsName == "orange"{
                      
                            if var credit = user.studentCredit {
                                credit = credit + 10
                                user.studentCredit = credit
                            }
                           
                            dbUsers.changeStudentCredit(user)
                            dismiss()
                        }
    
                        else if cardsName == "purple"{
                            if var credit = user.studentCredit {
                                credit = credit + 15
                                user.studentCredit = credit
                            }
                           
                            dbUsers.changeStudentCredit(user)
                            dismiss()
                            
                        }
    
                        else if cardsName == "yellow"{
                            if var credit = user.studentCredit {
                                credit = credit + 30
                                user.studentCredit = credit
                            }
                           
                            dbUsers.changeStudentCredit(user)
                            dismiss()
                            
                        }
                       
                        
                        
                    } label: {
                        HStack{
                            Spacer()
                            Text("إضافة النقاط").font(.title2)
                            Spacer()
                        }
                    }.padding()
                        .tint(Color("green"))
                        .buttonStyle(.borderedProminent)
                        .foregroundColor(.white)
                        .cornerRadius(10)
               
            }
            
        }
        
        
    }
    
    
    
    
//    struct Camera_View_Previews: PreviewProvider {
//        static var previews: some View {
//            Camera_View().environment(\.layoutDirection,.rightToLeft)
//        }
//    }
    
    
    
    
    
}
