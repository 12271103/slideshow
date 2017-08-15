//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 柳澤宏輔 on 2017/08/14.
//  Copyright © 2017年 kousuke.yanagisawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var slideshowButtonLabel: UIButton!
  
  //デバッグ用のラベル
  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var pictureNumberLabel: UILabel!
  
  //画像データを全て数字にしたので、これを仲介して表示させてみよう。
  var pictureNumber = 1
  
  //タイマーに使うカウント
  var count = 1
  
  //とりあえず宣言した
  var image = UIImage(named: "1.jpg")
  
  //タイマー？
  //timerというのはクラスらしい。これをアンラップしてるっていうのはどういうことだろう…？
  var timer : Timer!

  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    //フォルダ内の画像を取得…配列を使えば楽にできるかもしれない。
    
    //とりあえずで書いたコードなので後で修正してくれ
    var image = UIImage(named: "1.jpg")
    imageView.image = image
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let secoundViewController:SecoundViewController = segue.destination as! SecoundViewController
    //SecoundView...と大文字で始めてしまうと、変数ではなくクラスの指定になってしまうのでエラーが出るよ
    secoundViewController.pictureNumber = self.pictureNumber
  }
  
  @IBAction func nextButton(_ sender: Any) {
    //タイマーが無効の時有効
    if timer == nil{
      pictureNumber += 1
      if pictureNumber == 10{
        pictureNumber = 1
      }
      
      //デバック用プリント
      print(pictureNumber)
      
      //次の画像を表示
      changePictureNumberLabel(picturenumber: pictureNumber)
    }
  }
  
  @IBAction func prevButton(_ sender: Any) {
    //タイマー無効の時有効
    if timer == nil{
      pictureNumber -= 1
      if pictureNumber == 0{
        pictureNumber = 9
      }
      
      //デバック用プリント
      print(pictureNumber)
      
      //前の画像を表示
      changePictureNumberLabel(picturenumber: pictureNumber)
    }
  }
  
  @IBAction func slideshowButton(_ sender: Any) {
    //ボタンのテキストを変更
    //これだと、画面遷移の後に表示が変になりそうだ
//    if slideshowButtonLabel.currentTitle == "再生"{
//      self.slideshowButtonLabel.setTitle("停止", for:UIControlState.normal)
//    }else{
//      self.slideshowButtonLabel.setTitle("再生", for:UIControlState.normal)
//    }
    self.slideshowButtonLabel.setTitle("停止", for:UIControlState.normal)

    
    //カウントアップ開始、ループ タイマーが動いていない時にだけ動くようにする
    //タイマー始動！しか動かないんですけど…timer がnilになっていない？？いや、nilになりっぱなしなんだ、きっと…
    //解決した！self.timer = の形にしてなかったのだ
    if self.timer == nil{
      self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      print("タイマー始動！")
      print("\(self.timer)")
    }else{
//      self.timer.invalidate()
//      self.timer = nil
//      print("停止したよ")
//      print("\(self.timer)")
      stopTimer()

    }
    //カウントに応じた画像を表示
    
    //停止処理…この辺りはテキストの変更と連動させれないかね？？
    
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
      
      //デバッグ用・画像変更
      changePictureNumberLabel(picturenumber: pictureNumber)
    }
    
    //デバッグ用
    timerLabel.text = "\(count)"

  }
  
  //ピクチャーナンバーをラベルに反映　デバッグ用
  //ついでに画像も変更させてみた。後で完全にそれ用のメソッドとして書き換えよう
  func changePictureNumberLabel(picturenumber a:Int){
    pictureNumberLabel.text = "\(a)"
    self.image = UIImage(named:"\(a).jpg")
    imageView.image = self.image
    
  }
  
  
  //セグエ時の処理：遷移先のviewcontrollerに現在表示中の画像の情報を渡して表示できるようにする
  @IBAction func onTapImage(_ sender: Any) {
    
    //セグエ
    //タイプミスなんとかしろ〜〜〜sefueってなんぞ
    stopTimer()
    performSegue(withIdentifier: "segue", sender: nil)
    print("遷移しまーす")
  }
  
  //遷移先から戻って来るためのプログラム。なんでこっちに書くんだろう
  @IBAction func unwind(_ segue: UIStoryboardSegue){
    
  }
  
  //タイマー停止メソッドを作ろう
  //これで画面遷移しても再生と停止の表示がおかしくなることはないぞ！
  func stopTimer(){
    if self.timer != nil{
      self.timer.invalidate()
      self.timer = nil
      print("停止したよ")
      print("\(self.timer)")
      self.slideshowButtonLabel.setTitle("再生", for:UIControlState.normal)
    }
  }
  
  
  
  }

