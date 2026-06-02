//
//  Loginmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 04/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//

import Foundation
struct LoginData : Codable {
    let psc_user_id : String?
    let psc_first_name : String?
    let psc_last_name : String?
    let psc_email : String?
    let psc_phone : String?
    let psc_password : String?
    let psc_premium_member : String?
    let last_login : String?
    let login_time : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case psc_user_id = "psc_user_id"
        case psc_first_name = "psc_first_name"
        case psc_last_name = "psc_last_name"
        case psc_email = "psc_email"
        case psc_phone = "psc_phone"
        case psc_password = "psc_password"
        case psc_premium_member = "psc_premium_member"
        case last_login = "last_login"
        case login_time = "login_time"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        psc_user_id = try values?.decodeIfPresent(String.self, forKey: .psc_user_id)
        psc_first_name = try values?.decodeIfPresent(String.self, forKey: .psc_first_name)
        psc_last_name = try values?.decodeIfPresent(String.self, forKey: .psc_last_name)
        psc_email = try values?.decodeIfPresent(String.self, forKey: .psc_email)
        psc_phone = try values?.decodeIfPresent(String.self, forKey: .psc_phone)
        psc_password = try values?.decodeIfPresent(String.self, forKey: .psc_password)
        psc_premium_member = try values?.decodeIfPresent(String.self, forKey: .psc_premium_member)
        last_login = try values?.decodeIfPresent(String.self, forKey: .last_login)
        login_time = try values?.decodeIfPresent(String.self, forKey: .login_time)
        created_at = try values?.decodeIfPresent(String.self, forKey: .created_at)
        status = try values?.decodeIfPresent(String.self, forKey: .status)
    }
    
   

}
struct Json4Swift_Base : Codable {
    let data : [LoginData]?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        data = try values?.decodeIfPresent([LoginData].self, forKey: .data)
        status = try values?.decodeIfPresent(Bool.self, forKey: .status)
        message = try values?.decodeIfPresent(String.self, forKey: .message)
    }

    
}

//updateuserprofile
struct updateuserprofile : Codable {
   
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

       
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        
        status = try values?.decodeIfPresent(Bool.self, forKey: .status)
        message = try values?.decodeIfPresent(String.self, forKey: .message)
    }

    
}

//getprofiledetailwithresult
struct Profiledetailwithresultclass : Codable {
    let data : Profileresultdata?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Profileresultdata.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct User_res : Codable {
    let psc_user_id : String?
    let psc_first_name : String?
    let psc_last_name : String?
    let psc_email : String?
    let psc_phone : String?
    let psc_password : String?
    let psc_premium_member : String?
    let last_login : String?
    let login_time : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case psc_user_id = "psc_user_id"
        case psc_first_name = "psc_first_name"
        case psc_last_name = "psc_last_name"
        case psc_email = "psc_email"
        case psc_phone = "psc_phone"
        case psc_password = "psc_password"
        case psc_premium_member = "psc_premium_member"
        case last_login = "last_login"
        case login_time = "login_time"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_user_id = try values.decodeIfPresent(String.self, forKey: .psc_user_id)
        psc_first_name = try values.decodeIfPresent(String.self, forKey: .psc_first_name)
        psc_last_name = try values.decodeIfPresent(String.self, forKey: .psc_last_name)
        psc_email = try values.decodeIfPresent(String.self, forKey: .psc_email)
        psc_phone = try values.decodeIfPresent(String.self, forKey: .psc_phone)
        psc_password = try values.decodeIfPresent(String.self, forKey: .psc_password)
        psc_premium_member = try values.decodeIfPresent(String.self, forKey: .psc_premium_member)
        last_login = try values.decodeIfPresent(String.self, forKey: .last_login)
        login_time = try values.decodeIfPresent(String.self, forKey: .login_time)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}



struct Profileresultdata : Codable {
    let daily_exam : Daily_exam?
    let daily_exam_rank : String?
    let user_res : User_res?

    enum CodingKeys: String, CodingKey {

        case daily_exam = "daily_exam"
        case daily_exam_rank = "daily_exam_rank"
        case user_res = "user_res"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        daily_exam = try values.decodeIfPresent(Daily_exam.self, forKey: .daily_exam)
        daily_exam_rank = try values.decodeIfPresent(String.self, forKey: .daily_exam_rank)
        user_res = try values.decodeIfPresent(User_res.self, forKey: .user_res)
    }

}

struct Daily_exam : Codable {
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
//getfcmtoken
struct Fcmtokenclass : Codable {
   
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

       
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        
        status = try values?.decodeIfPresent(Bool.self, forKey: .status)
        message = try values?.decodeIfPresent(String.self, forKey: .message)
    }

    
}
