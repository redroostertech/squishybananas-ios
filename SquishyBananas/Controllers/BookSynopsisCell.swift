//
//  BookSynopsisCell.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/12/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class BookSynopsisCell: UITableViewCell {

  @IBOutlet weak var synopsisLabel: UILabel!

  override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
    return contentView.systemLayoutSizeFitting(CGSize(width: self.bounds.size.width, height: 1))
  }
  
  func configureCell(synopsis: String) {
    synopsisLabel.text = synopsis
  }
}
