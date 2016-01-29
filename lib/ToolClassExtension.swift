//
//  ToolClassExtension.swift
//  Buyer
//
//  Created by winter on 15/12/20.
//  Copyright © 2015年 www.eelly.buyer. All rights reserved.
//
//为一些类进行扩展




//MARK: - 颜色Extension

extension UIColor {
    
    //输入RGB，和alpha,返回UIColor
    public class func RGBA(r r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat) -> UIColor {
        return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    }
    
    //输入十六进制(#123456)、以#开头，返回UIColor
    public class func RGBWithHex(hexStr:String) -> UIColor {

        var cString:String = hexStr.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substringFromIndex(1)
        }
        
        let rString = (cString as NSString).substringToIndex(2)
        let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
        let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    
    
//MARK: - 规范颜色
    
    /**
     *  字体1、用于重要级文字
     */
    public class func colorText1() -> UIColor {
        return UIColor.RGBWithHex("#444D5C")
    }
    
    /**
     *  字体2、用于普通级段落信息
     */
    public class func colorText2() -> UIColor {
        return UIColor.RGBWithHex("#626A77")
    }
    
    /**
     *  字体3、用于辅助次要信息
     */
    public class func colorText3() -> UIColor {
        return UIColor.RGBWithHex("#AAB2BD")
    }
    
    
    /**
     *  主色Red_main
     */
    public class func colorRed_main() -> UIColor {
        return UIColor.RGBWithHex("#FF3E3E")
    }
    
    /**
     *  装饰Line_1
     */
    public class func colorLine_1() -> UIColor {
        return UIColor.RGBWithHex("#E0E0E0")
    }
    
    /**
     *  装饰Bg_main
     */
    public class func colorBg_main() -> UIColor {
        return UIColor.RGBWithHex("#F1F1F1")
    }
    
}













