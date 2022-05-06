//
//  ViewController.swift
//  Audio
//
//  Created by seungyeop on 2022/05/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnPlayAudio(_ sender: UIButton) {
    }
    @IBAction func btnPauseAudio(_ sender: UIButton) {
    }
    @IBAction func btnStopAudio(_ sender: UIButton) {
    }
    @IBAction func slChangeVolume(_ sender: UISlider) {
    }
}

