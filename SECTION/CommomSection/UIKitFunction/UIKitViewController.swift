//
//  UIKitViewController.swift
//  WTFunctionDemo
//
//  Created by winter on 15/11/20.
//  Copyright © 2015年 winter. All rights reserved.
//

import Foundation

class UIKitViewController: WT_BaseViewController, UITableViewDelegate, UITableViewDataSource{
    //tableView
    let tableView = UITableView()
    //数据源(存放分类名称)
    var datas = NSArray()
    //cell的重用符
    let UIKitViewcellID = "UIKitViewcellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit控件"
        
        defaultDataSetting()
        setupTableView()

    }
    
    //MARK: - 各控件初始化设置
    
    func defaultDataSetting() {
        datas = ["UILabel",
            "UIButton",
            "UIImage",]
        
        
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
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: UIKitViewcellID)
        cell.textLabel!.text = datas[indexPath.row] as? String
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            //UILabel
            self.navigationController?.pushViewController(UILabUseVC(), animated: true)
        case 1:
            //UIButton
            self.navigationController?.pushViewController(UIButtonUseVC(), animated: true)
        case 2:
            //UIImageView
            self.navigationController?.pushViewController(UIImageViewUseVC(), animated: true)
            break
        case 3:
            break

        default: break
        }
        
    }
    
    
    
}



