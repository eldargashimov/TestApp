//
//  ContactViewModelType.swift
//  TestApp
//
//  Created by Mac on 2/18/21.
//

import Foundation
import UIKit

protocol ContactViewModelType: class {
    
    var image: UIImage { get }
    var duration: String { get }
    var name: String { get }
    var address: String { get }
    var store: String { get }
    var business: String { get }
    var businessNumber: String { get }
    var buttonImage: UIImage { get }
}
