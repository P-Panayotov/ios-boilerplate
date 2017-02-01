//
//  API.swift
//  FireAppBoilerplate
//
//  Created by Panayot Panayotov on 31/01/2017.
//  Copyright © 2017 Panayot Panayotov. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class API: NSObject {
    
    static var baseURL = "https://www.google.com"
    
    static func exampleRequestNoParams(completed:@escaping ((_ response:BaseResponse?, _ error:Error?)->Void)){
        // this would be GET request with no parameteres
        API.request(request: ExampleRequest.noParameters) { (response, error) in
            completed(response, error)
        }
    }
    
    static func exampleRequestWithParams(completed:@escaping ((_ response:BaseResponse?, _ error:Error?)->Void)){
        // this would be POST request with the below parameters
        API.request(request: ExampleRequest.withParameters(params: ["Username":"M@st3rM1nd", "Password":"Test1234"])) { (response, error) in
            completed(response, error)
        }
    }
    
}

extension API {
    fileprivate static func request<T:Mappable>(request:BaseRequest, completed:((_ mappedObject:T?, _ error:Error?)->Void)? = nil) {
        let request = Alamofire.request(API.baseURL + request.path, method: request.method, parameters: request.parameters, headers: request.headres)
            .validate(statusCode: 200 ... 300)
            .responseObject { (response:DataResponse<T>) in
                
                if let error = response.error as? AFError {
                    switch error {
                    case .invalidURL(let url):
                        Console.log("Invalid URL: \(url) - \(error.localizedDescription)")
                    case .parameterEncodingFailed(let reason):
                        Console.log("Parameter encoding failed: \(error.localizedDescription)")
                        Console.log("Failure Reason: \(reason)")
                    case .multipartEncodingFailed(let reason):
                        Console.log("Multipart encoding failed: \(error.localizedDescription)")
                        Console.log("Failure Reason: \(reason)")
                    case .responseValidationFailed(let reason):
                        Console.log("Response validation failed: \(error.localizedDescription)")
                        Console.log("Failure Reason: \(reason)")
                        
                        switch reason {
                        case .dataFileNil, .dataFileReadFailed:
                            Console.log("Downloaded file could not be read")
                        case .missingContentType(let acceptableContentTypes):
                            Console.log("Content Type Missing: \(acceptableContentTypes)")
                        case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                            Console.log("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
                        case .unacceptableStatusCode(let code):
                            Console.log("Response status code was unacceptable: \(code)")
                        }
                    case .responseSerializationFailed(let reason):
                        Console.log("Response serialization failed: \(error.localizedDescription)")
                        Console.log("Failure Reason: \(reason)")
                    }
                    
                    Console.log("Underlying error: \(error.underlyingError)")
                } else if let error = response.error as? URLError {
                    Console.log("URLError occurred: \(error)")
                } else {
                    Console.log("Unknown error: \(response.error)")
                }
                
                completed?(response.result.value, response.error)
        }
        Console.debug(request)
    }
}
