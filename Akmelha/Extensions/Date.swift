//
//  Date.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 23/05/1444 AH.
//


import Foundation

extension Date {
    func diff(numDays: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: numDays, to: self)!
        
    }
    
    
    var startOfDay: Date {
        Calendar(identifier: .islamicUmmAlQura).startOfDay(for: self)
        
    }
    func convertDate() {
        let dateFor = DateFormatter()
        
        let hijriCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
        dateFor.locale = Locale.init(identifier: "ar") // or "en" as you want to show numbers
        
        dateFor.calendar = hijriCalendar
        
        dateFor.dateFormat = "dd/MM/yyyy"
        print(dateFor.string(from: Date()))
    }
    
}

