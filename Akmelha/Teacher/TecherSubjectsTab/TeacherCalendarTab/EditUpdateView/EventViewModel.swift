//
//  EventViewModel.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//

import Foundation

class EventFormViewModel: ObservableObject {
    @Published var date = Date()
    @Published var note = ""
    @Published var section = ""
    @Published var describtion = ""
    @Published var subject = ""

    var id: String?
    var updating: Bool { id != nil }

    init() {}

    init(_ event: Eventt) {
        date = event.date
        note = event.note
        id = event.id
        section = event.section
        describtion = event.describtion
        subject = event.subject
        
    }

    var incomplete: Bool {
        note.isEmpty
    }
}
