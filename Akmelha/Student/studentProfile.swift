//
//  StudentProfile.swift
//  Akmelha
//
//  Created by Deema on 26/05/1444 AH.
//

import SwiftUI

struct StudentProfile: View {
    @State var StudentName =  ""
    @State var StudentEmail =  ""
    @State var edit = false
    @State var userImage = "teacherProfile"
    @State var images = ["girl1","girl2","girl3","boy1","boy2","boy3"]
    @State var selectedImage =  ""
    
    
    
    
    var body: some View {
        VStack{
            
            Text("الملف الشخصي")
                .font(.system(size: 30))
                .foregroundColor(Color("title"))
            
            Image(userImage)
                .resizable()
                .frame(width: 120, height: 120, alignment: .center)
                .overlay(Circle().stroke(Color("title"), lineWidth: 2))
            
            Text("__________________________ ")
                .foregroundColor(Color("title"))
            
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
                        TextField(StudentName, text: $StudentName).disabled(!edit).padding(.horizontal).background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)).frame( height: 50).background(Color("bg")))
                            .padding()
                        
                        
                        HStack{
                            Spacer()
                            Button(action:{edit.toggle()}){
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
                
                
                TextField(StudentEmail, text: $StudentEmail)
                    .disabled(true)
                    .background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)).frame( height: 50).background(Color("bg")))
                    .padding()
                
                
                //                Spacer()
                //                Spacer()
                //                Spacer()
                //                Spacer()
                
                HStack{
                    Text("صورة الملف الشخصي")
                        .font(.system(size: 20))
                        .foregroundColor(Color("title"))
                    Spacer()
                }.padding()
                
                HStack{
                    
                    ForEach(images, id:\.self){image in
                        Button(action:{
                            selectedImage = image
                            userImage = selectedImage
                        }){
                            
                            if image == selectedImage{
                                Image(image)
                                    .resizable()
                                    .frame(width: 67, height: 69, alignment: .center)
                                    .overlay(Circle().stroke(Color(.red), lineWidth: 2))
                                
                            }
                            else{
                                Image(image)
                                    .resizable()
                                    .frame(width: 67, height: 69, alignment: .center)
                                    .overlay(Circle().stroke(Color("title"), lineWidth: 2))
                                
                            }
                        }
                    }
                }// h
                .padding()
                
                
                HStack{
                    //  Button(action:""){
                    Image("logOut")
                        .resizable()
                        .frame(width: 30, height: 30)
                    
                    Text("تسجيل الخروج")
                        .font(.system(size: 19))
                        .foregroundColor(Color("title"))
                    
                    Spacer()
                    
                }// h
                Spacer()
                Spacer()

                Spacer()
                
            }// v
            
        }// v
        .padding()

        
    }
        
    }
    

















struct StudentProfile_Previews: PreviewProvider {
    static var previews: some View {
        StudentProfile()
        .environment(\.layoutDirection,.rightToLeft)

    }
}
