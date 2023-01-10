//
//  DetailViewController.swift
//  Social Media
//
//  Created by Camelia Braghes on 09.01.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButton))
        
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        self.view.backgroundColor = UIColor.systemGroupedBackground
    }
    
    @objc func shareButton() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.5) else {
            print("Image not found")
            return
        }
        
        let detailViewController = UIActivityViewController(activityItems: [image, selectedImage?.replacingOccurrences(of: ".jpg", with: "")], applicationActivities: [])
        detailViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(detailViewController, animated: true)
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
