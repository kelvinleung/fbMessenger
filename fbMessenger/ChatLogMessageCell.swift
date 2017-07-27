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
    
    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        return textView
    }()
    
    var message: Message? {
        didSet {
            messageTextView.text = message?.text
        }
    }
    
    private func setupView() {
        backgroundColor = UIColor.blue
        
        addSubview(messageTextView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: messageTextView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: messageTextView)
    }
}
