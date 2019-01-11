//
//  OefeningenViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 04/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

class OefeningenViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
        var oefeningen = [Oefening]()
        var categorie:String = ""
    
    
    @IBOutlet weak var navigatieTitel: UINavigationItem!
    
    @IBOutlet weak var oefeningenCollectieView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("categorienaam: " + categorie)
      self.navigationItem.title = categorie
        
        if let opgeslagenOefeningen = Oefening.laadOefeningenVanDisk(){
            oefeningen = opgeslagenOefeningen
        }else{
            oefeningen = Oefening.laadStandaardOefeningen()
        }
        
        oefeningenCollectieView.dataSource = self
        oefeningenCollectieView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oefeningen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oefeningCell", for: indexPath) as! OefeningenCollectionViewCell
        cell.oefeningDetailLabel.text = oefeningen[indexPath.item].details
        cell.oefeningNaamLabel.text = oefeningen[indexPath.item].naam
        return cell
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
