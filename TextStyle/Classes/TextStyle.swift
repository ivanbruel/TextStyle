//
//  UIFont+TextStyle.swift
//  SwipeIt
//
//  Created by Ivan Bruel on 01/09/16.
//  Copyright © 2016 Faber Ventures. All rights reserved.
//

import UIKit
import Foundation

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

  public var font: UIFont {
    switch self {
    case .Title1:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleTitle1)
    case .Title2:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleTitle2)
    case .Headline:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
    case .Subheadline:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleSubheadline)
    case .Body:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    case .Caption1:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
    case .Caption2:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleCaption2)
    case .Footnote:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
    case .Callout:
      return UIFont.preferredFontForTextStyle(UIFontTextStyleCallout)
    }
  }

  public static func observeFontChanged(observer: AnyObject, selector aSelector: Selector) {
    NSNotificationCenter.defaultCenter()
      .addObserver(observer, selector: aSelector, name: UIContentSizeCategoryDidChangeNotification,
                   object: nil)
  }

  public static func removeObserver(observer: AnyObject) {
    NSNotificationCenter.defaultCenter()
      .removeObserver(observer, name: UIContentSizeCategoryDidChangeNotification,
                      object: nil)
  }
}
