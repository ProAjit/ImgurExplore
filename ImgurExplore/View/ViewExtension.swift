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
        Task {
            let _ = await Dependencies.accountImageViewModel.getImgurAccountImagesData()
            self.tableView.reloadData()
        }
    }
    
}

//MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Dependencies.accountImageViewModel.getImagesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get cell type
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        let images: [AccountImagesData] = Dependencies.accountImageViewModel.getImages()
        cell.textLabel?.text = images[indexPath.row].title
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
