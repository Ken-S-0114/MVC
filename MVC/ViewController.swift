//
//  ViewController.swift
//  MVC
//
//  Created by 佐藤賢 on 2019/01/14.
//  Copyright © 2019 佐藤賢. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var myView = View()

    override func loadView() {
        view = myView
        view.backgroundColor = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // ここで外部から View に Model を渡しているとイメージ
        myView.myModel = Model()
    }
}
