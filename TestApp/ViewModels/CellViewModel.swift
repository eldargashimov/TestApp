//
//  ContactViewModel.swift
//  TestApp
//
//  Created by Mac on 2/18/21.
//

import Foundation
import UIKit

final class CellViewModel: CellViewModelType {
    
    private var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    var image: UIImage = UIImage(named: "Image")!
    
    var duration: String {
        return String(contact.duration.dropFirst(3))
    }
    
    var name: String? {
        return contact.client.Name
    }
    
    var businessNumber: String {
        return contact.businessNumber.number
    }
    
    var time: String {
        return contact.timeString
    }
}
