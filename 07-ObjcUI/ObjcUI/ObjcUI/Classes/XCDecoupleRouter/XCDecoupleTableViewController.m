//
//  XCDecoupleTableViewController.m
//  ObjcUI
//
//  Created by Alexcai on 2018/11/9.
//  Copyright © 2018 dongjiu. All rights reserved.
//

#import "XCDecoupleTableViewController.h"
#import "XCRouterListManager.h"

@interface XCDecoupleTableViewController ()

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) XCRouterListManager *manager;

@end

@implementation XCDecoupleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.manager = [XCRouterListManager new];
    NSURL *url = [NSURL URLWithString:@"push://XCTest1ViewController"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    UIViewController *controller = [self.manager fetchControllerWithRequest:request];
    NSLog(@"%@",controller);
    
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    cell.textLabel.text = @(indexPath.row).stringValue;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)startTimer{
   NSTimer *t =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(outputNumberSring) userInfo:nil repeats:YES];
    [t fire];
    
}

- (void)outputNumberSring{
    static int i = 0;
    NSLog(@"i = %d",++i);
}

@end
