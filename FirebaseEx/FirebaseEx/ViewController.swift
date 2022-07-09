//
//  ViewController.swift
//  FirebaseEx
//
//  Created by seungyeop on 2022/07/04.
//

import UIKit
import Firebase
import FirebaseAuth

//Cocoa Pod 이용하기
//CLI(Command Line Interface) : DOS창, 터미널 창

//Cocoa Pod 이용순서
//0. 기본 xcodeproj프로젝트 닫기
//1. 파인더에서 프로젝트폴더 오른쪽 클릭해서 현재 폴더에서 터미널 열기
//2. Cocoa Pod 유틸 설치
//   명령어: sudo gem install cocoapods 엔터
//   Cocoa Pod 업데이트
//   명령어: pod repo update 엔터
//3. 프로젝트 초기화
//   명령어: pod init
//4. 라이브러리 설치
//   명령어: pod install
//5. 프로젝트열기: xcodeproj -> xcworkspace 열기
//   워크스페이스 열기: 더블클릭 하거나 터미널 open 프로젝트이름.xcworkspace
//6. Xcode에서 pod 파일을 편집하기( 라이브러리 목록 기술 )
//7. 터미널에서 pod install 한번 더하기

//터미널 명령어 - 리눅스 명령어
//1. pwd : 현재 폴더(디렉토리) 위치 보기
//2. ls : 파일 목록 보기
//3. ls -all : 파일 목록 자세히 보기
//4. open : 파일 열기(실행)  

class ViewController: UIViewController {

    @IBOutlet weak var labelLogin: UILabel!
    @IBOutlet weak var textfieldID: UITextField!
    @IBOutlet weak var textfieldPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    func updateUI() {
        if let user = Auth.auth().currentUser {
            // Loginされた状態(Session対応-自動ログイン対応)
            labelLogin.text = "Login状態: \(user.email!)にLogin"
        } else {
            // Logoutされた状態
            labelLogin.text = "Login状態: ログアウト"
        }
    }
    @IBAction func onBtnLogin(_ sender: UIButton) {
        if let textID = textfieldID.text, let textPW = textfieldPW.text {
            
            if textID.count < 1 || textPW.count < 1 {
                print("IDやパスワードが短いです")
                return;
            }
            Auth.auth().signIn(withEmail: textID, password: textPW) {
                //後行クローザー
                [weak self] user, error in
                guard let _ = self else { return }
                print("ログインできました")
                
                let user = Auth.auth().currentUser
                print("\(String(describing: user?.email)), \(String(describing: user?.uid))")
                
                self?.updateUI()
                
            }
        } else {
            print("ログインアカウントまたはパスワードをご確認ください");
        }
    }
    
    @IBAction func onBtnLogout(_ sender: UIButton) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print("SignOutError: %@", signOutError)
        }
        
        updateUI()
    }
    @IBAction func onBtnJoin(_ sender: UIButton) {
        if let textID = textfieldID.text, let textPW = textfieldPW.text {
            if textID.count < 1 || textPW.count < 1 {
                print("IDやパスワードが短いです")
                return;
            }
        } else {
            print("IDやパスワードがありません")
        }
    }
    
}

