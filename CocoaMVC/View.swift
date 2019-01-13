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
    
    let label = UILabel()
    let minusButton = UIButton()
    let plusButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        return nil
    }

    private func setSubviews() {

        addSubview(label)
        addSubview(minusButton)
        addSubview(plusButton)

        label.textAlignment = .center

        label.backgroundColor = .blue
        minusButton.backgroundColor = .red
        plusButton.backgroundColor = .green

        minusButton.setTitle("-1", for: .normal)
        plusButton.setTitle("+1", for: .normal)

    }

    private func setLayout() {

        label.translatesAutoresizingMaskIntoConstraints = false
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        minusButton.translatesAutoresizingMaskIntoConstraints = false

        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: minusButton.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: plusButton.topAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: minusButton.heightAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: plusButton.heightAnchor).isActive = true
        minusButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        plusButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        minusButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        minusButton.rightAnchor.constraint(equalTo: plusButton.leftAnchor).isActive = true
        plusButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        minusButton.widthAnchor.constraint(equalTo: plusButton.widthAnchor).isActive = true

    }

}
