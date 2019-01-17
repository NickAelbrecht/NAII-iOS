//
//  WriteTransaction.swift
//  MPT
//
//  Created by Nick Aelbrecht on 17/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import RealmSwift

public final class WriteTransaction {
    private let realm: Realm
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func add<T: Persistable>(_ value: T, update: Bool) {
        realm.add(value.managedObject(), update: update)
    }
    
    public func add<T: Sequence>(_ values: T, update: Bool = false) where T.Iterator.Element: Persistable {
        values.forEach { add($0, update: update) }
    }
    
    public func delete<T: Persistable>(_ value: T) {
        realm.delete(value.managedObject())
    }
    
    public func delete<T: Sequence>(_ values: T) where T.Iterator.Element: Persistable {
        realm.delete(values.map { $0.managedObject() })
    }
    
    public func update<T: Persistable>(_ type: T.Type, values: [T.PropertyValue]) {
        var dictionary: [String: Any] = [:]
        
        values.forEach {
            let pair = $0.propertyValuePair
            dictionary[pair.name] = pair.value
        }
        
        realm.create(T.ManagedObject.self, value: dictionary, update: true)
    }
}
