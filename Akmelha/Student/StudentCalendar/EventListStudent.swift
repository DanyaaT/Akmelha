//
//  EventListStudent.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct EventListStudent: View {
    @State var pickerColor = "pink"
    var user: User
    let event: Event
    var courseName = ""
    var courseColor = ""
    var courseLevel = ""
    @State var showDetailedEvent2 = false

    var body: some View {
        Button {
            showDetailedEvent2 = true
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text(courseName).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(courseColor)))
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
                        Text(courseLevel).foregroundColor(.gray)
                    }
                        

                    
                }.padding()
                
                
            }.padding(.horizontal)
        }
        .sheet(isPresented: $showDetailedEvent2){
            DetailedEventStudent(showDetailedEvent2:$showDetailedEvent2, event: event)
                .presentationDetents([.medium])
        }
    }
}

struct DetailedEventStudent: View{
    
    @Binding var showDetailedEvent2: Bool
    let event : Event
    @EnvironmentObject var dbEvent: EventDB
    @State var pickerColor1 = "math"
    @State var edit = false
    @State var pickerColor = "arabic"
    var body: some View{
        NavigationView{
            ZStack{
                Color("sheet").ignoresSafeArea()
                VStack {
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                        VStack{
                            HStack{
                                Text(event.eventCourse ?? "").foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor1)))
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
//                                Text(event.eventSection ?? "").foregroundColor(.gray)
                            }
                            
                            
                            
                        }.padding()
                        
                        
                    }.padding(.horizontal)
                     .environment(\.layoutDirection, .rightToLeft)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 180).background(Color.white).shadow(radius: 0.6)
                       
                        VStack{
                            HStack{
                                Text("الوصف").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                              
                                Text(event.eventDesc ?? "")
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                    
                            HStack{
                                Text("التاريخ").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                              
                                Text(event.eventDate.formatted(date: .abbreviated, time: .omitted))
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                            HStack{
                                Text("الصف الدراسي").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                              
//                                Text(event.eventSection ?? "")
//                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                           
                            
                        }.padding(.horizontal)
                        
                        
                    }.padding(.horizontal)
                     .environment(\.layoutDirection, .rightToLeft)
                        .navigationTitle("تفاصيل الحدث")
                        .navigationBarTitleDisplayMode(.inline)
   
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {showDetailedEvent2 = false}){
                                    Image(systemName: "xmark.circle").foregroundColor(.gray)
                                }
                            }
                        }
                        Spacer()
                    
                }
            }
        }
    }
    }
