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
    var body: some View{
        NavigationView{
            ZStack{
                VStack{
                    Text("العنوان  "+event.note)
                    Text("العنوان  "+event.describtion)
                }
                
            }.background(Color("sheet"))
                .navigationTitle("تفاصيل الحدث")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {showDetailedEvent = false}){
                            Image(systemName: "xmark.circle").foregroundColor(.gray)
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
