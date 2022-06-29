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
    //緯度、経度値から行政住所（東京都新宿区西新宿）に置き換えるクラス
    var geocoder = GMSGeocoder()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMapView()
        initLocationManager()
    }
    
    func initMapView() {
        mapView = GMSMapView()
        //カメラ設定:全マップの一部画面を意味
        //東京都庁　：　35.68977719010659, 139.69200566679217
        let camera = GMSCameraPosition.camera(withLatitude: 35.68977, longitude: 139.69200, zoom: 15)
        mapView.camera = camera
        // 現在の位置を示す青い丸いアイコン
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        mapView.delegate = self
        // 最上位ビューをGoogleMap Viewに交換
        self.view = mapView
    }
    
    func initLocationManager() {
        //GPS座標取得の活性化
        //GPS座標誤差範囲:10メートル~100メートル
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        //位置情報使用時ポップアップアラーム使用
        locationManager.requestWhenInUseAuthorization()
        //位置情報を持ってくるスタート！ 遅延ディレー 5秒
        locationManager.startUpdatingLocation()
    }
    
    //位置がアップデートされるたびに呼び出される関数
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let coordi = manager.location?.coordinate {
            print("緯度:", String(coordi.latitude))
            print("経度", String(coordi.longitude))
            
            //位置が変わったため、GoogleMapの中心位置を移す。
            let camera = GMSCameraPosition.camera(withLatitude: coordi.latitude, longitude: coordi.longitude, zoom: 15)
            mapView?.camera = camera
            //Googleマップをスムーズに移動させる
            mapView?.animate(to: camera)
        }
    }
    
    //Googleマップにマーカー(ピン)を表示する。
    var marker = GMSMarker()
    
    //Googleマップを移動すると、既存のマーカーを一度消してくれる。
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        //マーカー消し
        mapView.clear()
    }
    
    //Googleマップに移動してから停止した後に呼び出される関数
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        //ジオコーダを利用して、緯度、経度値を行政アドレスに変換できる。
        geocoder.reverseGeocodeCoordinate(position.target){
            //後行クローザーでコードブロックを入れる。
            (response, error) in
            guard error == nil else {
                return;
            }
            //正常呼出
            if let result = response?.firstResult() {
                let marker = GMSMarker()
                marker.position = position.target
                marker.title = "東京グルメ"
                marker.snippet = result.lines?[0] //行政住所を付加情報として追加する。
                marker.map = mapView
            }
        }
    }
}
