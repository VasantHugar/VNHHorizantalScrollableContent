//
//  ViewController.swift
//  Test
//
//  Created by Apple on 18/03/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var leadingSpaceOfIndicator: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Scrollable Content"
    }

    @IBAction func firstButtonAction(_ sender: Any) {
        var rect = scrollView.frame
        rect.origin.x = 0
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    
    @IBAction func secondButtonAction(_ sender: Any) {
        var rect = scrollView.frame
        rect.origin.x = rect.size.width
        scrollView.scrollRectToVisible(rect, animated: true)
    }
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var contentOffset: CGPoint = scrollView.contentOffset
        
        let contentOffsetX: CGFloat = contentOffset.x
        let widthOfView: CGFloat = self.view.frame.size.width
        
        // Change Position of Indicator
        leadingSpaceOfIndicator.constant = contentOffsetX / 2
        
        // Handle button selection
        if contentOffsetX < widthOfView / 2 {
            firstButton.isSelected = true
            secondButton.isSelected = false
        }
        else {
            firstButton.isSelected = false
            secondButton.isSelected = true
        }
        
        // Restrict Scrolling
        let minOffsetX: CGFloat = 0
        let maxOffsetX: CGFloat = widthOfView
        
        // Min
        if contentOffset.x < minOffsetX {
            contentOffset.x = minOffsetX
        }
        
        // Max
        if contentOffset.x > maxOffsetX {
            contentOffset.x = maxOffsetX
        }
        
        // Set offset
        scrollView.contentOffset = contentOffset
        
    }
}

