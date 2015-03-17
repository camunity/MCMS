//
//  HomeViewController.m
//  MCMS
//
//  Created by Cameron Flowers on 3/17/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "HomeViewController.h"
#import "MagicalCreature.h"
#import "DetailViewController.h"

@interface HomeViewController () < UITableViewDataSource, UITableViewDelegate >
@property (strong, nonatomic) IBOutlet UITableView *creaturesTableView;
@property (strong, nonatomic) IBOutlet UITextField *creatureTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailTextField;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *pikachu = [[MagicalCreature alloc]initWithName:@"Pikachu" WithDetail:@"Shockingly Talented hehehe"];
    MagicalCreature *squirtle = [[MagicalCreature alloc]initWithName:@"Squirtle" WithDetail:@"Cool as Water"];
    MagicalCreature *eevee = [[MagicalCreature alloc]initWithName:@"Eevee" WithDetail:@"Identity Issues but that's okay"];
    MagicalCreature *charmander = [[MagicalCreature alloc]initWithName:@"Charmander" WithDetail:@"Supa Hawt Fiya"];

self.creatures = [NSMutableArray arrayWithObjects:pikachu, squirtle, eevee, charmander, nil];
}




-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureCell"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.detail;
    return cell;
    
}
- (IBAction)onAddButtonPressed:(UIButton*)sender
{
    if([self.creatureTextField.text isEqualToString:@""])
    {
        //alert view yell at user
    }
    else
    {
        MagicalCreature *creature = [[MagicalCreature alloc]initWithName:self.creatureTextField.text WithDetail:self.detailTextField.text];
        [self.creatures addObject:creature];
        [self.view resignFirstResponder];
        self.detailTextField.text = @"";
        self.creatureTextField.text = @"";
        [self.creaturesTableView reloadData];
    }
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    NSIndexPath *indexPath = [self.creaturesTableView indexPathForCell:cell];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    DetailViewController *vc = [segue destinationViewController];
    vc.title = creature.name;
    vc.creature = creature;
}


- (IBAction)backToHomeController:(DetailViewController *)sender {

    
}











@end
