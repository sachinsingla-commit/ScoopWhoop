//
//  ShowDetailsModel.swift
//  ScoopWhoop
//
//  Created by Sachin's Macbook Pro on 23/06/21.
//


import Foundation
struct ShowDetailsModel: Codable {
    let status : Int?
    let showDetails : ShowDetails?
    let nextOffset : Int?
    let data : [ShowDetailsModelData]?
    let err : String?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case showDetails = "show_details"
        case nextOffset = "next_offset"
        case data = "data"
        case err = "err"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        showDetails = try values.decodeIfPresent(ShowDetails.self, forKey: .showDetails)
        nextOffset = try values.decodeIfPresent(Int.self, forKey: .nextOffset)
        data = try values.decodeIfPresent([ShowDetailsModelData].self, forKey: .data)
        err = try values.decodeIfPresent(String.self, forKey: .err)
    }
    
}

struct ShowDetails : Codable {
    let feature_img_port : String?
    let topic_name : String?
    let total_videos : Int?
    let topic_desc : String?
    let topic_slug : String?
    let feature_img_land : String?
    let onexone_img : String?
    
    enum CodingKeys: String, CodingKey {
        
        case feature_img_port = "feature_img_port"
        case topic_name = "topic_name"
        case total_videos = "total_videos"
        case topic_desc = "topic_desc"
        case topic_slug = "topic_slug"
        case feature_img_land = "feature_img_land"
        case onexone_img = "onexone_img"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        feature_img_port = try values.decodeIfPresent(String.self, forKey: .feature_img_port)
        topic_name = try values.decodeIfPresent(String.self, forKey: .topic_name)
        total_videos = try values.decodeIfPresent(Int.self, forKey: .total_videos)
        topic_desc = try values.decodeIfPresent(String.self, forKey: .topic_desc)
        topic_slug = try values.decodeIfPresent(String.self, forKey: .topic_slug)
        feature_img_land = try values.decodeIfPresent(String.self, forKey: .feature_img_land)
        onexone_img = try values.decodeIfPresent(String.self, forKey: .onexone_img)
    }
    
}
struct ShowDetailsModelData : Codable {
    let shHeading : String?
    let title : String?
    let onexoneImg : String?
    let videoThumbnail2x3 : String?
    let aspectRatio : String?
    let nsfw : Int?
    let featureImg : String?
    let videoThumbnail16x9 : String?
    let duration : String?
    let premium : Bool?
    let id : String?
    let pubDate : String?
    let slug : String?
    let tags : [String]?
    let videoThumbnail9x16 : String?
    
    enum CodingKeys: String, CodingKey {
        case shHeading = "sh_heading"
        case title = "title"
        case onexoneImg = "onexone_img"
        case videoThumbnail2x3 = "video_thumbnail_2x3"
        case aspectRatio = "aspect_ratio"
        case nsfw = "nsfw"
        case featureImg = "feature_img"
        case videoThumbnail16x9 = "video_thumbnail_16x9"
        case duration = "duration"
        case premium = "premium"
        case id = "_id"
        case pubDate = "pub_date"
        case slug = "slug"
        case tags = "tags"
        case videoThumbnail9x16 = "video_thumbnail_9x16"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shHeading = try values.decodeIfPresent(String.self, forKey: .shHeading)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        onexoneImg = try values.decodeIfPresent(String.self, forKey: .onexoneImg)
        videoThumbnail2x3 = try values.decodeIfPresent(String.self, forKey: .videoThumbnail2x3)
        aspectRatio = try values.decodeIfPresent(String.self, forKey: .aspectRatio)
        nsfw = try values.decodeIfPresent(Int.self, forKey: .nsfw)
        featureImg = try values.decodeIfPresent(String.self, forKey: .featureImg)
        videoThumbnail16x9 = try values.decodeIfPresent(String.self, forKey: .videoThumbnail16x9)
        duration = try values.decodeIfPresent(String.self, forKey: .duration)
        premium = try values.decodeIfPresent(Bool.self, forKey: .premium)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        pubDate = try values.decodeIfPresent(String.self, forKey: .pubDate)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        videoThumbnail9x16 = try values.decodeIfPresent(String.self, forKey: .videoThumbnail9x16)
    }
    
}
