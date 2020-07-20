#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIImageView * imageView;
    UIButton * btn;
}
- (void)viewDidLoad;
- (void) panAction;
- (void)exitApplication;
- (void)btnClick;
- (void) imagePickerController;
- (void) imagePickerControllerDidCancel;

@end
