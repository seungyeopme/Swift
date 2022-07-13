//
//  ListViewController.swift
//  FirebaseEx
//
//  Created by seungyeop on 2022/07/12.
//

import UIKit
import Firebase
import FirebaseFirestore

class ListViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    struct IdolData {
        var name: String = ""
        var imageString: String = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func onBtnAdd(_ sender: UIButton) {
    }
    
    @IBAction func onBtnRead(_ sender: UIButton) {
    }
    
    
}
