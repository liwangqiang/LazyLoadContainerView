//
//  SegueHandlerType.swift
//  LazyLoadContainerView
//
//  Created by wangqiang li on 8/5/16.
//  Copyright © 2016 Bruce Li. All rights reserved.
//

import UIKit

protocol SegueHandlerType {
    associatedtype SegueIdentifier: RawRepresentable
}

extension SegueHandlerType where Self: UIViewController, SegueIdentifier.RawValue == String {
    
    func performSegue(segueIdentifier: SegueIdentifier) {
        self.performSegueWithIdentifier(segueIdentifier.rawValue, sender: self)
    }
    
    func segueIdentifierFrom(identifier: String?) -> SegueIdentifier {
        guard let identifier = identifier, let segueIdentifier = SegueIdentifier(rawValue: identifier) else {
            fatalError("No available segue identifier")
        }
        return segueIdentifier
    }
    
}