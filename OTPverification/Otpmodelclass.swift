//
//  Otpmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 14/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation



struct Signupdata : Codable {
    let psc_first_name : String?
    let psc_last_name : String?
    let psc_email : String?
    let psc_phone : String?
    let psc_password : String?
    let psc_premium_member : Int?
    let last_login : String?
    let created_at : String?
    let status : Int?
    let user_id : Int?
    let title : String?
    let video_url : String?

    enum CodingKeys: String, CodingKey {

        case psc_first_name = "psc_first_name"
        case psc_last_name = "psc_last_name"
        case psc_email = "psc_email"
        case psc_phone = "psc_phone"
        case psc_password = "psc_password"
        case psc_premium_member = "psc_premium_member"
        case last_login = "last_login"
        case created_at = "created_at"
        case status = "status"
        case user_id = "user_id"
        case title = "title"
        case video_url = "video_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_first_name = try values.decodeIfPresent(String.self, forKey: .psc_first_name)
        psc_last_name = try values.decodeIfPresent(String.self, forKey: .psc_last_name)
        psc_email = try values.decodeIfPresent(String.self, forKey: .psc_email)
        psc_phone = try values.decodeIfPresent(String.self, forKey: .psc_phone)
        psc_password = try values.decodeIfPresent(String.self, forKey: .psc_password)
        psc_premium_member = try values.decodeIfPresent(Int.self, forKey: .psc_premium_member)
        last_login = try values.decodeIfPresent(String.self, forKey: .last_login)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(Int.self, forKey: .status)
        user_id = try values.decodeIfPresent(Int.self, forKey: .user_id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        video_url = try values.decodeIfPresent(String.self, forKey: .video_url)
    }

}
struct Otpverify : Codable {
    let data : [Signupdata]?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent([Signupdata].self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

