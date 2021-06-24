//
//  HomeViewControlle.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 22/06/21.
//

import UIKit
class HomeViewController: UICollectionViewController {
    //MARK:- Properties
    var homeViewModel = HomeViewModel()
    private let homeShowsCell = "HomeShowsCell"
    let errorImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        return image
    }()
    //MARK:- Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavigationBar()
    }
    
    //MARK:- Layouts
    private func configureUI(){
        fetchShows()
        setupDelegates()
        setupNavigationBar()
        setupCollectioView()
    }
    
    private func setupNavigationBar(){
        self.navigationItem.title = "Scoopwhoop"
        self.navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
    }
    
    private func setupCollectioView(){
        view.backgroundColor = .black
        collectionView.backgroundColor = .black
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: homeShowsCell)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    func checkForData(){
        if homeViewModel.showsArr.count == 0{
            errorImageLayout()
        }else{
            errorImage.removeFromSuperview()
        }
    }
    
    func errorImageLayout(){
        errorImage.loadGif(name: "404")
        errorImage.frame = view.bounds
        view.addSubview(errorImage)
    }
    
    private func fetchShows(){
        homeViewModel.fetchScoopWhoopShows()
    }
    
    private func setupDelegates(){
        homeViewModel.homeViewController = self
    }
}
//MARK:- Collection View Layouts
extension HomeViewController: UICollectionViewDelegateFlowLayout{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.showsArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeShowsCell, for: indexPath) as! HomeCell
        let show = homeViewModel.showsArr[indexPath.item]
        cell.showsData = show
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let slugTopic = homeViewModel.showsArr[indexPath.item].topicSlug{
            let detailsVC = ShowDetailViewController()
            detailsVC.slugTopic = slugTopic
            detailsVC.showName = slugTopic
            navigationController?.pushViewController(detailsVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = ((collectionView.frame.size.width / 2) - 22)
        let height = 3 * width * 9 / 16
        return CGSize(width: width, height: height)
    }
}
