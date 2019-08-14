//
//  vcProfile.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class vcProfile: UIViewController, CAPSPageMenuDelegate {

  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var relationshipStatusLabel: UILabel!
  @IBOutlet weak var memberSinceLabel: UILabel!

  var controllerArray : [UIViewController] = []
  var pageMenu : CAPSPageMenu?
  var recentBooks: vcRecentBooks?
  var callActivity: vcCallActivity?

  override func viewDidLoad() {
    super.viewDidLoad()
    loadCustomBackButton(withImage: "back")
    hideNavigationBarHairline()
    userImageView.makeCircular()

    if let cachedImage = imageCache.object(forKey: "https://i.pravatar.cc/150?img=3" as AnyObject) as? UIImage {
      userImageView.image = cachedImage
    }
    let url = URL(string: "https://i.pravatar.cc/150?img=3")
    URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
      if let err = error {

      } else {

        DispatchQueue.main.async(execute: {
          if let downloadedImage = UIImage(data: data!) {
            imageCache.setObject(downloadedImage, forKey: "https://i.pravatar.cc/150?img=3" as AnyObject)
            self.userImageView.image = downloadedImage
          }
        })
      }

    }).resume()

    usernameLabel.text = "Chris Witherspoon"
    relationshipStatusLabel.text = "Father"
    memberSinceLabel.text = "Member since 2019"
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    controllerArray.removeAll()
    recentBooks = nil
    callActivity = nil
    
    let recentBooks = vcRecentBooks(nibName: "vcRecentBooks", bundle: nil)
    recentBooks.title = "Recent Books"
    controllerArray.append(recentBooks)
    self.recentBooks = recentBooks

    let callActivity = vcCallActivity(nibName: "vcCallActivity", bundle: nil)
    callActivity.title = "Call Activity"
    controllerArray.append(callActivity)
    self.callActivity = callActivity

    let parameters: [CAPSPageMenuOption] = [
      .menuItemSeparatorWidth(0),
      .useMenuLikeSegmentedControl(true),
      .menuItemSeparatorPercentageHeight(0),
      .scrollMenuBackgroundColor(.white),
      .viewBackgroundColor(.white),
      .selectionIndicatorColor(UIColor.squishyYellow),
      .selectionIndicatorHeight(3.0),
      .selectedMenuItemLabelColor(UIColor.softBlack),
      .unselectedMenuItemLabelColor(UIColor.softBlack),
      .menuHeight(72.0),
      .menuItemWidth(90.0),
      .centerMenuItems(false)
    ]

    pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 325, width: self.view.frame.width, height: self.view.frame.height - 325), pageMenuOptions: parameters)
    pageMenu!.delegate = self
    self.view.addSubview(pageMenu!.view)
  }

}
