//
//  Oefening.swift
//  MPT
//
//  Created by Nick Aelbrecht on 04/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

struct Oefening:Codable {
    public var naam:String
    public var categorie:String
    public var details:String
    public var moeilijkheidsgraad:Int
    
    
    static func laadOefeningenVanDisk() -> [Oefening]?{
        
        var oefeningen:[Oefening] = laadStandaardOefeningen() //[]
        let container = try! Container()
        let oefeningenQuery = container.valuesZonderQuery(Oefening.self)
        var oef:Oefening
        for oefObj in oefeningenQuery.results {
            oef = Oefening(naam: oefObj.naam, categorie: oefObj.categorie, details: oefObj.categorie, moeilijkheidsgraad:oefObj.moeilijkheidsgraad)
            oefeningen.append(oef)
        }
        
        
        return oefeningen;
        
    }
    
    static func laadStandaardOefeningen() -> [Oefening]{
        var oefeningen:[Oefening] = []
        
        var oef = Oefening(naam: "Bench press", categorie: "Borst", details: "Uitleg over bench",moeilijkheidsgraad:5)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Deadlift", categorie: "Rug", details: "Uitleg over deadlift",moeilijkheidsgraad:5)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Squat", categorie: "Quadricep", details: "Uitleg over squat",moeilijkheidsgraad:5)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Bicep curl", categorie: "Bicep", details: "Uitleg over bicep curl",moeilijkheidsgraad:3)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Tricep pushdown", categorie: "Tricep", details: "Uitleg over tricep pushdown",moeilijkheidsgraad:3)
        oefeningen.append(oef)
        
        
        oef = Oefening(naam: "Military press", categorie: "Schouder", details: "Uitleg over military press",moeilijkheidsgraad:4)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Hamstring curl", categorie: "Hamstring", details: "Uitleg over hamstring curl",moeilijkheidsgraad:2)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Calves press", categorie: "Kuit", details: "Uitleg over calves press",moeilijkheidsgraad:2)
        oefeningen.append(oef)
        
        return oefeningen
    }
    
    
}


extension Oefening: Persistable {
    
    public init(managedObject: OefeningObject) {
        naam = managedObject.naam
        categorie = managedObject.categorie
        details = managedObject.details
        moeilijkheidsgraad = managedObject.moeilijkheidsgraad
    }
    public func managedObject() -> OefeningObject {
        let oef = OefeningObject()
        oef.naam = naam
        oef.categorie = categorie
        oef.details = details
        oef.moeilijkheidsgraad = moeilijkheidsgraad
        return oef
    }
}

extension Oefening {
    
    public enum PropertyValue: PropertyValueType {
        case naam(String)
        case categorie(String)
        
        
        public var propertyValuePair: PropertyValuePair {
            switch self {
            case .naam(let naam):
                return ("naam", naam)
            case .categorie(let cat):
                return ("categorie", cat)
                
            }
        }
    }
}

extension Oefening {
    
    public enum Query: QueryType {
        case oefeningNaam(String)
        
        public var predicate: NSPredicate? {
            switch self {
            case .oefeningNaam(let value):
                return NSPredicate(format: "oefening.naam ==[c] %@", value)
            }
        }
        
        public var sortDescriptors: [SortDescriptor] {
            return [SortDescriptor(keyPath: "naam")]
        }
    }
}





