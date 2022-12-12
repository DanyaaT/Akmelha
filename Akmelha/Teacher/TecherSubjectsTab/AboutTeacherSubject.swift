//
//  AboutTeacherSubjetc.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct AboutTeacherSubject: View {
    @State var subjectDesc =  ""
    @State var edit = false
    var body: some View {
        VStack(alignment: .leading){
         
        
          
            HStack(spacing: 2){
                Text("وصف المادة")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.bottom)
           
           
                

         
                
                TextField("الوصف", text: $subjectDesc).disabled(!edit).padding(.horizontal).background(RoundedRectangle(cornerRadius: 8).stroke(.gray.opacity(0.4)).frame( height: 50).background(Color("bg")))
                                                                                                       
            .padding(.vertical)
            
            
            HStack(spacing: 2){
                Text("معلم المادة")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            Text("الأستادة/ جواهر محمد").padding(.vertical)
            HStack(spacing: 2){
                Text("الرقم التعريفي")
                Rectangle().frame(height: 1).foregroundColor(.gray)
            }.padding(.vertical)
            Text("441g34662hh78").padding(.vertical)
            Spacer()
            VStack{
            if edit{
                Button(action:{}){
                    VStack{
                    HStack{
                        Spacer()
                        Image(systemName: "trash").font(.title).foregroundColor(.red)
                        Spacer()
                    }
                    HStack{
                        Spacer()
                        Text("حذف المادة").foregroundColor(.gray)
                        Spacer()
                    }
                    }
                }
                
            }
            }
            
        }.toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action:{edit.toggle()}){
                    if !edit{
                     
                           
                        Text("تحرير").foregroundColor(Color("purple"))
                           
                        
                    }else{
                       
                          
                        Text("حفظ").foregroundColor(Color("purple"))
                          
                     }
                        
                    }
                
                }
            }
         
    }
}

struct AboutSubject_Previews: PreviewProvider {
    static var previews: some View {
        AboutTeacherSubject().environment(\.layoutDirection, .rightToLeft)
    }
}
