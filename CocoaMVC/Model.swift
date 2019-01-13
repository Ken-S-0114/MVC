//
//  Model.swift
//  CocoaMVC
//
//  Created by 佐藤賢 on 2019/01/13.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import Foundation

final class Model {
    let notificationCenter = NotificationCenter()
    private(set) var count = 0 {
        didSet {
            notificationCenter.post(name: .init(rawValue: "count"),
                                    object: nil,
                                    userInfo: ["count": count])
        }
    }

    func countDown() { count -= 1 }
    func countUp() { count += 1 }
}
