//
//  UICATileLayerView.m
//  TestCALayer
//
//  Created by Fabricio Tofoli on 5/1/14.
//  Copyright (c) 2014 nklab. All rights reserved.
// 

#import "UICATileLayerView.h"
#include <sys/time.h>

@implementation UICATileLayerView

+(Class) layerClass
{
    return [CATiledLayer class];
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _color = [UIColor grayColor];
        
        // Set tile size to hald the view
        CATiledLayer *tiledLayer = (CATiledLayer *)self.layer;

        CGSize size = self.frame.size;

        // Take retina displays into account for correct tile size
        float scale = 1;
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)] == YES)
            scale = [[UIScreen mainScreen] scale];
        
        size.height = size.height/2 * scale;
        size.width = size.width/2 * scale;
        tiledLayer.tileSize = size;
    }
    
    return self;
}

-(void) drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGRect rect = CGContextGetClipBoundingBox(ctx);

    CGContextClearRect(ctx, rect);

    CGContextSetLineWidth(ctx, 2.0);
    CGContextSetFillColorWithColor(ctx, _color.CGColor);
    CGContextFillEllipseInRect(ctx, rect);
}

@end
