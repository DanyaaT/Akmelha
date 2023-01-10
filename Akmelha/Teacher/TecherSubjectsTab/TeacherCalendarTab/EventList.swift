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
    //let course: Course
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

    @State private var showDeleteAlert = false
    @Binding var showDetailedEvent: Bool
    @Environment(\.dismiss) var dismiss
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
