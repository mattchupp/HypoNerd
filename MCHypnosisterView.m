//
//  MCHypnosisterView.m
//  Hyposister
//
//  Created by Matthew Chupp on 3/17/15.
//  Copyright (c) 2015 MattChupp. All rights reserved.
//

#import "MCHypnosisterView.h"

@interface MCHypnosisterView()

@property (strong, nonatomic) UIColor *circleColor;

@end

@implementation MCHypnosisterView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // all MCHypnosisterViews start with a clear background
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    return self;
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGRect bounds = self.bounds;
    
    // figure out the center of the bounds rectangle
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    // the circle will be the largest that will fit in the view
//    float radius = MIN(bounds.size.width, bounds.size.height) / 2.0;

    // the largest circle will circumscribe the view
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    UIBezierPath *path = [[UIBezierPath alloc] init];
    
    // add an arc to the path at center, with radious of radius
    // from 0 to 2*M_PI radians (a circle)
//    [path addArcWithCenter:center
//                    radius:radius
//                    startAngle:0.0
//                    endAngle:M_PI * 2.0
//                    clockwise:YES];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        
        [path addArcWithCenter:center
                        radius:currentRadius
                        startAngle:0.0
                        endAngle:M_PI * 2.0
                        clockwise:YES];
    }
    
    // config line width to 10 pts
    path.lineWidth = 10;
    
    // config line color to light grey
//    [[UIColor lightGrayColor] setStroke]; 
    [self.circleColor setStroke];
    
    
    // draw the line
    [path stroke];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"%@ was touched", self);
    
    // get 3 random numbers between 0 and 1
    float red = (arc4random() % 100) / 100.0;
    float green = (arc4random() % 100) / 100.0;
    float blue = (arc4random() %  100) / 100.0;
    
    UIColor *randomColor = [UIColor colorWithRed:red
                                           green:green
                                            blue:blue
                                           alpha:1.0];
    
    self.circleColor = randomColor;
    
}

- (void)setCircleColor:(UIColor *)circleColor {
    
    _circleColor = circleColor;
    [self setNeedsDisplay]; 
}


@end
