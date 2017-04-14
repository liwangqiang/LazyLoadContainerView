//
//  LogViewController.swift
//  LazyLoadContainerView
//
//  Created by wangqiang li on 8/9/16.
//  Copyright © 2016 Bruce Li. All rights reserved.
//

import UIKit

class LogViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("\(NSStringFromClass(type(of: self))): viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("\(NSStringFromClass(type(of: self))): viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("\(NSStringFromClass(type(of: self))): viewWillDisappear")
    }
}


class CyanVC: LogViewController {}

class PurpleVC: LogViewController {}

class BrownVC: LogViewController {}

class LeftSideVC: LogViewController {}
