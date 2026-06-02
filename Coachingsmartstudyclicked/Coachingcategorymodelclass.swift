//
//  Coachingcategorymodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 10/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
//get_category_wise_video


struct categorywiseData : Codable {
    let payment_status : Bool?
    let category_wise_packages : [Category_wise_packagessmartstudy]?
    let category_wise_chapter : [Category_wise_chapter]?
    let user_subscription_status : Bool?

    enum CodingKeys: String, CodingKey {

        case payment_status = "payment_status"
        case category_wise_packages = "category_wise_packages"
        case category_wise_chapter = "category_wise_chapter"
        case user_subscription_status = "user_subscription_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        payment_status = try values.decodeIfPresent(Bool.self, forKey: .payment_status)
        category_wise_packages = try values.decodeIfPresent([Category_wise_packagessmartstudy].self, forKey: .category_wise_packages)
        category_wise_chapter = try values.decodeIfPresent([Category_wise_chapter].self, forKey: .category_wise_chapter)
        user_subscription_status = try values.decodeIfPresent(Bool.self, forKey: .user_subscription_status)
    }

}

struct Category_wise_packagessmartstudy : Codable {
    let psc_video_package_id : String?
    let psc_premium_category_id : String?
    let psc_package_name : String?
    let psc_package_price : String?
    let psc_package_period : String?
    let created_at : String?
    let status : String?
    let iOS_price : String?
    let product_id : String?

    enum CodingKeys: String, CodingKey {

        case psc_video_package_id = "psc_video_package_id"
        case psc_premium_category_id = "psc_premium_category_id"
        case psc_package_name = "psc_package_name"
        case psc_package_price = "psc_package_price"
        case psc_package_period = "psc_package_period"
        case created_at = "created_at"
        case status = "status"
        case iOS_price = "iOS_price"
        case product_id = "product_id"
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
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
    }

}



struct Category_wise_chapter : Codable {
    let chapter_id : String?
    let psc_premium_category_id : String?
    let chapter_name : String?
    let order_by : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case chapter_id = "chapter_id"
        case psc_premium_category_id = "psc_premium_category_id"
        case chapter_name = "chapter_name"
        case order_by = "order_by"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chapter_id = try values.decodeIfPresent(String.self, forKey: .chapter_id)
        psc_premium_category_id = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_id)
        chapter_name = try values.decodeIfPresent(String.self, forKey: .chapter_name)
        order_by = try values.decodeIfPresent(String.self, forKey: .order_by)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}





struct categorywisevideoclass : Codable {
    let status : Bool?
    let message : String?
    let data : categorywiseData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(categorywiseData.self, forKey: .data)
    }

}

//getsubscriptnlist


struct subscrptnlistdata : Codable {
    let subscription_package : [Subscription_package]?
    let category_wise_packages : [Category_wise_packagessubscrptnlist]?
    let active_subscription_package : Active_subscription_package?

    enum CodingKeys: String, CodingKey {

        case subscription_package = "subscription_package"
        case category_wise_packages = "category_wise_packages"
        case active_subscription_package = "active_subscription_package"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subscription_package = try values.decodeIfPresent([Subscription_package].self, forKey: .subscription_package)
        category_wise_packages = try values.decodeIfPresent([Category_wise_packagessubscrptnlist].self, forKey: .category_wise_packages)
         active_subscription_package = try values.decodeIfPresent(Active_subscription_package.self, forKey: .active_subscription_package)
    }

}

struct Subscription_package : Codable {
    let subscription_id : String?
    let subscription_name : String?
    let subscription_price : String?
    let subscription_period : String?
    let coaching_video : String?
    let mock_test_series : String?
    let created_at : String?
    let status : String?
    let iOS_price : String?
    let product_id : String?
    let pc_iOS_price : String?
    let pc_product_id : String?

    enum CodingKeys: String, CodingKey {

        case subscription_id = "subscription_id"
        case subscription_name = "subscription_name"
        case subscription_price = "subscription_price"
        case subscription_period = "subscription_period"
        case coaching_video = "coaching_video"
        case mock_test_series = "mock_test_series"
        case created_at = "created_at"
        case status = "status"
        case iOS_price = "iOS_price"
        case product_id = "product_id"
        case pc_iOS_price = "pc_iOS_price"
        case pc_product_id = "pc_product_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subscription_id = try values.decodeIfPresent(String.self, forKey: .subscription_id)
        subscription_name = try values.decodeIfPresent(String.self, forKey: .subscription_name)
        subscription_price = try values.decodeIfPresent(String.self, forKey: .subscription_price)
        subscription_period = try values.decodeIfPresent(String.self, forKey: .subscription_period)
        coaching_video = try values.decodeIfPresent(String.self, forKey: .coaching_video)
        mock_test_series = try values.decodeIfPresent(String.self, forKey: .mock_test_series)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        pc_iOS_price = try values.decodeIfPresent(String.self, forKey: .pc_iOS_price)
        pc_product_id = try values.decodeIfPresent(String.self, forKey: .pc_product_id)
    }

}
struct Active_subscription_package : Codable {
    let subscription_id : String?
    let subscription_name : String?
    let subscription_price : String?
    let subscription_period : String?
    let coaching_video : String?
    let mock_test_series : String?
    let created_at : String?
    let status : String?
    let iOS_price : String?
    let product_id : String?
    let pc_iOS_price : String?
    let pc_product_id : String?

    enum CodingKeys: String, CodingKey {

        case subscription_id = "subscription_id"
        case subscription_name = "subscription_name"
        case subscription_price = "subscription_price"
        case subscription_period = "subscription_period"
        case coaching_video = "coaching_video"
        case mock_test_series = "mock_test_series"
        case created_at = "created_at"
        case status = "status"
        case iOS_price = "iOS_price"
        case product_id = "product_id"
        case pc_iOS_price = "pc_iOS_price"
        case pc_product_id = "pc_product_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subscription_id = try values.decodeIfPresent(String.self, forKey: .subscription_id)
        subscription_name = try values.decodeIfPresent(String.self, forKey: .subscription_name)
        subscription_price = try values.decodeIfPresent(String.self, forKey: .subscription_price)
        subscription_period = try values.decodeIfPresent(String.self, forKey: .subscription_period)
        coaching_video = try values.decodeIfPresent(String.self, forKey: .coaching_video)
        mock_test_series = try values.decodeIfPresent(String.self, forKey: .mock_test_series)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        pc_iOS_price = try values.decodeIfPresent(String.self, forKey: .pc_iOS_price)
        pc_product_id = try values.decodeIfPresent(String.self, forKey: .pc_product_id)
    }

}


struct Subscriptionlistcalss : Codable {
    let status : Bool?
    let message : String?
    let data : subscrptnlistdata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(subscrptnlistdata.self, forKey: .data)
    }

}


struct Category_wise_packagessubscrptnlist : Codable {
    let psc_video_package_id : String?
    let psc_premium_category_id : String?
    let psc_package_name : String?
    let psc_package_price : String?
    let psc_package_period : String?
    let created_at : String?
    let status : String?
    let iOS_price : String?
    let product_id : String?

    enum CodingKeys: String, CodingKey {

        case psc_video_package_id = "psc_video_package_id"
        case psc_premium_category_id = "psc_premium_category_id"
        case psc_package_name = "psc_package_name"
        case psc_package_price = "psc_package_price"
        case psc_package_period = "psc_package_period"
        case created_at = "created_at"
        case status = "status"
        case iOS_price = "iOS_price"
        case product_id = "product_id"
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
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
    }

}

//apply_promo_code

struct ApplypromoData : Codable {
    let promo_code : String?
    let amount : String?
    let discount_amount : Float?
    let final_amount : Float?

    enum CodingKeys: String, CodingKey {

        case promo_code = "promo_code"
        case amount = "amount"
        case discount_amount = "discount_amount"
        case final_amount = "final_amount"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        promo_code = try values.decodeIfPresent(String.self, forKey: .promo_code)
        amount = try values.decodeIfPresent(String.self, forKey: .amount)
        discount_amount = try values.decodeIfPresent(Float.self, forKey: .discount_amount)
        final_amount = try values.decodeIfPresent(Float.self, forKey: .final_amount)
    }

}


//struct Applypromocodeclass : Codable {
//    let status : Bool?
//    let message : String?
//    let data : ApplypromoData?
//
//    enum CodingKeys: String, CodingKey {
//
//        case status = "status"
//        case message = "message"
//        case data = "data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        status = try values.decodeIfPresent(Bool.self, forKey: .status)
//        message = try values.decodeIfPresent(String.self, forKey: .message)
//        data = try values.decodeIfPresent(ApplypromoData.self, forKey: .data)
//    }
//}
    
    struct Applypromocodeclass : Codable {
        let status : Bool?
        let message : String?
        let data : ApplypromoData?

        enum CodingKeys: String, CodingKey {

            case status = "status"
            case message = "message"
            case data = "data"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            status = try values.decodeIfPresent(Bool.self, forKey: .status)
            message = try values.decodeIfPresent(String.self, forKey: .message)
            data = try values.decodeIfPresent(ApplypromoData.self, forKey: .data)
        }

    }



