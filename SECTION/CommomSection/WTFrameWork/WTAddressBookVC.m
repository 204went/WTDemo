//
//  WTAddressBookVC.m
//  WTFunctionDemo
//
//  Created by winter on 16/1/27.
//  Copyright © 2016年 winter. All rights reserved.
//
//#import <AddressBook/AddressBook.h>
//#import <AddressBookUI/AddressBookUI.h>

#import "WTAddressBookVC.h"
#import "OCMacro.h"

#import <Contacts/Contacts.h>
#import <ContactsUI/ContactsUI.h>


@interface WTAddressBookVC () < UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) UITableView *tableView;
/**
 *  通讯录对象数据源
 */
@property (strong, nonatomic) NSMutableArray <CNContact *> *contactArrMut ;

@end



@implementation WTAddressBookVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录的使用";
    _contactArrMut = [[NSMutableArray alloc]init];
    [self setupHeaderOperation];
    [self setupTableView];
    [self fetchContactData];
}

#pragma mark - 控件设置

- (void)setupHeaderOperation {
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, gap64, SCRWIDTH, gap64)];
    bgView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:bgView];
    
}

- (void)setupTableView {
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, gap64+gap64, SCRWIDTH, SCRHEIGHT-gap64-gap64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}


#pragma mark - 操作

/**
 *  读取通讯录数据库
 */
- (void)fetchContactData {
    //设置获取请求
    NSArray <id<CNKeyDescriptor>> *fetchKeys = @[[CNContactFormatter descriptorForRequiredKeysForStyle:CNContactFormatterStyleFullName],CNContactPhoneNumbersKey];
    CNContactFetchRequest *fetchRequest = [[CNContactFetchRequest alloc]initWithKeysToFetch:fetchKeys];
    
    //遍历手机的通讯录
    CNContactStore *contactStore = [[CNContactStore alloc]init];
    [contactStore enumerateContactsWithFetchRequest:fetchRequest error:nil usingBlock:^(CNContact * _Nonnull contact, BOOL * _Nonnull stop) {
        //将获得的通讯录加入到数据源中
        [_contactArrMut addObject:contact];
    }];
    deBugLog(@"%@", _contactArrMut);
    [self.tableView reloadData];
}




#pragma mark - UITableViewdataSource&Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contactArrMut.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"AddressBookCell"];
    if (indexPath.row < _contactArrMut.count) {
        CNContact *contact = [_contactArrMut objectAtIndex:indexPath.row];
        //获取联系人姓名
        cell.textLabel.text = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
        //获取联系电话
        NSMutableString *mutStr = [[NSMutableString alloc]init];
        for (CNLabeledValue *number in contact.phoneNumbers) {
            CNPhoneNumber *numberValue = number.value;
            [mutStr appendString:numberValue.stringValue];
        }
        cell.detailTextLabel.text = mutStr;
    }
    return cell;
}



@end
