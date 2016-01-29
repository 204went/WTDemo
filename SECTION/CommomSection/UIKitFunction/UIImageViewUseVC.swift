//
//  UIImageViewUseVC.swift
//  WTFunctionDemo
//
//  Created by winter on 16/1/25.
//  Copyright © 2016年 winter. All rights reserved.
//


class UIImageViewUseVC: WT_BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIImage使用"
        
        view.addSubview(configUIImageView())
        view.addSubview(configImageViewBySD())
        
        
    }
    
    
    //返回一个UIimageView
    func configUIImageView() -> UIImageView {
        //初始化同时设置frame
        let imageView = UIImageView(frame: CGRectMake(gap32, gap64+44, 98, 98))
        //图像
        imageView.image = UIImage(named: "xxImage5")
        //图像填充方式(要确保masksToBounds是true)
        imageView.contentMode = .ScaleAspectFill
        //设置圆角(要用layer层、度数通常是其宽度一半)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = CGRectGetWidth(imageView.frame)/2
        
        //自动更换图片的内容
        let image1 = UIImage(named: "xxImage1")
        let image2 = UIImage(named: "xxImage2")
        let image3 = UIImage(named: "xxImage3")
        let imagesArray: [UIImage] = [image1!, image2!, image3!]
        imageView.animationImages = imagesArray
        // 设定所有的图片在多少秒内播放完毕
        imageView.animationDuration = Double(imagesArray.count)
        // 重复次数，0表示无数遍
        imageView.animationRepeatCount = 2;
        // 开始播放
        imageView.startAnimating()
        
        return imageView
    }

    
    //使用SDWebImage设置
    func configImageViewBySD() -> UIImageView {
        
        let sdImageView = UIImageView(frame: CGRectMake(gap32, gap64+44+2*gap64, 98, 98))
        let url = NSURL(string: "http://img.taopic.com/uploads/allimg/120403/57997-12040319145195.jpg")
        sdImageView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "xxImage4"))
        
        return sdImageView
    }
    
 
}
