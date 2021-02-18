//
//  WithoutNameTableViewCell.swift
//  TestApp
//
//  Created by Mac on 2/16/21.
//

import UIKit

class WithoutNameTableViewCell: WithNameTableViewCell {
    
    override weak var contactViewModel: CellViewModelType? {
        willSet (contactViewModel) {
            guard let contactViewModel = contactViewModel else { return }
            
            self.callImageView.image = contactViewModel.image
            self.contactNumberLabel.attributedText = NSMutableAttributedString(string: contactViewModel.businessNumber, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
            self.durationLabel.attributedText = NSMutableAttributedString(string: contactViewModel.duration, attributes: [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 14)])
            self.timeLabel.text = contactViewModel.time
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        callImageView.pin
            .width(50)
            .height(50)
            .left()
            .top()
            .margin(10)
        
        contactNumberLabel.pin
            .height(20)
            .left(to: callImageView.edge.right)
            .right()
            .top(15)
            .margin(10)
        
        durationLabel.pin
            .height(15)
            .bottom()
            .left(to: callImageView.edge.left)
            .right(to: callImageView.edge.right)
            .marginBottom(10)
        
        timeLabel.pin
            .height(15)
            .bottom()
            .right()
            .width(60)
            .margin(10)
    }
}
