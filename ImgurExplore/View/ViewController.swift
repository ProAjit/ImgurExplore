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
    
    var imgurListViewModel = ImageListViewModel()
        
    //MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Imgur List"
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        // Do any additional setup after loading the view.
        imgurListViewModel.delegate = self
    }
        
    override func viewDidAppear(_ animated: Bool) {
        self.callImgurImageListAPI()
    }
    
}

//MARK: - ImageListProtocol

extension ViewController: ImageListProtocol {
    
    func callImgurImageListAPI() {
        imgurListViewModel.callImgurImageListAPI()
    }
    
    func returnData(imgurImageListData : ImageListModel?) {
        // Hide the user’s age.
        imgurListViewModel.imgurImageListData = imgurImageListData
        Logger().info("Images: \(imgurImageListData.debugDescription, privacy: .private)")
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func returnError(error : UserError?) {
        Logger().info("Error: \(error, privacy: .private)")
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let modelData = imgurListViewModel.imgurImageListData?.data else {
            return 0
        }
        return modelData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get cell type
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.text = imgurListViewModel.imgurImageListData?.data[indexPath.row].link
        cell.textLabel?.textColor = .black

        return cell
    }
    
    
}

//MARK: - TableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
