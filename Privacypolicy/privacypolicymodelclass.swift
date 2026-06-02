//
//  privacypolicymodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 10/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//


import Foundation
struct privacydata : Codable {
    let id : String?
    let privacy_policy : String?
    let created_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case privacy_policy = "privacy_policy"
        case created_at = "created_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        privacy_policy = try values.decodeIfPresent(String.self, forKey: .privacy_policy)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
    }

}



struct Privacypolicyclass : Codable {
    let status : Bool?
    let message : String?
    let data : privacydata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(privacydata.self, forKey: .data)
    }

}
//get_terms_and_condition
struct TermsData : Codable {
    let id : String?
    let terms_condition : String?
    let created_at : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case terms_condition = "terms_condition"
        case created_at = "created_at"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        terms_condition = try values.decodeIfPresent(String.self, forKey: .terms_condition)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
    }

}
struct Termsclass : Codable {
    let status : Bool?
    let message : String?
    let data : TermsData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(TermsData.self, forKey: .data)
    }

}
