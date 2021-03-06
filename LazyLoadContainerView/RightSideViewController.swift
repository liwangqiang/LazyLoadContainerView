//
//  ViewController.swift
//  LazyLoadContainerView
//
//  Created by wangqiang li on 8/5/16.
//  Copyright © 2016 Bruce Li. All rights reserved.
//

import UIKit

class RightSideViewController: LogViewController, SegueHandlerType {
    
    @IBOutlet var container: UIView!    // its dynamic type is SizeMatchView 
    
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
        
        /// 没有storyboard的container view也可以perform embbed segue, 且会自动加上 container view + vc.view
    }
    
    @IBAction func clickCyanButton(sender: UIButton) {
        if cyanViewController == nil {
            performSegue(.CyanSegue)
        }
        if let vc = cyanViewController {
            showViewController(vc)
        }
    }
    
    @IBAction func clickBrownButton(sender: UIButton) {
        if brownViewController == nil {
            performSegue(.BrownSegue)
        }
        if let vc = brownViewController {
            showViewController(vc)
        }
    }
    
    @IBAction func clickPurpleButton(sender: UIButton) {
        if purpleViewController == nil {
            performSegue(.PurpleSegue)
        }
        if let vc = purpleViewController {
            showViewController(vc)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // let _ = segue.destinationViewController.view
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
    
    /// 这里来控制一开始是否执行embbed segue
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        switch segueIdentifierFrom(identifier) {
        case .BrownSegue:
            return false
        case .CyanSegue:
            return false
        case .PurpleSegue:
            return false
        }
    }

    func showViewController(vc: UIViewController) {
        guard vc != currentViewController else {
            return
        }
        
        self.childViewControllers.forEach {
            if $0 != vc {
                $0.view.superview?.hidden = true
            } else {
                $0.view.superview?.hidden = false
            }
        }
        
        let lastViewController = currentViewController
        
        vc.beginAppearanceTransition(true, animated: false)
        vc.endAppearanceTransition()
        
        lastViewController?.beginAppearanceTransition(false, animated: false)
        lastViewController?.endAppearanceTransition()
        
        currentViewController = vc
    }
}
