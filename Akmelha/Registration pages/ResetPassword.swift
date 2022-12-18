//
//  ResetPassword.swift
//  welcomPages
//
//  Created by H on 23/05/1444 AH.
//

import SwiftUI

struct ResetPassword: View {
    @State var Email: String = ""

    var body: some View {
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
                    .frame(width: 350, alignment: .trailing)
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
                    .frame(width: 170, alignment: .trailing)
                
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
                

                Text("البريد الإلكتروني")
                    .foregroundColor(Color.gray)
                    .font(.system(size: 20))
                    .frame(width: 350, alignment: .trailing)

                TextField("البريد الإلكتروني", text: $Email)
                    .padding()
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(50)
                    .frame(width: 370, alignment: .center)
                

                Spacer()

                HStack{
                    

                    Button("تراجع") {
                        //her the acion
                    }
                    .foregroundColor(Color.gray)
                    .frame(width: 150, height: 50)
                    .background(Color("pickerBG"))
                    .cornerRadius(50)
                    .font(.system(size: 25))
                    

                    Button("إرسال") {
                        //her the acion
                    }
                    .foregroundColor(Color.gray)
                    .frame(width: 150, height: 50)
                    .background(Color("pickerBG"))
                    .cornerRadius(50)
                    .font(.system(size: 25))
                }
          

                
                
               

            }
            
        }
        }
}

struct ResetPassword_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassword()
    }
}
