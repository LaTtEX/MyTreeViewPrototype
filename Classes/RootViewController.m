//
//  RootViewController.m
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "MyTreeViewCell.h"

@implementation RootViewController


#pragma mark -
#pragma mark View lifecycle


- (void)viewDidLoad {
    [super viewDidLoad];

	treeNode = [[MyTreeNode alloc] initWithValue:@"Root"];
	MyTreeNode *node1 = [[MyTreeNode alloc] initWithValue:@"Node1"];
	[treeNode addChild:node1];
	
	MyTreeNode *node1a = [[MyTreeNode alloc] initWithValue:@"Node1a"];
	MyTreeNode *node1b = [[MyTreeNode alloc] initWithValue:@"Node1b"];
	[node1 addChild:node1a];
	[node1 addChild:node1b];
	
	MyTreeNode *node1a1 = [[MyTreeNode alloc] initWithValue:@"Node1a1"];
	[node1a addChild:node1a1];
	
	MyTreeNode *node1b1 = [[MyTreeNode alloc] initWithValue:@"Node1b1"];
	MyTreeNode *node1b2 = [[MyTreeNode alloc] initWithValue:@"Node1b2"];
	MyTreeNode *node1b3 = [[MyTreeNode alloc] initWithValue:@"Node1b3"];
	
	[node1b addChild:node1b1];
	[node1b addChild:node1b2];
	[node1b addChild:node1b3];
	node1b.inclusive = NO;
	
	MyTreeNode *node2 = [[MyTreeNode alloc] initWithValue:@"Node2"];
	[treeNode addChild:node2];
	
	MyTreeNode *node2a = [[MyTreeNode alloc] initWithValue:@"Node2a"];
	[node2 addChild:node2a];
	
	MyTreeNode *node2a1 = [[MyTreeNode alloc] initWithValue:@"Node2a1"];
	[node2a addChild:node2a1];
}


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [treeNode descendantCount];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
	
   	MyTreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
	MyTreeViewCell *cell = [[MyTreeViewCell alloc] initWithStyle:UITableViewCellStyleDefault
												 reuseIdentifier:CellIdentifier 
														   level:[node levelDepth] - 1 
														expanded:node.inclusive];   
	cell.valueLabel.text = node.value;
	
    return cell;
}



#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	MyTreeNode *node = [[treeNode flattenElements] objectAtIndex:indexPath.row + 1];
	if (!node.hasChildren) return;
	
	node.inclusive = !node.inclusive;	
	[treeNode flattenElementsWithCacheRefresh:YES];
	[tableView reloadData];
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end

