//
//  OCMacro.h
//  WTFunctionDemo
//
//  Created by winter on 16/1/21.
//  Copyright © 2016年 winter. All rights reserved.
//

#ifdef DEBUG
#   define deBugLog(...) NSLog(__VA_ARGS__)
#else
#   define deBugLog(...)
#endif


//屏幕宽、高
#define SCRWIDTH [UIScreen mainScreen].bounds.size.width
#define SCRHEIGHT [UIScreen mainScreen].bounds.size.height

//常用标尺
#define gap12 12
#define gap14 14
#define gap16 16
#define gap36 36
#define gap44 44
#define gap64 64