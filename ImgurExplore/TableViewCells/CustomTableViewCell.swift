//
//  CustomTableViewCell.swift
//  ImgurExplore
//
//  Created by Ajit Satarkar on 03/01/24.
//

import UIKit
import SDWebImage

class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    // Activity indicator for image loading
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    let customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        contentView.addSubview(customImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        // Constraints for customImageView
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            customImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            customImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            customImageView.widthAnchor.constraint(equalToConstant: 150),
            customImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        // Constraints for titleLabel
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        // Constraints for subtitleLabel
        NSLayoutConstraint.activate([
            subtitleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 8),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            subtitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            subtitleLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    // MARK: - Configuration
    
    func configure(index: Int) {
        //customImageView.image = image
        let images: [AccountImagesData] = Dependencies.accountImageViewModel.getImages()
        
        let unixTime = images[index].datetime
        let inputDate = Date(timeIntervalSince1970: TimeInterval(unixTime))
        let outputDateString = convertDateFormat(inputDate: inputDate)
        print("Converted Date: \(outputDateString)")
        customImageView.image = UIImage(named: "placeholderImage")
        // Add and start the activity indicator
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: customImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: customImageView.centerYAnchor)
        ])
        activityIndicator.startAnimating()
        
        // Load and set the actual image asynchronously
        if let imageURL = URL(string: images[index].link) {
            customImageView.sd_setImage(with: imageURL, completed: { [weak self] _,_,_,_ in
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.removeFromSuperview()
            })
        }
        
        titleLabel.text = images[index].title
        subtitleLabel.text = outputDateString
    }
    
    func convertDateFormat(inputDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: inputDate)
    }
    
}

/* For reference this code is kept intentionally here.
 It will work if we don't want to use SDWebImage dependancy to download images, but SDWebImage will help in caching as well.
 
 // Load and set the actual image asynchronously
 //        if let imageURL = URL(string: images[index].link) {
 //            downloadImage(from: imageURL)
 //        }
     
 //    private func downloadImage(from url: URL) {
 //        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
 //            guard let data = data, error == nil else {
 //                // Handle the error, set a default image, or handle as needed
 //                return
 //            }
 //            DispatchQueue.main.async {
 //                // Set the downloaded image to the UIImageView
 //                self?.customImageView.image = UIImage(data: data)
 //                // Stop the activity indicator once the image is loaded
 //                self?.activityIndicator.stopAnimating()
 //                self?.activityIndicator.removeFromSuperview()
 //            }
 //        }.resume()
 //    }
     
 */
