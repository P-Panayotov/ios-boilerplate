//
//  ViewController.swift
//  FireAppBoilerplate
//
//  Created by Panayot Panayotov on 31/01/2017.
//  Copyright © 2017 Panayot Panayotov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        API.exampleRequestNoParams { (mappedObject, error) in
            Console.log(mappedObject ?? "no mapped object", error ?? "error free")
            Console.debug(mappedObject ?? error ?? "nothing to debug")
        }
        
        API.exampleRequestWithParams { (mappedObject, error) in
            Console.log(mappedObject ?? "no mapped object", error ?? "error free")
            Console.debug(mappedObject ?? error ?? "nothing to debug")
        }
    }


}
