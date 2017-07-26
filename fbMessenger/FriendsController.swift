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
        
        clearData()
        setupData()
        
        navigationItem.title = "Recent"

        collectionView?.backgroundColor = UIColor.white
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(FriendCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return messages?.count ?? 0
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
            mark.name = "Mark Lee"
            mark.profileImageName = "boy"
            
            let tracy = Friend(context: context)
            tracy.name = "Tracy Ho"
            tracy.profileImageName = "girl"
            
            createMessageWithText(text: "Hello, my name is Mark", friend: mark, minutesAgo: 1, context: context)
            createMessageWithText(text: "Would you like some coffee?", friend: mark, minutesAgo: 3, context: context)
            createMessageWithText(text: "Hello, how are you today?", friend: tracy, minutesAgo: 7, context: context)
            createMessageWithText(text: "I'm going to the zoo with my friends.", friend: tracy, minutesAgo: 9, context: context)
            createMessageWithText(text: "Where are you going?", friend: tracy, minutesAgo: 13, context: context)
            
            try? context.save()
        }
        loadData()
    }
    
    private func fetchFriends() -> [Friend]? {
        if let context = container?.viewContext {
            let request: NSFetchRequest<Friend> = Friend.fetchRequest()
            return try? context.fetch(request)
        }
        return nil
    }
    
    private func loadData() {
        if let context = container?.viewContext {
            if let friends = fetchFriends() {
                messages = [Message]()
                for friend in friends {
                    let request: NSFetchRequest<Message> = Message.fetchRequest()
                    request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
                    request.predicate = NSPredicate(format: "friend.name = %@", friend.name!)
                    request.fetchLimit = 1
                    if let fetchedMessages = try? context.fetch(request) {
                        messages?.append(contentsOf: fetchedMessages)
                    }
                }
                messages = messages?.sorted(by: { $0.date!.compare($1.date! as Date) == .orderedDescending })
            }
        }
    }
    
    private func clearData() {
        if let context = container?.viewContext {
            let messageRequest: NSFetchRequest<Message> = Message.fetchRequest()
            let friendRequest: NSFetchRequest<Friend> = Friend.fetchRequest()
            
            if let messages = try? context.fetch(messageRequest) {
                for message in messages {
                    context.delete(message)
                }
            }

            if let friends = try? context.fetch(friendRequest) {
                for friend in friends {
                    context.delete(friend)
                }
            }
            try? context.save()
        }
    }
    
    private func createMessageWithText(text: String, friend: Friend, minutesAgo: Double, context: NSManagedObjectContext) {
        let message = Message(context: context)
        message.friend = friend
        message.text = text
        message.date = NSDate().addingTimeInterval(-minutesAgo * 60)
    }
}
