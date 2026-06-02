//
//  slidereportmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 13/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation

struct Daily_exam_result : Codable {
    let psc_daily_exam_result_id : String?
    let psc_user_id : String?
    let psc_exam_date : String?
    let psc_exam_time : String?
    let psc_daily_exam_mark : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case psc_daily_exam_result_id = "psc_daily_exam_result_id"
        case psc_user_id = "psc_user_id"
        case psc_exam_date = "psc_exam_date"
        case psc_exam_time = "psc_exam_time"
        case psc_daily_exam_mark = "psc_daily_exam_mark"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_daily_exam_result_id = try values.decodeIfPresent(String.self, forKey: .psc_daily_exam_result_id)
        psc_user_id = try values.decodeIfPresent(String.self, forKey: .psc_user_id)
        psc_exam_date = try values.decodeIfPresent(String.self, forKey: .psc_exam_date)
        psc_exam_time = try values.decodeIfPresent(String.self, forKey: .psc_exam_time)
        psc_daily_exam_mark = try values.decodeIfPresent(String.self, forKey: .psc_daily_exam_mark)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}

struct slidereportdata : Codable {
    let mock_test_series_result : [Mock_test_series_result]?
    let daily_exam_result : [Daily_exam_result]?

    enum CodingKeys: String, CodingKey {

        case mock_test_series_result = "mock_test_series_result"
        case daily_exam_result = "daily_exam_result"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mock_test_series_result = try values.decodeIfPresent([Mock_test_series_result].self, forKey: .mock_test_series_result)
        daily_exam_result = try values.decodeIfPresent([Daily_exam_result].self, forKey: .daily_exam_result)
    }

}

struct Mock_test_series_result : Codable {
    let psc_mock_user_result_id : String?
    let psc_mock_unique_id : String?
    let psc_mock_category_id : String?
    let psc_mock_test_series_id : String?
    let psc_user_id : String?
    let psc_user_time : String?
    let psc_mock_user_mark : String?
    let created_at : String?
    let status : String?
    let psc_mock_test_name : String?

    enum CodingKeys: String, CodingKey {

        case psc_mock_user_result_id = "psc_mock_user_result_id"
        case psc_mock_unique_id = "psc_mock_unique_id"
        case psc_mock_category_id = "psc_mock_category_id"
        case psc_mock_test_series_id = "psc_mock_test_series_id"
        case psc_user_id = "psc_user_id"
        case psc_user_time = "psc_user_time"
        case psc_mock_user_mark = "psc_mock_user_mark"
        case created_at = "created_at"
        case status = "status"
        case psc_mock_test_name = "psc_mock_test_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_mock_user_result_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_user_result_id)
        psc_mock_unique_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_unique_id)
        psc_mock_category_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_category_id)
        psc_mock_test_series_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_series_id)
        psc_user_id = try values.decodeIfPresent(String.self, forKey: .psc_user_id)
        psc_user_time = try values.decodeIfPresent(String.self, forKey: .psc_user_time)
        psc_mock_user_mark = try values.decodeIfPresent(String.self, forKey: .psc_mock_user_mark)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        psc_mock_test_name = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_name)
    }

}

struct Slidereportclass : Codable {
    let data : slidereportdata?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(slidereportdata.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
//submit_enquiry

struct Submitenquiryclass : Codable {
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
//logout
struct Logoutclass : Codable {
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
