//
//  ContentView.swift
//  welcomPages
//
//  Created by H on 17/05/1444 AH.
//



import SwiftUI

import Firebase
import FirebaseCore
import FirebaseAuth

struct logIN: View {

    @State var email: String = ""
    @State var password: String = ""
    @State var Message: String = ""
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var dbUsers: UserDB
    @State var goToStudent = false
    @State var goToTeacher = false
    @State var emailIsValid: Bool = true

    let id = Auth.auth().currentUser?.uid

    public init(email: String = "")

    {

        self.email = email

    }


    var body: some View {
        
        NavigationView{
            ZStack{
                Color("bg").ignoresSafeArea()
                
                VStack(spacing: -450.0){
                    
                    
                    
                    Image("oval").ignoresSafeArea()
                    Spacer()
                    
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( width: 340, height: 00.0, alignment: .bottom)
                    
                    Spacer()
                    
                    
                    
                }
                VStack(spacing: -630){
                    
                    
                    Text("أهلًا بك")
                        .font(.system(size: 45))
                        .accessibilitySortPriority(1)
                        .font(.largeTitle)
                        .foregroundColor(Color(hue: 0.105, saturation: 0.155, brightness: 0.518))
                        .frame(width: 350, alignment: .leading)
                    Spacer()
                    
                    
                    
                    Text("مجددًا")
                    
                        .accessibilityHidden(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                        .font(.system(size: 50))
                        .lineLimit(nil)
                        .font(.largeTitle)
                        .foregroundColor(Color(hue: 0.105, saturation: 0.186, brightness: 0.564))
                        .multilineTextAlignment(.center)
                        .accessibilityLabel("Label")
                        .frame(width: 170, alignment: .leading)
                        .shadow(radius: /*@START_MENU_TOKEN@*/19/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    
                    
                    
                    
                    
                    
                }
                VStack(alignment: .center){
                    
                    Spacer()
                    
                    Text("تسجيل الدخول")
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.gray)
                        .font(.system(size: 30))
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                        .frame(width: 250, alignment: .center)
                    
                    
                    HStack(spacing: -340.0){
                     
                        
                        Text("البريد الإلكتروني")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 20))
                            .frame(width: 350, alignment: .leading)

                        Text(emailIsValid ? "" : "* الإيميل غير صحيح")
                        .foregroundColor(Color.red)
                        .font(.system(size: 15))
                        .frame(width: 350, alignment: .trailing)

                        

                    }
                    
                    TextField("البريد الإلكتروني", text: $email)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(50)
                        .frame(width: 370, alignment: .center)
                        .onChange(of: email) { newValue in

                            if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {

                                self.emailIsValid = true


                            } else {

                                self.emailIsValid = false


                            }

                        }
                    
                    Text("كلمة المرور")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 20))
                        .frame(width: 350, alignment: .leading)
                    
                    
                    SecureField("كلمة المرور", text: $password)
                        .padding()
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(50)
                        .frame(width: 370, alignment: .center)
                    
                    Text(Message)
                        .foregroundColor(Color.red)
                        .font(.system(size: 15))
                        .frame(width: 350, alignment: .leading)
                    
                }
                
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(width: 0.0, height: 500)
                
                VStack{
                    
                    Spacer()
                    
                    Button("تسجيل") {
                        viewModel.signIn(email: email, password: password)
                           
                        let user = user(id: id ?? "", users: dbUsers.users)
                        if user.userType == "S"{
                                goToStudent = true
                                
                                
                        }else  if user.userType == "T"{
                                goToTeacher = true
                                
                            }
                        
                        
                    }
                    .foregroundColor(Color.gray)
                    .frame(width: 300, height: 50)
                    .background(Color("pickerBG"))
                    .cornerRadius(50)
                    .font(.system(size: 25))
                    
                    HStack{
                        
                        Text("ليس لديك حساب؟")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                        
                        NavigationLink("تسجيل جديد",destination: UserType())
                            .foregroundColor(Color(hue: 1.0, saturation: 0.075, brightness: 0.706))
                            .font(.system(size: 15))
                        
                 
                    }
                    
                    
                    
                    
                    
                    HStack{
                        
                        Text("نسيت كلمة المرور؟")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                        
                        NavigationLink("إعادة تعيين",destination: ResetPassword())
                            .foregroundColor(Color(red: 0.708, green: 0.649, blue: 0.65))
                            .font(.system(size: 15))
                        
                      
                        
                        
                    }
                    
                }
            
//                NavigationLink("", destination: StudentTabBar(user: user(id: id ?? "", users: dbUsers.users)), isActive: $goToStudent)
//
//                 NavigationLink("", destination: TeacherTabBar(), isActive: $goToTeacher)
            }
           
        }.toolbar(.hidden)
     
        
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in if error != nil {
                print(error!.localizedDescription)
                Message = "المدخلات غير صحيحة"
            }
            else{
                Message = ""

            }
        }
    }

}
    

struct logIN_Previews: PreviewProvider {
    static var previews: some View {
        logIN().environment(\.layoutDirection, .rightToLeft)
    }
}
