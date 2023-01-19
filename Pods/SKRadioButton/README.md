# SKRadioButton

> A Radio button for iOS Application built in Swift programming language

[![Build Status](https://travis-ci.org/sag333ar/SKRadioButton.svg?branch=master)](https://travis-ci.org/sag333ar/SKRadioButton)
[![Pod Platform](https://img.shields.io/cocoapods/p/SKRadioButton.svg?style=flat)](https://cocoapods.org/pods/SKRadioButton)
[![Pod License](https://img.shields.io/cocoapods/l/SKRadioButton.svg?style=flat)](https://github.com/sag333ar/SKRadioButton/blob/master/LICENSE)
[![Pod Version](https://img.shields.io/cocoapods/v/SKRadioButton.svg?style=flat)](https://cocoapods.org/pods/SKRadioButton)
![Readme Score](http://readme-score-api.herokuapp.com/score.svg?url=https://github.com/sag333ar/skradiobutton)

## Sample Screenshot

![Demo](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/GifDemo.gif)

![ScreenShot](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/SampleImage.png)

With the help of these custom buttons, Radio button funcationality can be achieved easily.

## Features

- [x] Customizable Icon Color
- [x] Customize Margin width between Icon & Title Text
- [x] Change Title Text
- [x] Change Icon size
- [x] Change Title Label Color
- [x] Change Title Label Background Color
- [x] Change number of lines for Title Label

## Requirements

- iOS 9.0+
- Xcode 9

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `SKRadioButton` by adding it to your `Podfile`:

```ruby
platform :ios, '9.0'
use_frameworks!
pod 'SKRadioButton'
```

To get the full benefits import `SKRadioButton` wherever you import UIKit

``` swift
import UIKit
import SKRadioButton
```

#### Manually

1. Download and drop `SKRadioButton.swift` in your project.  
2. Congratulations!  

## Usage example

***Step 1:*** Open `Storyboard`, Drag and drop a `UIButton` inside your view of `ViewController`.

![Drag & Drop Button](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step1.png)

***Step 2:*** Change the `Class` and `Module` from `Class inspector` for `UIbutton`s which you want to convert to Radio button.

![Change Class](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step2.png)

***Step 3:*** Select your buttons, Change `Type` to `Custom`, remove button `Title` + `Image` + `Background`. Apply Radio buttons customization.

![Change Attributes](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step3-1.png)

![Change Attributes2](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step3-2.png)

***Step 4:*** Place your Radio buttons inside a stack view (recommended) & apply necessary constraints as per your needs.

![Use Stackview](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step4.png)

***Step 5:*** One by one, select your Radio buttons & connect with `Outlet Collection` to your `viewController` as indicated below.

![Outlet Collection](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step5.png)

***Step 6:*** One by one, select your Radio buttons & connect same `Action` to your `viewController`s `IBAction` as indicated below.

![IBAction Connection](https://raw.githubusercontent.com/sag333ar/SKRadioButton/master/ReadmeAssets/Step6.png)

***Step 7:*** Add following piece of code & you're done.


```swift
import UIKit
import SKRadioButton // Step 1. Import SKRadioButton

class ViewController: UIViewController {

  // Step 2. collection of radio buttons
  @IBOutlet var genderRadioButtons: [SKRadioButton]!

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  // Step 3. On tap update 'isSelected' attributes
  @IBAction func genderRadioButtonsTapped(_ sender: SKRadioButton) {
    genderRadioButtons.forEach { (button) in
      button.isSelected = false
    }
    sender.isSelected = true
  }

 }
```

## Contribute

We would love you for the contribution to **SKRadioButton**, check the ``LICENSE`` file for more info.

## Meta

Sagar R. Kothari – [@sag333ar](https://twitter.com/sag333ar) – sag333ar@gmail.com

Cheers.