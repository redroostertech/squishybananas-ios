import Foundation
import UIKit

class LayoutManager {
    struct vertical {
      static var one_col_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: kWidthOfScreen - (kPlugInColCellInsets + (kPlugInColCellInsets / 2)), height: kPlugInColCellHeight)
        layout.minimumLineSpacing = kPrimarySpacing
        layout.minimumInteritemSpacing = kPrimarySpacing
        layout.sectionInset = UIEdgeInsets(top: kPlugInColCellInsets, left: kPlugInColCellInsets, bottom: kPlugInColCellInsets, right: kPlugInColCellInsets)
        return layout
      }

      static var one_col_no_margin: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: kWidthOfScreen, height: kDashboardSectionSize)
        return flowLayout
      }

      static var one_col_sm_margin: UICollectionViewFlowLayout {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.itemSize = CGSize(width: 100.0, height: 100.0)
        return flowLayout
      }

      static var two_col_margin: UICollectionViewFlowLayout {
          let layout = UICollectionViewFlowLayout()
          layout.scrollDirection = .vertical
          layout.itemSize = CGSize(width: (kWidthOfScreen / 2) - (kPlugInColCellInsets + (kPlugInColCellInsets / 2)), height: kPlugInColCellHeight)
          layout.minimumLineSpacing = kPrimarySpacing
          layout.minimumInteritemSpacing = kPrimarySpacing
          layout.sectionInset = UIEdgeInsets(top: kPlugInColCellInsets, left: kPlugInColCellInsets, bottom: kPlugInColCellInsets, right: kPlugInColCellInsets)
          return layout
      }

      static var two_col_no_margin: UICollectionViewFlowLayout {
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.scrollDirection = .vertical
          flowLayout.minimumLineSpacing = 0
          flowLayout.minimumInteritemSpacing = 0
          flowLayout.itemSize = CGSize(width: kWidthOfScreen / 2, height: kDashboardSectionSize)
          return flowLayout
      }

      static var three_col_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (kWidthOfScreen / 3) - (kPlugInColCellInsets + (kPlugInColCellInsets / 3)), height: kPlugInColCellHeight)
        layout.minimumLineSpacing = kPrimarySpacing
        layout.minimumInteritemSpacing = kPrimarySpacing
        layout.sectionInset = UIEdgeInsets(top: kPlugInColCellInsets, left: kPlugInColCellInsets, bottom: kPlugInColCellInsets, right: kPlugInColCellInsets)
        layout.headerReferenceSize = CGSize(width: kWidthOfScreen, height: 50.0)
        layout.footerReferenceSize = CGSize(width: kWidthOfScreen, height: 50.0)
        return layout
      }

      static var three_col_margin_no_footer: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (kWidthOfScreen / 3) - (kPlugInColCellInsets + (kPlugInColCellInsets / 3)), height: kPlugInColCellHeight)
        layout.minimumLineSpacing = kPrimarySpacing
        layout.minimumInteritemSpacing = kPrimarySpacing
        layout.sectionInset = UIEdgeInsets(top: kPlugInColCellInsets, left: kPlugInColCellInsets, bottom: kPlugInColCellInsets, right: kPlugInColCellInsets)
        layout.headerReferenceSize = CGSize(width: kWidthOfScreen, height: 50.0)
        return layout
      }

      static var three_col_margin_no_header_footer: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (kWidthOfScreen / 3) - (kPlugInColCellInsets + (kPlugInColCellInsets / 3)), height: kPlugInColCellHeight)
        layout.minimumLineSpacing = kPrimarySpacing
        layout.minimumInteritemSpacing = kPrimarySpacing
        layout.sectionInset = UIEdgeInsets(top: kPlugInColCellInsets, left: kPlugInColCellInsets, bottom: kPlugInColCellInsets, right: kPlugInColCellInsets)
        return layout
      }
    }
    struct horizontal {
      static var sm_col_no_margin: UICollectionViewFlowLayout {
          let flowLayout = UICollectionViewFlowLayout()
          flowLayout.scrollDirection = .horizontal
          flowLayout.itemSize = CGSize(width: 50.0, height: 50.0)
          return flowLayout
      }

      static var md_col_no_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100.0, height: 100.0)
        return layout
      }

      static var fullscreen_col_no_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: kWidthOfScreen, height: 350)
        return layout
      }

      static var sm_col_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 50.0, height: 50.0)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        return layout
      }

      static var md_col_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100.0, height: 100.0)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        return layout
      }

      static var fullscreen_col_margin: UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: kWidthOfScreen, height: 350)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        return layout
      }

      static func custom_col_margin(width: CGFloat = 100.0, height: CGFloat = 100.0) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: width, height: height)
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        return layout
      }
    }
}
