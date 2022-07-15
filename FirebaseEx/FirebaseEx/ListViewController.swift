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
        
        db.collection("idols").whereField("name", isEqualTo: "Matsumoto Jun").getDocuments() {
            //後行クローザー
            (QuerySnapshot, err) in
            if let error = err {
                print("読み取りエラー発生", error.localizedDescription)
                self.textView.text.append("\n読み取りエラー発生")
            } else {
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    
                    let dataDic = document.data() as NSDictionary
                    let name = dataDic["name"] as? String ?? "이름없음"
                    let imageString = dataDic["imageString"] as? String ?? "イメージなし"
                    
                }
            }
            
        }
    }
    
    
}
