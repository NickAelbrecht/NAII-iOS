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
        spierenCollectionView.dataSource = self
        spierenCollectionView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return spieren.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.spierLabel.text = spieren[indexPath.item]
        cell.spierAfbeelding.image = afbeeldingen[indexPath.item]
        
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