import Foundation
import UIKit

extension UILabel {
    func resizeAccordingToString() -> Void {
        guard let text = self.text else {
            return
        }
        self.frame.size.height = text.height(withConstrainedWidth: kWidthOfScreen,
                                             font: .systemFont(ofSize: 14.0))
    }
    
    func makeOneLine() {
        self.numberOfLines = 1
        self.lineBreakMode = .byTruncatingTail
    }
    
    func makeMultipleLines(_ max: Int = 0) {
        self.numberOfLines = max
        self.lineBreakMode = .byWordWrapping
    }
    
    func makeTitleCase() {
        self.text = self.text?.capitalized
    }
    
    func set(text: String, lineSpacing: CGFloat) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        let attrString = NSMutableAttributedString(string: text)
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attrString.length))
        self.attributedText = attrString
    }
}

@IBDesignable
class CustomLabel: UILabel {
  @IBInspectable var topInset: CGFloat = 15.0
  @IBInspectable var bottomInset: CGFloat = 15.0
  @IBInspectable var leftInset: CGFloat = 15.0
  @IBInspectable var rightInset: CGFloat = 15.0

  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: UIEdgeInsetsInsetRect(rect, insets))
  }

  override var intrinsicContentSize: CGSize {
    var contentSize = super.intrinsicContentSize
    contentSize.height += topInset + bottomInset
    contentSize.width += leftInset + rightInset
    return contentSize
  }
}
