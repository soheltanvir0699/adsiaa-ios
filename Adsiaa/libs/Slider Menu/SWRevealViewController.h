


#import <UIKit/UIKit.h>

@class SWRevealViewController;
@protocol SWRevealViewControllerDelegate;

#pragma mark - SWRevealViewController Class

// Enum values for setFrontViewPosition:animated:
typedef NS_ENUM( NSInteger, FrontViewPosition)
{
    FrontViewPositionLeftSideMostRemoved,
    
    FrontViewPositionLeftSideMost,
    FrontViewPositionLeftSide,

    FrontViewPositionLeft,
    

    FrontViewPositionRight,
    
    FrontViewPositionRightMost,
    
    FrontViewPositionRightMostRemoved,
    
};

// Enum values for toggleAnimationType
typedef NS_ENUM(NSInteger, SWRevealToggleAnimationType)
{
    SWRevealToggleAnimationTypeSpring,    // <- produces a spring based animation
    SWRevealToggleAnimationTypeEaseOut,   // <- produces an ease out curve animation
};


@interface SWRevealViewController : UIViewController

/* Basic API */

// Object instance init and rear view setting
- (id)initWithRearViewController:(UIViewController *)rearViewController frontViewController:(UIViewController *)frontViewController;

// Rear view controller, can be nil if not used
@property (nonatomic) UIViewController *rearViewController;
- (void)setRearViewController:(UIViewController *)rearViewController animated:(BOOL)animated;

// Optional right view controller, can be nil if not used
@property (nonatomic) UIViewController *rightViewController;
- (void)setRightViewController:(UIViewController *)rightViewController animated:(BOOL)animated;

// Front view controller, can be nil on initialization but must be supplied by the time the view is loaded
@property (nonatomic) UIViewController *frontViewController;
- (void)setFrontViewController:(UIViewController *)frontViewController animated:(BOOL)animated;


- (void)pushFrontViewController:(UIViewController *)frontViewController animated:(BOOL)animated;

@property (nonatomic) FrontViewPosition frontViewPosition;
- (void)setFrontViewPosition:(FrontViewPosition)frontViewPosition animated:(BOOL)animated;


- (IBAction)revealToggle:(id)sender;
- (IBAction)rightRevealToggle:(id)sender; // <-- simetric implementation of the above for the rightViewController


- (void)revealToggleAnimated:(BOOL)animated;
- (void)rightRevealToggleAnimated:(BOOL)animated; // <-- simetric implementation of the above for the rightViewController


- (UIPanGestureRecognizer*)panGestureRecognizer;


- (UITapGestureRecognizer*)tapGestureRecognizer;
@property (nonatomic) CGFloat rearViewRevealWidth;
@property (nonatomic) CGFloat rightViewRevealWidth; // <-- simetric implementation of the above for the rightViewController

// Defines how much of an overdraw can occur when dragging further than 'rearViewRevealWidth', default is 60.
@property (nonatomic) CGFloat rearViewRevealOverdraw;
@property (nonatomic) CGFloat rightViewRevealOverdraw;   // <-- simetric implementation of the above for the rightViewController

// Defines how much displacement is applied to the rear view when animating or dragging the front view, default is 40.
@property (nonatomic) CGFloat rearViewRevealDisplacement;
@property (nonatomic) CGFloat rightViewRevealDisplacement;  // <-- simetric implementation of the above for the rightViewController

// Defines a width on the border of the view attached to the panGesturRecognizer where the gesture is allowed,
// default is 0 which means no restriction.
@property (nonatomic) CGFloat draggableBorderWidth;

// If YES (the default) the controller will bounce to the Left position when dragging further than 'rearViewRevealWidth'
@property (nonatomic) BOOL bounceBackOnOverdraw;
@property (nonatomic) BOOL bounceBackOnLeftOverdraw;  // <-- simetric implementation of the above for the rightViewController

// If YES (default is NO) the controller will allow permanent dragging up to the rightMostPosition
@property (nonatomic) BOOL stableDragOnOverdraw;
@property (nonatomic) BOOL stableDragOnLeftOverdraw; // <-- simetric implementation of the above for the rightViewController

// If YES (default is NO) the front view controller will be ofsseted vertically by the height of a navigation bar.
// Use this on iOS7 when you add an instance of RevealViewController as a child of a UINavigationController (or another SWRevealViewController)
// and you want the front view controller to be presented below the navigation bar of its UINavigationController grand parent.
// The rearViewController will still appear full size and blurred behind the navigation bar of its UINavigationController grand parent
@property (nonatomic) BOOL presentFrontViewHierarchically;

// Velocity required for the controller to toggle its state based on a swipe movement, default is 250
@property (nonatomic) CGFloat quickFlickVelocity;

// Duration for the revealToggle animation, default is 0.25
@property (nonatomic) NSTimeInterval toggleAnimationDuration;

// Animation type, default is SWRevealToggleAnimationTypeSpring
@property (nonatomic) SWRevealToggleAnimationType toggleAnimationType;

// When animation type is SWRevealToggleAnimationTypeSpring determines the damping ratio, default is 1
@property (nonatomic) CGFloat springDampingRatio;

// Duration for animated replacement of view controllers
@property (nonatomic) NSTimeInterval replaceViewAnimationDuration;

// Defines the radius of the front view's shadow, default is 2.5f
@property (nonatomic) CGFloat frontViewShadowRadius;

// Defines the radius of the front view's shadow offset default is {0.0f,2.5f}
@property (nonatomic) CGSize frontViewShadowOffset;

// Defines the front view's shadow opacity, default is 1.0f
@property (nonatomic) CGFloat frontViewShadowOpacity;

// Defines the front view's shadow color, default is blackColor
@property (nonatomic) UIColor *frontViewShadowColor;

@property (nonatomic) BOOL clipsViewsToBounds;

@property (nonatomic) BOOL extendsPointInsideHit;

@property (nonatomic,weak) id<SWRevealViewControllerDelegate> delegate;

@end


#pragma mark - SWRevealViewControllerDelegate Protocol

typedef enum
{
    SWRevealControllerOperationNone,
    SWRevealControllerOperationReplaceRearController,
    SWRevealControllerOperationReplaceFrontController,
    SWRevealControllerOperationReplaceRightController,
    
} SWRevealControllerOperation;


@protocol SWRevealViewControllerDelegate<NSObject>

@optional

// The following delegate methods will be called before and after the front view moves to a position
- (void)revealController:(SWRevealViewController *)revealController willMoveToPosition:(FrontViewPosition)position;
- (void)revealController:(SWRevealViewController *)revealController didMoveToPosition:(FrontViewPosition)position;

// This will be called inside the reveal animation, thus you can use it to place your own code that will be animated in sync
- (void)revealController:(SWRevealViewController *)revealController animateToPosition:(FrontViewPosition)position;

// Implement this to return NO when you want the pan gesture recognizer to be ignored
- (BOOL)revealControllerPanGestureShouldBegin:(SWRevealViewController *)revealController;

// Implement this to return NO when you want the tap gesture recognizer to be ignored
- (BOOL)revealControllerTapGestureShouldBegin:(SWRevealViewController *)revealController;

// Implement this to return YES if you want other gesture recognizer to share touch events with the pan gesture
- (BOOL)revealController:(SWRevealViewController *)revealController
    panGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

// Implement this to return YES if you want other gesture recognizer to share touch events with the tap gesture
- (BOOL)revealController:(SWRevealViewController *)revealController
    tapGestureRecognizerShouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer;

// Called when the gestureRecognizer began and ended
- (void)revealControllerPanGestureBegan:(SWRevealViewController *)revealController;
- (void)revealControllerPanGestureEnded:(SWRevealViewController *)revealController;

- (void)revealController:(SWRevealViewController *)revealController panGestureBeganFromLocation:(CGFloat)location progress:(CGFloat)progress overProgress:(CGFloat)overProgress;
- (void)revealController:(SWRevealViewController *)revealController panGestureMovedToLocation:(CGFloat)location progress:(CGFloat)progress overProgress:(CGFloat)overProgress;
- (void)revealController:(SWRevealViewController *)revealController panGestureEndedToLocation:(CGFloat)location progress:(CGFloat)progress overProgress:(CGFloat)overProgress;

// Notification of child controller replacement
- (void)revealController:(SWRevealViewController *)revealController willAddViewController:(UIViewController *)viewController
    forOperation:(SWRevealControllerOperation)operation animated:(BOOL)animated;
- (void)revealController:(SWRevealViewController *)revealController didAddViewController:(UIViewController *)viewController
    forOperation:(SWRevealControllerOperation)operation animated:(BOOL)animated;

// Support for custom transition animations while replacing child controllers. If implemented, it will be fired in response
// to calls to 'setXXViewController' methods
- (id<UIViewControllerAnimatedTransitioning>)revealController:(SWRevealViewController *)revealController
    animationControllerForOperation:(SWRevealControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC;

// DEPRECATED - The following delegate methods will be removed some time in the future
- (void)revealController:(SWRevealViewController *)revealController panGestureBeganFromLocation:(CGFloat)location progress:(CGFloat)progress; // (DEPRECATED)
- (void)revealController:(SWRevealViewController *)revealController panGestureMovedToLocation:(CGFloat)location progress:(CGFloat)progress; // (DEPRECATED)
- (void)revealController:(SWRevealViewController *)revealController panGestureEndedToLocation:(CGFloat)location progress:(CGFloat)progress; // (DEPRECATED)
@end


#pragma mark - UIViewController(SWRevealViewController) Category

// A category of UIViewController to let childViewControllers easily access their parent SWRevealViewController
@interface UIViewController(SWRevealViewController)

- (SWRevealViewController*)revealViewController;

@end


#pragma mark - StoryBoard support Classes

/* StoryBoard support */

// String identifiers to be applied to segues on a storyboard
extern NSString* const SWSegueRearIdentifier;  // this is @"sw_rear"
extern NSString* const SWSegueFrontIdentifier; // this is @"sw_front"
extern NSString* const SWSegueRightIdentifier; // this is @"sw_right"

/* This will allow the class to be defined on a storyboard */

// Use this along with one of the above segue identifiers to segue to the initial state
@interface SWRevealViewControllerSegueSetController : UIStoryboardSegue
@end

// Use this to push a view controller
@interface SWRevealViewControllerSeguePushController : UIStoryboardSegue
@end
