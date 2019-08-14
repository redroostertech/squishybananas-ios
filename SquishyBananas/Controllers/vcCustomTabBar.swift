//
//  vcCustomTabBar.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit
import SDWebImage

private let arrayOfImagesForTabBar = [ "bookshelf", "bookmark", "user"]

class vcCustomTabBar: UITabBarController, UITabBarControllerDelegate {

  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBarItems()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MARK: - Private member functions
  private func setupTabBarItems() {
    guard let arrayOfTabBarItems = self.tabBar.items else { return }
    let selectedColor = UIColor.squishyYellow
    let unselectedColor = UIColor.white
    var count = 0
    for tabBarItem in arrayOfTabBarItems {
      tabBarItem.tag = count
      tabBarItem.image = UIImage(named: arrayOfImagesForTabBar[count])
      tabBarItem.selectedImage = UIImage(named: arrayOfImagesForTabBar[count] + "-selected")
      tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor],
                                        for: .normal)
      tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor],
                                        for: .selected)
      count += 1
    }
  }
}
