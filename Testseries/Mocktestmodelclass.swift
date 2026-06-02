//
//  Mocktestmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 23/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation



struct Mocktestdata : Codable {
    let mock_test_category : [Mock_test_category]?

    enum CodingKeys: String, CodingKey {

        case mock_test_category = "mock_test_category"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mock_test_category = try values.decodeIfPresent([Mock_test_category].self, forKey: .mock_test_category)
    }

}


struct Mock_test_category : Codable {
    let psc_mock_category_id : String?
    let psc_mock_category_name : String?
    let psc_mock_price : String?
    let psc_mock_period : String?
    let created_at : String?
    let status : String?
    let mock_test_payment : Bool?
    let mock_test_count : Int?
    let iOS_price : String?
    let product_id : String?
    let main_category_id : String?
    let color_code : String?

    enum CodingKeys: String, CodingKey {

        case psc_mock_category_id = "psc_mock_category_id"
        case psc_mock_category_name = "psc_mock_category_name"
        case psc_mock_price = "psc_mock_price"
        case psc_mock_period = "psc_mock_period"
        case created_at = "created_at"
        case status = "status"
        case mock_test_payment = "mock_test_payment"
        case mock_test_count = "mock_test_count"
        case iOS_price = "iOS_price"
        case product_id = "product_id"
        case main_category_id = "main_category_id"
        case color_code = "color_code"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_mock_category_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_category_id)
        psc_mock_category_name = try values.decodeIfPresent(String.self, forKey: .psc_mock_category_name)
        psc_mock_price = try values.decodeIfPresent(String.self, forKey: .psc_mock_price)
        psc_mock_period = try values.decodeIfPresent(String.self, forKey: .psc_mock_period)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        mock_test_payment = try values.decodeIfPresent(Bool.self, forKey: .mock_test_payment)
        mock_test_count = try values.decodeIfPresent(Int.self, forKey: .mock_test_count)
        iOS_price = try values.decodeIfPresent(String.self, forKey: .iOS_price)
        product_id = try values.decodeIfPresent(String.self, forKey: .product_id)
        main_category_id = try values.decodeIfPresent(String.self, forKey: .main_category_id)
        color_code = try values.decodeIfPresent(String.self, forKey: .color_code)
    }

}

struct Mocktest : Codable {
    let status : Bool?
    let message : String?
    let data : Mocktestdata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Mocktestdata.self, forKey: .data)
    }

}
//get mock test series
struct Mock_test_series : Codable {
    let psc_mock_test_series_id : String?
    let psc_mock_category_id : String?
    let psc_mock_test_name : String?
    let psc_mock_test_instruction : String?
    let psc_mock_test_time : String?
    let psc_mock_test_lock : String?
    let created_at : String?
    let status : String?
    let psc_mock_test_time_ms : Int?
    let is_question : Int?
    let psc_mock_price : String?

    enum CodingKeys: String, CodingKey {

        case psc_mock_test_series_id = "psc_mock_test_series_id"
        case psc_mock_category_id = "psc_mock_category_id"
        case psc_mock_test_name = "psc_mock_test_name"
        case psc_mock_test_instruction = "psc_mock_test_instruction"
        case psc_mock_test_time = "psc_mock_test_time"
        case psc_mock_test_lock = "psc_mock_test_lock"
        case created_at = "created_at"
        case status = "status"
        case psc_mock_test_time_ms = "psc_mock_test_time_ms"
        case is_question = "is_question"
        case psc_mock_price = "psc_mock_price"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_mock_test_series_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_series_id)
        psc_mock_category_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_category_id)
        psc_mock_test_name = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_name)
        psc_mock_test_instruction = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_instruction)
        psc_mock_test_time = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_time)
        psc_mock_test_lock = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_lock)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        psc_mock_test_time_ms = try values.decodeIfPresent(Int.self, forKey: .psc_mock_test_time_ms)
        is_question = try values.decodeIfPresent(Int.self, forKey: .is_question)
        psc_mock_price = try values.decodeIfPresent(String.self, forKey: .psc_mock_price)
    }

}
struct mocktestseriesData : Codable {
    let mock_test_series : [Mock_test_series]?
    let mock_test_payment : Bool?

    enum CodingKeys: String, CodingKey {

        case mock_test_series = "mock_test_series"
        case mock_test_payment = "mock_test_payment"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mock_test_series = try values.decodeIfPresent([Mock_test_series].self, forKey: .mock_test_series)
        mock_test_payment = try values.decodeIfPresent(Bool.self, forKey: .mock_test_payment)
    }

}
struct Mocktestseriesclass : Codable {
    let status : Bool?
    let message : String?
    let data : mocktestseriesData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(mocktestseriesData.self, forKey: .data)
    }

}

