//
//  TaskStatus.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 26/05/1444 AH.
//

import SwiftUI

struct TaskStatus: View {
    var body: some View {
        ZStack {
            Color("bg").ignoresSafeArea()
            ScrollView {
                
                VStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.1), lineWidth: 1).frame( height: 60).background(Color.white).shadow(radius:0.1)
                        HStack{
                            ZStack {
                                Circle()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color("checkColor"))
                                    
                                .padding(.horizontal)
                                Image(systemName: "checkmark").foregroundColor(.white)
                            }
                            Text("١/٦ الاربعاء").font(.system(size: 20))
                            Spacer()
                        }.environment(\.layoutDirection, .rightToLeft)
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.1), lineWidth: 1).frame( height: 60).background(Color.white).shadow(radius:0.1)
                        HStack{
                            ZStack {
                                Circle().strokeBorder(.black, lineWidth: 1)
                                    .frame(width: 30, height: 30)
                                    
                                    
                                .padding(.horizontal)
                                Image(systemName: "checkmark").foregroundColor(.white)
                            }
                            Text("١/٦ الاربعاء").font(.system(size: 20))
                            Spacer()
                        }.environment(\.layoutDirection, .rightToLeft)
                    }

                }
            }
        }
    }
}

struct TaskStatus_Previews: PreviewProvider {
    static var previews: some View {
        TaskStatus()
    }
}
