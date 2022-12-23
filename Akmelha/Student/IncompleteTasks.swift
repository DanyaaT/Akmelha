//
//  IncompleteTasks.swift
//  Akmelha
//
//  Created by H on 29/05/1444 AH.
//

import SwiftUI

struct IncompleteTasks: View {
    var body: some View {
        ScrollView{
            Button {
                
            }
        label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text("الرياضيات").foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color("pink")))
                        Spacer()
                        Text("الأربعاء ٣/٢٨")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        ZStack {
                            Circle().strokeBorder(.black, lineWidth: 1)
                                .frame(width: 30, height: 30)
                            
                            
                        }
                        
                        Text("مطوية الفصل الرابع").font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        
                        Spacer()
                        Text("١٠ نقاط").foregroundColor(.gray)
                    }
                    
                    
                    
                }.padding()
            }.padding(.horizontal)
        }  }
        
    }
}

struct IncompleteTasks_Previews: PreviewProvider {
    static var previews: some View {
        IncompleteTasks()
    }
}
