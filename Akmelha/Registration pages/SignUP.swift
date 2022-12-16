//
//  SignUP.swift
//  Akmelha
//
//  Created by H on 22/05/1444 AH.
//

import SwiftUI

struct SignUP: View {
    
    @State var Username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack{
            Color("bg").ignoresSafeArea()
            
            VStack(spacing: -520.0){
                
                
                
                Image("oval").ignoresSafeArea()
                Spacer()
                
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame( width: 300, height: 0, alignment: .bottom)
                
                Spacer()
                
                
                
            }
            
            VStack(spacing: -630){
                
                
                Text("أكمِلها")
                    .font(.system(size: 45))
                    .accessibilitySortPriority(1)
                    .font(.largeTitle)
                    .foregroundColor(Color(hue: 0.105, saturation: 0.155, brightness: 0.518))
                    .frame(width: 350, alignment: .trailing)
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
                
                Spacer()
                
                
            }
            
            VStack(alignment: .center){
                
                Spacer()
             

                Text("تسجيل جديد")
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.gray)
                    .font(.system(size: 30))
                    .frame(width: 250, alignment: .center)

                
                Text("البريد الإلكتروني")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 20))
                    .padding(.top, -18.0)
                    .frame(width: 350, alignment: .trailing)
                
                TextField("البريد الإلكتروني", text: $Username)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(50)
                    .frame(width: 370, alignment: .center)
                
                Text("كلمة المرور")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 20))
                    .padding(.top)
                    .frame(width: 350, alignment: .trailing)
                
                
                TextField("كلمة المرور", text: $password)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(50)
                    .frame(width: 370, alignment: .center)
                
                Text("تأكيد كلمة المرور")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 20))
                    .padding(.top)
                    .frame(width: 350, alignment: .trailing)
                
                
                TextField("تأكيد كلمة المرور", text: $password)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(50)
                    .frame(width: 370, alignment: .center)
                
                
                
            }
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            .frame(width: 0.0, height: 620)
            
            VStack{
                
                Spacer()
                
                Button("تسجيل") {
                    //her the acion
                }
                .foregroundColor(Color.gray)
                .frame(width: 300, height: 50)
                .background(Color("pickerBG"))
                .cornerRadius(50)
                .font(.system(size: 25))
            }
        }
    }
}

struct SignUP_Previews: PreviewProvider {
    static var previews: some View {
        SignUP()
    }
}
