//
//  MainViewModel.swift
//  TestApp
//
//  Created by Mac on 2/18/21.
//

import Foundation

final class MainViewModel: MainViewModelType {
    
    private var contacts = NetworkManager.getContacts().sorted{ $0.createdDate! > $1.createdDate! }
    
    func  numberOfRows() -> Int {
        return contacts.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType? {
        let contact = contacts[indexPath.row]
        return CellViewModel(contact: contact)
    }
    
    func contactViewModel(forIndexPath indexPath: IndexPath) -> ContactViewModelType? {
        let contact = contacts[indexPath.row]
        return ContactViewModel(contact: contact)
    }
}

