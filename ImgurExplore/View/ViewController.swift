//
//  ViewController.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 02/01/24.
//

import UIKit
import OSLog

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Imgur List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        // Do any additional setup after loading the view.
        self.getImgurAccountImages()
    }
    
    //MARK: - deinit
     deinit { }
    
}
