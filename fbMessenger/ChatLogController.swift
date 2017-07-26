//
//  ChatLogController.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 26/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var friend: Friend? {
        didSet {
            navigationItem.title = friend?.name
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = UIColor.white
    }
}
