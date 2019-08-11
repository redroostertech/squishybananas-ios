//
//  vcBookmark.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class vcBookmark: UIViewController {

  @IBOutlet weak var mainCollection: UICollectionView!

  override func viewDidLoad() {
    super.viewDidLoad()
    mainCollection.setCollectionViewLayout(LayoutManager.vertical.three_col_margin_no_header_footer, animated: true)
    mainCollection.register(BookshelfItem.nib, forCellWithReuseIdentifier: BookshelfItem.identifier)
    mainCollection.reloadData()
  }
}

extension vcBookmark: UICollectionViewDataSource, UICollectionViewDelegate {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 18
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookshelfItem.identifier, for: indexPath) as? BookshelfItem else { return UICollectionViewCell(frame: .zero) }
    cell.configureCell(book: "OK")
    return cell
  }
}
