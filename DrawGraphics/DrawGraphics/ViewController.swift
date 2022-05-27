//
//  ViewController.swift
//  DrawGraphics
//
//  Created by seungyeop on 2022/05/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnDrawLine(_ sender: UIButton) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        let context = UIGraphicsGetCurrentContext()!
        
        // Draw Line
        context.setLineWidth(2.0)
        context.setStrokeColor(UIColor.red.cgColor)
        
        context.move(to: CGPoint(x: 70, y: 50))
        context.addLine(to: CGPoint(x: 270, y: 250))
        
        context.strokePath()
        
        // Draw Triangle
        context.setLineWidth(4.0)
        context.setStrokeColor(UIColor.blue.cgColor)
        
        context.move(to: CGPoint(x: 170, y: 200))
        context.addLine(to: CGPoint(x: 270, y: 350))
        context.addLine(to: CGPoint(x: 70, y: 350))
        context.addLine(to: CGPoint(x: 170, y: 200))
        context.strokePath()
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    @IBAction func btnDrawRectangle(_ sender: UIButton) {
    }
    @IBAction func btnDrawCircle(_ sender: UIButton) {
    }
    @IBAction func btnDrawArc(_ sender: UIButton) {
    }
    @IBAction func btnDrawFill(_ sender: UIButton) {
    }
    

}

