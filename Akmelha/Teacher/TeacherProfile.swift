//
//  TeacherProfile.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

struct TeacherProfile: View {
    var user: User
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var dbUsers: UserDB
    @State var TeacherName =  ""
    @State var TeacherEmail =  ""
    @State var edit = false
    
    let id = Auth.auth().currentUser?.uid
    
    
    var body: some View {
       
        VStack{

          
        

            Text("الملف الشخصي")
                .font(.system(size: 30))
                .foregroundColor(Color("title"))
            
            Image("teacherProfile")
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .overlay(Circle().stroke(Color("title"), lineWidth: 2))
            
            Text("__________________________ ")
                .foregroundColor(Color("title"))
            
            Spacer()
            VStack{
                
                HStack{
                    Text("الاسم")
                        .font(.system(size: 20))
                        .foregroundColor(Color("title"))
                    Spacer()
                }
                .padding()
                
                HStack{
                    ZStack{
                        TextField(TeacherName, text: $TeacherName).disabled(!edit).padding(.horizontal).background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)).frame( height: 50).background(Color("bg")))
                            .padding()
                        
                        
                        HStack{
                            Spacer()
                            Button(action:{edit.toggle()
                                if (TeacherName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty) {
                                    TeacherName = user.userName ?? ""
                                }else{
                                    user.userName = TeacherName
                                    dbUsers.changeUserName(user)
                                }
                            }){
                                if !edit{
                                    
                                    Image("edit")
                                        .resizable()
                                        .frame(width: 18, height: 18)
                                        .padding()
                                        .padding()

                                }else{
                                    
                                    Text("حفظ").foregroundColor(.gray)
                                        .padding()
                                        .padding()
                                    
                                }// else
                                
                            }//button
                        }
                    }// Zstack
                } //h
                
                HStack{
                    Text("البريد الإلكتروني")
                        .font(.system(size: 20))
                        .foregroundColor(Color("title"))
                        Spacer()
                }.padding()

                
                TextField(TeacherEmail, text: $TeacherEmail)
                    .disabled(true)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)).frame( height: 50).background(Color("bg")))
                    .padding()
                
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
              
                

                
              Button(action: {viewModel.signOut()}){
                    HStack{
                       
                        Image("logOut")
                            .resizable()
                            .frame(width: 30, height: 30)
                        
                        Text("تسجيل الخروج")
                            .font(.system(size: 19))
                            .foregroundColor(Color("title"))
                        
                        Spacer()
                        
                        
                    }
                    }
                Spacer()
                
            }
            .padding()
            
        }// v
        .padding()
        .onAppear{
            TeacherName = user.userName ?? ""
            TeacherEmail = user.userEmail ?? ""
            
        }
    }
    
}


















//struct TeacherProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        TeacherProfile()
//        .environment(\.layoutDirection,.rightToLeft)
//
//    }
//}
