//
//  formValidatie.swift
//  MPT
//
//  Created by Nick Aelbrecht on 15/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation

class NaamValidatie: ValidatorConvertible{
    
    func isValidMoeilijkheidOefening(_ value: Int) -> Bool {
        if(value > 0 && value <= 5){
            return true
        }else{
            return false
        }
    }
    
    func validated(_ value: String?) throws -> Bool {
        if(!value!.isEmpty && value!.count >= 5){
            return true
        }
        else{
            return false
        }
    }
}

class DetailsValidatie:ValidatorConvertible {
    func validated(_ value: String?) throws -> Bool {
        if(!value!.isEmpty && value!.count >= 15){
            return true
        }else{
            return false
        }
    }
}

class EmailValidatie:ValidatorConvertible {
    func validated(_ value: String?) throws -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: value)
    }
}

class WachtwoordValidatie:ValidatorConvertible {
    func validated(_ value: String?) throws -> Bool {
        if(!value!.isEmpty && value!.count >= 6){
            return true
        }else{
            return false
        }
    }
}

class MoeilijkheidsgraadValidatie:ValidatorConvertible {
    func validated(_ value: String?) throws -> Bool {
        let val:Int? = Int(value ?? String(0))
        if(!value!.isEmpty && val ?? 0 > 0 && val ?? 0 <= 5){
            return true
        }else{
            return false
        }
    }
}


protocol ValidatorConvertible {
    func validated(_ value: String?) throws -> Bool
}

enum ValidatorType {
    case naam
    case details
    case moeilijkheidsgraad
    case email
    case wachtwoord
    
}

enum VaildatorFactory {
    static func validatorFor(type: ValidatorType) -> ValidatorConvertible {
        switch type {
        case .naam: return NaamValidatie() as ValidatorConvertible
        case .details: return DetailsValidatie()
        case .moeilijkheidsgraad: return MoeilijkheidsgraadValidatie()
        case .email: return EmailValidatie()
        case .wachtwoord: return WachtwoordValidatie()
            
        }
    }
}
