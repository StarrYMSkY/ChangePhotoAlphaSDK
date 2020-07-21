//
//  PhotoAlpha.m
//  MyPhoto
//
//  Created by 陈又铜 on 2020/7/20.
//  Copyright © 2020 陈又铜. All rights reserved.
//

#import "KZZPhotoAlpha.h"

@interface KZZPhotoAlpha () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@end

@implementation KZZPhotoAlpha{
    __weak UIViewController *_object;
}

- (void)ShowTheView : (UIViewController *) object{
    //持有object
    _object = object;
    
    //添加图片显示View
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(object.view.frame.origin.x, object.view.frame.origin.y, object.view.frame.size.width, object.view.frame.size.height);
    _imageView.backgroundColor = [UIColor whiteColor];
    [_imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    _imageView.clipsToBounds = YES;
    [object.view addSubview:_imageView];
    
    //开启视图的用户交互
    _imageView.userInteractionEnabled = YES;
    object.view.userInteractionEnabled = YES;
    
    //添加手势监控
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(panAction:)];
    [_imageView addGestureRecognizer:pan];
    
    //添加图片选择Button
    _btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _btn.frame = CGRectMake(_imageView.frame.size.width*0.4, _imageView.frame.size.height*0.5, 70, 50);
    [_btn setTitle:@"Choose" forState:UIControlStateNormal];
    [_btn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    _btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_imageView addSubview:_btn];
    
    
    //退出
    UITapGestureRecognizer * exit = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(returnHome:)];
    exit.numberOfTapsRequired = 2;
    [_imageView addGestureRecognizer:exit];
    [exit requireGestureRecognizerToFail:exit];
}

- (void)panAction: (UIPanGestureRecognizer *) pan{
    CGPoint point;
    CGPoint _point;
    if(pan.state == UIGestureRecognizerStateBegan){
        point = [pan locationInView:_imageView];
    }
    if(pan.state == UIGestureRecognizerStateChanged){
        _point = [pan translationInView:_imageView];
        CGFloat num = _point.y / _imageView.frame.size.height;
        CGFloat alpha = _imageView.alpha - num;
        if(alpha < 0) alpha = 0;
        if(alpha > 1) alpha = 1;
        _imageView.alpha = alpha;
    }
}

- (void)returnHome: (UITapGestureRecognizer *) tap{
    [_imageView removeFromSuperview];
}

- (void)btnClick:(UIButton *) sender{
    UIImagePickerController * pickerControll = [[UIImagePickerController alloc] init];
    pickerControll.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerControll.delegate = self;
    pickerControll.allowsEditing = YES;
    [_object presentViewController:pickerControll animated:YES completion:nil];
    _btn.hidden = YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:( NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    _imageView.image = image;
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
