//
//  Optional+Extension.swift
//  WKBaseServicesSwift
//
//  Created by guowk on 2018/11/20.
//  Copyright © 2018 郭伟坤. All rights reserved.
//

import Foundation

extension Optional {
    
    /// 可选类型是否为none
    var isNone: Bool {
        switch self {
        case .some(_):
            return false
        case .none:
            return true
        }
    }
    
    /// 可选类型是否为some值
    var isSome: Bool {
        switch self {
        case .some(_):
            return true
        case .none:
            return false
        }
    }
}
