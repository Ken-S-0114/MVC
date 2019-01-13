//
//  Controller.swift
//  MVC
//
//  Created by 佐藤賢 on 2019/01/13.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import Foundation

class Controller {
    weak var myModel: Model?
    // required: View が作成する Controller の型を外から指定できるようにするため
    required init() {}

    @objc func onMinusTapped() {
        myModel?.countDown()
    }

    @objc func onPlusTapped() {
        myModel?.countUp()
    }
}
