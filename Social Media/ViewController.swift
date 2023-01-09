//
//  ViewController.swift
//  Social Media
//
//  Created by Camelia Braghes on 09.01.2023.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            pictures.append(item)
        }
        print(pictures)
    }

}

