//
//  ViewController.swift
//  JrnlApp
//
//  Created by Абзал Айтмолданов on 9/22/20.
//  Copyright © 2020 Абзал Айтмолданов. All rights reserved.
//

import UIKit

struct  Item {
    var Imagename: String
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = UIImage(named: items[indexPath.item].Imagename)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item  = items[indexPath.item]
        performSegue(withIdentifier: viewImageSegueIdentifier, sender: item)
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Item] = [Item(Imagename: "1"),
                        Item(Imagename: "2"),
                        Item(Imagename: "3"),
                        Item(Imagename: "4"),
                        Item(Imagename: "5"),
                        Item(Imagename: "6"),
                        Item(Imagename: "7"),
                        Item(Imagename: "8"),
                        Item(Imagename: "9"),
                        Item(Imagename: "10"),
                        Item(Imagename: "11"),
                        Item(Imagename: "12"),
                        Item(Imagename: "13"),
                        Item(Imagename: "14"),
                        Item(Imagename: "15"),
                        Item(Imagename: "16"),
                        Item(Imagename: "17"),
                        Item(Imagename: "18"),
                        Item(Imagename: "19"),
                        Item(Imagename: "20"),
                        Item(Imagename: "21")]
                        
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let item = sender as! Item
       
       if segue.identifier == viewImageSegueIdentifier {
           if let vc = segue.destination as? ImageViewerViewController {
               vc.imageName = item.Imagename
           }
       }
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewSize()
        
    }
    
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    private func setupCollectionViewSize(){
        if collectionViewFlowLayout == nil{
            let numberOfItemPerRow: CGFloat = 2
            let lineSpacing: CGFloat = 5
            let interItemSpacing: CGFloat = 5
            let width = (collectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = interItemSpacing
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }


}

