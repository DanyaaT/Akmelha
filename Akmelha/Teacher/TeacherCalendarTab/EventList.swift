//
//  EventList.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import SwiftUI

struct EventList: View {
    @State var pickerColor = "pink"
    
    let event: Event
    @EnvironmentObject var dbCourse: CourseDB
    //let course: Course
    @State var showDetailedEvent = false

    var body: some View {
        Button {
            showDetailedEvent = true
        } label: {
            ZStack{
                let course = CourseNameLevel(id: event.eventCourse ?? "", courses: dbCourse.courses)
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{

                        
                       

                       
                        Text(course[0]).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(course[1])))

                        Spacer()
                        Text(event.eventDate.formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text(event.eventName ?? "").font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        Text("").background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                        Spacer()
                        Text(course[2]).foregroundColor(.gray)
                    }
                        

                    
                }.padding()
                
                
            }.padding(.horizontal)
        }
        .sheet(isPresented: $showDetailedEvent){
            DetailedEvent(showDetailedEvent:$showDetailedEvent, event: event)
                .presentationDetents([.medium])
        }
    }
    func courseColorAndImage(courseName: String) -> [String]{
        var colorAndImage = [""]
        var color = ""
        var image = ""
        
        if courseName == "الرياضيات"{
          color = "math"
          image = "math"
        }
       else if courseName == "العلوم"{
          color = "science"
          image = "science"
        }
        else if courseName == "لغتي الجميلة"{
           color = "arabic"
           image = "arabic"
         }
        else if courseName == "لغتي الخالدة"{
           color = "arabic"
           image = "arabic"
         }
        else if courseName == "الدراسات الإسلامية"{
           color = "islamic"
           image = "islamic"
         }
        else if courseName == "اللغة الإنجليزية"{
           color = "english"
           image = "english"
         }
        else if courseName == "الدراسات الاجتماعية"{
           color = "geo"
           image = "geo"
         }
        else if courseName == "المهارات الرقمية"{
           color = "computer"
           image = "computer"
         }
        else if courseName == "التربية الأسرية"{
           color = "family"
           image = "family"
         }
        else if courseName == "التربية الفنية"{
           color = "art"
           image = "art"
         }
        else if courseName == "التفكير الناقد"{
           color = "think"
           image = "think"
         }
        else{
            color = ""
            image = ""
        }
        
        colorAndImage = [color, image]
        
        return colorAndImage
    }

}

struct DetailedEvent: View{

    @State private var showDeleteAlert = false
    @Binding var showDetailedEvent: Bool
    @Environment(\.dismiss) var dismiss
    let event : Event
    @EnvironmentObject var dbCourse: CourseDB
    @EnvironmentObject var dbEvent: EventDB
    @State var pickerColor1 = "math"
    @State var edit = false
    @State var pickerColor = "arabic"
    var body: some View{
        NavigationView{
            ZStack{
                Color("sheet").ignoresSafeArea()
                VStack {
                    let course = CourseNameLevel(id: event.eventCourse ?? "", courses: dbCourse.courses)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                        VStack{
                            HStack{
                                Text(course[0]).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(course[1])))
                                Spacer()
                                //Text(event.eventDate ?? Date().formatted(date: .abbreviated, time: .omitted))
                                  //  .foregroundColor(.gray)
                                Text(event.eventDate , style: .date).foregroundColor(.gray)
                            }
                            HStack{
                                Text(event.eventName ?? "").font(.title3).foregroundColor(.black)
                                Spacer()
                            }
                            HStack{
                                Text("").background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                                Spacer()
                               Text(course[2]).foregroundColor(.gray)
                            }
      
                        }.padding()
                    }.padding(.horizontal)
                     .environment(\.layoutDirection, .rightToLeft)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 180).background(Color.white).shadow(radius: 0.6)
                        VStack{
                            
                            HStack{
                               
                                Text("الوصف").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(course[1])))
                              
                                Text(event.eventDesc ?? "")
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                    
                            HStack{
                                Text("التاريخ").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(course[1])))
                              
                                Text(event.eventDate.formatted(date: .abbreviated, time: .omitted))
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                            HStack{
                                Text("الصف الدراسي").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(course[1])))
                              
                               Text(course[2])
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                        }.padding(.horizontal)
                    }.padding(.horizontal)
                     .environment(\.layoutDirection, .rightToLeft)
                        .navigationTitle("تفاصيل الحدث")
                        .navigationBarTitleDisplayMode(.inline)

                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {showDetailedEvent = false}){
                                    Image(systemName: "xmark.circle").foregroundColor(.gray)
                                }
                            }
                            ToolbarItem(placement:.navigationBarLeading){
                                Button(action: {showDeleteAlert = true}){
                                    Image(systemName: "trash").foregroundColor(.red)
                                 
                                } .alert( isPresented: $showDeleteAlert) {
                                    
                                    Alert(
                                        title: Text("حذف المهمة؟"),
                                        message: Text(""),
                                        primaryButton: .destructive(Text("حذف"), action: {
                                            dbEvent.deleteEvent(event)
                                        }),
                                        secondaryButton: .cancel(Text("الغاء"), action: { // 1
                                            
                                            
                                        })
                                    )
                                    
                                }
                            }
                            
                        }
      
                    
                }
            }
        }
    }
    }
