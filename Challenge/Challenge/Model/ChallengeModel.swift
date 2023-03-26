//
//  ChallengeModel.swift
//  Challenge
//
//  Created by Rubén Higuera Galán on 25/3/23.
//

import Foundation

struct ChallengeModel: Decodable {
    let id: Int
    let date: String?
    let amount: Double
    let fee: Double?
    let description: String?
    
    enum CodingKeys: String, CodingKey {
        case id 
        case description
        case date
        case amount, fee
    }
    
    func checkDateValid(string: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        if let date = dateFormatter.date(from: string) {
            print(date)
            return true
        } else {
            return false
        }
    }
}

