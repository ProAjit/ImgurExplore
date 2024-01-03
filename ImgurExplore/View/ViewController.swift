//
//  ViewController.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 02/01/24.
//

import UIKit

class ViewController: SuperViewController {

    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpNavBar()
        self.setUpTableView()
        // Do any additional setup after loading the view.
        self.getImgurAccountImages()
    }
    
    private func setUpNavBar() {
        title = "Imgur List"
        if #available(iOS 13.0, *) {
            navigationController?.navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        }
    }
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
    }
    
    //MARK: - deinit
     deinit { }
    
}
