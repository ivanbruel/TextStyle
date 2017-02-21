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

  public var rx_font: Observable<UIFont> {
    return TextStyle.rx_changed()
      .map { _ in return self.font }
      .startWith(self.font)
  }

  public static func rx_changed() -> Observable<Void> {
    return NotificationCenter.default
      .rx.notification(NSNotification.Name.UIContentSizeCategoryDidChange)
      .map { _ in Void() }
  }
}

public extension Reactive where Base: UILabel {

  public var font: AnyObserver<UIFont> {
    return UIBindingObserver(UIElement: self.base) { label, font in
      label.font = font
      }.asObserver()
  }
}


public extension Reactive where Base: UIButton {

  public var font: AnyObserver<UIFont> {
    return UIBindingObserver(UIElement: self.base) { button, font in
      button.titleLabel?.font = font
      }.asObserver()
  }
}

public extension Reactive where Base: UITextField {

  public var font: AnyObserver<UIFont> {
    return UIBindingObserver(UIElement: self.base) { textField, font in
      textField.font = font
    }.asObserver()
  }
}

public extension Reactive where Base: UITextView {

  public var font: AnyObserver<UIFont> {
    return UIBindingObserver(UIElement: self.base) { textView, font in
      textView.font = font
    }.asObserver()
  }
}
