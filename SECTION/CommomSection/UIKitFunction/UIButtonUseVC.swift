//
//  UIButtonUseVC.swift
//  WTFunctionDemo
//
//  Created by winter on 15/12/27.
//  Copyright © 2015年 winter. All rights reserved.
//



class UIButtonUseVC: WT_BaseViewController {
    
    //用于展示点击按钮后的改变
    var contentLab: UILabel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIButton使用"
        view.backgroundColor = UIColor.whiteColor()
        //点击按钮后显示的内容
        contentLab = UILabel(frame: CGRectMake(screenWidth - 150, gap64+gap64, 120, 20))
        contentLab?.textColor = UIColor.blackColor()
        contentLab?.font = UIFont.systemFontOfSize(27)
        contentLab?.text = "0"
        view.addSubview(contentLab!)
        
        //添加经过设置的按钮
        view.addSubview(configBtnNormal())
        
        configBtnStyle1()
        configBtnStyle2()
    }
    
    //返回一个普通设置的按钮
    func configBtnNormal() -> UIButton {
        //初始化同时设置frame
        let btn = UIButton(frame: CGRectMake(gap16, gap64+gap12, 120, 64))
        //背景色
        btn.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //各状态下标题
        btn.setTitle("普通状态", forState: .Normal)
        btn.setTitle("选中状态", forState: .Selected)
        //各状态下标题颜色
        btn.setTitleColor(UIColor.blackColor(), forState:  .Normal)
        btn.setTitleColor(UIColor.redColor(), forState: .Selected)
        //字体
        btn.titleLabel?.font = UIFont.systemFontOfSize(16)
        //各状态下图片
        btn.setImage(UIImage(named: "btn_general_multiselect_off"), forState: .Normal)
        btn.setImage(UIImage(named: "btn_general_multiselect_on"), forState: .Selected)
        //内部控件的水平和垂直对齐方式（就是标题和图片),默认都是center，因此设置水平方向的即可
        btn.contentHorizontalAlignment = .Left
        //取消高亮时的变灰
        btn.adjustsImageWhenHighlighted = false
        //点击事件,有:表示传btn过去
        btn.addTarget(self, action: Selector("methodName:"), forControlEvents: .TouchUpInside)
        //tag默认是0
        btn.tag = 10
        
        return btn
    }
    
    //点击按钮后调用的方法
    func methodName(btn :UIButton) {
        //改变其select状态
        if btn.selected == true {
            btn.selected = false
        } else {
            btn.selected = true
        }
        //将lab上次的内容转成Int类型和按钮的tag值相加
        //string转成Int要确保其是数值，因此在lab初始化时设置其为"0"
        //再将相加的值转成字符串
        contentLab?.text = String( Int((contentLab?.text)!)! + btn.tag)
    }
    
    

    //样式1
    func configBtnStyle1() {
        //先设置放置按钮的BGview
        //CGRectGetMaxY 是取某控件的最下面的y坐标
        let btnBGView = UIView(frame: CGRectMake(0, CGRectGetMaxY((contentLab?.frame)!)+gap36, screenWidth, gap44))
        btnBGView.backgroundColor = UIColor.clearColor()
        //添加到主view上
        view.addSubview(btnBGView)
        //有五个图标，所以一个按钮宽度是屏幕5分之一
        let btnWidth = screenWidth/5
        //循环设置
        for i in 0...4 {
            //初始化同时设置frame,将i转为CGFloat类型
            let btn = UIButton(frame: CGRectMake(CGFloat(i)*btnWidth, 0, btnWidth, gap44))
            //判断i值来设置按钮名称和图片
            switch i {
            case 0:
                btn.setTitle("编辑", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_edit"), forState: .Normal)
            case 1:
                btn.setTitle("增加", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_restock"), forState: .Normal)
            case 2:
                btn.setTitle("分享", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_share"), forState: .Normal)
            case 3:
                btn.setTitle("多图", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_multishare"), forState: .Normal)
            case 4:
                btn.setTitle("删除", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_delete"), forState: .Normal)
            default: break
                
            }
            //各状态下标题颜色
            btn.setTitleColor(UIColor.blackColor(), forState:  .Normal)
            //字体
            btn.titleLabel?.font = UIFont.systemFontOfSize(16)
            
            //内部控件的水平和垂直对齐方式（就是标题和图片)
            btn.contentHorizontalAlignment = .Center
            btn.contentVerticalAlignment = .Center
            //取消高亮时的变灰
            btn.adjustsImageWhenHighlighted = false
            //添加到背景上
            btnBGView.addSubview(btn)
            
        }
        //在顶部加分隔线
        let topSeparatorLine = UIView(frame: CGRectMake(0, 0, screenWidth, 1))
        topSeparatorLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //在底部加分隔线
        let bottomSeparatorLine = UIView(frame: CGRectMake(0, CGRectGetHeight(btnBGView.frame)-1, screenWidth, 1))
        bottomSeparatorLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //添加到BGview上
        btnBGView.addSubview(topSeparatorLine)
        btnBGView.addSubview(bottomSeparatorLine)
        
    }
    
    
    //样式2
    func configBtnStyle2() {
        //先设置放置按钮的BGview
        //CGRectGetMaxY 是取某控件的最下面的y坐标
        let btnBGView = UIView(frame: CGRectMake(0, CGRectGetMaxY((contentLab?.frame)!)+gap36+gap64, screenWidth, gap44))
        btnBGView.backgroundColor = UIColor.clearColor()
        //添加到主view上
        view.addSubview(btnBGView)
        //有五个图标，所以一个按钮宽度是屏幕5分之一
        let btnWidth = screenWidth/5
        //循环设置
        for i in 0...4 {
            //初始化同时设置frame,将i转为CGFloat类型
            let btn = UIButton(frame: CGRectMake(CGFloat(i)*btnWidth, 0, btnWidth, gap44))
            //判断i值来设置按钮名称和图片
            switch i {
            case 0:
                btn.setTitle("编辑", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_edit"), forState: .Normal)
            case 1:
                btn.setTitle("增加", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_restock"), forState: .Normal)
            case 2:
                btn.setTitle("分享", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_share"), forState: .Normal)
            case 3:
                btn.setTitle("多图", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_multishare"), forState: .Normal)
            case 4:
                btn.setTitle("删除", forState: .Normal)
                btn.setImage(UIImage(named: "icon_manage_delete"), forState: .Normal)
            default: break
                
            }
            //字体
            btn.titleLabel?.font = UIFont.systemFontOfSize(11)
            //设置内部的偏移
            btn.contentHorizontalAlignment = .Left
            //图片、标题宽度
            let btnContentWidth: CGFloat = 22
            btn.imageEdgeInsets = UIEdgeInsetsMake(-18 , (btnWidth-btnContentWidth)/2, 0, 0)
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, (btnWidth-btnContentWidth)/2-btnContentWidth, -18, 0)
            //各状态下标题颜色
            btn.setTitleColor(UIColor.blackColor(), forState:  .Normal)
            //取消高亮时的变灰
            btn.adjustsImageWhenHighlighted = false
            //添加到背景上
            btnBGView.addSubview(btn)
            
        }
        //在顶部加分隔线
        let topSeparatorLine = UIView(frame: CGRectMake(0, 0, screenWidth, 1))
        topSeparatorLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //在底部加分隔线
        let bottomSeparatorLine = UIView(frame: CGRectMake(0, CGRectGetHeight(btnBGView.frame)-1, screenWidth, 1))
        bottomSeparatorLine.backgroundColor = UIColor.groupTableViewBackgroundColor()
        //添加到BGview上
        btnBGView.addSubview(topSeparatorLine)
        btnBGView.addSubview(bottomSeparatorLine)
        
        
    }
    
    
    
    
    
    
    
    
}


