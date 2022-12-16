//
//  WelcomePage.swift
//  Akmelha
//
//  Created by H on 22/05/1444 AH.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        
        ZStack{
            Color("bg").ignoresSafeArea()
            
            
            
            VStack{
                
                VStack(spacing: -30){
                    
                    
                    Image("oval").ignoresSafeArea()
                    Spacer()
                    
                    
                    
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame( width: 440, height: 0, alignment: .bottom)
                    Spacer()
                    
                    
                }

                
                HStack{

                    Text("أكمِــ")
                        .font(.system(size: 110))
                        .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                    Spacer()

                    
                    Text("ــلها")
                        .font(.system(size: 110))
                        .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))

                   
                }
                Spacer()

                
                
                VStack{
                    
                    Text("أكمِـلها")
                        .font(.system(size: 50))
                        .foregroundColor(Color(hue: 1.0, saturation: 0.015, brightness: 0.432))
                        .background(Rectangle().frame( height: 13 ).foregroundColor(Color("pink")))
                    
                    Spacer()
                    Spacer()

                    
                   
                        
                        Button("حساب جديد") {
                        }
                        .foregroundColor(Color(red: 0.552, green: 0.557, blue: 0.574))
                        .frame(width: 300, height: 50)
                        .background(Color("pickerBG"))
                        .cornerRadius(50)
                       
                        }
                    
                        Spacer()
                    
                    
                    Button("تسجيل الدخول") {
                        
                    }
                    .foregroundColor(Color(red: 0.552, green: 0.557, blue: 0.574))
                    .frame(width: 300, height: 50)
                    .background(Color("pickerBG"))
                    .cornerRadius(50)
                    Spacer()
                                
                Spacer()
                Spacer()




            }
         
        }
        
    }
}

struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage()
    }
}
