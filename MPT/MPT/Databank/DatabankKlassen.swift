//
//  DatabankKlassen.swift
//  MPT
//
//  Created by Nick Aelbrecht on 15/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import RealmSwift

// Klasse voor oefening toe te voegen aan de databank



// Implement the Container
public final class Container {
    private let realm: Realm
    public convenience init() throws {
        try self.init(realm: Realm())
    }
    internal init(realm: Realm) {
        self.realm = realm
    }
    //    Oefening toevoegen aan de databank
    public func write(_ block: (WriteTransaction) throws -> Void) throws {
        let transaction = WriteTransaction(realm: realm)
        try realm.write {
            try block(transaction)
        }
    }
    //    Oefening ophalen uit de databank
    public func values<T: Persistable> (_ type: T.Type, matching query: T.Query) -> FetchedResults<T> {
        var results = realm.objects(T.ManagedObject.self)
        
        if let predicate = query.predicate {
            results = results.filter(predicate)
        }
        
        results = results.sorted(by: query.sortDescriptors)
        
        return FetchedResults(results: results)
    }
    
    public func valuesZonderQuery<T: Persistable> (_ type: T.Type) -> FetchedResults<T> {
        let results = realm.objects(T.ManagedObject.self)
        
        
        
        return FetchedResults(results: results)
    }
    
    
    
}





