//
//  SuperViewController.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import UIKit

class SuperViewController: UIViewController {
    var loadingIndicator : UIActivityIndicatorView? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension SuperViewController {
    
   func LoadingStart() {
       loadingIndicator = UIActivityIndicatorView()
       loadingIndicator?.hidesWhenStopped = true
       loadingIndicator?.color = .white
       loadingIndicator?.style = .large
       loadingIndicator?.center = self.view.center
       loadingIndicator?.startAnimating()
       self.view.addSubview(loadingIndicator!)
   }

  func LoadingStop(){
      loadingIndicator?.stopAnimating()
      loadingIndicator?.removeFromSuperview()
  }
    
}
