//
//  ViewController.h
//  MyPhoto
//
//  Created by 陈又铜 on 2020/7/16.
//  Copyright © 2020 陈又铜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIImageView * imageView;
    UIButton * btn;
}

@end

