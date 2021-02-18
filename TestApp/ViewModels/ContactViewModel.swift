//
//  DetailViewModel.swift
//  TestApp
//
//  Created by Mac on 2/18/21.
//

import Foundation
import UIKit

final class ContactViewModel: ContactViewModelType {
    
    private var contact: Contact
    
    var image: UIImage {
        return UIImage(named: "Image")!
    }
    
    var duration: String {
        return String(contact.duration.dropFirst(3))
    }
    
    var name: String {
        return contact.client.Name ?? "Unknown"
    }
    
    var address: String {
        return contact.client.address
    }
    
    var store: String {
        return contact.businessNumber.label
    }
    
    var business: String {
        return "Business number"
    }
    
    var businessNumber: String {
        return contact.businessNumber.number
    }
    
    var buttonImage: UIImage {
        return UIImage(named: "Image-1")!
    }
    
    init(contact: Contact) {
        self.contact = contact
    }
}
