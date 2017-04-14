//
//  ContainerViewController.swift
//  LazyLoadContainerView
//
//  Created by wangqiang li on 8/9/16.
//  Copyright © 2016 Bruce Li. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, SegueHandlerType {
    
    enum SegueIdentifier: String {
        case LeftContainerSegue
        case RightContainerSegue
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ContainerViewController: viewDidLoad")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segueIdentifierFrom(segue.identifier) {
        case .LeftContainerSegue:
            print("LeftContainerSegue")
        case .RightContainerSegue:
            print("RightContainerSegue")
        }
    }

}
