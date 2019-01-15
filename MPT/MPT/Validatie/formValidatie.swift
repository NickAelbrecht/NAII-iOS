//
//  formValidatie.swift
//  MPT
//
//  Created by Nick Aelbrecht on 15/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation

class formValidatie{
    func isValidNaamOefening(_ value: String) -> Bool {
        if(!value.isEmpty && value.count >= 5){
            return true
        }
        else{
            return false
        }
    }
    
    func isValidUitlegOefening(_ value: String) -> Bool {
        if(!value.isEmpty && value.count >= 15){
            return true
        }else{
            return false
        }
    }
    
    func isValidMoeilijkheidOefening(_ value: Int) -> Bool {
        if(value > 0 && value <= 5){
            return true
        }else{
            return false
        }
    }
}
