//
//  FriendCell.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 25/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class FriendCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 34
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Friend Name"
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "Your friend's message and something else..."
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "12:45 pm"
        label.textColor = UIColor.darkGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .right
        return label
    }()
    
    let hasReadImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 12
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private func setupViews() {
        addSubview(profileImageView)
        addConstraintsWithFormat(format: "H:|-12-[v0(68)]", views: profileImageView)
        addConstraintsWithFormat(format: "V:[v0(68)]", views: profileImageView)
        
        hCenterAlign(view: profileImageView, to: self)
        
        addSubview(dividerLineView)
        addConstraintsWithFormat(format: "H:|-92-[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:[v0(1)]|", views: dividerLineView)
        
        setupContainerView()
    }
    
    private func setupContainerView() {
        let containerView = UIView()
        
        addSubview(containerView)
        addConstraintsWithFormat(format: "H:|-92-[v0]-12-|", views: containerView)
        addConstraintsWithFormat(format: "V:[v0(50)]", views: containerView)
        
        hCenterAlign(view: containerView, to: self)
        
        containerView.addSubview(nameLabel)
        containerView.addSubview(timeLabel)
        containerView.addSubview(messageLabel)
        containerView.addSubview(hasReadImageView)
        
        containerView.addConstraintsWithFormat(format: "H:|[v0][v1(80)]|", views: nameLabel, timeLabel)
        
        containerView.hCenterAlign(view: timeLabel, to: nameLabel)
        
        containerView.addConstraintsWithFormat(format: "H:|[v0]-[v1(20)]|", views: messageLabel, hasReadImageView)
        containerView.addConstraintsWithFormat(format: "V:[v0(20)]", views: hasReadImageView)
        containerView.hCenterAlign(view: hasReadImageView, to: messageLabel)
        
        containerView.addConstraintsWithFormat(format: "V:|[v0][v1(24)]|", views: nameLabel, messageLabel)
        
        
        
    }
}
