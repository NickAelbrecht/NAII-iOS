//
//  SpierViewController.swift
//  MPT
//
//  Created by Nick Aelbrecht on 04/01/2019.
//  Copyright © 2019 Nick Aelbrecht. All rights reserved.
//

import UIKit

class SpierViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    let spieren = ["Borst", "Rug", "Bicep","Tricep", "Schouder", "Buik", "Quadriceps", "Hamstring","Kuit","Alle"]
    
    let afbeeldingen:[UIImage] = [
        UIImage(named: "borst")!,
        UIImage(named: "rug")!,
        UIImage(named: "bicep")!,
        UIImage(named: "tricep")!,
        UIImage(named: "schouder")!,
        UIImage(named: "buik")!,
        UIImage(named: "quads")!,
        UIImage(named: "hamstring")!,
        UIImage(named: "kuit")!,
        UIImage(named: "alle")!,
        
    ]

    @IBOutlet weak var spierenCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Deze klasse toewijzen als bron van data en ook dat deze het proces 'delegeert'
        spierenCollectionView.dataSource = self
        spierenCollectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spieren.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //voor elk item van de array het label en image aanpassen
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.spierLabel.text = spieren[indexPath.item]
        cell.spierAfbeelding.image = afbeeldingen[indexPath.item]
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        let nav = segue.destination as! UINavigationController        
        if (segue.identifier == "naarOefeningen") {
            let oefeningenViewController = nav.viewControllers[1] as! OefeningenViewController
            var categorie = ""
            let cell = sender as! CollectionViewCell
            categorie = cell.spierLabel.text!
            oefeningenViewController.categorie = categorie
        }
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
