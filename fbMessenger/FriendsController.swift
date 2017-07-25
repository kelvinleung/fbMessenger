//
//  FriendsController.swift
//  fbMessenger
//
//  Created by Kelvin Leung on 18/07/2017.
//  Copyright © 2017 Kelvin Leung. All rights reserved.
//

import UIKit
import CoreData

class FriendsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    
    var container = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    
    var messages: [Message]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()
        
        navigationItem.title = "Recent"

        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = messages?.count {
            return count
        }
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        if let friendCell = cell as? FriendCell,
            let message = messages?[indexPath.item] {
            friendCell.message = message
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    private func setupData() {
        if let context = container?.viewContext {
            let mark = Friend(context: context)
            mark.name = "Mark Zuckerberg"
            mark.profileImageName = "profile"
            
            let message = Message(context: context)
            message.friend = mark
            message.text = "Hello, my name is Mark. Nice to meet you..."
            message.date = NSDate()
            
            try? context.save()
        }
        loadData()
    }
    
    private func loadData() {
        if let context = container?.viewContext {
            let request:NSFetchRequest<Message> = Message.fetchRequest()
            self.messages = try? context.fetch(request)
        }
    }
}
