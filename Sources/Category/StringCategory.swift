//
//  StringCategory.swift
//  WKBaseServicesSwift
//
//  Created by 郭伟坤 on 16/7/19.
//  Copyright © 2016年 郭伟坤. All rights reserved.
//

import Foundation
import CCommonCrypto

extension String {
    
    /// 字符串长度
    public var lenght: Int {
        get {
            return self.characters.count
        }
    }
    
    
    /// url 转码
    public var urlEscaped: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet()) ?? ""
    }
    
    
    /**
     日期值
     
     - parameter formatterStyle: 格式化风格 如： yyyy-MM-dd HH:mm:ss
     
     - returns: NSDate 
     */
    public func dateValue(formatterStyle: String) -> NSDate? {
        let formatter = NSDateFormatter()
//        formatter.locale = NSLocale.cnLocal()
        formatter.dateFormat = formatterStyle
        return formatter.dateFromString(self)
    }
    
    
    /// 汉字转拼音
    ///
    /// - Returns: 拼音
    public func pinyin() -> String? {
        //转成了可变字符串
        let str = NSMutableString(string: self)
        //先转换为带声调的拼音
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformMandarinLatin, false)
        //再转换为不带声调的拼音
        CFStringTransform(str as CFMutableStringRef, nil, kCFStringTransformStripDiacritics, false);
        return str.lowercaseString;
    }
    
    
    /// MD5 加密
    public var md5: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_MD5(str!, strLen, result)
        return stringFromBytes(result, length: digestLen)
    }
    
    
    /// sha1 加密
    public var sha1: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_SHA1(str!, strLen, result)
        return stringFromBytes(result, length: digestLen)
    }
    
    
    /// sha256 加密
    public var sha256String: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_SHA256_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_SHA256(str!, strLen, result)
        return stringFromBytes(result, length: digestLen)
    }
    
    
    /// sha512 加密
    public var sha512String: String! {
        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
        let strLen = CC_LONG(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
        let digestLen = Int(CC_SHA512_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
        CC_SHA512(str!, strLen, result)
        return stringFromBytes(result, length: digestLen)
    }

    func stringFromBytes(bytes: UnsafeMutablePointer<CUnsignedChar>, length: Int) -> String{
        let hash = NSMutableString()
        for i in 0..<length {
            hash.appendFormat("%02x", bytes[i])
        }
        bytes.dealloc(length)
        return String(format: hash as String)
    }
    

}
