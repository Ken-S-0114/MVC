//
//  View.swift
//  CocoaMVC
//
//  Created by 佐藤賢 on 2019/01/13.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import UIKit

// Cocoa MVC の View は，Model を参照しない
final class View: UIView {
    let label: UILabel
    let minusButton: UIButton
    let plusButton: UIButton

    override init(frame: CGRect) {
        // ... 画面のレイアウト設定 ...
    }
}
