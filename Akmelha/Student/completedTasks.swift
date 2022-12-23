//
//  completedTasks.swift
//  Akmelha
//
//  Created by H on 29/05/1444 AH.
//

import SwiftUI

struct completedTasks: View {
    var body: some View {
        
        ScrollView{
            Button {
                
            }
        label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text("الدراسات الإسلامية").foregroundColor(.black).background(
                            Rectangle()
                                .frame( height: 8 )
                                .foregroundColor(Color("green"))
                        )
                        Spacer()
                        Text("الخميس ٣/٢٩ ")
                            .foregroundColor(.gray)
                    }
                    HStack{
                        ZStack {
                            Circle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color("checkColor"))
                            
                            Image(systemName: "checkmark").foregroundColor(.white)
                        }
                        
                        ZStack{
                            
                            Text("مراجعة سورة البيّنة").font(.title3).foregroundColor(.black)
                            
                            Rectangle().frame(width: 180,height: 1,alignment: .leading)
                                .foregroundColor(Color("pink"))
                        }
                        Spacer()
                    }
                    HStack{
                        
                        Spacer()
                        Text("١٥ نقاط").foregroundColor(.gray)
                    }
                    
                    
                    
                }.padding()
            }.padding(.horizontal)
        }
        }
    }
}

struct completedTasks_Previews: PreviewProvider {
    static var previews: some View {
        completedTasks()
    }
}
