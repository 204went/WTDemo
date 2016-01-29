//
//  BlockUseVC.m
//  WTFunctionDemo
//
//  Created by winter on 16/1/12.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "BlockUseVC.h"
#import "WTDemo-Swift.h"


typedef void (^voidBlock)();

@interface BlockUseVC ()

@property(strong, nonatomic) UILabel *titlelab;
@property (copy, nonatomic) voidBlock voidBlock;


@end

@implementation BlockUseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"block使用";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(32, 64+32, 120, 44)];
    [btn setTitle:@"点这里" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:21];
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: btn];
    
    _titlelab = [[UILabel alloc]initWithFrame:CGRectMake(32, 64+32+64, 120, 44)];
    _titlelab.textColor = [UIColor blackColor];
    [self.view addSubview:_titlelab];
    
}


/*
 *  返回类型 (^名称)(参数类型) =
 *
 *  ^(参数类型 参数名) {
 *      //方法体
 *  }
 */
- (void)clickBtn:(UIButton *)btn {
    
    //返回类型 (^名称)(参数类型) = ^(参数类型 参数名称){  方法体 }
    NSString* (^myBlock)(int) = ^(int num) {
        
        return [NSString stringWithFormat:@"%d", num];
    };
    
    _titlelab.text = myBlock(5);
    
    //block作别名
    [self useBlockTypeddfAsParameter:^{
        
        
    }];
    
    //没有设置别名
    [self useBlockAsParameter:^{
        
        
    }];
    
}




//block别名作类型
- (void)useBlockTypeddfAsParameter:(voidBlock) block {
    
    
    
}



- (void)useBlockAsParameter:(void(^)()) block {
    
    
    
    
    
    
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
