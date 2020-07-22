//
//  TextStyle+RxSwift.swift
//  SwipeIt
//
//  Created by Ivan Bruel on 01/09/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public extension TextStyle {

    var rx_font: Observable<UIFont> {
    return TextStyle.rx_changed()
      .map { _ in return self.font }
      .startWith(self.font)
  }

    static func rx_changed() -> Observable<Void> {
    return NotificationCenter.default
      .rx.notification(UIContentSizeCategory.didChangeNotification)
      .map { _ in Void() }
  }
}

public extension Reactive where Base: UILabel {

    var font: AnyObserver<UIFont> {
    return Binder(self.base) { label, font in
      label.font = font
      }.asObserver()
  }
}


public extension Reactive where Base: UIButton {

    var font: AnyObserver<UIFont> {
    return Binder(self.base) { button, font in
      button.titleLabel?.font = font
      }.asObserver()
  }
}

public extension Reactive where Base: UITextField {

    var font: AnyObserver<UIFont> {
    return Binder(self.base) { textField, font in
      textField.font = font
    }.asObserver()
  }
}

public extension Reactive where Base: UITextView {

    var font: AnyObserver<UIFont> {
    return Binder(self.base) { textView, font in
      textView.font = font
    }.asObserver()
  }
}
