//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 今岡大智 on 2021/01/02.
//  Copyright © 2021 taichi.imaoka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //進む・戻るボタンをViewControllerに接続
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    
    //再生・停止ボタンをViewControllerに接続
    @IBOutlet weak var startstop: UIButton!
    
    //タイマー
    var timer: Timer!
    
    //タイマー用の時間の変数
    var timer_sec: Float = 1
    
    //ボタンテキスト用の変数を設定
    var buttonText: String = "再生"
    
    //タイマーで2秒ごとに呼び出す関数
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        if self.timer_sec == 1 {
            self.image1.image = img1
        } else if self.timer_sec == 2 {
            self.image1.image = img2
        } else if self.timer_sec == 3 {
            self.image1.image = img3
            self.timer_sec = 0
        }
    }
    
    //再生・停止ボタンをクリックした時の処理
    @IBAction func clickbutton(_ sender: Any) {
        if buttonText == "再生" {
            // 再生ボタンを押すとタイマー作成、始動
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            //進む・戻るボタンを無効
            nextbutton.isEnabled = false
            backbutton.isEnabled = false
            startstop.setTitle("停止", for: .normal)
            buttonText = "停止"
        } else if buttonText == "停止" {
            // タイマーを停止
            self.timer.invalidate()
            //進む・戻るボタンを有効
            nextbutton.isEnabled = true
            backbutton.isEnabled = true
            startstop.setTitle("再生", for: .normal)
            buttonText = "再生"
        }
    }
    
    //スライドショー再生中に、拡大画像を押したら、再生中止
    @IBAction func expansion(_ sender: Any) {
        if buttonText == "停止" {
            // タイマーを停止
            self.timer.invalidate()
            //進む・戻るボタンを有効
            nextbutton.isEnabled = true
            backbutton.isEnabled = true
            startstop.setTitle("再生", for: .normal)
            buttonText = "再生"
        }
    }
    
    //画像表示領域をViewControllerに接続
    @IBOutlet weak var image1: UIImageView!
    
    //ViewController内で、sample1の画像ファイルをimg1という名前で扱えるように設定
    var img1 = UIImage(named:"sample1")
    
    var img2 = UIImage(named:"sample2")
    
    var img3 = UIImage(named:"sample3")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //sample1の画像を表示
        image1.image = img1
    }
    
    //進むボタンを押した時の処理
    @IBAction func next(_ sender: Any) {
        if image1.image == img1 {
            image1.image = img2
        } else if image1.image == img2 {
            image1.image = img3
        } else if image1.image == img3 {
            image1.image = img1
        } else {
            print("画像の読み込みに失敗しました")
        }
    }
    
    //戻るボタンを押した時の処理
    @IBAction func back(_ sender: Any) {
        if image1.image == img1 {
            image1.image = img3
        } else if image1.image == img3 {
            image1.image = img2
        } else if image1.image == img2 {
            image1.image = img1
        } else {
            print("画像の読み込みに失敗しました")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        // 遷移先のResultViewControllerで宣言しているx, yに値を代入して渡す
        if image1.image == img1 {
            resultViewController.x = img1
        } else if image1.image == img2 {
            resultViewController.x = img2
        } else if image1.image == img3 {
            resultViewController.x = img3
        } else {
            print("画像の読み込みに失敗しました")
        }
        
    }
    
    //遷移先の戻るボタンを押した時、最初の画面に戻る
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        //戻ったとき実行する処理
    }

}

