//
//  ScoopWhoopModel.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 23/06/21.
//

import UIKit
// MARK: - ScoopWhoopShowsModel
struct ScoopWhoopShowsModel: Codable {
    let status : Int?
    let next_offset : Int?
    let total_shows : Int?
    let data : [ScoopWhoopShowsModelData]?
    let err : String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case next_offset = "next_offset"
        case total_shows = "total_shows"
        case data = "data"
        case err = "err"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        next_offset = try values.decodeIfPresent(Int.self, forKey: .next_offset)
        total_shows = try values.decodeIfPresent(Int.self, forKey: .total_shows)
        data = try values.decodeIfPresent([ScoopWhoopShowsModelData].self, forKey: .data)
        err = try values.decodeIfPresent(String.self, forKey: .err)
    }
    
}


// MARK: - Datum
struct ScoopWhoopShowsModelData: Codable  {
    let showImage : String?
    let showName : String?
    let id : String?
    let topicSlug: String?
    
    enum CodingKeys: String, CodingKey {
        
        case showImage = "feature_img_port"
        case showName = "topic_name"
        case id = "_id"
        case topicSlug = "topic_slug"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        showImage = try values.decodeIfPresent(String.self, forKey: .showImage)
        showName = try values.decodeIfPresent(String.self, forKey: .showName)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        topicSlug = try values.decodeIfPresent(String.self, forKey: .topicSlug)
    }
}
