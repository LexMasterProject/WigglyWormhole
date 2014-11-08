//
//  ScoreBoardVC.m
//  WigglyWormhole
//
//  Created by Alex on 07/11/2014.
//  Copyright (c) 2014 Alex. All rights reserved.
//

#import "ScoreBoardVC.h"

@interface ScoreBoardVC ()

@end

@implementation ScoreBoardVC

-(UITableViewCell *)tableView:(UITableView *)sender cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *myIdentifier = @"myIdentifier";
    UITableViewCell *cell = [sender dequeueReusableCellWithIdentifier:myIdentifier];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myIdentifier];
    }
    
    NSArray*scoreArr=[self.scores objectAtIndex:indexPath.row];
    NSString* cellText= [[NSString alloc]initWithFormat:@"Rank %d:  %@  %@",indexPath.row+1,[scoreArr objectAtIndex:0],[scoreArr objectAtIndex:1]];
    cell.textLabel.text = cellText;
    return cell;
}

-(NSInteger)tableView:(UITableView *)sender numberOfRowsInSection:(NSInteger)section {
    return [self.scores count];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scores=self.appDataModel.scoreBoard;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadView
{
  
    UITableView*tableView=[[UITableView alloc]initWithFrame:[[UIScreen mainScreen]applicationFrame] style:UITableViewStylePlain];
    tableView.delegate=self;
    tableView.dataSource=self;
    [tableView reloadData];
    self.view=tableView;
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
