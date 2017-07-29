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
        view.backgroundColor = UIColor(white: 0.9, alpha: 1)
        return view
    }()
    
    var message: Message? {
        didSet {
            messageView.text = message?.text
        }
    }
    
    var bubbleSize: CGSize? {
        didSet {
            if let size = bubbleSize {
                bubbleView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
                messageView.frame = bubbleView.bounds
            }
        }
    }
    
    private func setupView() {
        self.contentView.addSubview(bubbleView)
        bubbleView.addSubview(messageView)
    }
}
