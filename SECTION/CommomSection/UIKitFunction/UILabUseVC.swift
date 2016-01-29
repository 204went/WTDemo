//
//  UILabUseVC.swift
//  WTFunctionDemo
//
//  Created by winter on 16/1/9.
//  Copyright © 2016年 winter. All rights reserved.
//



class UILabUseVC: WT_BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UILabel使用"
        
        view.addSubview(configLabNormal())
        view.addSubview(configLabLines())
        
    }
    
    //返回一个普通样式UILabel
    func configLabNormal() -> UILabel {
        //初始化同时设置frame
        let lab = UILabel(frame: CGRectMake(gap16, gap64+gap44, 150, 20))
        //文字
        lab.text = "heheheh呵呵呵呵呵呵呵呵呵呵呵呵"
        //设置文字颜色
        lab.textColor = UIColor.blackColor()
        //字体
        lab.font = UIFont.systemFontOfSize(19)
        //设置文字对齐方法
        lab.textAlignment = .Left
        //设置label的行数,0是自动换行(前提是高度足够
        lab.numberOfLines = 0
        //超过长度的显示方法,常用这种:abcd...
        lab.lineBreakMode = .ByTruncatingTail
        //设置阴影
        //        lab.shadowColor = UIColor.redColor()
        //        lab.shadowOffset = CGSizeMake(1.0,1.0)
        return lab
    }

    
    //返回一个多行样式UILabel
    func configLabLines() -> UILabel {
        //初始化同时设置frame
        let lab = UILabel(frame: CGRectMake(gap16, gap64+gap44+gap64, 150, 50))
        //文字
        lab.text = "heheheh呵呵呵呵呵呵呵呵呵呵呵呵"
        //设置文字颜色
        lab.textColor = UIColor.blackColor()
        //字体
        lab.font = UIFont.systemFontOfSize(19)
        //设置文字对齐方法
        lab.textAlignment = .Left
        //设置label的行数,0是自动换行(前提是高度足够
        lab.numberOfLines = 0
        //超过长度的显示方法,常用这种:abcd...
        lab.lineBreakMode = .ByTruncatingTail
        return lab
    }
    
    
    
    
       
        

    
}
