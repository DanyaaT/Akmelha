//
//  ResetPassword.swift
//  welcomPages
//
//  Created by H on 23/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth


struct ResetPassword: View {
    @State var email: String = ""
    @State var Message: String = ""
    @State var emailIsValid: Bool = true
    @EnvironmentObject var viewModel: AppViewModel
    @EnvironmentObject var dbUsers: UserDB
    
    public init(email: String = "")

    {

        self.email = email

    }
    var body: some View {
        NavigationView{
            
            ZStack{
                    
                    Color("bg").ignoresSafeArea()
                    
                    VStack(spacing: -430.0){
                        
                        
                        
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
                        
                            .accessibilityHidden(false)
                            .fontWeight(.bold)
                            .font(.system(size: 50))
                            .lineLimit(nil)
                            .font(.largeTitle)
                            .foregroundColor(Color(hue: 0.105, saturation: 0.186, brightness: 0.564))
                            .multilineTextAlignment(.center)
                            .accessibilityLabel("Label")
                            .frame(width: 170, alignment: .leading)
                        
                        Spacer()
                        
                        
                        
                        
                        
                        
                        
                    }
                    
                    VStack(){
                        
                        Spacer()
                        Spacer()
                        
                        Text("إعادة تعيين كلمة المرور")
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 30))
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: 300, alignment: .center)
                        
                        
                        HStack(spacing: -340.0){
                            
                            
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
                            .cornerRadius(50)
                            .frame(width: 370, alignment: .center)
                            .onChange(of: email) { newValue in
                                
                                if(newValue.range(of:"^\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", options: .regularExpression) != nil) {
                                    
                                    self.emailIsValid = true
                                    
                                    
                                } else {
                                    
                                    self.emailIsValid = false
                                    
                                    
                                }
                                
                            }
                        
                        Text(Message)
                            .foregroundColor(Color.red)
                            .font(.system(size: 15))
                            .frame(width: 350, alignment: .leading)
                        
                        Spacer()
                        
                        HStack{
                            
                            Button("إرسال") {
                                resetPassword()
                                print(email)
                                
                            }
                            .foregroundColor(Color.gray)
                            .frame(width: 150, height: 50)
                            .background(Color("pickerBG"))
                            .cornerRadius(50)
                            .font(.system(size: 25))
                            
                            NavigationLink("تراجع",destination: logIN())
                                .foregroundColor(Color.gray)
                                .frame(width: 150, height: 50)
                                .background(Color("pickerBG"))
                                .cornerRadius(50)
                                .font(.system(size: 25))
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        
                    }
                    
                }
            
        }.toolbar(.hidden)
         
    }
    
    func resetPassword(){
        Auth.auth().sendPasswordReset(withEmail: email) { error
            in if error != nil {
                Message = " البريدالإلكتروني غير مسجل مسبقًا"
                print(error!.localizedDescription)
            } else{
                Message = "تم إرسال رابط إعادة التعيين على بريدك الإلكتروني"
            }        }
    }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword().environment(\.layoutDirection, .rightToLeft)
    }
}
 
 
