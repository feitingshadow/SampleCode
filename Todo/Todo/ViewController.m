//
//  ViewController.m
//  Todo
//
//  Created by Stephen Johnson on 8/17/16.
//  Copyright © 2016 Nazca. All rights reserved.
//

#import "ViewController.h"
#import "Settings.h"
#import "TodoItemCell.h"
#import "AppConstants.h"

@interface ViewController ()
{
}
@property (nonatomic, strong) NSMutableArray * items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateLocalArray];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initNavigationBar {
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItemTapped:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
}

//MARK: TableView Methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (editingStyle) {
        case UITableViewCellEditingStyleDelete: {
            TodoItem * deletedItem = self.items[indexPath.row];
            [[Settings sharedSettings] removeItem:deletedItem];
            [self updateLocalArray];
            [self.tableView reloadData];
            break;
        }
        default: {
            break;
        }
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TodoItem * item = self.items[indexPath.row];
    TodoItemCell * cell = (TodoItemCell*)[self.tableView dequeueReusableCellWithIdentifier:@"ItemCell"];
    [cell setupWithItem:item];
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:NAVIGATION_FLAGS_EDIT];
    [[NSUserDefaults standardUserDefaults] setInteger:indexPath.row forKey:KEY_ITEM_INDEX];
    
    [self performSegueWithIdentifier:@"AddSegue" sender:self];
    //Normally, go to edit view. Since simple app, just allowing delete. Otherwise would store index or otherwise pass to new viewController, and allow editing.
}

//MARK: From IBOutlet and interface

- (IBAction) addItemTapped:(UIButton*) sender {
    [self performSegueWithIdentifier:@"AddSegue" sender:self];
}

//MARK: Custom

- (void) updateLocalArray
{
   self.items = [[Settings sharedSettings] getItemsArray];
}
@end
