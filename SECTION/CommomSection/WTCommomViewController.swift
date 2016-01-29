//
//  WTCommomViewController.swift
//  WTFunctionDemo
//
//  Created by winter on 15/11/18.
//  Copyright © 2015年 winter. All rights reserved.
//

import Foundation
import UIKit

class WTCommomViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    //tableView
    let tableView = UITableView()
    //数据源(存放分类名称)
    var datas = NSArray()
    //cell的重用符
    let rootViewcellID = "rootViewcellID"
    
    override func viewDidLoad() {
        
        title = "功能分类"
        
        view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        defaultDataSetting()
        setupTableView()
        
    }
    
    //MARK: - 各控件初始化设置
    
    func defaultDataSetting() {
        datas = ["UIKit控件常用设置",
                 "一些动画效果",
                 "字符串的操作",
                 "网络请求",
                 "block使用",
                 "扫一扫功能",
                 "通讯录"]
        
        
    }
    
    
    func setupTableView() {
        tableView.frame = CGRectMake(0, 0, screenWidth, screenHeight)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
    }
    
    
    //MARK: - UITableViewDelegate&DataSource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  datas.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: rootViewcellID)
        cell.textLabel!.text = datas[indexPath.row] as? String
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            //UIKit控件常用设置
            self.navigationController?.pushViewController(UIKitViewController(), animated: true)
        case 1:
            //一些动画效果
            self.navigationController?.pushViewController(AnimationViewController(), animated: true)
        case 2:
            //字符串的操作
            break
        case 3:
            //网络请求
            self.navigationController?.pushViewController(NetWorkRequestViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(BlockUseVC(), animated: true)
    
            break
        case 5:
               self.navigationController?.pushViewController(WTScanerViewController(), animated: true)
            
            break
        case 6:
            
            self.navigationController?.pushViewController(WTAddressBookVC(), animated: true)
            break
        default: break
        }
        
    }
    
    
    
}


