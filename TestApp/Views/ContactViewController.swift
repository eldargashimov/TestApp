//
//  ContactViewController.swift
//  TestApp
//
//  Created by Mac on 2/16/21.
//

import UIKit
import PinLayout

class ContactViewController: UIViewController {
    
    var fullInfo: Bool = true
    
    var contactViewModel: ContactViewModelType

    var buttonView = UIImageView()
    
    var animatedView = UIView()
    var infoView = UIView()
    var shadowAnimatedView = UIView()
    
    var shadowImageView = UIView()
    
    var callImage = UIImageView()
    var nameLabel = UILabel()
    var addressLabel = UILabel()
    var durationLabel = UILabel()
    var businessLabel = UILabel()
    var storeLabel = UILabel()
    var businessNumberLabel = UILabel()
    
    var fullToShortViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissVC))
        
        fullToShortViewButton.addTarget(self, action: #selector(svertka), for: .touchUpInside)
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        shadowAnimatedView.pin
            .top()
            .left()
            .right()
            .height(300)
        
        animatedView.pin
            .top()
            .left()
            .right()
            .bottom()
        
        infoView.pin
            .top()
            .left()
            .right()
            .height(300)
        
        shadowImageView.pin
            .top(80)
            .left(10)
            .height(50)
            .width(50)
        
        nameLabel.pin
            .top(to: shadowImageView.edge.top)
            .left(to: shadowImageView.edge.right)
            .right()
            .height(24)
            .marginLeft(10)
            .marginTop(10)
        
        addressLabel.pin
            .top(to: nameLabel.edge.bottom)
            .left(to: nameLabel.edge.left)
            .right(to: nameLabel.edge.right)
            .height(15)
            .marginVertical(10)
        
        durationLabel.pin
            .top(to: addressLabel.edge.bottom)
            .left(to: shadowImageView.edge.left)
            .right(to: shadowImageView.edge.right)
            .height(15)
            .marginVertical(10)
        
        businessLabel.pin
            .top(to: durationLabel.edge.bottom)
            .left(to: nameLabel.edge.left)
            .right(to: nameLabel.edge.right)
            .height(15)
            .marginVertical(10)
        
        storeLabel.pin
            .top(to: businessLabel.edge.bottom)
            .left(to: nameLabel.edge.left)
            .right(to: nameLabel.edge.right)
            .height(24)
            .marginVertical(10)
        
        businessNumberLabel.pin
            .top(to:storeLabel.edge.bottom)
            .left(to:nameLabel.edge.left)
            .right(to: nameLabel.edge.right)
            .height(15)
            .marginVertical(10)
        
        fullToShortViewButton.pin
            .hCenter()
            .width(100)
            .height(20)
            .bottom()
            .margin(10)
        
        buttonView.pin
            .top()
            .left()
            .right()
            .bottom()
        
        callImage.pin
            .top()
            .left()
            .right()
            .bottom()
    }
    
    private func setup() {

        callImage.image = contactViewModel.image
        callImage.applyshadowWithCorner(containerView: shadowImageView, shadowRadius: 3.0, cornerRadious: 25.0)

        shadowImageView.addSubview(callImage)
        nameLabel.attributedText = NSMutableAttributedString(string: contactViewModel.name, attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        addressLabel.text = contactViewModel.address
        durationLabel.font = UIFont.systemFont(ofSize: 14)
        durationLabel.textColor = .darkGray
        durationLabel.textAlignment = .center
        durationLabel.text = String(contactViewModel.duration)
        businessLabel.font = UIFont.systemFont(ofSize: 12)
        businessLabel.textColor = .lightGray
        businessLabel.text = contactViewModel.business
        storeLabel.attributedText = NSMutableAttributedString(string: contactViewModel.store, attributes:[NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        businessNumberLabel.text = contactViewModel.businessNumber
        
        [shadowImageView, nameLabel, addressLabel, durationLabel, businessLabel, storeLabel, businessNumberLabel].forEach { infoView.addSubview($0) }
        
        animatedView.backgroundColor = .white
        
        animatedView.applyshadowWithCorner(containerView : shadowAnimatedView, shadowRadius: 5, cornerRadious : 20)
        
        animatedView.addSubview(infoView)
        animatedView.addSubview(fullToShortViewButton)
        
        shadowAnimatedView.addSubview(animatedView)
        
        buttonView.image = contactViewModel.buttonImage
        fullToShortViewButton.addSubview(buttonView)
        
        view.addSubview(shadowAnimatedView)
    }
    
    init(contactViewModel: ContactViewModel, nibName: String?, bundle: Bundle?) {
        
        self.contactViewModel = contactViewModel
        super.init(nibName: nibName, bundle: bundle)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func dismissVC() {
        
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func svertka() {
        
        if fullInfo {
            UIView.animate(withDuration: 0.4, animations: {
                self.animatedView.pin
                    .top()
                    .left()
                    .right()
                    .height(175)
                
                self.fullToShortViewButton.pin
                    .hCenter()
                    .width(100)
                    .height(20)
                    .bottom()
                    .margin(10)
            })
        } else {
            UIView.animate(withDuration: 0.4, animations: {
                self.animatedView.pin
                    .top()
                    .left()
                    .right()
                    .height(300)
                
                self.fullToShortViewButton.pin
                    .hCenter()
                    .width(100)
                    .height(20)
                    .bottom()
                    .margin(10)
            })
        }
        
        fullInfo = !fullInfo
    }
}

extension UIView {
    func applyshadowWithCorner(containerView : UIView, shadowRadius: CGFloat, cornerRadious : CGFloat){
        
        self.layer.cornerRadius = cornerRadious
        self.clipsToBounds = true
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.15
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 3
        containerView.layer.cornerRadius = cornerRadious
    }
}
