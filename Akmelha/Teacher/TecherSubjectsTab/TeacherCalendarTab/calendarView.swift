//
//  calendarView.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import SwiftUI

struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    @ObservedObject var eventStore: EventStore
    @Binding var dateSelected: DateComponents?
    @Binding var displayEvents: Bool
    
    func makeUIView(context: Context) -> some UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        view.locale = Locale(identifier: "ar_SA")
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        view.selectionBehavior = dateSelection
        view.fontDesign = .default
        view.tintColor = UIColor(named: "purple")
        return view
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self, eventStore: _eventStore)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let changedEvent = eventStore.changedEvent {
            uiView.reloadDecorations(forDateComponents: [changedEvent.dateComponents], animated: true)
            eventStore.changedEvent = nil
        }

        if let movedEvent = eventStore.movedEvent {
            uiView.reloadDecorations(forDateComponents: [movedEvent.dateComponents], animated: true)
            eventStore.movedEvent = nil
        }
    }
    
    class Coordinator: NSObject, UICalendarSelectionSingleDateDelegate {
        var parent: CalendarView
        @ObservedObject var eventStore: EventStore
        init(parent: CalendarView, eventStore: ObservedObject<EventStore>) {
            self.parent = parent
            self._eventStore = eventStore
        }
        
        @MainActor
        func dateSelection(_ selection: UICalendarSelectionSingleDate,
                           didSelectDate dateComponents: DateComponents?) {
            parent.dateSelected = dateComponents
            
            guard let dateComponents else { return }
            let foundEvents = eventStore.events
            
                .filter {$0.date.startOfDay == dateComponents.date?.startOfDay}
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

