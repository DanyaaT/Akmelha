//
//  UserType.swift
//  welcomPages
//
//  Created by H on 25/05/1444 AH.
//

import SwiftUI

struct UserType: View {
    var body: some View {
        NavigationView{
            
            
            
            ZStack{
                Color("bg").ignoresSafeArea()
                
                VStack{
                    VStack(spacing: -750.0){
                        
                        
                        
                        Image("oval").ignoresSafeArea()
                        Spacer()
                        
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame( width: 400, height: 0.0, alignment: .top)
                        
                        Spacer()
                        
                        
                        
                    }
                    

                    HStack{
                            
                            
                            NavigationLink("طالب",destination: WelcomePage())
                                .foregroundColor(Color(red: 0.552, green: 0.557, blue: 0.574))
                                .frame(width: 160, height: 220)
                                .background(Color("pickerBG"))
                                .cornerRadius(50)
                                .font(.system(size: 50))
                            
                                .padding(.all, 10.0)
                        
                        
                          
                        
                        
                        
                        NavigationLink("معلم",destination: WelcomePage())
                            .foregroundColor(Color(red: 0.552, green: 0.557, blue: 0.574))
                            .frame(width: 160, height: 220)
                            .background(Color("pickerBG"))
                            .cornerRadius(50)
                            .font(.system(size: 50))
                            .padding(.all, 10.0)
                        
                        
                        
                    } .frame(width: 0, height: 500)

                   
                }
               

                 
            }
        }
        }
}

struct UserType_Previews: PreviewProvider {
    static var previews: some View {
        UserType().environment(\.layoutDirection, .rightToLeft)
    }
}
