//
//  Exclusivecoachingmodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 11/08/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//



//get_chapter_wise_video
import Foundation
struct chapterwisedata : Codable {
    let coaching_video : [Coaching_video]?
    let user_subscription_status : Bool?
    let exam_instructions : Exam_instructions?
    let video_url : String?

    enum CodingKeys: String, CodingKey {

        case coaching_video = "coaching_video"
        case user_subscription_status = "user_subscription_status"
        case exam_instructions = "exam_instructions"
        case video_url = "video_url"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coaching_video = try values.decodeIfPresent([Coaching_video].self, forKey: .coaching_video)
        user_subscription_status = try values.decodeIfPresent(Bool.self, forKey: .user_subscription_status)
        exam_instructions = try values.decodeIfPresent(Exam_instructions.self, forKey: .exam_instructions)
        video_url = try values.decodeIfPresent(String.self, forKey: .video_url)
    }

}


struct Exam_instructions : Codable {
    let id : String?
    let instructions : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case instructions = "instructions"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        instructions = try values.decodeIfPresent(String.self, forKey: .instructions)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}


struct Coaching_video : Codable {
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
    let video_id : String?

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
         case video_id = "video_id"
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
        video_id = try values.decodeIfPresent(String.self, forKey: .video_id)
    }

}


struct Getchapterwisevideoclass : Codable {
    let status : Bool?
    let message : String?
    let data : chapterwisedata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(chapterwisedata.self, forKey: .data)
    }

}
