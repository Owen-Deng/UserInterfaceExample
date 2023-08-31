//
//  CollectionViewController.swift
//  UserInterfaceExample
//
//  Created by Owen on 8/29/23.
//

import UIKit

private let reuseIdentifier = "CollectCell"

class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    lazy var imageModel = {return ImageModel.sharedInstance()}()

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // return the number of items
        return self.imageModel.numberOfImages()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? CollectionViewCell {
            
            //no need to cast
            //if let name = self.imageModel.getImageName(for: indexPath.row) as? String{
            
            var name = self.imageModel.getImageName(for: indexPath.row)
            cell.imageView.image = self.imageModel.getImageWithName(name)
            
            return cell
        }else{
            fatalError("Could not dequeue cell")
        }
    }

}
