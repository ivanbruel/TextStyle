//
//  TextStyle+RxSwift.swift
//  SwipeIt
//
//  Created by Ivan Bruel on 01/09/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import UIKit
import TextStyle
import RxSwift
import RxCocoa

public extension TextStyle {

  public var rx_font: Observable<UIFont> {
    return Observable<UIFont>.create { observer in
      observer.onNext(self.font)
      let disposable = NSNotificationCenter.defaultCenter()
        .rx_notification(UIContentSizeCategoryDidChangeNotification)
        .subscribeNext { _ in
          observer.onNext(self.font)
      }
      return AnonymousDisposable {
        disposable.dispose()
        observer.onCompleted()
      }
    }
  }
}

public extension UILabel {

  public var rx_font: AnyObserver<UIFont> {
    return UIBindingObserver(UIElement: self) { label, font in
      label.font = font
      }.asObserver()
  }
}

public extension UIButton {

  public var rx_font: AnyObserver<UIFont> {
    return UIBindingObserver(UIElement: self) { button, font in
      button.titleLabel?.font = font
      }.asObserver()
  }
}
