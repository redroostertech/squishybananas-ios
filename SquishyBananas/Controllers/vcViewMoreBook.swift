//
//  vcViewMoreBook.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class vcViewMoreBook: UIViewController {

  @IBOutlet weak var mainCollection: UICollectionView!
  @IBOutlet weak var backButton: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    mainCollection.setCollectionViewLayout(LayoutManager.vertical.three_col_margin, animated: true)
    mainCollection.register(BookshelfItem.nib, forCellWithReuseIdentifier: BookshelfItem.identifier)
    mainCollection.register(BookshelfSectionHeader.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BookshelfSectionHeader.identifier)

    mainCollection.reloadData()
  }

  @IBAction func goBack(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

}

extension vcViewMoreBook: UICollectionViewDataSource, UICollectionViewDelegate {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if (kind == UICollectionView.elementKindSectionHeader) {
      guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BookshelfSectionHeader.identifier, for: indexPath) as? BookshelfSectionHeader else { return UICollectionReusableView(frame: .zero) }
      headerView.configure(sectionTitle: "Sample Header")
      return headerView
    }
    return UICollectionReusableView(frame: .zero)
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookshelfItem.identifier, for: indexPath) as? BookshelfItem else { return UICollectionViewCell(frame: .zero) }
    cell.configureCell(book: "OK")
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = sb.instantiateViewController(withIdentifier: "vcViewBook") as? vcViewBook else { return }
    // TODO: - Send in category or some type of identifier for books
    self.present(vc, animated: true, completion: nil)
  }
}
