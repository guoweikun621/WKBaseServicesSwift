//
//  ArrayTest.swift
//  WKBaseServicesSwift
//
//  Created by guowk on 2018/9/21.
//  Copyright © 2018年 郭伟坤. All rights reserved.
//

import Foundation


class Person {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
}

class Student: Person {
    var studentId: String = ""
    var age: Int = 1
    
    init(name: String, studentId: String, age: Int) {
        self.studentId = studentId
        self.age = age
        super.init(name: name)
    }
    
    
}

extension Student: Equatable {
    static func == (lhs: Student, rhs: Student) -> Bool {
        return lhs.name == rhs.name && lhs.studentId == rhs.studentId
    }
}

extension Student: Hashable {
    var hashValue: Int {
        return (name + studentId).hashValue
    }
}
