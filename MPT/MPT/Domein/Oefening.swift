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

public struct Oefening {
    public var naam:String
    public var categorie:String
    public var details:String
    public var moeilijkheidsgraad:Int
    
    
    static func laadOefeningenVanDisk() -> [Oefening]?{
        
        var oefeningen:[Oefening] = []
        let container = try! Container()
        let oefeningenQuery = container.valuesZonderQuery(Oefening.self)
        print("Oefeningenquery", oefeningenQuery)
        for oefObj in oefeningenQuery.results {
            let oef = Oefening(naam: oefObj.naam, categorie: oefObj.categorie, details: oefObj.details, moeilijkheidsgraad:oefObj.moeilijkheidsgraad)
            oefeningen.append(oef)
            try! container.write{
                tranaction in tranaction.add(oef, update: true)
            }
        }
        
        
        
        
        return oefeningen;
        
    }
    static func voegOefeningenEenKeerToe(){
        let container = try! Container()
        for oef in laadStandaardOefeningen(){
            try! container.write{
                tranaction in tranaction.add(oef, update: true)
            }
        }
        
    }
    
    static func laadStandaardOefeningen() -> [Oefening]{
        var oefeningen:[Oefening] = []
        
        var oef = Oefening(naam: "Dumbell Bench press", categorie: "Borst", details: """
            1. Start met het pakken van de dumbbels met het gewicht dat je aankan, houdt deze aan de zijkant van je lichaam en ga dan zitten op het trainingsbankje
            2. Til de gewichten op je benenLeun achterover en houdt de dumbbels op je borst en breng je ellebogen aan de zijkant van je lichaam en houdt de dumbells iets hoger dan de hoogte van  je borstkas.
            3. Duw nu de dumbbells naar boven en naar elkaar toe zodat ze recht boven je borst eindigen.
            4 .Span je borstspieren aan op het moment dat je de dumbells boven je hebt.Laat de dumbells langzaam en gecontroleerd zakken, laat de zwaartekracht niet het werk doen, nu ben je weer bij de begin positie.
            """,moeilijkheidsgraad:5)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Deadlift", categorie: "Rug", details: """
         1.   Ga met je benen op schouderbreedte bij de barbell staan.
         2.   Squat met een rechte rug naar beneden
         3.   Pak de barbell iets breder dan schouderbreedte vast.
         4.   Als je onderarmen niet sterk genoeg zijn, gebruik dan lifting straps.
         5.   Leun niet over de stang.
         6.   Houd je hoofd omhoog en til de stang op.
         7.   Druk je heupen naar voren wanneer de stang op kniehoogte is.
         8.   Trek je schouders naar achteren als je het gewicht helemaal hebt opgetild.
         9.   Laat het gewicht weer zakken door middel van door je knieën te gaan.
        """,moeilijkheidsgraad:5)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Front Squat", categorie: "Quadriceps", details: """
        1. Plaats een barbell in het squatrek en plaats daar het gewicht op
        2. De barbell plaats je onder schouderhoogte
        3. Ga onder de barbell staan met je voeten op schouderbreedte
        4. Plaats de barbell op je schouders. Kruis je armen en houd de barbell vast met je handen.
        5. Dit is de beginpositie van de oefening
        6. Ga iets door je knieeen zakken en let op dat je rug recht blijft
        7. Haal het gewicht van het rek af.
        8. Doe 1 stap achteruit
        9. Blijf vooruit kijken en zak gecontroleerd naar beneden.
        10. Zak totdat je paralel komt met de vloer en ga dan pas omhoog.
        11. Zorg ervoor dat je knieeen niet op slot gaan als je weer boven bent.
        12. Herhaal voor het gewenste aantal herhalingen

    """,moeilijkheidsgraad:5)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Bicep curl", categorie: "Bicep", details: """
    1. Ga zittend of staan, afhankelijk welke variant je van de dumbbell curls wilt uitvoeren met in beide handen een dumbbell.
    2. De dumbbells dienen je lichaam niet te raken als je ze vasthoudt.
    3. De handpalmen moeten naar binnen wijzen.
    4. Curl de dumbbell langzaam omhoog, zo ver mogelijk.
    5. Knijp de biceps bovenin samen. En laat de dumbbells gecontroleerd weer terugzakken.
    6. Herhaal voor het gewenste aantal reps.
    """,moeilijkheidsgraad:3)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Tricep pushdown", categorie: "Tricep", details: """
    1. Stel de pulley hoog in en bevestig het touw. Dit zijn de benodigdheden voor deze oefening.
    2. Houd je rug recht en leun iets voorover en pak het touw overhands vast met de handpalmen naar beneden toe gericht.
    3. Je bovenarmen en ellebogen houd je in je zij en je onderarmen dienen parallel te staan met de grond.
    4. Duw het touw naar beneden totdat je beide armen gestrekt zijn.
    5. Houd hier het gewicht even vast en breng vervolgens het gewicht weer terug naar de beginpositie.
    6. Herhaal voor het gewenste aantal reps.
    """,moeilijkheidsgraad:3)
        oefeningen.append(oef)
        
        
        oef = Oefening(naam: "Military press", categorie: "Schouder", details: """

    1. Stel het gewicht dat je wilt gebruiken op de barbell.
    2. Ga met je gezicht richting de barbell staan met je voeten op schouderbreedte.
    3. Pak de barbell overhands vast
    4. Terwijl je je rug recht houdt til je de barbell op tot boven je schouders en vervolgens boven je hoofd. Dit is de startpositie van de oefening.
    5. Laat daarna het gewicht gecontroleerd zakken tot vlak boven je borst.
    6. Als je daarna uitstoot zorg ervoor dat je ellebogen niet op slot gaan.
    """,moeilijkheidsgraad:4)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Hamstring curl", categorie: "Hamstring", details: """
    1. Ga zitten op de seated leg curl machine
    2. Stel de steunen zo in dat ze boven je enkels uitkomen
    3. Stel het gewenste gewicht in
    4. Breng het gewicht iets omhoog met je benen, zodat je hamstrings onder spanning komen te staan
    5. Dit is de beginpositie van de oefening
    6. Duw met je enkels het gewicht helemaal naar beneden
    7. Houd het gewicht hier een seconde vast
    8. Laat vervolgens het gewicht gecontroleerd weer zakken naar de beginpositie
    9. Houd de spanning op je hamstrings
    10. Herhaal voor het gewenste aantal reps
    
    """,moeilijkheidsgraad:2)
        oefeningen.append(oef)
        
        oef = Oefening(naam: "Calves press", categorie: "Kuit", details: """
    1. Plaats de voeten onderop de afzetplaat iets smaller dan schouderbreedte.
    2. Zorg voor een goede lig positie met de rug aangesloten op het kussen.
    3. De bal van de voeten staan op de afzetplaat de rest van de voet dus niet.
    4. Duw het gewicht weg en strek de benen (houdt de knieën ligt gebogen).
    5. Verplaats nu het gewicht met de benen gestrekt, door alleen met de bal van de voet te duwen (voetzoolflexie).
    6. Verplaats nu het gewicht weer naar beneden en rek de kuitspier weer goed op.
    7. Herhaal deze beweging vervolgens voor het gewenste aantal herhalingen.
    """,moeilijkheidsgraad:2)
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
        case details(String)
        case moeilijkheidsgraad(Int)
        
        public var propertyValuePair: PropertyValuePair {
            switch self {
            case .naam(let naam):
                return ("naam", naam)
            case .categorie(let cat):
                return ("categorie", cat)
            case .details(let det):
                return ("details", det)
            case .moeilijkheidsgraad(let moeilijkheidsgraad):
                return ("moeilijkheidsgraad", moeilijkheidsgraad)
                
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





