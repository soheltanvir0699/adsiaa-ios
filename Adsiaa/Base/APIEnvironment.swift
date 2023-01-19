//
//  APIEnvironment.swift
//  Adsiaa
//
//  Created by appleguru on 29/10/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import Foundation

enum APIEnvironment {
    case staging
    case production
}


extension APIEnvironment {
    
    static var baseURL = "http://127.0.0.1:8000"
    
}
