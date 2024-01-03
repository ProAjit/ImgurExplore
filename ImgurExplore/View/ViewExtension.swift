//
//  ViewExtension.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import Foundation
import UIKit

extension ViewController {
            
    func getImgurAccountImages() {
        self.LoadingStart()
        Task {
            let _ = await Dependencies.accountImageViewModel.getImgurAccountImagesData()
            self.tableView.isHidden = false
            self.tableView.reloadData()
            self.LoadingStop()
        }
    }
    
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dependencies.accountImageViewModel.getImagesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        // Configure the cell with your data
        cell.configure(index: indexPath.row)
        return cell
    }
    
}

//MARK: - TableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}
