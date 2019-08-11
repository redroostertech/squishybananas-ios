//
//  BookshelfSectionFooter.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/10/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

protocol BookshelfSectionDelegate: class {
  func bookshelf(_ view: UIView, viewMoreAtCategory category: String)
}

class BookshelfSectionFooter: UICollectionReusableView {

  @IBOutlet weak var viewMoreButton: UIButton!

  weak var delegate: BookshelfSectionDelegate?

  func configure(_ delegate: BookshelfSectionDelegate, titleForButton title: String) {
    self.delegate = delegate
    viewMoreButton.setTitle(title, for: .normal)
  }

  @IBAction func viewMore(_ sender: UIButton) {
    self.delegate?.bookshelf(self, viewMoreAtCategory: "")
  }

}
