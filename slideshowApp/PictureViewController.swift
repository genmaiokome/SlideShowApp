//
//  PictureViewController.swift
//  slideshowApp
//
//  Created by 渡辺涼介 on 2020/10/05.
//  Copyright © 2020 ryosuke.watanabe. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet weak var ImageView: UIImageView!
    
    var ImageNo = 0
    let Picture = ["ベース", "キーボード", "ドラム", "ギター"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ImageView.image = UIImage(named: Picture[ImageNo])
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
