//
//  AnimationViewController.swift
//  WTFunctionDemo
//
//  Created by winter on 15/11/20.
//  Copyright © 2015年 winter. All rights reserved.
//


class AnimationViewController: WT_BaseViewController, UITableViewDelegate, UITableViewDataSource{
    //tableView
    let tableView = UITableView()
    //数据源(存放分类名称)
    var datas = NSArray()
    //cell的重用符
    let rootViewcellID = "rootViewcellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "功能分类"
        
        defaultDataSetting()
        setupTableView()
        
        
        
    }
    
    //MARK: - 各控件初始化设置
    
    func defaultDataSetting() {
        datas = ["抛物线",
            "......",
            "......",
            "其他功能"]
        
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
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            let vc = AnimationTools()
            self.navigationController?.pushViewController(vc, animated: true)
        default: break
        }
        
    }
    
    
    
}