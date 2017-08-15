//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 柳澤宏輔 on 2017/08/14.
//  Copyright © 2017年 kousuke.yanagisawa. All rights reserved.
//

import UIKit
//import Photos

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var slideshowButtonLabel: UIButton!
  
  //デバッグ用のラベル
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var pictureNumberLabel: UILabel!
  
  //画像データを全て数字にしたので、これを仲介して表示させてみよう。
  var pictureNumber = 0
  
  //タイマーに使う
  var count = 0
  
  var image = UIImage(named: "1.jpg")

  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //フォルダ内の画像を取得…配列を使えば楽にできるかもしれない。
    //import photo を記入した。ダメだったら消して。
    //途中で止まってますよ
    //let photo = PHAsset.fetchAssets(withALAssetURLs: <#T##[URL]#>, options: nil)
    
    var image = UIImage(named: "1.jpg")
    imageView.image = image
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func nextButton(_ sender: Any) {
    //タイマー有効時に無効
    
    //次の画像を表示
    pictureNumber += 1
    if pictureNumber == 10{
      pictureNumber = 1
    }
    
    //デバック用プリント
    print(pictureNumber)
    
    changePictureNumberLabel(picturenumber: pictureNumber)

  }
  
  @IBAction func prevButton(_ sender: Any) {
    //タイマー有効時に無効
    //前の画像を表示
    pictureNumber -= 1
    if pictureNumber == 0{
      pictureNumber = 9
    }

    //デバック用プリント
    print(pictureNumber)
    
    //picturenumberこうしん
    changePictureNumberLabel(picturenumber: pictureNumber)
  }
  
  @IBAction func slideshowButton(_ sender: Any) {
    //ボタンのテキストを変更
    if slideshowButtonLabel.currentTitle == "再生"{
      self.slideshowButtonLabel.setTitle("停止", for:UIControlState.normal)
    }else{
      self.slideshowButtonLabel.setTitle("再生", for:UIControlState.normal)
    }
    //カウントアップ開始、ループ
    Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    
    
    
    //カウントに応じた画像を表示
  }
  
  //タイマー更新メソッド
  func updateTimer(timer :Timer){
    count += 1
    
    //2秒ごとにカウントをリセットして次の画像に
    if count == 2{
      count = 0
      pictureNumber += 1
      if pictureNumber == 10{
        pictureNumber = 1
      }
    }
  }
  
  //ピクチャーナンバーをラベルに反映　デバッグ用
  func changePictureNumberLabel(picturenumber a:Int){
    pictureNumberLabel.text = "\(a)"
    print("大丈夫やで")
    self.image = UIImage(named:"\(a).jpg")
    imageView.image = self.image
    
  }
  
  
  //セグエ時の処理：遷移先のviewcontrollerに現在表示中の画像の情報を渡して表示できるようにする
  
  
  }

