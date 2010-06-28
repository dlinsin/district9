/*
 * Copyright (C) 2009  <David Linsin>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#import "Root.h"

@implementation Root

@synthesize pageIndex = _pageIndex;

- (id) initWithParent:(UIView *)parent {
	self = [super initWithParent:parent];
	if (self == nil) {
		return nil;
	}

	self.userInteractionEnabled = YES;

	self.size = self.window.size;

	[[UIImageView viewWithParent:self] setImageWithName:@"dailies"];
	[[UIImageView viewWithParent:self] setImageWithName:@"top"];
	[[UIImageView viewWithParent:self] setImageWithName:@"top_menu"];
	[[UIImageView viewWithParent:self] setImageWithName:@"top_translated"];

	self.pageIndex = 0;

	return self;
}

- (void)setPageIndex:(int)index {
	if (index < 0 || index >= [self.subviews count]) {
		return;
	}
	_pageIndex = index;

	for (int i = 0; i < [self.subviews count]; i++) {
		UIImageView *page = [self.subviews objectAtIndex:i];
		page.x = (i < _pageIndex) ? -self.width : (i > _pageIndex) ? self.width : 0;
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	BOOL touchChangeForward = [[touches anyObject] locationInView:self].x > 160 && [[touches anyObject] locationInView:self].y > 430;
	BOOL touchChangeBackward = [[touches anyObject] locationInView:self].x < 160 && [[touches anyObject] locationInView:self].y > 430;
	BOOL touchTranslateMenu = [[touches anyObject] locationInView:self].y < 150;
	BOOL touchTranslate = [[touches anyObject] locationInView:self].y < 200;

	if (touchChangeBackward) {
		self.pageIndex = 0;
	} else if (touchChangeForward) {
		self.pageIndex = 1;
	} else if (touchTranslateMenu){
		self.pageIndex = 2;
	} else if (touchTranslate){
		self.pageIndex = 3;
	}

}

@end
