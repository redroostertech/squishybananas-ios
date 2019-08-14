//
//  vcContactList.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

enum ContactListType {
  case read
  case buy
}

class vcContactList: UIViewController {

  @IBOutlet weak var mainCollection: UICollectionView!
  @IBOutlet weak var backButton: UIButton!
  @IBOutlet weak var titleLabel: UILabel!

  var viewType: ContactListType? {
    didSet {
      guard let type = self.viewType else { return }
      switch type {
      case .buy:
        self.viewTitle = "Select Guardian to Buy Book"
      case .read:
        self.viewTitle = "Select Guardian to Read Book"
      }
    }
  }

  private var viewTitle: String?

  override func viewDidLoad() {
    super.viewDidLoad()

    if let title = self.viewTitle {
      titleLabel.text = title
    }
    mainCollection.setCollectionViewLayout(LayoutManager.vertical.one_col_margin, animated: true)
    mainCollection.register(ContactListCell.nib, forCellWithReuseIdentifier: ContactListCell.identifier)
    mainCollection.reloadData()
  }

  @IBAction func goBack(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

}

extension vcContactList: UICollectionViewDataSource, UICollectionViewDelegate {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 12
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContactListCell.identifier, for: indexPath) as? ContactListCell else { return UICollectionViewCell(frame: .zero) }
    cell.configureCell(delegate: self, user: nil, userImage: "", name: "Christian Hall", relationship: "Father", memberSince: "Member since 2019", row: indexPath.row, type: viewType)
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = sb.instantiateViewController(withIdentifier: "vcViewBook") as? vcViewBook else { return }
    // TODO: - Send in category or some type of identifier for books
    self.present(vc, animated: true, completion: nil)
  }
}

extension vcContactList: ContactListDelegate {
  func select(_ cell: UICollectionViewCell, user: Any?, buy: Bool) {
    print("Buy")
  }

  func select(_ cell: UICollectionViewCell, user: Any?, read: Bool) {
    print("Read")
  }
}
