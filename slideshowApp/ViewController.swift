//
//  ViewController.swift
//  slideshowApp
//
//  Created by 渡辺涼介 on 2020/10/05.
//  Copyright © 2020 ryosuke.watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var PictureButton: UIButton!
    @IBOutlet weak var BackButton: UIButton!
    @IBOutlet weak var AdvanceButton: UIButton!
    @IBOutlet weak var PlayStopButton: UIButton!
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.PictureButton.setImage(UIImage(named: Picture[PictureNo]), for: .normal)
        label.text = "🔴・・・"
        
    }
    
    let Picture = ["ベース", "キーボード", "ドラム", "ギター"]
    var flg: Bool = true {
        didSet(newValue){
            switch flg {
            case false:
                PlayStopButton.setTitle("停止", for: .normal)
                BackButton.isEnabled = false
                AdvanceButton.isEnabled = false
            case true:
                PlayStopButton.setTitle("再生", for: .normal)
                BackButton.isEnabled = true
                AdvanceButton.isEnabled = true
            }
            
        }
    }
    
    @objc func updateTimer(_ timer: Timer) {
        PictureNo += 1
    }
    
    var PictureNo: Int = 0 {
        didSet(newValue){
            if PictureNo == 4 {
                PictureNo = 0
            }
            if PictureNo == -1 {
                PictureNo = 3
            }
            switch PictureNo {
            case 0:
                label.text = "🔴・・・"
            case 1:
                label.text = "・🔴・・"
            case 2:
                label.text = "・・🔴・"
            case 3:
                label.text = "・・・🔴"
            default:
                label.text = ""
            }
            self.PictureButton.setImage(UIImage(named: Picture[PictureNo]), for: .normal)
        }
    }
    
    @IBAction func BackButton(_ sender: Any) {
        PictureNo -= 1
    }
    
    @IBAction func AdvanceButton(_ sender: Any) {
        PictureNo += 1
    }
    
    @IBAction func PlayStopButton(_ sender: Any) {
        if flg == true {
            flg = false
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            flg = true
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        flg = true
        if self.timer != nil {
            self.timer.invalidate()
        }
        
        let pictureViewController: PictureViewController = segue.destination as! PictureViewController
        pictureViewController.ImageNo = PictureNo
    }

}

