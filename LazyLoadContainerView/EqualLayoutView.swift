//
//  EqualLayoutView.swift
//  LazyLoadContainerView
//
//  Created by wangqiang li on 8/16/16.
//  Copyright © 2016 Bruce Li. All rights reserved.
//

import UIKit

class SizeMatchView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.subviews.forEach { $0.frame = bounds }
    }

}
