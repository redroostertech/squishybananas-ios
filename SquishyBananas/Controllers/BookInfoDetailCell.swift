//
//  BookInfoDetailCell.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/11/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

protocol BookDetailDelegate: class {

}

class BookInfoDetailCell: UITableViewCell {
  @IBOutlet weak var bookImageView: UIImageView!
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var authorImageView: UIImageView!
  @IBOutlet weak var authorNameLabel: UILabel!
  @IBOutlet weak var bookPriceLabel: UILabel!
  @IBOutlet weak var pagesCountLabel: UILabel!
  @IBOutlet weak var actionButton: UIButton!
  @IBOutlet weak var bookmarkActionButton: UIButton!

  var book: Any?
  weak var delegate: BookDetailDelegate?

  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
    return contentView.systemLayoutSizeFitting(CGSize(width: self.bounds.size.width, height: 1))
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    authorImageView.applyCornerRadius()
  }

  func configure(bookImage: String, bookTitle: String, authorImage: String, authorName: String, bookPrice: Double, pagesCount: Int, book: Any?, delegate: BookDetailDelegate?) {
//    bookImageView.imageFromUrl(theUrl: bookImage)
    bookTitleLabel.text = bookTitle
//    authorImageView.imageFromUrl(theUrl: authorImage)
    authorNameLabel.text = authorName
    bookPriceLabel.text = String(describing: bookPrice)
    pagesCountLabel.text = String(describing: pagesCount) + " pages"
    self.book = book
    self.delegate = delegate
  }

  @IBAction func action(_ sender: UIButton) {
  }

  @IBAction func bookmark(_ sender: UIButton) {
  }
}
