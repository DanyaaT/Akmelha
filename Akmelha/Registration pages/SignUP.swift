//
//  SignUP.swift
//  Akmelha
//
//  Created by H on 22/05/1444 AH.
//

import SwiftUI

import Firebase
import FirebaseCore
import FirebaseAuth

struct SignUP: View {
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var dbUsers: UserDB
    @State var userType = ""
    @State var name: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var Message: String = ""
    @State var Message_name: String = ""
    @State var Message_pass: String = ""
    @State var Message_email: String = ""
    @State var goToStudent = false
    @State var goToTeacher = false
    var new = true
    

    @State var emailIsValid: Bool = true

    

//    public init(email: String = "")
//
//    {
//
//        self.email = email
//
//    }
    
    var body: some View {
        NavigationView{
           
            ZStack{
                    Color("bg").ignoresSafeArea()
                    
                    VStack(spacing: -520.0){
                        
                        
                        
                        Image("oval").ignoresSafeArea()
                        Spacer()
                        
                        

                        
                        
                        
                    }
                ScrollView {
                    VStack(){
              
                        
                        Text("أكمِلها")
                            .font(.system(size: 45))
                            .accessibilitySortPriority(1)
                            .font(.largeTitle)
                            .foregroundColor(Color(hue: 0.105, saturation: 0.155, brightness: 0.518))
                            .frame(width: 350, alignment: .leading)
                        Spacer()
                        
                        
                        
                        Text("يرحب بك!")
                        
                            .accessibilityHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                            .font(.system(size: 50))
                            .lineLimit(nil)
                            .font(.largeTitle)
                            .foregroundColor(Color(hue: 0.105, saturation: 0.186, brightness: 0.564))
                            .multilineTextAlignment(.center)
                            .accessibilityLabel("Label")
                            .frame(width: 220, alignment: .trailing)
                            .shadow(radius: /*@START_MENU_TOKEN@*/19/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding(.bottom, -250.0)
                            .frame( width: 300, height: 0, alignment: .bottom)
                        
                        
                        Spacer()
                        
                        
                    }
                    
                    VStack(alignment: .center){
                        
                        Spacer()

                        
                        Text("تسجيل جديد")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 30))
                            .padding(.top)
                            .frame(width: 250, alignment: .center)
                        
                        
                        Text("الاسم")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 20))
                            .padding(.top, -18.0)
                            .frame(width: 350, alignment: .leading)
                        
                        TextField("الاسم", text: $name)
                        
                            .padding()
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(20)
                            .frame(width: 350,alignment: .leading)
                        Text(Message_name)
                            .foregroundColor(Color.red)
                            .font(.system(size: 15))
                            .frame(width: 350, alignment: .trailing)
                        
                        
                        HStack(spacing: -350.0){
                         
                        
                            Text("البريد الإلكتروني")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 20))
                                .frame(width: 350, alignment: .leading)

                            Text(emailIsValid ? "" : "* البريد الإلكتروني غير صحيح")
                            .foregroundColor(Color.red)
                            .font(.system(size: 15))
                            .frame(width: 350, alignment: .trailing)

                            

                        }
                     
                        
                        TextField("البريد الإلكتروني", text: $email)
                            .padding()
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(20)
                            .frame(width: 350, alignment: .center)
                        
                            .onChange(of: email) { newValue in

                                if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {

                                    self.emailIsValid = true


                                } else {

                                    self.emailIsValid = false


                                }

                            }
                        Text(Message_email)
                            .foregroundColor(Color.red)
                            .font(.system(size: 15))
                            .padding(.bottom, -10.0)
                            .frame(width: 350, alignment: .trailing)
                  
                        
                        Text("كلمة المرور")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 20))
                            .padding(.top)
                            .frame(width: 350, alignment: .leading)
                        
                        
                        SecureField("كلمة المرور", text: $password)
                            .padding()
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(20)
                            .frame(width: 350, alignment: .center)
                        
                   
                        
                    }
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: 0.0, height: 590)
                    
                    Text(Message_pass)
                        .foregroundColor(Color.red)
                        .font(.system(size: 15))
                        .padding(.top, -23.0)
                        .frame(width: 350, alignment: .trailing)
                    Text(Message)
                        .foregroundColor(Color.red)
                        .font(.system(size: 15))
                        .padding(.top, -5.0)
                        .frame(width: 350, alignment: .leading)
                    VStack{
                        
                        Spacer()
                        
                        Button("تسجيل") {
                           
                            if(password.count < 8) || (name == "") || (email == ""){
                                Message_name = ""
                                Message_pass = ""
                                Message_email = ""
                                if name == ""{
                                 Message_name = " أدخل الاسم"
                                }
                                if email == ""{
                                 Message_email = "أدخل البريد الإلكتروني"
                                }
                                if(password.count < 8){
                                    Message_pass = "يجب أن تكون كلمة المرور مكونة من ٨ خانات فأكثر"
                                }
                            }
                            else{
                                Message_name = ""
                                Message_email = viewModel.signedUp
                                Message_pass = ""
                                    viewModel.signUp(email: email, password: password, name:name, userType: userType)
                                if userType == "S"{
                                    goToStudent = true
                                    
                                }
                                
                               else if userType == "T"{
                                    goToTeacher = true
                                    
                                }
                               
//                                                   Message = "البريد الالكتروني موجود مسبقًا"

                                
                          
                             
                            }
                        }
                        .foregroundColor(Color.gray)
                        .frame(width: 250, height: 50)
                        .background(Color("pickerBG"))
                        .cornerRadius(50)
                        .font(.system(size: 20))
                        
                        
                        
                        HStack{
                            Text( "لديك حساب؟")
                                .foregroundColor(Color.gray)
                                .font(.system(size: 15))
                            
                            NavigationLink("تسجيل الدخول",destination: logIN())
                                .foregroundColor(Color(hue: 1.0, saturation: 0.075, brightness: 0.706))
                                .font(.system(size: 15))
                            
                          
                        }
                        
                         
                    }
                    
                }
//
//               NavigationLink("", destination: StudentTabBar(), isActive: $goToStudent)
//
//                NavigationLink("", destination: TeacherTabBar(), isActive: $goToTeacher)
            }
        }.toolbar(.hidden)
    }
    
//    private func createUser() {
//           Auth.auth().createUser(withEmail: email, password: password, completion: { result, error in if error != nil  {
//                   Message = "المدخلات غير صحيحة"
//                   return
//               }
//               print("Successfully created account with ID: \(result?.user.uid ?? "")")
//               Message = ""
//
//           })
//       }
   
   
}

struct SignUP_Previews: PreviewProvider {
    static var previews: some View {
        SignUP().environment(\.layoutDirection, .rightToLeft)
    }
}



//Auth.auth().signIn(withEmail: email, password: password){
//           result, error in if error != nil {
//               print(error!.localizedDescription)
//               Message = "البريد الالكتروني موجود مسبقًا"
//           }
//           else{
//               Message = ""
//
//           }
//       }
