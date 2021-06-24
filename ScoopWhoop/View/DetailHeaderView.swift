//
//  Details.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 24/06/21.
//

import UIKit
class DetailHeaderView: UICollectionReusableView {
    var headerDetails: ShowDetails?{
        didSet{
            if let thumbnail = headerDetails?.feature_img_land{
                self.thumbnailImage.loadImageUsingUrlString(urlString: thumbnail)
            }
            
            if let descriptionText = headerDetails?.topic_desc{
                self.descriptionLabel.text = descriptionText
            }
            
            if let titleText = headerDetails?.topic_name{
                self.headerLabel.text = titleText
            }
        }
    }
    let thumbnailImage: CustomImageView = {
        let image = CustomImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textAlignment = .left
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        thumbnailImageLayout()
        headerLabelLayout()
        descriptionLabelLayout()
    }
    
    private func thumbnailImageLayout(){
        addSubview(thumbnailImage)
        let width = self.frame.size.width
        let height = width * 9 / 16
        thumbnailImage.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        thumbnailImage.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        thumbnailImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        thumbnailImage.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func headerLabelLayout(){
        addSubview(headerLabel)
        headerLabel.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: 10).isActive = true
        headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        headerLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func descriptionLabelLayout(){
        addSubview(descriptionLabel)
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

