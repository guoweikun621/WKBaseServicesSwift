//
//  NSDecimalNumberCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import UIKit

extension NSDecimalNumber {
    
    /**
     是否等于0
     
     - returns: true or false
     */
    public func isEqualZero() -> Bool {
        return self.compare(NSDecimalNumber.zero()) == .OrderedSame
    }
    
    /**
     是否小于0
     
     - returns: true or false
     */
    public func isLessThanZero() -> Bool {
        return self.compare(NSDecimalNumber.zero()) == .OrderedAscending
    }
    
    /**
     是否小于等于0
     
     - returns: true or false
     */
    public func isLessThanAndEqualZero() -> Bool {
        return self.compare(NSDecimalNumber.zero()) != .OrderedDescending
    }
    
    /**
     是否大于0
     
     - returns: true or false
     */
    public func isGreaterThanZero() -> Bool {
        return self.compare(NSDecimalNumber.zero()) == .OrderedDescending
    }
    
    /**
     是否大于等于0
     
     - returns: true or false
     */
    public func isGreaterThanAndEqualZero() -> Bool {
        return self.compare(NSDecimalNumber.zero()) != .OrderedAscending
    }
}
