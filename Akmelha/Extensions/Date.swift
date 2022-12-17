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
        Calendar.current.startOfDay(for: self)
    }
}

