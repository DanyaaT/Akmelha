//
//  WelcomePage.swift
//  Akmelha
//
//  Created by H on 22/05/1444 AH.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth





struct WelcomePage: View {
    @EnvironmentObject var viewModel: AppViewModel
    var body: some View {
        NavigationView{
            
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
                            
                            Text("ـــلها")
                                .font(.system(size: 110))
                                .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                            
                            Spacer()
                            
                            Text("أكمِـــ")
                                .font(.system(size: 110))
                                .foregroundColor(Color(hue: 0.105, saturation: 0.021, brightness: 0.635))
                            
                            
                            
                            
                        }
                        Spacer()
                        
                        
                        
                        VStack{
                            
                            Text("أكمِـلها")
                                .font(.system(size: 50))
                                .foregroundColor(Color(hue: 1.0, saturation: 0.015, brightness: 0.432))
                                .background(Rectangle().frame( width: 250,height: 13
                                                             )
                                    .cornerRadius(50).foregroundColor(Color(hue: 0.299, saturation: 0.057, brightness: 0.894)))
                            
                            Spacer()
                            Spacer()
                            
                            
                            
                            
                            NavigationLink(destination: UserType()) {
                                Text("حساب جديد")
                                    .foregroundColor(Color(red: 0.552, green: 0.557, blue: 0.574))
                                    .frame(width: 300, height: 50)
                                    .background(Color("pickerBG"))
                                    .cornerRadius(50)
                            }
                        }
                        
                        Spacer()
                        
                        
                        NavigationLink("تسجيل الدخول",destination: logIN())
                            .foregroundColor(Color(red: 0.552, green: 0.557, blue: 0.574))
                            .frame(width: 300, height: 50)
                            .background(Color("pickerBG"))
                            .cornerRadius(50)
                    }
                    Spacer()
                    
                    Spacer()
                    Spacer()
                    
                    
                    
                    
                
            }
        }
        .toolbar(.hidden)
        
    }
    }


struct WelcomePage_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePage().environment(\.layoutDirection, .rightToLeft)
    }
}
