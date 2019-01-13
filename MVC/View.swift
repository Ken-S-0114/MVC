//
//  View.swift
//  MVC
//
//  Created by 佐藤賢 on 2019/01/13.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import UIKit

// 適切な Controller オブジェクトの選定、Model オブジェクトの保持
final class View: UIView {
    private let label: UILabel
    private let minusButton: UIButton
    private let plusButton: UIButton

    // Controller の型はプロパティとして外から指定できる
    var defaultControllerClass: Controller.Type = Controller.self
    private var myController: Controller?

    var myModel: Model? {
        didSet {
            // Controller生成と、Modelの監視を開始する
            regiterModel()
        }
    }
    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }

    override init(frame: CGRect) {
        // ... 画面のレイアウト設定 ...
    }

    private func regiterModel() {
        guard let model = myModel else { return }
        // Strategy パターンによって，適切な Controller を生成
        let controller = defaultControllerClass.init()
        controller.myModel = model

        label.text = model.count.description

        minusButton.addTarget(controller, action: #selector(Controller.onMinusTapped), for: .touchUpInside)
        plusButton.addTarget(controller, action: #selector(Controller.onPlusTapped), for: .touchUpInside)

        // Model の状態を Observer パターンで監視する
        model.notificationCenter
            .addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil, using:
                { [unowned self] notification in
                    if let count = notification.userInfo?["count"] as? Int {
                        self.label.text = count.description
                    }
            })
    }
}
