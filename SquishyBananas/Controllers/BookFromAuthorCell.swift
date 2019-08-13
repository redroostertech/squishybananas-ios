//
//  BookFromAuthorCell.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/13/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

protocol BookFromAuthorCellDelegate: class {
  func bookFromAuthor(_ cell: UITableViewCell, viewMore: Bool)
  func bookFromAuhtor(_ cell: UITableViewCell, viewBook: Int)
}
class BookFromAuthorCell: UITableViewCell {

  @IBOutlet weak var sectionHeaderLabel: UILabel!
  @IBOutlet weak var booksCollectionView: UICollectionView!
  @IBOutlet weak var viewMoreButton: UIButton!

  weak var delegate: BookFromAuthorCellDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    booksCollectionView.setCollectionViewLayout(LayoutManager.vertical.three_col_margin_no_header_footer, animated: true)
    booksCollectionView.delegate = self
    booksCollectionView.dataSource = self
    booksCollectionView.register(BookshelfItem.nib, forCellWithReuseIdentifier: BookshelfItem.identifier)
    booksCollectionView.reloadData()
  }

  func configureCell(withHeader header: String, authorId: Int, andDelegate delegate: BookFromAuthorCellDelegate?) {
    sectionHeaderLabel.text = header
    self.delegate = delegate
  }

  @IBAction func viewMore(_ sender: UIButton) {
    self.delegate?.bookFromAuthor(self, viewMore: true)
  }
}

extension BookFromAuthorCell: UICollectionViewDataSource, UICollectionViewDelegate {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookshelfItem.identifier, for: indexPath) as? BookshelfItem else { return UICollectionViewCell(frame: .zero) }
    cell.configureCell(book: "OK")
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.delegate?.bookFromAuhtor(self, viewBook: 0)
  }
}
