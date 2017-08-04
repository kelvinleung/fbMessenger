Notes on building a Facebook Messenger like app

** Manually Create View Controller

```swift
// set window
window = UIWindow(frame: UIScreen.main.bounds)
window?.makeKeyAndVisible()

let layout = UICollectionViewFlowLayout()
let friendsController = FriendsController(collectionViewLayout: layout)

// set root VC
window?.rootViewController = UINavigationController(rootViewController: friendsController)
```
