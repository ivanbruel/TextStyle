//
//  ViewController.swift
//  TextStyle
//
//  Created by Ivan Bruel on 09/01/2016.
//  Copyright (c) 2016 Ivan Bruel. All rights reserved.
//

import UIKit
import TextStyle
import RxSwift

class ViewController: UIViewController {

  @IBOutlet var labels: [UILabel]!

  fileprivate let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    let textStyles: [TextStyle] = [.title1, .title2, .headline, .subheadline, .body,
                                    .caption1, .caption2, .footnote, .callout]
    let texts: [String] = ["Title1", "Title2", "Headline", "Subheadline", "Body", "Caption1",
                           "Caption2", "Footnote", "Callout"]
    for index in 0..<labels.count {
      let label = labels[index]
      let textStyle = textStyles[index]
      let text = texts[index]

      label.text = text
        textStyle.rx_font.bind(to: label.rx.font)
            .disposed(by: disposeBag)
    }
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

