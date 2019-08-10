//
//  vcBookshelf.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class vcBookshelf: UIViewController {

  @IBOutlet weak var mainCollection: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    mainCollection.delegate = self
    mainCollection.dataSource = self
    mainCollection.register(BookshelfSectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "BookshelfSectionHeader")
    mainCollection.register(BookshelfSectionFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "BookshelfSectionFooter")
  }
}

extension vcBookshelf: UICollectionViewDataSource, UICollectionViewDelegate {

}
