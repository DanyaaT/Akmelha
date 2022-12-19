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
    @State var showDetailedEvent = false

    var body: some View {
        Button {
            showDetailedEvent = true
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text(event.eventCourse ?? "").foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
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
                        Text(event.eventSection ?? "").foregroundColor(.gray)
                    }
                        

                    
                }.padding()
                
                
            }.padding(.horizontal)
        }
        .sheet(isPresented: $showDetailedEvent){
            DetailedEvent(showDetailedEvent:$showDetailedEvent, event: event)
                .presentationDetents([.medium])
        }
    }
}

struct DetailedEvent: View{

    
    @Binding var showDetailedEvent: Bool
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
                                Text(event.eventSection ?? "").foregroundColor(.gray)
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
                              
                                Text(event.eventSection ?? "")
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                           
                            
                        }.padding(.horizontal)
                        
                        
                    }.padding(.horizontal)
                     .environment(\.layoutDirection, .rightToLeft)
                        .navigationTitle("تفاصيل الحدث")
                        .navigationBarTitleDisplayMode(.inline)
                    VStack{
                    if edit{
                        Button(action:{
                            dbEvent.deleteEvent(event)
                            
                        }){
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

                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing){
                                Button(action: {showDetailedEvent = false}){
                                    Image(systemName: "xmark.circle").foregroundColor(.gray)
                                }
                            }
                        }
                        Spacer()
                        .toolbar{
                            ToolbarItem(placement: .navigationBarLeading){
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
        }
    }
    }
