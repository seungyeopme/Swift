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
        addListData()
    }
    
    @IBAction func onBtnRead(_ sender: UIButton) {
        readListData()
    }
    
    func addListData() {
        var idol = IdolData()
        idol.name = "Aiba Masaki"
        idol.imageString = "image3.png"
        //DBにアクセスしながらDictionaryに変換
        let idolDic = idol.getDic()
        //DB 連動
        let db = Firestore.firestore()
        
        var ref: DocumentReference? = nil
        ref = db.collection("idols").addDocument(data: idolDic) {
            //後行クローザー
            err in
            if let error = err {
                print("書き込みエラー発生:", error)
                self.textView.text.append("\n書き込みエラー発生")
            }else {
                print("ドキュメント書き出し成功")
                print("ドキュメント ID: ", ref!.documentID)
                self.textView.text.append("\nドキュメント書き出し成功")
            }
        }
    }
    
    func readListData() {
        let db = Firestore.firestore()
        
        db.collection("idols").whereField("name", isEqualTo: "Aiba Masaki").getDocuments() {
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
                    
                    //構造体でデータを入れる
                    var idol = IdolData()
                    idol.name = name
                    idol.imageString = imageString
                    self.idolArray.append( idol )
                }
                
                for idol in self.idolArray {
                    self.textView.text.append("\n\(idol.name)")
                    self.textView.text.append("\n\(idol.imageString)")
                    
                    
                }
            }
            
        }
    }
    
    
}
