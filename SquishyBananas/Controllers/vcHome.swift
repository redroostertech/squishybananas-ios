//
//  ViewController.swift
//  SquishyBananas
//
//  Created by Michael Westbrooks on 8/8/19.
//  Copyright © 2019 Nuracode. All rights reserved.
//

import UIKit

typealias Slides = [UIView]

class vcHome: UIViewController {

  // MARK: - IBOutlets
  @IBOutlet weak var pageControl: UIPageControl!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var getStartedButton: UIButton!

  // MARK: - Properties
  private var slides: Slides!

  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()

    slides = createSlides()
    scrollView.delegate = self

    setupSlideScrollView(slides: slides)

    pageControl.numberOfPages = slides.count
    pageControl.currentPage = 0

    view.sendSubviewToBack(scrollView)
    view.bringSubviewToFront(pageControl)

  }

  // MARK: - Private member methods
  private func createSlides() -> Slides {
    let slide0 = Walkthrough_1()
    slide0.view.frame = scrollView.bounds
    let slide1 = Walkthrough_2()
    slide1.view.frame = scrollView.bounds
    let slide2 = Walkthrough_3()
    slide2.view.frame = scrollView.bounds
    let slide3 = Walkthrough_4()
    slide3.view.frame = scrollView.bounds
    return [slide0.view, slide1.view, slide2.view, slide3.view]
  }

  private func setupSlideScrollView(slides: Slides) {
    scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(slides.count),
                                    height: scrollView.frame.height)
    scrollView.isPagingEnabled = true

    for i in 0 ..< slides.count {
      slides[i].frame = CGRect(x: scrollView.frame.width * CGFloat(i),
                               y: 0,
                               width: scrollView.frame.width,
                               height: scrollView.frame.height)
      scrollView.addSubview(slides[i])
    }
  }
}

// MARK: - UIScrollViewDelegate
extension vcHome: UIScrollViewDelegate {
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    setupSlideScrollView(slides: slides)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
    pageControl.currentPage = Int(pageIndex)
  }
}

