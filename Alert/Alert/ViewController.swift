//
//  ViewController.swift
//  Alert
//
//  Created by seungyeop on 2022/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    let imgOn = UIImage(named: "lamp-on.png")
    
    let imgOff = UIImage(named: "lamp-off.png")
    
    let imgRemove = UIImage(named: "lamp-remove.png")
    
    var isLampOn = true

    @IBOutlet var lampImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lampImg.image = imgOn
    }

    @IBAction func btnLampOn(_ sender: UIButton) {
        if(isLampOn==true) {
            // 전구가 켜져 있을 때
            // 전구가 켜져 있다고 Alert을 실행함
            let lampOnAlert = UIAlertController(title: "경고", message: "현재 On 상태입니다", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        } else {
            // 전구가 켜져 있지 않을 때
            // 전구를 켬
            lampImg.image = imgOn
            isLampOn=true
        }
    }
    @IBAction func btnLampOff(_ sender: UIButton) {
    }
    @IBAction func btnLampRemove(_ sender: UIButton) {
    }
    
}

