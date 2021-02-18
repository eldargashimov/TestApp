//
//  Model.swift
//  TestApp
//
//  Created by Mac on 2/14/21.
//

import Foundation

struct Client: Codable {
    
    var address: String
    var Name: String?
}

struct BusinessNumber: Codable {
    
    var number: String
    var label: String
}

struct Contact: Codable {
    
    var id: String
    var state: String
    var client: Client
    var type: String
    var created: String
    var businessNumber: BusinessNumber
    var origin: String
    var favorite: Bool
    var duration: String
    
    var createdDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: String(created))
    }
    
    var timeString: String {
        
        guard let createdDate = createdDate else {
            return ""
        }
        let (hour, minute) = (Calendar.current.component(.hour, from: createdDate), Calendar.current.component(.minute, from: createdDate))
        if Int(hour) >= 12 {
            return Int(hour) >= 22 ? "\(Int(hour) - 12):\(minute) PM" : "0\(Int(hour) - 12):\(minute) PM"
        } else {
            return "\(hour):\(minute) AM"
        }
    }
}

struct Requests: Codable {
    
    var requests: [Contact]
}

