//
//  ViewController.swift
//  Social Media
//
//  Created by Camelia Braghes on 09.01.2023.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
                
        for item in items {
            if item.hasSuffix("png") {
                let itemWithNoExtension = item.fileName()
                flags.append(itemWithNoExtension)
            }
        }
        print(flags)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let detailViewControler = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            
            detailViewControler.selectedImage = flags[indexPath.row]
//            detailViewControler.title = "\(flags[indexPath.row])"
            navigationController?.pushViewController(detailViewControler, animated: true)
        }
    }
}

