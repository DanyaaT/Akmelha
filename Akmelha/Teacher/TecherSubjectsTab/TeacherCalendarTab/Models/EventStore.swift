//
//  EventStore.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import Foundation


@MainActor
class EventStore: ObservableObject {
    @Published var events = [Eventt]()
    @Published var preview: Bool
    @Published var changedEvent: Eventt?
    @Published var movedEvent: Eventt?

    init(preview: Bool = false) {
        self.preview = preview
        fetchEvents()
    }

    func fetchEvents() {
        if preview {
            events = Eventt.sampleEvents
        } else {
            // load from your persistence store
        }
    }

    func delete(_ event: Eventt) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            changedEvent = events.remove(at: index)
        }
    }

    func add(_ event: Eventt) {
        events.append(event)
        changedEvent = event
    }

    func update(_ event: Eventt) {
        if let index = events.firstIndex(where: {$0.id == event.id}) {
            movedEvent = events[index]
            events[index].date = event.date
            events[index].note = event.note
            events[index].subject = event.subject
            events[index].describtion = event.describtion
            events[index].section = event.section
            changedEvent = event
        }
    }

}
