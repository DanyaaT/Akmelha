//
//  StudentCalendarView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct StudentCalendarView: View {
    @State var dateSelected: DateComponents?
    @State var showAddEventSheet = false
    @EnvironmentObject var dbEvent: EventDB
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
                                 dbEvent: dbEvent,
                                 dateSelected: $dateSelected,
                                 displayEvents: $displayEvents)
                    
                    HStack {
                        Text("الأحداث المهمة")
                            .font(.system(size: 23))
                            .foregroundColor(Color("addEvent"))
                            .padding()
                        Spacer()
                        Spacer()
  
                    } //Hstack
                    
                        
                    }.environment(\.layoutDirection, .rightToLeft)
                    
                        .padding(.top, -35.0)
                    
                    
                    //  ForEach(eventStore.events.sorted {$0.date < $1.date }) { event in
                    //  EventList(event: event)
                    
                    
                    ForEach(dbEvent.events.indices, id: \.self) {index in
                        EventList(event : dbEvent.events[index])
                    }
                    .environment(\.layoutDirection, .rightToLeft)
                    
                    .sheet(isPresented: $displayEvents) {
                        DaysEventsListView(dateSelected: $dateSelected)
                            .presentationDetents([.medium])
                    }
                    
                    
                    
                }//scrollView
            }//Vstack
        }//Zstack
    }


struct StudentCalendarView_Previews: PreviewProvider {
    static var dateComponents: DateComponents {
        
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: Date())
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .islamicUmmAlQura)
        return dateComponents
    }
    static var previews: some View {
        StudentCalendarView().environment(\.layoutDirection, .leftToRight)
        
    }
}
