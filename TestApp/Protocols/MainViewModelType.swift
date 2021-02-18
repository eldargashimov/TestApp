//
//  MainViewModelType.swift
//  TestApp
//
//  Created by Mac on 2/18/21.
//

import Foundation
import UIKit

protocol MainViewModelType {
    func numberOfRows() -> Int
    func cellViewModel(forIndexPath indexPath: IndexPath) -> CellViewModelType?
    func contactViewModel(forIndexPath indexPath: IndexPath) -> ContactViewModelType?
}
