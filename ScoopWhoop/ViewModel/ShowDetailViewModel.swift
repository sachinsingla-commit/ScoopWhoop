//
//  ShowDetailViewModel.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 23/06/21.
//

import UIKit
class ShowDetailViewModel{
    weak var showDetailsViewController: ShowDetailViewController?
    var showDetailsArr = [ShowDetailsModelData]()
    var showDetailsHeader: ShowDetails?
    var isPaginating = false
    func fetchShowDetails(pagination: Bool = false, topicSlug: String, offset: Int){
        guard let showURL = URL(string: "\(Constants.showDetailsURL)\(topicSlug)&offset=\(offset)") else {return}
        if pagination{
            isPaginating = true
        }
        URLSession.shared.dataTask(with: showURL) { (data, response, err) in
            if let error = err{
                print(error.localizedDescription)
                return
            }else{
                if let safeData = data{
                    do{
                        let jsonData = try JSONDecoder().decode(ShowDetailsModel.self, from: safeData)
                        DispatchQueue.global().asyncAfter(deadline: .now() + (pagination ? 1.5 : 0)) {
                        if let json = jsonData.data, let headerDetails = jsonData.showDetails{
                            self.showDetailsArr.append(contentsOf: json)
                            self.showDetailsHeader = headerDetails
                            if let offset = jsonData.nextOffset{
                                self.showDetailsViewController?.offsetValue = offset
                            }
                            DispatchQueue.main.async { [self] in
                                self.showDetailsViewController?.detailCollectionView.reloadData()
                            }
                            if pagination{
                                self.isPaginating = false
                            }
                        }
                        }}catch (let jsonErr){
                        print(jsonErr.localizedDescription)
                        return
                    }
                }
            }
        }.resume()
    }
}
