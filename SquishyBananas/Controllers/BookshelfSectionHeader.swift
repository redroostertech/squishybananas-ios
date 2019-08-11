//
//  BookshelfSectionHeader.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/10/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class BookshelfSectionHeader: UICollectionReusableView {

  @IBOutlet weak var sectionHeaderLabel: UILabel!

  func configure(sectionTitle: String) {
    sectionHeaderLabel.text = sectionTitle
  }
}
