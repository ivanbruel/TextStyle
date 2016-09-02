# TextStyle

[![Version](https://img.shields.io/cocoapods/v/TextStyle.svg?style=flat)](http://cocoapods.org/pods/TextStyle)
[![License](https://img.shields.io/cocoapods/l/TextStyle.svg?style=flat)](http://cocoapods.org/pods/TextStyle)
[![Platform](https://img.shields.io/cocoapods/p/TextStyle.svg?style=flat)](http://cocoapods.org/pods/TextStyle)

`TextStyle` provides easier management of dynamic font sizing in iOS.

## Benefits

With `TextStyle` you can support Dynamic Font Sizing in iOS, allowing font size changes through accessibility.

We also provide convenient wrappers for the `NSNotificationCenter` observer and also `RxSwift` bindings for common usage.

## Available TextStyles

```swift
public enum TextStyle {

  case Title1
  case Title2
  case Headline
  case Subheadline
  case Body
  case Caption1
  case Caption2
  case Footnote
  case Callout
}
```

## Usage

Check the `Example` project for a better understanding of how `TextStyle` works.

### Without RxSwift

```swift
import TextStyle

class ViewController: UIViewController {
  let label = UILabel()

  private func viewDidLoad() {
    super.viewDidLoad()
    label.font = TextStyle.Body.font
    TextStyle.observeFontChanged(self, selector: #selector(ViewController.fontChanged))
  }

  private func fontChanged() {
    label.font = TextStyle.Body.font
  }

  deinit {
    TextStyle.removeObserver(self)
  }
}
```

### With RxSwift

```swift
import TextStyle
import RxSwift

class ViewController: UIViewController {
  let label = UILabel()
  let disposeBag = DisposeBag()

  private func viewDidLoad() {
    super.viewDidLoad()
    TextStyle.Body.rx_font
      .bindTo(label.rx_font)
      .addDisposableTo(disposeBag)
  }
}
```

## Reminder

iOS 9.3 (which includes the simulator) has a bug in which it doesn't receive the notification, be sure to use either an update iOS device or the iOS 9.2 simulator.

## Installation

RxResult is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "TextStyle"
```

## License

RxResult is available under the MIT license. See the LICENSE file for more info.
