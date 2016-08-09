//
//  ViewController.swift
//  LazyLoadContainerView
//
//  Created by wangqiang li on 8/5/16.
//  Copyright © 2016 Bruce Li. All rights reserved.
//

import UIKit

class RightViewController: UIViewController, SegueHandlerType {
    
    enum SegueIdentifier: String {
        case BrownSegue
        case CyanSegue
        case PurpleSegue
    }

    
    var brownViewController: UIViewController?
    var purpleViewController: UIViewController?
    var cyanViewController: UIViewController?
    
    var currentViewController: UIViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("RightViewController: viewDidLoad")
    }
    
    override func didReceiveMemoryWarning() {
        
        // Fix ME: more better way to release sub view controller
        if brownViewController != currentViewController {
            brownViewController?.view.removeFromSuperview()
            brownViewController = nil
        }
        if purpleViewController != currentViewController {
            purpleViewController?.view.removeFromSuperview()
            purpleViewController = nil
        }
        if cyanViewController != currentViewController {
            cyanViewController?.view.removeFromSuperview()
            cyanViewController = nil
        }
    }
    
    @IBAction func clickCyanButton(sender: UIButton) {
        if cyanViewController == nil {
            performSegue(.CyanSegue)
        }
        self.cyanViewController?.view.hidden = false
        self.purpleViewController?.view.hidden = true
        self.brownViewController?.view.hidden = true
        currentViewController = cyanViewController
    }
    
    @IBAction func clickBrownButton(sender: UIButton) {
        if brownViewController == nil {
            performSegue(.BrownSegue)
        }
        self.cyanViewController?.view.hidden = true
        self.purpleViewController?.view.hidden = true
        self.brownViewController?.view.hidden = false
        currentViewController = brownViewController
    }
    
    @IBAction func clickPurpleButton(sender: UIButton) {
        if purpleViewController == nil {
            performSegue(.PurpleSegue)
        }
        self.cyanViewController?.view.hidden = true
        self.purpleViewController?.view.hidden = false
        self.brownViewController?.view.hidden = true
        currentViewController = purpleViewController
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        switch segueIdentifierFrom(segue.identifier) {
        case .BrownSegue:
            brownViewController = segue.destinationViewController
            print("BrownSegue")
        case .CyanSegue:
            cyanViewController = segue.destinationViewController
            print("CyanSegue")
        case .PurpleSegue:
            purpleViewController = segue.destinationViewController
            print("PurpleSegue")
        }
    }
    
//    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
//        switch segueIdentifierFrom(identifier) {
//        case .BrownSegue:
//            return false
//        case .CyanSegue:
//            return false
//        case .PurpleSegue:
//            return false
//        }
//    }
}

