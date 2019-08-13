//
//  vcViewBook.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/9/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

class vcViewBook: UIViewController {

  @IBOutlet weak var mainCollection: UITableView!
  @IBOutlet weak var backButton: UIButton!

  var book: Any?

  override func viewDidLoad() {
    super.viewDidLoad()
    mainCollection.register(BookInfoDetailCell.nib, forCellReuseIdentifier: BookInfoDetailCell.identifier)
    mainCollection.register(BookSynopsisCell.nib, forCellReuseIdentifier: BookSynopsisCell.identifier)
    mainCollection.register(BookFromAuthorCell.nib, forCellReuseIdentifier: BookFromAuthorCell.identifier)
    mainCollection.estimatedRowHeight = UITableView.automaticDimension
    mainCollection.reloadData()
  }

  @IBAction func goBack(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }

}

extension vcViewBook: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: BookInfoDetailCell.identifier) as? BookInfoDetailCell else { return UITableViewCell(frame: .zero) }
      cell.configure(bookImage: "", bookTitle: "Harry Potter and Soceror's Stone", authorImage: "", authorName: "JK Rowling", bookPrice: 12.99, pagesCount: 134, book: nil, delegate: nil)
      return cell
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: BookSynopsisCell.identifier) as? BookSynopsisCell else { return UITableViewCell(frame: .zero) }
      cell.configureCell(synopsis: "Sample synopsis for book about a young wizard whose parents are dead.")
      return cell
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: BookFromAuthorCell.identifier) as? BookFromAuthorCell else { return UITableViewCell(frame: .zero) }
      cell.configureCell(withHeader: "More from Author", authorId: 1, andDelegate: self)
      return cell
    default:
      return UITableViewCell(frame: .zero)
    }
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
  }
}

extension vcViewBook: BookFromAuthorCellDelegate {

  func bookFromAuthor(_ cell: UITableViewCell, viewMore: Bool) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = sb.instantiateViewController(withIdentifier: "vcViewMoreBook") as? vcViewMoreBook else { return }
    // TODO: - Send in category or some type of identifier for books
    self.present(vc, animated: true, completion: nil)
  }

  func bookFromAuhtor(_ cell: UITableViewCell, viewBook: Int) {
    let sb = UIStoryboard(name: "Main", bundle: nil)
    guard let vc = sb.instantiateViewController(withIdentifier: "vcViewBook") as? vcViewBook else { return }
    // TODO: - Send in category or some type of identifier for books
    self.present(vc, animated: true, completion: nil)
  }
}
