//
//  ACYContainerView.m
//  ACYKit
//
//  Created by Arthur Liu on 2017/05/18.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import "ACYContainerView.h"
#import "Masonry.h"

@interface ACYContainerView ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIImageView *aImageView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ACYContainerView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //
        
        [self acy_bindAction:@selector(p_handleTapGesture:) withTarget:self];
        
        [self acy_addSubviews:@[self.aImageView,
                                self.imageView]];
        
        [self.aImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(100);
            make.size.mas_equalTo(CGSizeMake(200, 200));
        }];
        
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(200);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
        self.backgroundColor = [UIColor redColor];
        
    }
    return self;
}

#pragma mark - Private Methods

- (void)p_handleTapGesture:(UITapGestureRecognizer *)tap {
 
    DDLogDebug(@"view be tapped");
}

- (void)p_didTapButton:(UIButton *)sender {
    DDLogInfo(@"did tap button");
}

- (void)p_didTapImageView:(UITapGestureRecognizer *)tap {
    DDLogInfo(@"did tap image view at index:%@",@(tap.view.tag));
}

#pragma mark - Properties

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_button setTitle:@"button" forState:UIControlStateNormal];
        
        [_button acy_bindAction:@selector(p_didTapButton:) withTarget:self];
        
        [_button setBackgroundColor:[UIColor greenColor]];
        
    }
    return _button;
}

- (UIImageView *)aImageView {
    if (!_aImageView) {
        _aImageView = [UIImageView new];
        
        [_aImageView setBackgroundColor:[UIColor purpleColor]];
        
        _aImageView.tag = 1;
        
        [_aImageView acy_bindAction:@selector(p_didTapImageView:) withTarget:self];
    }
    return _aImageView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [UIImageView new];
        
//        [_imageView acy_bindAction:@selector(p_didTapImageView:) withTarget:self];
        _imageView.tag = 2;
        
        [_imageView setBackgroundColor:[UIColor blueColor]];
    }
    
    return _imageView;
}



@end
