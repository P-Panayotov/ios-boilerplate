//
//  StandardRequest.swift
//  FireAppBoilerplate
//
//  Created by Panayot Panayotov on 31/01/2017.
//  Copyright © 2017 Panayot Panayotov. All rights reserved.
//

import UIKit
import Alamofire

enum ExampleRequest: BaseRequest {
    case noParameters
    case withParameters(params:Parameters)
    
    var path:String {
        return "/some/api/path"
    }
}

extension ExampleRequest {
    
    var parameters:Parameters {
        switch self {
        case .withParameters(let parameters):
            return parameters
        default:
            return [:]
        }
    }
    
    var method:HTTPMethod {
        switch self {
        case .withParameters:
            return.post
        default:
            return .get
        }
    }
}
