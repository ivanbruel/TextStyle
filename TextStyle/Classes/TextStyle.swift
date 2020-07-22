//
//  UIFont+TextStyle.swift
//  SwipeIt
//
//  Created by Ivan Bruel on 01/09/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import UIKit
import Foundation

public enum TextStyle: String {

  case title1
  case title2
  case headline
  case subheadline
  case body
  case caption1
  case caption2
  case footnote
  case callout

  public var font: UIFont {
    switch self {
    case .title1:
        return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title1)
    case .title2:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.title2)
    case .headline:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
    case .subheadline:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
    case .body:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.body)
    case .caption1:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
    case .caption2:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption2)
    case .footnote:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.footnote)
    case .callout:
      return UIFont.preferredFont(forTextStyle: UIFont.TextStyle.callout)
    }
  }

  public static func observeFontChanged(_ observer: AnyObject, selector aSelector: Selector) {
    NotificationCenter.default
        .addObserver(observer, selector: aSelector, name: UIContentSizeCategory.didChangeNotification,
                   object: nil)
  }

  public static func removeObserver(_ observer: AnyObject) {
    NotificationCenter.default
        .removeObserver(observer, name: UIContentSizeCategory.didChangeNotification,
                      object: nil)
  }
}
