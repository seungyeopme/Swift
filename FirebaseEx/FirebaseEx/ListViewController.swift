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
        //Firebase DBに入るデータ構造
        //クラス、構造体が入ることができない
        //1. Number
        //2. String
        //3. Array
        //4. Dictionary
        func getDic() -> [String:String] {
            let dict = ["name": self.name,
                        "imageString": self.imageString]
            return dict
        }
    }
    
    //구조체 배열
    var idolArray: Array<IdolData> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func onBtnAdd(_ sender: UIButton) {
    }
    
    @IBAction func onBtnRead(_ sender: UIButton) {
        readListData()
    }
    
    func readListData() {
        let db = Firestore.firestore()
        
        db.collection("idols").whereField("name", isEqualTo: "Matsumoto Jun")
    }
    
    
}
