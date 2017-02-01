//
//  Console.swift
//  FireAppBoilerplate
//
//  Created by Panayot Panayotov on 31/01/2017.
//  Copyright © 2017 Panayot Panayotov. All rights reserved.
//

import UIKit

class Console: NSObject {
    
    static func log(_ items: Any..., separator: String = " ", terminator: String = "\n", line:Int = #line, file:NSString = #file) {
        #if DEBUG
            // remove  .swift from file name
            var fileName = file.lastPathComponent
            fileName = fileName.substring(to: fileName.index(fileName.endIndex, offsetBy: -6))
            
            Swift.print("<<< \(fileName):\(line) >>> \(items[0])" , separator:separator, terminator: terminator)
        #endif
    }
    
    static func debug(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
            // only print if in debug build
            Swift.debugPrint(items[0], separator: separator, terminator: terminator)
        #endif
    }
}
