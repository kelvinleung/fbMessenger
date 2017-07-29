//
//  ChatLogController.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 26/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit

class ChatLogController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var messages: [Message]?
    
    var friend: Friend? {
        didSet {
            navigationItem.title = friend?.name
            messages = friend?.messages?.allObjects as? [Message]
            
            messages = messages?.sorted(by: { $0.date!.compare($1.date! as Date) == .orderedAscending })
        }
    }
    
    private func calculateTextFrame(text: String, maxWidth: CGFloat, fontSize: CGFloat) -> CGRect {
        let size = CGSize(width: maxWidth, height: CGFloat.greatestFiniteMagnitude)
        let option = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: option, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: fontSize)], context: nil)
        return estimatedFrame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(ChatLogMessageCell.self, forCellWithReuseIdentifier: cellId)
        
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        if let chatLogMessageCell = cell as? ChatLogMessageCell {
            chatLogMessageCell.message = messages?[indexPath.item]
            
            if let messageText = messages?[indexPath.item].text {
                let frame = calculateTextFrame(text: messageText, maxWidth: 250, fontSize: 18)
                let bubbleSize = CGSize(width: frame.width + 12 * 2, height: frame.height + 8 * 2)
                chatLogMessageCell.bubbleSize = bubbleSize
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let messageText = messages?[indexPath.item].text {
            let frame = calculateTextFrame(text: messageText, maxWidth: 250, fontSize: 18)
            return CGSize(width: view.frame.width, height: frame.height + 8 * 2)
        }
        return CGSize(width: view.frame.width, height: 100)
    }
}
