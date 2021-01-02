//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 今岡大智 on 2021/01/02.
//  Copyright © 2021 taichi.imaoka. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //拡大画像表示領域をViewControllerと接続
    @IBOutlet weak var largeImage: UIImageView!
    
    var x:UIImage! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //クリックされた画像を表示
        largeImage.image = x
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
