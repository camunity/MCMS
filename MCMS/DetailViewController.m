//
//  DetailViewController.m
//  MCMS
//
//  Created by Cameron Flowers on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "DetailViewController.h"
#import "MagicalCreature.h"

@interface DetailViewController () <UITableViewDelegate, UITableViewDataSource >
@property (strong, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *creatureDetailLabel;
@property (strong, nonatomic) IBOutlet UITextField *creatureNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *creatureDetailTextField;
@property (strong, nonatomic) IBOutlet UITableView *accessoriesTableView;
@property NSArray *weaponsAvailable;
@property (strong, nonatomic) IBOutlet UIButton *editButton;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.weaponsAvailable = [NSArray arrayWithObjects:
                             @"Hairball",
                             @"Nunchucks",
                             @"Urine Stream",
                             @"A Mother's Love"
                             @"Crossbow",
                             @"Ben Beard",
                             nil];
    // Do any additional setup after loading the view.
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeaponsCell"];
    cell.textLabel.text = [self.weaponsAvailable objectAtIndex:indexPath.row];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.weaponsAvailable.count;
}

- (IBAction)onEditButtonPressed:(UIButton *)sender {
    
    if ([sender.titleLabel.text isEqualToString:@"Edit"]) {
        sender.titleLabel.text = @"Done";
        [self.accessoriesTableView setEditing:YES animated:YES];
    } else {
        sender.titleLabel.text = @"Edit";
        [self.accessoriesTableView setEditing:NO animated:YES];
    }


}












@end
