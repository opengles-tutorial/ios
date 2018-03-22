//
//  ViewController.m
//  OpenGLESforiOS
//
//  Created by niyao on 3/21/18.
//  Copyright © 2018 dourui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) EAGLContext *glContext;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.glContext];//reason: '-[EAGLContext superview]: unrecognized selector sent to instance 0x60000002c860'
    GLKView *_glkView = (GLKView *)self.view;
    [_glkView setContext:self.glContext];
    [_glkView setDrawableColorFormat:GLKViewDrawableColorFormatRGBA8888];
    [EAGLContext setCurrentContext:self.glContext];
}

#pragma mark - GLKViewDelegate
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
    // 清除颜色缓存和深度缓存
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
}

- (EAGLContext *)glContext {
    if (!_glContext) {
        _glContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    }
    return _glContext;
}

@end
