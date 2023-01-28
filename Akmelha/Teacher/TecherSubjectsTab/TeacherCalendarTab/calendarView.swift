//
//  calendarView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var dbEvent: EventDB
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .islamicUmmAlQura)
        view.availableDateRange = interval
        view.locale = Locale(identifier: "ar_SA")
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        view.fontDesign = .default
        view.tintColor = UIColor(named: "purple")
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, dbEvent: _dbEvent)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {

    }
    
    class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
        var parent: CalendarView
        @ObservedObject var dbEvent: EventDB
        init(parent: CalendarView, dbEvent: ObservedObject<EventDB>) {
            self.parent = parent
            self._dbEvent = dbEvent
        }
        
        @MainActor
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
            
            guard let dateComponents else { return }
            let foundEvents = dbEvent.events
            
                .filter {$0.eventDate.startOfDay == dateComponents.date?.startOfDay}
            if !foundEvents.isEmpty {
                parent.displayEvents.toggle()
            }
        }
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           canSelectDate dateComponents: DateComponents?) -> Bool {

            return true
        }
        

        
    }
    
    
}

