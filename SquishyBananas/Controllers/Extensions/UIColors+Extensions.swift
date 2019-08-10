import Foundation
import UIKit

extension UIColor {
    
    @nonobjc class var softBlack: UIColor {
        return UIColor(red: 39/255,
                       green: 39/255,
                       blue: 39/255,
                       alpha: 1.0)
    }
    
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        if hexString.hasPrefix("#") {
            let start = hexString.index(hexString.startIndex, offsetBy: 1)
            let hexColor = String(hexString[start...])
            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }

  struct AppColors {
    static var sky_blue = UIColor(red: 58/255, green: 204/255, blue: 225/255, alpha: 1.0)
    static var dark_blue = UIColor(red: 26/255, green: 58/255, blue: 96/255, alpha: 1.0)
    static var beige = UIColor(red: 255/255, green: 250/255, blue: 238/255, alpha: 1)
    static var black = UIColor(red: 48/255, green: 48/255, blue: 48/255, alpha: 1)
    static var purple = UIColor(red: 102/255, green: 94/255, blue: 255/255, alpha: 1)
    static var purple_2 = UIColor(red: 74/255, green: 45/255, blue: 50/255, alpha: 1)
    static var light_purple = UIColor(red: 88/255, green: 66/255, blue: 78/255, alpha: 1)
    static var dark_purple = UIColor(red: 39/255, green: 30/255, blue: 35/255, alpha: 1)
    static var dark_purple_2 = UIColor(red: 41/255, green: 30/255, blue: 36/255, alpha: 1)
    static var dark_purple_3 = UIColor(red: 51/255, green: 38/255, blue: 45/255, alpha: 1)
    static var grey = UIColor(red: 213/255, green: 213/255, blue: 213/255, alpha: 1)
    static var plum = UIColor(red: 134/255, green: 51/255, blue: 66/255, alpha: 1)
    static var link_blue = UIColor(red: 50/255, green: 132/255, blue: 255/255, alpha: 1)
    static var pending_yellow = UIColor(red: 255/255, green: 193/255, blue: 0/255, alpha: 1)
    //  Add more colors as needed...
  }

  func fromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
  }

  func fromHexString(hex: String)->UIColor{
    let scanner = Scanner(string: hex)
    scanner.scanLocation = 0

    var rgbValue: UInt64 = 0

    scanner.scanHexInt64(&rgbValue)

    let r = (rgbValue & 0xff0000) >> 16
    let g = (rgbValue & 0xff00) >> 8
    let b = rgbValue & 0xff

    let color = UIColor.init(
      red: CGFloat(r) / 0xff,
      green: CGFloat(g) / 0xff,
      blue: CGFloat(b) / 0xff, alpha: 1
    )
    return color
  }
}
