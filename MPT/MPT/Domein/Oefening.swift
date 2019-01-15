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
    
    
    static func laadOefeningenVanDisk() -> [Oefening]?{
        return nil
    }
    
    static func laadStandaardOefeningen() -> [Oefening]{
        var oefeningen:[Oefening] = []
        
        var oef = Oefening(naam: "Bench press", categorie: "Borst", details: "Uitleg over bench")
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Deadlift", categorie: "Rug", details: "Uitleg over deadlift")
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Squat", categorie: "Quadricep", details: "Uitleg over squat")
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Bicep curl", categorie: "Bicep", details: "Uitleg over bicep curl")
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Tricep pushdown", categorie: "Tricep", details: "Uitleg over tricep pushdown")
        oefeningen.append(oef)
        
        
        oef = Oefening(naam: "Military press", categorie: "Schouder", details: "Uitleg over military press")
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Hamstring curl", categorie: "Hamstring", details: "Uitleg over hamstring curl")
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Calves press", categorie: "Kuit", details: "Uitleg over calves press")
        oefeningen.append(oef)
        
        return oefeningen
    }
    
    
}

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

extension Oefening: Persistable {
    public init(managedObject: OefeningObject) {
        naam = managedObject.naam
        categorie = managedObject.categorie
        details = managedObject.details
    }
    public func managedObject() -> OefeningObject {
        let oef = OefeningObject()
        oef.naam = naam
        oef.categorie = categorie
        oef.details = details
        return oef
    }
}





