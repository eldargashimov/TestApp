//
//  WithNameTableViewCell.swift
//  TestApp
//
//  Created by Mac on 2/15/21.
//

import UIKit
import PinLayout

class WithNameTableViewCell: UITableViewCell {
    
    weak var contactViewModel: CellViewModelType? {
        willSet (contactViewModel) {
            guard let contactViewModel = contactViewModel else { return }
            
            self.callImageView.image = contactViewModel.image
            self.contactNameLabel.attributedText = NSMutableAttributedString(string: contactViewModel.name ?? "", attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
            self.contactNumberLabel.text = contactViewModel.businessNumber
            self.durationLabel.attributedText = NSMutableAttributedString(string: contactViewModel.duration, attributes: [NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 14)])
            self.timeLabel.text = contactViewModel.time
        }
    }
    
    var cellView = UIView()
    var callImageView = UIImageView()
    var contactNameLabel = UILabel()
    var contactNumberLabel = UILabel()
    var durationLabel = UILabel()
    var timeLabel = UILabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        cellView.pin
            .top()
            .left()
            .right()
            .bottom()
            .marginHorizontal(10)
            .marginVertical(4)
        
        callImageView.pin
            .width(50)
            .height(50)
            .left()
            .top()
            .margin(10)
        
        contactNameLabel.pin
            .height(20)
            .left(to: callImageView.edge.right)
            .right()
            .top()
            .margin(10)
        
        contactNumberLabel.pin
            .height(20)
            .left(to: callImageView.edge.right)
            .right()
            .top(to: contactNameLabel.edge.bottom)
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        
        durationLabel.textAlignment = .center
        durationLabel.font = UIFont(name: "Helvetica", size: 14)
        durationLabel.textColor = .darkGray
        timeLabel.textAlignment = .center
        timeLabel.font = UIFont(name: "Helvetica", size: 14)
        timeLabel.textColor = .darkGray
        cellView.backgroundColor = .white
        
        cellView.layer.cornerRadius = 8
        // shadow
        cellView.layer.shadowColor = UIColor.black.cgColor
        cellView.layer.shadowOffset = CGSize(width: 0, height: 0)
        cellView.layer.shadowOpacity = 0.15
        cellView.layer.shadowRadius = 3
        [callImageView, contactNameLabel, contactNumberLabel, durationLabel, timeLabel].forEach { cellView.addSubview($0) }
        addSubview(cellView)
    }
}



