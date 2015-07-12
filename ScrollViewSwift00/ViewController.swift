//
//  ViewController.swift
//  ScrollViewSwift
//
//  Created by MAEDAHAJIME on 2015/07/12.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var img: [UIImage] = []
    var imageView01: [UIImageView?] = []
    
    @IBOutlet weak var scrView: UIScrollView!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
        
        // 画像配列を設定
        img = [UIImage(named:"img1.png")!,
               UIImage(named:"img2.png")!,
               UIImage(named:"img3.png")!]
        
        // UIImageViewにUIIimageを追加
        imageView01 = [UIImageView(image:img[0]),
                       UIImageView(image:img[1]),
                       UIImageView(image:img[2])]
        
        // 全体のサイズ ScrollViewフレームサイズ取得
        let SVSize = scrView.frame.size
        // 画像サイズ x 3　高さ CGSizeMake(240, 240*3) //高さ * 3
        scrView.contentSize = CGSizeMake(SVSize.width, SVSize.height * CGFloat(img.count))

        // UIImageViewのサイズと位置を決めます
        // 上下に並べる　縦方向 Y
        for i in 0...2 {
            
            var x:CGFloat = 0
            var y:CGFloat = 0
            var width:CGFloat = 240
            var height:CGFloat = 240
            
            if i == 0 {
                //y = 0
            } else if i == 1 {
                y = 240
            } else if i == 2 {
                y = 480
            }
            
            // Scrollviewに追加
            imageView01[i]!.frame = CGRectMake(x, y, width, height)
            
            // Scrollviewに追加
            scrView.addSubview(imageView01[i]!)
        }
        
        // １ページ単位でスクロールさせる
        scrView.pagingEnabled = true
        
        //scroll画面の初期位置
        scrView.contentOffset = CGPointMake(0, 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

