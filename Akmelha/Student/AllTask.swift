//
//  AllTask.swift
//  Akmelha
//
//  Created by H on 29/05/1444 AH.
//

import SwiftUI

struct AllTask: View {
    @State private var showSheet = false

    var body: some View {
        ScrollView{
            
            HStack{
                
                
                Text("المهام المدرسية")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                    .font(.system(size: 20))
                
                Rectangle().frame(height: 1,alignment: .center)
                    .foregroundColor(Color("title"))
                
                
            }.padding(.horizontal)
            
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
        }
            
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
            
            
            HStack{
                
                
                Text("مهامي")
                    .foregroundColor(Color(hue: 1.0, saturation: 0.082, brightness: 0.307))
                    .font(.system(size: 20))
                
                Rectangle().frame(height: 1,alignment: .center)
                    .foregroundColor(Color("title"))
                
                
            }.padding(.horizontal)
            
            Button {
                
            }
        label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
                VStack{
                    Spacer()
                    Spacer()
                    
                    HStack{
                        ZStack {
                            Circle().strokeBorder(.black, lineWidth: 1)
                                .frame(width: 30, height: 30)
                            
                        }
                        
                        Text("ترتيب الغرفة").font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        
                        Spacer()
                        Text("٥ نقاط").foregroundColor(.gray)
                    }
                    
                    
                    
                }.padding()
            }.padding(.horizontal)
        }
            
            
            Button {
                
            }
        label: {
            ZStack{
                
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 100).background(Color.white).shadow(radius: 0.6)
                VStack{
                    Spacer()
                    Spacer()
                    
                    HStack{
                        ZStack {
                            Circle().strokeBorder(.black, lineWidth: 1)
                                .frame(width: 30, height: 30)
                            
                        }
                        
                        Text("تحضير درس الرياضيات").font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        
                        Spacer()
                        Text("٥ نقاط").foregroundColor(.gray)
                    }
                    
                    
                    
                }.padding()
            }.padding(.horizontal)
        }
            
            
            ZStack {
                
                Rectangle()
                    .foregroundColor(Color("green"))
                    .frame(width:56,height:56, alignment: .bottom)
                    .cornerRadius(21.8)
                
                Button("+"){
                    showSheet = true                }// end Button
                .font(.system(size: 30))
                .foregroundColor(.white)
                .frame(width: 56 , height: 56 ,alignment: .center)
                
            }//  Zstack
            .frame(alignment: .bottom)
        } //scroolview
        
            .sheet(isPresented: $showSheet){
                SheetView(showSheet:$showSheet)
                    .presentationDetents([.medium])
            }
                
        
    }
}


struct SheetView:View{

@Binding var showSheet : Bool
@State var taskName : String = ""
@State var disc : String = ""

@State var selectedCourse = ""
@State var selectedLevel = ""
@EnvironmentObject var dbCourse: CourseDB
@State var courseColor = ""
@State var courseImage = ""
@State var courseTeacher = ""

@State var courses = ["الرياضيات", "العلوم","لغتي الجميلة","لغتي الخالدة","الدراسات الإسلامية","اللغة الإنجليزية","المهارات الرقمية","الدراسات الاجتماعية","التربية الأسرية","التربية الفنية","التفكير الناقد",]
@State var levels = ["الأول ابتدائي", "الثاني ابتدائي","الثالث ابتدائي", "الرابع ابتدائي"," الخامس ابتدائي"," السادس ابتدائي","الأول متوسط","الثاني متوسط","الثالث متوسط"]




var body: some View{
    
    VStack{
        NavigationView{
            Form {

                TextField("اسم المهمة", text: $taskName, axis: .vertical)
                    .environment(\.layoutDirection, .rightToLeft)
                   .frame(width: 300)
                   .frame(alignment: .top)

                
             

                
                TextField("الوصف", text: $disc, axis: .vertical)
                    .environment(\.layoutDirection, .rightToLeft)
                    .frame(width: 300,height: 200,alignment: .top)
                
                
                
                
                Section(footer:
                            HStack {
                    Spacer()
                    Button {
                     
                        showSheet = false
                  
                    } label: {
                        HStack{
                            Spacer()
                            Text("اضافة").font(.title2)
                            Spacer()
                        }
                    }.tint(Color("green"))
                    .buttonStyle(.borderedProminent)
                    .foregroundColor(.white)
                    .cornerRadius(10)
               
    
                }
                ) {
                    EmptyView()
                }
            }
            .environment(\.layoutDirection,.rightToLeft)
            .scrollContentBackground(.hidden)
            .background(Color("sheet"))
            .navigationTitle("اضافة مهمة جديدة")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.navigationBarTrailing){
                    Button(action:{showSheet=false}){
                        Image(systemName:"xmark.circle")
                            .foregroundColor(.gray)
                    }// end button
                }// end toolbar item
                
            }//end toolbar
        }// end NavigationView

    } // end first Vstack
    

    }// body
    }// struct



struct AllTask_Previews: PreviewProvider {
    static var previews: some View {
        AllTask() .environment(\.layoutDirection,.rightToLeft)
    }
}
