//
//  Coachingmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 24/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
struct Premium_category : Codable {
    let psc_premium_category_id : String?
    let psc_premium_category_name : String?
    let psc_premium_category_image : String?
    let created_at : String?
    let status : String?
    let payment_status : Bool?
    let category_wise_packages : [Category_wise_packages]?

    enum CodingKeys: String, CodingKey {

        case psc_premium_category_id = "psc_premium_category_id"
        case psc_premium_category_name = "psc_premium_category_name"
        case psc_premium_category_image = "psc_premium_category_image"
        case created_at = "created_at"
        case status = "status"
        case payment_status = "payment_status"
        case category_wise_packages = "category_wise_packages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_premium_category_id = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_id)
        psc_premium_category_name = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_name)
        psc_premium_category_image = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_image)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        payment_status = try values.decodeIfPresent(Bool.self, forKey: .payment_status)
        category_wise_packages = try values.decodeIfPresent([Category_wise_packages].self, forKey: .category_wise_packages)
    }

}
struct Coachingdata : Codable {
    let trending_videos : [Trending_videos]?
    let premium_category : [Premium_category]?
    let user_subscription_status : Bool?
    let user_id : String?
    let video_url : String?
    let premium_category_url : String?

    enum CodingKeys: String, CodingKey {

        case trending_videos = "trending_videos"
        case premium_category = "premium_category"
        case user_subscription_status = "user_subscription_status"
        case user_id = "user_id"
        case video_url = "video_url"
        case premium_category_url = "premium_category_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        trending_videos = try values.decodeIfPresent([Trending_videos].self, forKey: .trending_videos)
        premium_category = try values.decodeIfPresent([Premium_category].self, forKey: .premium_category)
        user_subscription_status = try values.decodeIfPresent(Bool.self, forKey: .user_subscription_status)
        user_id = try values.decodeIfPresent(String.self, forKey: .user_id)
        video_url = try values.decodeIfPresent(String.self, forKey: .video_url)
        premium_category_url = try values.decodeIfPresent(String.self, forKey: .premium_category_url)
    }

}
struct Trending_videos : Codable {
    let psc_video_tutorial_id : String?
    let psc_premium_category_id : String?
    let chapter_id : String?
    let psc_video_title : String?
    let psc_video_description : String?
    let psc_video_premium : String?
    let psc_video_trending : String?
    let psc_video_name : String?
    let psc_vimeo_video_url : String?
    let psc_vimeo_video_thumb : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case psc_video_tutorial_id = "psc_video_tutorial_id"
        case psc_premium_category_id = "psc_premium_category_id"
        case chapter_id = "chapter_id"
        case psc_video_title = "psc_video_title"
        case psc_video_description = "psc_video_description"
        case psc_video_premium = "psc_video_premium"
        case psc_video_trending = "psc_video_trending"
        case psc_video_name = "psc_video_name"
        case psc_vimeo_video_url = "psc_vimeo_video_url"
        case psc_vimeo_video_thumb = "psc_vimeo_video_thumb"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_video_tutorial_id = try values.decodeIfPresent(String.self, forKey: .psc_video_tutorial_id)
        psc_premium_category_id = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_id)
        chapter_id = try values.decodeIfPresent(String.self, forKey: .chapter_id)
        psc_video_title = try values.decodeIfPresent(String.self, forKey: .psc_video_title)
        psc_video_description = try values.decodeIfPresent(String.self, forKey: .psc_video_description)
        psc_video_premium = try values.decodeIfPresent(String.self, forKey: .psc_video_premium)
        psc_video_trending = try values.decodeIfPresent(String.self, forKey: .psc_video_trending)
        psc_video_name = try values.decodeIfPresent(String.self, forKey: .psc_video_name)
        psc_vimeo_video_url = try values.decodeIfPresent(String.self, forKey: .psc_vimeo_video_url)
        psc_vimeo_video_thumb = try values.decodeIfPresent(String.self, forKey: .psc_vimeo_video_thumb)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
struct Coachingdetails : Codable {
    let status : Bool?
    let message : String?
    let data : Coachingdata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Coachingdata.self, forKey: .data)
    }

}
struct Category_wise_packages : Codable {
    let psc_video_package_id : String?
    let psc_premium_category_id : String?
    let psc_package_name : String?
    let psc_package_price : String?
    let psc_package_period : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case psc_video_package_id = "psc_video_package_id"
        case psc_premium_category_id = "psc_premium_category_id"
        case psc_package_name = "psc_package_name"
        case psc_package_price = "psc_package_price"
        case psc_package_period = "psc_package_period"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_video_package_id = try values.decodeIfPresent(String.self, forKey: .psc_video_package_id)
        psc_premium_category_id = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_id)
        psc_package_name = try values.decodeIfPresent(String.self, forKey: .psc_package_name)
        psc_package_price = try values.decodeIfPresent(String.self, forKey: .psc_package_price)
        psc_package_period = try values.decodeIfPresent(String.self, forKey: .psc_package_period)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
//get_exam_subscription_packages


struct Category_packages : Codable {
    let category_package_id : String?
    let preliminary_id : String?
    let main_exam_id : String?
    let category_package_name : String?
    let category_package_price : String?
    let category_package_period : String?
    let created_at : String?
    let status : String?
    let product_id : String?
    let iOS_price : String?
    let payment_status : Bool?
    let expiry_date : String?

    enum CodingKeys: String, CodingKey {

        case category_package_id = "category_package_id"
        case preliminary_id = "preliminary_id"
        case main_exam_id = "main_exam_id"
        case category_package_name = "category_package_name"
        case category_package_price = "category_package_price"
        case category_package_period = "category_package_period"
        case created_at = "created_at"
        case status = "status"
        case product_id = "product_id"
        case iOS_price = "iOS_price"
        case payment_status = "payment_status"
        case expiry_date = "expiry_date"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        category_package_id = try values.decodeIfPresent(String.self, forKey: .category_package_id)
        preliminary_id = try values.decodeIfPresent(String.self, forKey: .preliminary_id)
        main_exam_id = try values.decodeIfPresent(String.self, forKey: .main_exam_id)
        category_package_name = try values.decodeIfPresent(String.self, forKey: .category_package_name)
        category_package_price = try values.decodeIfPresent(String.self, forKey: .category_package_price)
        category_package_period = try values.decodeIfPresent(String.self, forKey: .category_package_period)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        payment_status = try values.decodeIfPresent(Bool.self, forKey: .payment_status)
        expiry_date = try values.decodeIfPresent(String.self, forKey: .expiry_date)
    }

}


struct ExamsubscrptnData : Codable {
    let subscription_package : [ExamSubscription_package]?
    let category_packages : [Category_packages]?

    enum CodingKeys: String, CodingKey {

        case subscription_package = "subscription_package"
        case category_packages = "category_packages"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subscription_package = try values.decodeIfPresent([ExamSubscription_package].self, forKey: .subscription_package)
        category_packages = try values.decodeIfPresent([Category_packages].self, forKey: .category_packages)
    }

}



struct Examsubscriptnclass : Codable {
    let status : Bool?
    let message : String?
    let data : ExamsubscrptnData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(ExamsubscrptnData.self, forKey: .data)
    }

}



struct ExamSubscription_package : Codable {
    let cat_subscription_id : String?
    let cat_subscription_name : String?
    let cat_subscription_price : String?
    let cat_subscription_period : String?
    let product_id : String?
    let iOS_price : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case cat_subscription_id = "cat_subscription_id"
        case cat_subscription_name = "cat_subscription_name"
        case cat_subscription_price = "cat_subscription_price"
        case cat_subscription_period = "cat_subscription_period"
        case product_id = "product_id"
        case iOS_price = "iOS_price"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cat_subscription_id = try values.decodeIfPresent(String.self, forKey: .cat_subscription_id)
        cat_subscription_name = try values.decodeIfPresent(String.self, forKey: .cat_subscription_name)
        cat_subscription_price = try values.decodeIfPresent(String.self, forKey: .cat_subscription_price)
        cat_subscription_period = try values.decodeIfPresent(String.self, forKey: .cat_subscription_period)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}
