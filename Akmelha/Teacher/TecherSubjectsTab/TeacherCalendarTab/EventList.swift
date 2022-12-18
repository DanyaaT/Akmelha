//
//  EventList.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import SwiftUI

struct EventList: View {
    @State var pickerColor = "pink"
    let event: Eventt
    @State var showDetailedEvent = false
    @State private var formType: EventFormType?
    var body: some View {
        Button {
            showDetailedEvent = true
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 85).background(Color.white).shadow(radius: 0.6)
                VStack{
                    HStack{
                        Text(event.subject).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                        Spacer()
                        Text(event.date.formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(.gray)
                    }
                    HStack{
                        Text(event.note).font(.title3).foregroundColor(.black)
                        Spacer()
                    }
                    HStack{
                        Text("").background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                        Spacer()
                        Text(event.section).foregroundColor(.gray)
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
    let event : Eventt
    @EnvironmentObject var eventStore: EventStore
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
                                Text(event.subject).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor1)))
                                Spacer()
                                Text(event.date.formatted(date: .abbreviated, time: .omitted))
                                    .foregroundColor(.gray)
                            }
                            HStack{
                                Text(event.note).font(.title3).foregroundColor(.black)
                                Spacer()
                            }
                            HStack{
                                Text("").background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                                Spacer()
                                Text(event.section).foregroundColor(.gray)
                            }
                            
                            
                            
                        }.padding()
                        
                        
                    }.padding(.horizontal)
                     .environment(\.layoutDirection, .rightToLeft)
                    ZStack{
                        RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5), lineWidth: 0.5).frame( height: 180).background(Color.white).shadow(radius: 0.6)
                       
                        VStack{
                            HStack{
                                Text("الوصف").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                              
                                Text(event.describtion)
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                    
                            HStack{
                                Text("التاريخ").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                              
                                Text(event.date.formatted(date: .abbreviated, time: .omitted))
                                    .foregroundColor(.black)
                                Spacer()
                            }.padding(.vertical)
                            HStack{
                                Text("الصف الدراسي").font(.system(size: 20)).foregroundColor(.black).background(Rectangle().frame( height: 8 ).foregroundColor(Color(pickerColor)))
                              
                                Text(event.section)
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
                            eventStore.delete(event)
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

struct EventLisr_Previews: PreviewProvider {
    static let event =  Eventt(date: Date().diff(numDays: 0), note: "تسيليم واجب الرياضيات" ,section: "ثالث ابتدائي",describtion: "الحرص",subject: "رياضيات")
    static var previews: some View {
        EventList(event: event)
            .environment(\.layoutDirection, .rightToLeft)
            
    }
}
