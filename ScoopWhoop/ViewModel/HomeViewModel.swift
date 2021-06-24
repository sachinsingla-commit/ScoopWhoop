//
//  HomeViewModel.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 23/06/21.
//

import UIKit
class HomeViewModel {
    weak var homeViewController: HomeViewController?
    var showsArr = [ScoopWhoopShowsModelData]()
    func fetchScoopWhoopShows(){
        URLSession.shared.dataTask(with: URL(string: Constants.showsURL)!) { (data, response, err) in
            if let error = err{
                print(error.localizedDescription)
                return
            }else{
                if let safeData = data{
                    do{
                        let jsonData = try JSONDecoder().decode(ScoopWhoopShowsModel.self, from: safeData)
                        if let shows = jsonData.data{
                            self.showsArr.append(contentsOf: shows)
                            DispatchQueue.main.async {
                                if self.showsArr.count == 0{
                                    self.homeViewController?.checkForData()
                                }else{
                                    self.homeViewController?.errorImage.removeFromSuperview()
                                }
                                self.homeViewController?.collectionView.reloadData()
                            }
                        }
                    }catch (let jsonErr){
                        print(jsonErr.localizedDescription)
                        return
                    }
                }
            }
        }.resume()
    }
}
