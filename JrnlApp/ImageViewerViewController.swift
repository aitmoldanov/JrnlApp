import UIKit

class ImageViewerViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    var imageName: String!
    
    override func viewDidLoad() {
      super.viewDidLoad()
      setupImageView()
    }
    
    private func setupImageView() {
      guard let nameImage = imageName else { return }
      
      if let image = UIImage(named: nameImage) {
        imageView.image = image
      }
    }
    

     
     

}
