//
//  ImageViewerViewController.swift
//  JrnlApp
//
//  Created by Абзал Айтмолданов on 9/22/20.
//  Copyright © 2020 Абзал Айтмолданов. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
      // Do any additional setup after loading the view.
      setupImageView()
    }
    
    private func setupImageView() {
      guard let name = imageName else { return }
      
      if let image = UIImage(named: name) {
        imageView.image = image
      }
    }
    

     
     

}
