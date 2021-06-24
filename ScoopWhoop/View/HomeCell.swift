//
//  HomeCell.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 23/06/21.
//

import UIKit
class HomeCell: UICollectionViewCell {
    var showsData: ScoopWhoopShowsModelData?{
        didSet{
            if let showName = showsData?.showName{
                self.showNameLabel.text = showName
            }
            
            if let showImage = showsData?.showImage{
                self.thumbnailImage.loadImageUsingUrlString(urlString: showImage)
            }
        }
    }
    
    var showDetails: ShowDetailsModelData?{
        didSet{
            if let image = showDetails?.featureImg{
                self.thumbnailImage.loadImageUsingUrlString(urlString: image)
            }
            
            if let title = showDetails?.title{
                self.showNameLabel.text = title
            }
        }
    }
    let thumbnailImage: CustomImageView = {
        let imageView = CustomImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.alpha = 0.8
        return imageView
    }()
    
    let showNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    private func configureUI(){
        self.layer.cornerRadius = 5
        thumbnailImageLayout()
        nameLabelLayout()
    }
    
    private func thumbnailImageLayout(){
        thumbnailImage.frame = bounds
        addSubview(thumbnailImage)
    }
    
    private func nameLabelLayout(){
        addSubview(showNameLabel)
        showNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        showNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
        showNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
