Manually Create View Controller

```swift
window = UIWindow(frame: UIScreen.main.bounds)
window?.makeKeyAndVisible()

let layout = UICollectionViewFlowLayout()
let friendsController = FriendsController(collectionViewLayout: layout)

window?.rootViewController = UINavigationController(rootViewController: friendsController)
```
