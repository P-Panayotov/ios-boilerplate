//
//  BaseRequest.swift
//  FireAppBoilerplate
//
//  Created by Panayot Panayotov on 31/01/2017.
//  Copyright © 2017 Panayot Panayotov. All rights reserved.
//

import UIKit
import Alamofire

protocol BaseRequest {
    var path:String { get }
    var method:HTTPMethod { get }
    var headres:HTTPHeaders { get }
    var parameters:Parameters { get }
}

extension BaseRequest {
    var path:String { return "" }
    var method:HTTPMethod { return .get }
    var headres:HTTPHeaders { return [:] }
    var parameters:Parameters { return [:] }
}
