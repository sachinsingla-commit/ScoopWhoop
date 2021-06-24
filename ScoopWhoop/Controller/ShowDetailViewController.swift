//
//  ShowDetailViewController.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 23/06/21.
//

import UIKit
class ShowDetailViewController: UIViewController {
    //MARK:- Properties
    var showDetailViewModel = ShowDetailViewModel()
    var slugTopic: String = ""
    var showName: String = ""
    var offsetValue = 10
    lazy var detailCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(HomeCell.self, forCellWithReuseIdentifier: Constants.showDetailCellID)
        cv.register(DetailHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.detailsHeaderID)
        cv.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return cv
    }()
    
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        self.navigationItem.title = showName.capitalized
        configureUI()
    }
    
    
    //MARK:- UI Layouts
    private func configureUI(){
        collectionViewLayout()
        setupDelegates()
        fetchShowDetails()
    }
    
    private func collectionViewLayout(){
        detailCollectionView.frame = view.bounds
        view.addSubview(detailCollectionView)
    }
    
    private func setupDelegates(){
        detailCollectionView.delegate = self
        detailCollectionView.dataSource = self
        showDetailViewModel.showDetailsViewController = self
    }
    
    private func fetchShowDetails(){
        showDetailViewModel.fetchShowDetails(topicSlug: slugTopic, offset: offsetValue)
    }
}
extension ShowDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return showDetailViewModel.showDetailsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.size.width / 2) - 22)
        let height = 2 * width * 9 / 16
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.showDetailCellID, for: indexPath) as! HomeCell
        let showDetails = showDetailViewModel.showDetailsArr[indexPath.item]
        cell.showDetails = showDetails
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.detailsHeaderID, for: indexPath) as! DetailHeaderView
        if let details = showDetailViewModel.showDetailsHeader{
            header.headerDetails = details
        }
        return header
    }
    
    
    //MARK:- Dynamic height of the Header
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = (collectionView.frame.size.width)
        let height = (width * 9 / 16) + 60
        if let descriptionText = showDetailViewModel.showDetailsHeader?.topic_desc{
            let size = CGSize(width: width, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: descriptionText).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)], context: nil)
            
            return CGSize(width: width, height: height + estimatedFrame.height)
        }
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // MARK:- Pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (detailCollectionView.contentSize.height - 100 - scrollView.frame.size.height){
            guard !showDetailViewModel.isPaginating else {return}
            showDetailViewModel.fetchShowDetails(pagination: true, topicSlug: self.slugTopic, offset: offsetValue)
        }
    }
}
