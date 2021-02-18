//
//  CellViewModelType.swift
//  TestApp
//
//  Created by Mac on 2/18/21.
//

import Foundation
import UIKit

protocol CellViewModelType: class {
    
    var image: UIImage { get }
    var name: String? { get }
    var businessNumber: String { get }
    var duration: String { get }
    var time: String { get }
}
