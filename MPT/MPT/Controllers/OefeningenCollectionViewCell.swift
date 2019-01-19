//
//  OefeningenCollectionViewCell.swift
//  MPT
//
//  Created by Nick Aelbrecht on 04/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

protocol MyCellDelegate: AnyObject {
    func btnCloseTapped(cell: OefeningenCollectionViewCell)
    func btnOefeningNaam(cell: OefeningenCollectionViewCell)
}

class OefeningenCollectionViewCell: UICollectionViewCell {
//    @IBOutlet weak var oefeningNaamLabel: UILabel!
    @IBOutlet weak var moeilijkheidsgraadLabel: UILabel!
    @IBOutlet weak var oefeningNaamButton: UIButton!
    
    @IBOutlet var deleteButton: UIButton!
    
    weak var delegate: MyCellDelegate?
    
    @IBAction func btnCloseTapped(_ sender: Any) {
//        print("cell tapped button close")
        delegate?.btnCloseTapped(cell: self)
    }
    
    @IBAction func btnOefeningNaam(_ sender: Any) {
        delegate?.btnOefeningNaam(cell: self)
    }
    
    
}


