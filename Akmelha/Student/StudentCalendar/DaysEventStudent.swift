//
//  DaysEventStudent.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 25/05/1444 AH.
//

import SwiftUI

struct DaysEventStudent: View {
    @Binding var dateSelected: DateComponents?
    @EnvironmentObject var dbEvent: EventDB
    
    var body: some View {
        
        NavigationStack {
            Group {
                if let dateSelected {
                    let foundEvents = dbEvent.events
                        .filter {$0.eventDate.startOfDay == dateSelected.date!.startOfDay}
                    VStack{
                        ForEach(foundEvents) { event in
                            EventListStudent(event: event)
                        }.environment(\.layoutDirection,.rightToLeft)
                        }
                       
                }
            }
           
            .navigationTitle(dateSelected?.date?.formatted(date: .long, time: .omitted) ?? "")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
        
}

struct DaysEventStudent_Previews: PreviewProvider {
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
        DaysEventStudent(dateSelected: .constant(dateComponents))
    }
}
