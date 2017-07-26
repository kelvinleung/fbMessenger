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
    
    private func setupView() {
        backgroundColor = UIColor.blue
    }
}
