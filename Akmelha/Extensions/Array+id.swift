//
//  Array+id.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 12/07/1444 AH.
//


import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int?{
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
