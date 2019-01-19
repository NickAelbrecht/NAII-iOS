//
//  OefeningObject.swift
//  MPT
//
//  Created by Nick Aelbrecht on 15/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

final public class OefeningObject: Object {
    @objc dynamic var naam = ""
    @objc dynamic var categorie = ""
    @objc dynamic var details = ""
    @objc dynamic var moeilijkheidsgraad = 1
    override public static func primaryKey() -> String? {
        return "naam"
    }
    
}
