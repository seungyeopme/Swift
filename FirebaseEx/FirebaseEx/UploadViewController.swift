//
//  UploadViewController.swift
//  FirebaseEx
//
//  Created by seungyeop on 2022/07/21.
//

import UIKit
import Firebase
import FirebaseStorage

class UploadViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

    @IBAction func onBtnUpload(_ sender: UIButton) {
        uploadImage()
    }
    
    func uploadImage() {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let data = imageView.image!.pngData()
        
        //タイムスタンプ: 1970年1月1日0時0分0秒を基準にミリセカンド単位の時間を表す整数
        //ユニークなファイル名を決める時に使用
        let timeStamp = Int( NSDate.timeIntervalSinceReferenceDate*1000 )
        let imageFileName = "idol" + String( timeStamp ) + ".png"
        
        let serverImageRef = storageRef.child( imageFileName )
        
        //メタデータ追加
        let metadata = StorageMetadata()
        metadata.contentType = "image/png"
        
        let uploadTask = serverImageRef.putData(data!, metadata: metadata) {
            //後行クローザー
            (metadata, error) in
            guard metadata != nil else {
                print("アップロード失敗")
                self.textView.text.append("\nアップロード失敗")
                return
            }
            
            print("アップロード成功")
            self.textView.text.append("\nアップロード成功")
            
            //download URL
            serverImageRef.downloadURL() {
                //後行クローザー
                (url, error) in
                guard let downloadURL = url else {
                    return
                }
                self.textView.text.append("\n\(downloadURL.absoluteURL)")
                print("downloadURL:", downloadURL.absoluteURL)
                
                //DBに書き込む機能を追加すればよい
            }
        }
    }
}
