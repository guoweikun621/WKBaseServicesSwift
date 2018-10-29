//
//  File.swift
//  WKBaseServicesSwift
//
//  Created by guowk on 2018/9/21.
//  Copyright © 2018年 郭伟坤. All rights reserved.
//

import Foundation

extension Array {
    
    /// 剔除数组中重复的元素
    ///
    /// - Parameter filter: 去重方式Closure
    /// - Returns: 返回已去重的数组
    func wk_filterRepeat<E: Hashable>(_ filter: (Element) -> E) -> [Element] {
        var result = [Element]()
        var keySet: Set<E> = []
        for value in self {
            let key = filter(value)
            if !keySet.contains(key) {
                keySet.insert(key)
                result.append(value)
            }
        }
        return result
    }
    
    
}

extension Array where Array.Iterator.Element: Hashable {
    
    /// 合并数组
    ///
    /// - Parameters:
    ///   - other: 被合并的数组
    ///   - combine: 冲突元素Closure， （currentElement, newElement）-> changeElement
    mutating func wk_merge(_ other: [Element], uniquingKeysWith combine: (Element, Element) -> Element) {
        let selfSet = Set<Element>(self)
        other.forEach { (ele) in
            if selfSet.contains(ele) {
                #if swift(>=4.2)
                guard let currentElement = (selfSet.filter { $0 == ele }).first, let idx = firstIndex(of: currentElement) else { return }
                #else
                guard let currentElement = (selfSet.filter { $0 == ele }).first, let idx = index(of: currentElement) else { return }
                #endif
                let changeElement = combine(currentElement, ele)
                replaceSubrange(idx...idx, with: [changeElement])
            }
            else {
                append(ele)
            }
        }
    }
}
