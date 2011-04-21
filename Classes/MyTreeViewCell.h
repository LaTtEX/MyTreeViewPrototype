//
//  MyTreeViewCell.h
//  MyTreeViewPrototype
//
//  Created by Jon Limjap on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyTreeViewCell : UITableViewCell {
	UILabel *valueLabel;
	UIImageView *arrowImage;
	
	int level;
	BOOL expanded;
}

@property (nonatomic, retain) UILabel *valueLabel;
@property (nonatomic, retain) UIImageView *arrowImage;
@property (nonatomic) int level;
@property (nonatomic) BOOL expanded;

- (id)initWithStyle:(UITableViewCellStyle)style 
	reuseIdentifier:(NSString *)reuseIdentifier 
			  level:(NSUInteger)_level 
		   expanded:(BOOL)_expanded; 

@end
