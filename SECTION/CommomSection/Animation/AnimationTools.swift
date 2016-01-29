//
//  AnimationTools.swift
//  WTFunctionDemo
//
//  Created by winter on 15/11/20.
//  Copyright © 2015年 winter. All rights reserved.
//

class AnimationTools: WT_BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
        //初始化背景
        let jlsimage = UIImageView(frame: CGRectMake(gap16, navHeight+stateHeight+gap16, 104, 104))
        jlsimage.image = UIImage(named: "julisha")
        view.addSubview(jlsimage)
        //按钮
        let jlsBtn = UIButton(frame: CGRectMake(gap16, navHeight+stateHeight+gap16, 104, 104))
        view.addSubview(jlsBtn)
        jlsBtn.addTarget(self, action: Selector("clickJLSBtn"), forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    
    
    //点击开始动画
    func clickJLSBtn() {
        //初始化动画
        let imageLayer = CALayer()
        imageLayer.contents = UIImage(named: "julisha")?.CGImage
        imageLayer.bounds = CGRectMake(gap16, navHeight+stateHeight+gap16, 104, 104)
        imageLayer.masksToBounds = true
        imageLayer.cornerRadius = 18
        view.layer.addSublayer(imageLayer)
        //设定移动路径
        let pathAnimation = CAKeyframeAnimation(keyPath: "position")
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(gap16+52, navHeight+stateHeight+gap16+52))
        path.addQuadCurveToPoint(CGPointMake(screenWidth-gap64, screenHeight-gap32), controlPoint: CGPointMake(screenWidth-gap32, gap16))
        pathAnimation.path = path.CGPath
        pathAnimation.duration = 1.20
        //旋转
        pathAnimation.rotationMode = kCAAnimationRotateAuto
        //缩小
       let narrowAnimation = CABasicAnimation(keyPath: "transform.scale")
        narrowAnimation.duration = 1.20
        narrowAnimation.fromValue = NSNumber(float: 0.75)
        narrowAnimation.toValue = NSNumber(float: 0.30)
        //动画组
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [pathAnimation,narrowAnimation]
        groupAnimation.duration = 1.20
        groupAnimation.delegate = self
        //开始动画
        imageLayer.addAnimation(groupAnimation, forKey: nil)
        
    }
    
    //MARK: - 动画代理方法
    
    override func animationDidStart(anim: CAAnimation) {
        //动画开始时的处理，通常可以禁止按钮的点击，避免多次播放动画
        
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        //动画结束后的处理，恢复按钮的点击、调用发送请求的方法等
        
    }
    
    
}



