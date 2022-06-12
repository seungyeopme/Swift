//
//  ViewController.swift
//  PinchGesture
//
//  Created by seungyeop on 2022/06/11.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var txtPinch: UILabel!
    @IBOutlet var imgPinch: UIImageView!
    
    var initialFontSize:CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }
    
//    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
//        if (pinch.state == UIGestureRecognizer.State.began) {
//            initialFontSize = txtPinch.font.pointSize
//        } else {
//            txtPinch.font = txtPinch.font.withSize(initialFontSize * pinch.scale)
//        }
//    }
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale)
        pinch.scale = 1
    }
}
