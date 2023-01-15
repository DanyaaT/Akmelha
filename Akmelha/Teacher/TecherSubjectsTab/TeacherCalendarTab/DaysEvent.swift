//
//  DaysEvent.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//


import SwiftUI
import FirebaseAuth
struct DaysEventsListView: View {

    @Binding var dateSelected: DateComponents?
   
    @EnvironmentObject var dbEvent: EventDB
    
    var body: some View {
        NavigationStack {
            Group {
                if let dateSelected {
                    let foundEvents = dbEvent.events
                        .filter {$0.eventDate.startOfDay == dateSelected.date!.startOfDay}
                    VStack{
                        let id = Auth.auth().currentUser?.uid
                        ForEach(dbEvent.events.indices, id: \.self) {index in
                            if ( dbEvent.events[index].courseTeacher == id ){
                                EventList(event : dbEvent.events[index])
                            }
                        } .environment(\.layoutDirection,.rightToLeft)
                        }
                       
                }
            }
           
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct DaysEventsListView_Previews: PreviewProvider {
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
        DaysEventsListView(dateSelected: .constant(dateComponents))
       
    }
}

