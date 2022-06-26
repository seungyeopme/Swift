//
//  GoogleMapViewController.swift
//  GoogleMap
//
//  Created by seungyeop on 2022/06/25.
//

import UIKit
import GoogleMaps //グーグルマップ
import CoreLocation // AppleSDK - GPSから座標をもたらすライブラリー

//開発者コンソール
//https://console.cloud.google.com
//APIキー: AIzaSyDeiVOkpFsQPK6dkPpYI6J_2zrgqgeMvTA

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

class GoogleMapViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    
    //Google Map View
    var mapView: GMSMapView!
    //GPS座標オブジェクト
    var locationManager = CLLocationManager()
    //緯度、経度値から行政住所（東京都江戸川区東葛西）に置き換えるクラス
    var geocoder = GMSGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
        initLocationManager()
    }
    
    func initMapView() {
        mapView = GMSMapView()
        // カメラ設定:全マップの一部画面を意味
        // 東葛西　：　35.66277751529612, 139.88032630984225
        let camera = GMSCameraPosition.camera(withLatitude: 35.66277, longitude: 139.88032, zoom: 15)
        mapView.camera = camera
        // 現在の位置を示す青い丸いアイコン
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        // 最上位ビューをGoogleMap Viewに交換
        self.view = mapView
    }
    
    func initLocationManager() {
        
    }
    

   

}
