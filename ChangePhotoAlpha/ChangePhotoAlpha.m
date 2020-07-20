//
//  ViewController.m
//  MyPhoto
//
//  Created by 陈又铜 on 2020/7/16.
//  Copyright © 2020 陈又铜. All rights reserved.
//

#import "ChangePhotoAlpha.h"

@interface ViewController ()

@end

@implementation ViewController{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //添加图片显示View
    imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    imageView.backgroundColor = [UIColor whiteColor];
    [imageView setContentScaleFactor:[[UIScreen mainScreen] scale]];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    imageView.clipsToBounds = YES;
    [self.view addSubview:imageView];
    
    //添加手势监控
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] init];
    [self.view addGestureRecognizer:pan];
    [pan addTarget:self action:@selector(panAction:)];
    
    //添加图片选择Button
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(self.view.frame.size.width*0.4, self.view.frame.size.height*0.9, 70, 50);
    [btn setTitle:@"Choose" forState:UIControlStateNormal];
    [btn setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //退出
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer * exit = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exitApplication:)];
    exit.numberOfTapsRequired = 2;
    [imageView addGestureRecognizer:exit];
    [exit requireGestureRecognizerToFail:exit];
}

- (void) panAction: (UIPanGestureRecognizer *) pan{
    CGPoint point;
    CGPoint _point;
    if(pan.state == UIGestureRecognizerStateBegan){
        point = [pan locationInView:imageView];
    }
    if(pan.state == UIGestureRecognizerStateChanged){
        _point = [pan translationInView:imageView];
        CGFloat num = _point.y / imageView.frame.size.height;
        CGFloat alpha = imageView.alpha - num;
        //NSLog(@"%f %f",point.y,_point.y);
        if(alpha < 0) alpha = 0;
        if(alpha > 1) alpha = 1;
        imageView.alpha = alpha;
    }
}

- (void)exitApplication: (UITapGestureRecognizer *) tap{
    //NSLog(@"exit");
    //exit(0);
//    [self dismissViewControllerAnimated:YES completion:nil];
    [imageView removeFromSuperview];
}

- (void)btnClick:(UIButton *) sender {
    UIImagePickerController * pickerControll = [[UIImagePickerController alloc] init];
    //设置pickerControll选择的资源类型
    pickerControll.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerControll.delegate = self;
    pickerControll.allowsEditing = YES;
    [self presentViewController:pickerControll animated:YES completion:nil];
    btn.hidden = YES;
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:( NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
    imageView.image = image;
    //[btn dismissViewControllerAnimated:YES completion:nil]
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *) picker{
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end


