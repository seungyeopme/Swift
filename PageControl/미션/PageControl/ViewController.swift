//
//  ViewController.swift
//  PageControl
//
//  Created by Ho-Jeong Song on 2020/11/05.
//

import UIKit

let NUM_PAGE = 10

class ViewController: UIViewController {
    @IBOutlet var lblPageNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        pageControl.numberOfPages = NUM_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        lblPageNumber.text = String(pageControl.currentPage+1)
    }


    @IBAction func pageChange(_ sender: UIPageControl) {
        lblPageNumber.text = String(pageControl.currentPage+1)
    }
}

