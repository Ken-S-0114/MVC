//
//  Controller.swift
//  CocoaMVC
//
//  Created by 佐藤賢 on 2019/01/13.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    var myModel: Model? {
        didSet {
            // ViewとModelとを結合し、Modelの監視を開始する
        }
    }

    private(set) lazy var myView: View = View()

    override func loadView() {
        view = myView
    }

    deinit {
        myModel?.notificationCenter.removeObserver(self)
    }
    private func registerModel() {
        guard let model = myModel else { return }

        myView.label.text = model.count.description

        myView.minusButton.addTarget(self, action: #selector(onMinusTapped), for: .touchUpInside)
        myView.plusButton.addTarget(self, action: #selector(onPlusTapped), for: .touchUpInside)

        model.notificationCenter
            .addObserver(forName: .init(rawValue: "count"), object: nil, queue: nil, using:
                { [unowned self] notification in
                    if let count = notification.userInfo?["count"] as? Int {
                        self.myView.label.text = "\(count)"
                    }

            })
    }

    @objc func onMinusTapped() { myModel?.countDown() }
    @objc func onPlusTapped() { myModel?.countUp() }
}
