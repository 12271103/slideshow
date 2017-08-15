//
//  SecoundViewController.swift
//  SlideshowApp
//
//  Created by 柳澤宏輔 on 2017/08/14.
//  Copyright © 2017年 kousuke.yanagisawa. All rights reserved.
//

import UIKit

class SecoundViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  
  var image = UIImage(named: "1.jpg")
  var pictureNumber = 2

  override func viewDidLoad() {
    super.viewDidLoad()
    image = UIImage(named:"\(pictureNumber).jpg")
    imageView.image = image
    print(pictureNumber)
    
    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    
    
  }
  
  //セグエ後：向こうから表示する画像の情報をもらって反映させる
  
  //セグエ処理：戻るボタンで前ページに遷移
    //現在表示中の画像の情報を向こうに渡して表示できるようにする
  
}
