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
    return rx_changed
      .map { _ in return self.font }
      .startWith(self.font)
  }
  
  public var rx_changed: Observable<Bool> {
    return NotificationCenter.default
      .rx.notification(NSNotification.Name.UIContentSizeCategoryDidChange)
      .map { _ in return Void() }
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

