//
//  Model.swift
//  MVC
//
//  Created by 佐藤賢 on 2019/01/13.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import Foundation

final class Model {
    // NotificationCenter: 更新を複数のオブジェクトに通知する
    let notificationCenter = NotificationCenter()
    private(set) var count = 0 {
        didSet {
            // Observer パターンを用いて，自分自身の状態の変化に関連する View に通知する．
            notificationCenter.post(name: .init(rawValue: "count"),
                                    object: nil,
                                    userInfo: ["count": count])
        }
    }
    
    func countDown() { count -= 1 }
    func countUp() { count += 1 }
}
