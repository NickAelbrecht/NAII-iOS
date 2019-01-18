//
//  ValidatieError.swift
//  MPT
//
//  Created by Nick Aelbrecht on 18/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation

struct ValidatieError:Error {
    var message: String
    
    init(_ message: String) {
        self.message = message
    }
}
