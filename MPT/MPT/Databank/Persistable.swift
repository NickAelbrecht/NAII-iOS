//
//  Persistable.swift
//  MPT
//
//  Created by Nick Aelbrecht on 17/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    associatedtype PropertyValue: PropertyValueType = DefaultPropertyValue
    associatedtype Query: QueryType = DefaultQuery
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}
    public typealias PropertyValuePair = (name: String, value: Any)
    
    /// Represents a property value
    public protocol PropertyValueType {
        var propertyValuePair: PropertyValuePair { get }
    }
    
    public enum DefaultPropertyValue: PropertyValueType {
        
        public var propertyValuePair: PropertyValuePair {
            return ("", 0)
        }
    }
    
    /// Represents a Query
    public protocol QueryType {
        var predicate: NSPredicate? { get }
        var sortDescriptors: [SortDescriptor] { get }
    }
    
    public enum DefaultQuery: QueryType {
        
        public var predicate: NSPredicate? {
            return nil
        }
        
        public var sortDescriptors: [SortDescriptor] {
            return []
        }
    }
    


