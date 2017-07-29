//
//  ChatLogMessageCell.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 27/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class ChatLogMessageCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let messageView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.padding(top: 8, right: 12, bottom: 8, left: 12)
        textView.textContainer.lineFragmentPadding = 0
        textView.backgroundColor = UIColor.clear
        textView.isEditable = false
        return textView
    }()
    
    let bubbleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return view
    }()
    
    let profileImageView: UIImageView = {
        let profileView = UIImageView()
        profileView.layer.cornerRadius = 15
        profileView.layer.masksToBounds = true
        profileView.contentMode = .scaleAspectFill
        return profileView
    }()
    
    var bubbleSize: CGSize? {
        didSet {
            if let size = bubbleSize {
                bubbleView.frame = CGRect(x: 46, y: 0, width: size.width, height: size.height)
                messageView.frame = bubbleView.bounds
            }
        }
    }
    
    private func setupView() {
        self.contentView.addSubview(bubbleView)
        bubbleView.addSubview(messageView)
        self.contentView.addSubview(profileImageView)
        
        self.contentView.addConstraintsWithFormat(format: "H:|-8-[v0(30)]", views: profileImageView)
        self.contentView.addConstraintsWithFormat(format: "V:|[v0(30)]", views: profileImageView)
    }
}
