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

    self.creatureNameTextField.text = self.creature.name;
    self.creatureNameLabel.text = self.creature.name;
    self.creatureDetailTextField.text = self.creature.detail;
    self.creatureDetailLabel.text = self.creature.detail;





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

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {

    if([sender.title isEqualToString:@"Edit"])
    {
        sender.title = @"Done";
        self.creatureNameTextField.hidden = NO;
        self.creatureDetailTextField.hidden = NO;
    }
    else
    {
        sender.title = @"Edit";
        self.creatureNameTextField.hidden = YES;
        self.creatureDetailTextField.hidden = YES;
        self.creatureNameLabel.text = self.creatureNameTextField.text;
        self.creatureDetailLabel.text = self.creatureDetailTextField.text;
        self.creature.name = self.creatureNameTextField.text;
        self.creature.detail = self.creatureDetailTextField.text;

    }
}












@end
