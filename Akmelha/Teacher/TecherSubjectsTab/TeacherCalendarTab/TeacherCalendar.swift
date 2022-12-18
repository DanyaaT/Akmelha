//
//  TeacherCalendar.swift
//  Akmelha
//
//  Created by Danya T on 17/05/1444 AH.
//

import SwiftUI

struct TeacherCalendar: View {
    @State private var formType: EventFormType?
    @EnvironmentObject var eventStore: EventStore
    @State var dateSelected: DateComponents?
   
    @State private var displayEvents = false
    var body: some View {
      
        ZStack{
            Color("bg").ignoresSafeArea()

            VStack{
                ZStack{
                    
                    Rectangle()
                        .cornerRadius(radius:50, corners: [.bottomRight, .bottomLeft])
                        .foregroundColor(Color("top")).ignoresSafeArea()
                        .frame(height:99)
                    
                    
                    
                    Text("\n"+"التقويم الدراسي")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40))
                        .foregroundColor(Color("title"))
                }//end overlay
                        ScrollView{
                           
                            CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                                         eventStore: eventStore,
                                         dateSelected: $dateSelected,
                                         displayEvents: $displayEvents)
                           
                            HStack {
                                Text("الأحداث المهمة")
                                    .font(.system(size: 23))
                                    .foregroundColor(Color("addEvent"))
                                    .padding()
                                Spacer()
                  
                                        Button {
                                            formType = .new
                                        } label: {
                                            Image(systemName: "calendar.badge.plus")
                                                .resizable()
                                                .foregroundColor(Color("addEvent"))
                                                .frame(width: 38, height: 35)
                                                .padding()
                                        } //Button
                                        .sheet(item: $formType) {$0}

                            }.environment(\.layoutDirection, .rightToLeft)//Hstack
                            .padding(.top, -35.0)
                            
                        
                                ForEach(eventStore.events.sorted {$0.date < $1.date }) { event in
                                    EventList(event: event)
                                 
                                
                            }.environment(\.layoutDirection, .rightToLeft)

                                .sheet(isPresented: $displayEvents) {
                                   DaysEventsListView(dateSelected: $dateSelected)
                                    .presentationDetents([.medium])
                          }
                            
                            }

                        }//scrollView
                    }//Vstack
                }//Zstack
    }



struct TeacherCalendar_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }
    static var previews: some View {
        
        TeacherCalendar()
            //.environment(\.layoutDirection, .rightToLeft)
            .environmentObject(EventStore(preview: true))
           
    }
}
