//
//  WTScanerViewController.m
//  WTFunctionDemo
//
//  Created by winter on 16/1/21.
//  Copyright © 2016年 winter. All rights reserved.
//

#import "WTScanerViewController.h"
#import "OCMacro.h"


@interface WTScanerViewController ()



/**
 *  输入流
 */
@property (strong, nonatomic) AVCaptureDeviceInput *deviceInput;
/**
 *  输出流
 */
@property (strong, nonatomic) AVCaptureMetadataOutput *dataOutput;
/**
 *  显示输出内容的layer层
 */
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *previewLayer;


@end

@implementation WTScanerViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"扫一扫";
    
    [self setupCapture];
    [self setupUI];
    
}


#pragma mark - 控件设置

/**
 *  设置捕获对象
 */
- (void)setupCapture {
    
    
    
    
}

/**
 *  设置显示UI
 */
- (void)setupUI {
    
    //显示框
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(gap36, SCRHEIGHT/2-150, SCRWIDTH-2*gap36, 180)];
    imageView.image = [UIImage imageNamed:@"capture"];
    [self.view addSubview:imageView];
    
}



/**
 *  是否授权
 */
- (BOOL)isAuthrized {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
        return NO;
    } else {
        return YES;
    }
}




#pragma mark - 外部使用的设置


@end
