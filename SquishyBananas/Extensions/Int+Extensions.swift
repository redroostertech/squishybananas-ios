import Foundation

extension Int {
    static func random(range: Range<Int>) -> Int {
        var offset = 0
        if range.startIndex < 0 {
            offset = abs(range.startIndex)
        }
        let mini = UInt32(range.startIndex + offset)
        let maxi = UInt32(range.endIndex   + offset)
        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}
