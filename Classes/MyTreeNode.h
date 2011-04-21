//
//  MyTreeNode.h
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyTreeNode.h"

@interface MyTreeNode : NSObject {
	int index;
	NSString *value;
	MyTreeNode *parent;
	NSMutableArray *children;
	BOOL inclusive;
	NSArray *flattenedTreeCache;
}

@property (nonatomic) int index;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) MyTreeNode *parent;
@property (nonatomic, retain, readonly) NSMutableArray *children;
@property (nonatomic) BOOL inclusive;

- (id)initWithValue:(NSString *)_value;

- (void)addChild:(MyTreeNode *)newChild;
- (NSUInteger)descendantCount;
- (NSUInteger)levelDepth;
- (NSArray *)flattenElements;
- (NSArray *)flattenElementsWithCacheRefresh:(BOOL)invalidate;
- (BOOL)isRoot;
- (BOOL)hasChildren;

@end
