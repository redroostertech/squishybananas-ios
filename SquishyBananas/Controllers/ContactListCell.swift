//
//  ContactListCell.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/14/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

protocol ContactListDelegate: class {
  func select(_ cell: UICollectionViewCell, user: Any?, buy: Bool)
  func select(_ cell: UICollectionViewCell, user: Any?, read: Bool)
}

class ContactListCell: UICollectionViewCell {

  @IBOutlet weak var contentContainerView: UIView!
  @IBOutlet weak var userImageView: UIImageView!
  @IBOutlet weak var userNameLabel: UILabel!
  @IBOutlet weak var userRelationshipLabel: UILabel!
  @IBOutlet weak var memberSinceLabel: UILabel!
  @IBOutlet weak var selectButton: UIButton!

  var type: ContactListType?
  var user: Any?
  weak var delegate: ContactListDelegate?

  override func awakeFromNib() {
    super.awakeFromNib()
    userImageView.applyCornerRadius()
    contentContainerView.applyCornerRadius(0.10)
  }

  func configureCell(delegate: ContactListDelegate?, user: Any?, userImage: String, name: String, relationship: String, memberSince: String, row: Int, type: ContactListType?) {
    userNameLabel.text = name
    userRelationshipLabel.text = relationship
    memberSinceLabel.text = memberSince

    if row % 2 > 0 {
      self.contentContainerView.backgroundColor = .squishyBlue
      self.userNameLabel.textColor = .white
      self.userRelationshipLabel.textColor = .white
      self.memberSinceLabel.textColor = .white
      self.loadTertiary()
    } else if row % 3 > 0 {
      self.contentContainerView.backgroundColor = .squishyYellow
      self.userNameLabel.textColor = .softBlack
      self.userRelationshipLabel.textColor = .softBlack
      self.memberSinceLabel.textColor = .softBlack
      self.loadSecondary()
    } else {
      self.contentContainerView.backgroundColor = .squishyGreen
      self.userNameLabel.textColor = .white
      self.userRelationshipLabel.textColor = .white
      self.memberSinceLabel.textColor = .white
      self.loadSecondary()
    }

    self.type = type
  }

  func loadSecondary() {
    selectButton.setBackgroundImage(UIImage(named: "button_bg_secondary")!, for: .normal)
    selectButton.setWhiteText()
  }

  func loadTertiary() {
    selectButton.setBackgroundImage(UIImage(named: "button_bg_tertiary")!, for: .normal)
    selectButton.setBlackText()
  }

  @IBAction func selectUser(_ sender: UIButton) {
    guard let user = self.user, let type = self.type else { return }
    switch type {
    case .buy:
      self.delegate?.select(self, user: user, buy: true)
    case .read:
      self.delegate?.select(self, user: user, read: true)

    }

  }
}
