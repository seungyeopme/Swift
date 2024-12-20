//
//  ViewController.swift
//  MoviePlayer
//
//  Created by Ho-Jeong Song on 2020/11/15.
//

import UIKit
import AVKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnPlayInternalMovie(_ sender: UIButton) {
        // 내부 파일 mp4
        let filePath:String? = Bundle.main.path(forResource: "FastTyping", ofType: "mp4")
        let url = NSURL(fileURLWithPath: filePath!)

        playVideo(url: url)
    }
    
    @IBAction func btnPlayInternalMovie2(_ sender: UIButton) {
        // 내부 파일 mov
        let filePath:String? = Bundle.main.path(forResource: "Mountaineering", ofType: "mov")
        let url = NSURL(fileURLWithPath: filePath!)
        
        playVideo(url: url)
    }
    @IBAction func btnPlayEnternalMovie(_ sender: UIButton) {
        // 외부 파일 mp4
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/e38auz050w2mvud/Fireworks.mp4")!
        
        playVideo(url: url)
    }
    
    @IBAction func btnPlayExternalMovie2(_ sender: UIButton) {
        // 외부 파일 mov
        let url = NSURL(string: "https://dl.dropboxusercontent.com/s/ijybpprsmx0bgre/Seascape.mov")!
        
        playVideo(url: url)
    }
    private func playVideo(url: NSURL)  {
        let playerController = AVPlayerViewController()
        
        let player = AVPlayer(url: url as URL)
        playerController.player = player
        
        self.present(playerController, animated: true) {
            player.play()
        }
    }
}

