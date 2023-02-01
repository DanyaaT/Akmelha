//
//  RekorlarViewModel.swift
//  Akmelha
//
//  Created by Hadeel Mohammed on 10/07/1444 AH.
//


import Foundation
class RekorlarViewModel: ObservableObject{
    var rekor : User1?{
        if let savedUserData = UserDefaults.standard.object(forKey: "rekor") as? Data{
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User1.self, from: savedUserData){
                return savedUser
            }
        }
        return nil
//        let rekor = UserDefaults.standard.double(forKey: "rekor")
//        return rekor
    }
    var rekorResim : User1?{
        if let savedUserData = UserDefaults.standard.object(forKey: "rekorResim") as? Data{
            let decoder = JSONDecoder()
            if let savedUser = try? decoder.decode(User1.self, from: savedUserData){
                return savedUser
            }
        }
        return nil
//        let rekor = UserDefaults.standard.double(forKey: "rekor")
//        return rekor
    }
}
