//
//  Dailyexammodelclass.swift
//  Lasagu
//
//  Created by Arun Vijayan on 30/07/20.
//  Copyright © 2020 Arun Vijayan. All rights reserved.
//




import Foundation

//dailyeaxmquestions
struct quesansdata : Codable {
    let psc_question_id : String?
    let psc_premium : String?
    let psc_question : String?
    let psc_option1 : String?
    let psc_option2 : String?
    let psc_option3 : String?
    let psc_option4 : String?
    let psc_answer : String?
    let psc_hints : String?
    let psc_exam_date : String?
    let psc_special_exam : String?
    let created_at : String?
    let status : String?
    var isselected:Int?

    enum CodingKeys: String, CodingKey {

        case psc_question_id = "psc_question_id"
        case psc_premium = "psc_premium"
        case psc_question = "psc_question"
        case psc_option1 = "psc_option1"
        case psc_option2 = "psc_option2"
        case psc_option3 = "psc_option3"
        case psc_option4 = "psc_option4"
        case psc_answer = "psc_answer"
        case psc_hints = "psc_hints"
        case psc_exam_date = "psc_exam_date"
        case psc_special_exam = "psc_special_exam"
        case created_at = "created_at"
        case status = "status"
        case isselected = "isselected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_question_id = try values.decodeIfPresent(String.self, forKey: .psc_question_id)
        psc_premium = try values.decodeIfPresent(String.self, forKey: .psc_premium)
        psc_question = try values.decodeIfPresent(String.self, forKey: .psc_question)
        psc_option1 = try values.decodeIfPresent(String.self, forKey: .psc_option1)
        psc_option2 = try values.decodeIfPresent(String.self, forKey: .psc_option2)
        psc_option3 = try values.decodeIfPresent(String.self, forKey: .psc_option3)
        psc_option4 = try values.decodeIfPresent(String.self, forKey: .psc_option4)
        psc_answer = try values.decodeIfPresent(String.self, forKey: .psc_answer)
        psc_hints = try values.decodeIfPresent(String.self, forKey: .psc_hints)
        psc_exam_date = try values.decodeIfPresent(String.self, forKey: .psc_exam_date)
        psc_special_exam = try values.decodeIfPresent(String.self, forKey: .psc_special_exam)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        isselected=try values.decodeIfPresent(Int.self, forKey: .isselected)
    }

}
struct Dailyexam : Codable {
    let status : Bool?
    let message : String?
    let data : [quesansdata]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([quesansdata].self, forKey: .data)
    }

}
//mocktestquestions
struct Mock_test_series_question : Codable {
    let psc_mock_test_series_id : String?
    let psc_mock_category_id : String?
    let psc_mock_test_name : String?
    let psc_mock_test_instruction : String?
    let psc_mock_test_time : String?
    let psc_mock_test_lock : String?
    let created_at : String?
    let status : String?
    let questions : [Questions]?

    enum CodingKeys: String, CodingKey {

        case psc_mock_test_series_id = "psc_mock_test_series_id"
        case psc_mock_category_id = "psc_mock_category_id"
        case psc_mock_test_name = "psc_mock_test_name"
        case psc_mock_test_instruction = "psc_mock_test_instruction"
        case psc_mock_test_time = "psc_mock_test_time"
        case psc_mock_test_lock = "psc_mock_test_lock"
        case created_at = "created_at"
        case status = "status"
        case questions = "questions"
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
        questions = try values.decodeIfPresent([Questions].self, forKey: .questions)
    }

}
struct testseriesqustdata : Codable {
    let mock_test_series : [Mock_test_series_question]?

    enum CodingKeys: String, CodingKey {

        case mock_test_series = "mock_test_series"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        mock_test_series = try values.decodeIfPresent([Mock_test_series_question].self, forKey: .mock_test_series)
    }

}
struct Questions : Codable {
    let psc_mtq_id : String?
    let psc_mock_test_series_id : String?
    let psc_question_id : String?
    let psc_premium : String?
    let psc_question : String?
    let psc_option1 : String?
    let psc_option2 : String?
    let psc_option3 : String?
    let psc_option4 : String?
    let psc_answer : String?
    let psc_hints : String?
    let psc_exam_date : String?
    let psc_special_exam : String?
    let created_at : String?
    let status : String?
    var isselected :Int?

    enum CodingKeys: String, CodingKey {

        case psc_mtq_id = "psc_mtq_id"
        case psc_mock_test_series_id = "psc_mock_test_series_id"
        case psc_question_id = "psc_question_id"
        case psc_premium = "psc_premium"
        case psc_question = "psc_question"
        case psc_option1 = "psc_option1"
        case psc_option2 = "psc_option2"
        case psc_option3 = "psc_option3"
        case psc_option4 = "psc_option4"
        case psc_answer = "psc_answer"
        case psc_hints = "psc_hints"
        case psc_exam_date = "psc_exam_date"
        case psc_special_exam = "psc_special_exam"
        case created_at = "created_at"
        case status = "status"
        case isselected = "isselected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        psc_mtq_id = try values.decodeIfPresent(String.self, forKey: .psc_mtq_id)
        psc_mock_test_series_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_test_series_id)
        psc_question_id = try values.decodeIfPresent(String.self, forKey: .psc_question_id)
        psc_premium = try values.decodeIfPresent(String.self, forKey: .psc_premium)
        psc_question = try values.decodeIfPresent(String.self, forKey: .psc_question)
        psc_option1 = try values.decodeIfPresent(String.self, forKey: .psc_option1)
        psc_option2 = try values.decodeIfPresent(String.self, forKey: .psc_option2)
        psc_option3 = try values.decodeIfPresent(String.self, forKey: .psc_option3)
        psc_option4 = try values.decodeIfPresent(String.self, forKey: .psc_option4)
        psc_answer = try values.decodeIfPresent(String.self, forKey: .psc_answer)
        psc_hints = try values.decodeIfPresent(String.self, forKey: .psc_hints)
        psc_exam_date = try values.decodeIfPresent(String.self, forKey: .psc_exam_date)
        psc_special_exam = try values.decodeIfPresent(String.self, forKey: .psc_special_exam)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        isselected = try values.decodeIfPresent(Int.self, forKey: .isselected)
    }

}
struct Testseriesquestion : Codable {
    let status : Bool?
    let message : String?
    let data : testseriesqustdata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(testseriesqustdata.self, forKey: .data)
    }

}

//dailyeaxamnaswersubmission
struct Solutions : Codable {
    let question_id : String?
    let question : String?
    let selected_answer : String?
    let psc_answer : String?
    let psc_hints : String?
    let psc_answer_status : Int?

    enum CodingKeys: String, CodingKey {

        case question_id = "question_id"
        case question = "question"
        case selected_answer = "selected_answer"
        case psc_answer = "psc_answer"
        case psc_hints = "psc_hints"
        case psc_answer_status = "psc_answer_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        question_id = try values.decodeIfPresent(String.self, forKey: .question_id)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        selected_answer = try values.decodeIfPresent(String.self, forKey: .selected_answer)
        psc_answer = try values.decodeIfPresent(String.self, forKey: .psc_answer)
        psc_hints = try values.decodeIfPresent(String.self, forKey: .psc_hints)
        psc_answer_status = try values.decodeIfPresent(Int.self, forKey: .psc_answer_status)
    }

}

struct Dailyexamanswerdata : Codable {
    let total_question : Int?
    let total_attend_question : Int?
    let total_correct_answer : Int?
    let total_wrong_answer : Int?
    let total_mark_out_100 : Float?
    let current_user_rank : String?
    let user_time : String?
    let total_user : Int?
    let solutions : [Solutions]?

    enum CodingKeys: String, CodingKey {

        case total_question = "total_question"
        case total_attend_question = "total_attend_question"
        case total_correct_answer = "total_correct_answer"
        case total_wrong_answer = "total_wrong_answer"
        case total_mark_out_100 = "total_mark_out_100"
        case current_user_rank = "current_user_rank"
        case user_time = "user_time"
        case total_user = "total_user"
        case solutions = "solutions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_question = try values.decodeIfPresent(Int.self, forKey: .total_question)
        total_attend_question = try values.decodeIfPresent(Int.self, forKey: .total_attend_question)
        total_correct_answer = try values.decodeIfPresent(Int.self, forKey: .total_correct_answer)
        total_wrong_answer = try values.decodeIfPresent(Int.self, forKey: .total_wrong_answer)
        total_mark_out_100 = try values.decodeIfPresent(Float.self, forKey: .total_mark_out_100)
        current_user_rank = try values.decodeIfPresent(String.self, forKey: .current_user_rank)
        user_time = try values.decodeIfPresent(String.self, forKey: .user_time)
        total_user = try values.decodeIfPresent(Int.self, forKey: .total_user)
        solutions = try values.decodeIfPresent([Solutions].self, forKey: .solutions)
    }

}

struct Dailyexamanswersubmsn : Codable {
    let data : Dailyexamanswerdata?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(Dailyexamanswerdata.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

//testseriesanswersubmision
struct ReporttestseriesData : Codable {
    let report : Report?

    enum CodingKeys: String, CodingKey {

        case report = "report"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report = try values.decodeIfPresent(Report.self, forKey: .report)
    }

}


struct Reporttestseries : Codable {
    let data : ReporttestseriesData?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(ReporttestseriesData.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct Report : Codable {
    let statistics : [String]?
    let total_question : Int?
    let total_attend_question : Int?
    let total_correct_answer : Int?
    let total_wrong_answer : Int?
    let total_mark_out_100 : Double?
    let current_user_rank : String?
    let exam_time : String?
    let user_time : String?
    let total_user : Int?
    let mock_test_series_id : String?
    let mock_result_id : Int?

    enum CodingKeys: String, CodingKey {

        case statistics = "statistics"
        case total_question = "total_question"
        case total_attend_question = "total_attend_question"
        case total_correct_answer = "total_correct_answer"
        case total_wrong_answer = "total_wrong_answer"
        case total_mark_out_100 = "total_mark_out_100"
        case current_user_rank = "current_user_rank"
        case exam_time = "exam_time"
        case user_time = "user_time"
        case total_user = "total_user"
        case mock_test_series_id = "mock_test_series_id"
        case mock_result_id = "mock_result_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statistics = try values.decodeIfPresent([String].self, forKey: .statistics)
        total_question = try values.decodeIfPresent(Int.self, forKey: .total_question)
        total_attend_question = try values.decodeIfPresent(Int.self, forKey: .total_attend_question)
        total_correct_answer = try values.decodeIfPresent(Int.self, forKey: .total_correct_answer)
        total_wrong_answer = try values.decodeIfPresent(Int.self, forKey: .total_wrong_answer)
        total_mark_out_100 = try values.decodeIfPresent(Double.self, forKey: .total_mark_out_100)
        current_user_rank = try values.decodeIfPresent(String.self, forKey: .current_user_rank)
        exam_time = try values.decodeIfPresent(String.self, forKey: .exam_time)
        user_time = try values.decodeIfPresent(String.self, forKey: .user_time)
        total_user = try values.decodeIfPresent(Int.self, forKey: .total_user)
        mock_test_series_id = try values.decodeIfPresent(String.self, forKey: .mock_test_series_id)
        mock_result_id = try values.decodeIfPresent(Int.self, forKey: .mock_result_id)
    }

}

//solutiontestseries
struct Solutiontestseries : Codable {
    let questions : [Questionstestseries]?

    enum CodingKeys: String, CodingKey {

        case questions = "questions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        questions = try values.decodeIfPresent([Questionstestseries].self, forKey: .questions)
    }

}
struct solutiontestseriesData : Codable {
    let solution : Solutiontestseries?

    enum CodingKeys: String, CodingKey {

        case solution = "solution"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        solution = try values.decodeIfPresent(Solutiontestseries.self, forKey: .solution)
    }

}
struct Questionstestseries : Codable {
    let id : String?
    let psc_mock_user_result_id : String?
    let psc_question_id : String?
    let psc_selected_answer : String?
    let psc_answer_status : String?
    let psc_user_id : String?
    let question_answer : String?
    let question : String?
    let psc_hints : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case psc_mock_user_result_id = "psc_mock_user_result_id"
        case psc_question_id = "psc_question_id"
        case psc_selected_answer = "psc_selected_answer"
        case psc_answer_status = "psc_answer_status"
        case psc_user_id = "psc_user_id"
        case question_answer = "question_answer"
        case question = "question"
        case psc_hints = "psc_hints"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        psc_mock_user_result_id = try values.decodeIfPresent(String.self, forKey: .psc_mock_user_result_id)
        psc_question_id = try values.decodeIfPresent(String.self, forKey: .psc_question_id)
        psc_selected_answer = try values.decodeIfPresent(String.self, forKey: .psc_selected_answer)
        psc_answer_status = try values.decodeIfPresent(String.self, forKey: .psc_answer_status)
        psc_user_id = try values.decodeIfPresent(String.self, forKey: .psc_user_id)
        question_answer = try values.decodeIfPresent(String.self, forKey: .question_answer)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        psc_hints = try values.decodeIfPresent(String.self, forKey: .psc_hints)
    }

}
struct Solutionfortestseriesclass : Codable {
    let data : solutiontestseriesData?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(solutiontestseriesData.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}
//get_chapter_wise_examfrom coaching


struct chapterwisequstndata : Codable {
    let chapter_question_id : String?
    let psc_premium_category_id : String?
    let chapter_id : String?
    let chapter_exam_question : String?
    let chapter_exam_option1 : String?
    let chapter_exam_option2 : String?
    let chapter_exam_option3 : String?
    let chapter_exam_option4 : String?
    let chapter_exam_answer : String?
    let chapter_exam_hints : String?
    let created_at : String?
    let status : String?
    var isselected :Int?

    enum CodingKeys: String, CodingKey {

        case chapter_question_id = "chapter_question_id"
        case psc_premium_category_id = "psc_premium_category_id"
        case chapter_id = "chapter_id"
        case chapter_exam_question = "chapter_exam_question"
        case chapter_exam_option1 = "chapter_exam_option1"
        case chapter_exam_option2 = "chapter_exam_option2"
        case chapter_exam_option3 = "chapter_exam_option3"
        case chapter_exam_option4 = "chapter_exam_option4"
        case chapter_exam_answer = "chapter_exam_answer"
        case chapter_exam_hints = "chapter_exam_hints"
        case created_at = "created_at"
        case status = "status"
         case isselected = "isselected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chapter_question_id = try values.decodeIfPresent(String.self, forKey: .chapter_question_id)
        psc_premium_category_id = try values.decodeIfPresent(String.self, forKey: .psc_premium_category_id)
        chapter_id = try values.decodeIfPresent(String.self, forKey: .chapter_id)
        chapter_exam_question = try values.decodeIfPresent(String.self, forKey: .chapter_exam_question)
        chapter_exam_option1 = try values.decodeIfPresent(String.self, forKey: .chapter_exam_option1)
        chapter_exam_option2 = try values.decodeIfPresent(String.self, forKey: .chapter_exam_option2)
        chapter_exam_option3 = try values.decodeIfPresent(String.self, forKey: .chapter_exam_option3)
        chapter_exam_option4 = try values.decodeIfPresent(String.self, forKey: .chapter_exam_option4)
        chapter_exam_answer = try values.decodeIfPresent(String.self, forKey: .chapter_exam_answer)
        chapter_exam_hints = try values.decodeIfPresent(String.self, forKey: .chapter_exam_hints)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        isselected = try values.decodeIfPresent(Int.self, forKey: .isselected)
    }

}

struct Chapterwiseexamclass : Codable {
    let status : Bool?
    let message : String?
    let data : [chapterwisequstndata]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([chapterwisequstndata].self, forKey: .data)
    }

}

//submit_chapterwiseexam

struct Solutionschapterwise : Codable {
    let chapter_question_id : String?
    let chapter_exam_question : String?
    let chapter_select_answer : String?
    let chapter_exam_answer : String?
    let chapter_answer_status : Int?
    let chapter_exam_hints : String?

    enum CodingKeys: String, CodingKey {

        case chapter_question_id = "chapter_question_id"
        case chapter_exam_question = "chapter_exam_question"
        case chapter_select_answer = "chapter_select_answer"
        case chapter_exam_answer = "chapter_exam_answer"
        case chapter_answer_status = "chapter_answer_status"
        case chapter_exam_hints = "chapter_exam_hints"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        chapter_question_id = try values.decodeIfPresent(String.self, forKey: .chapter_question_id)
        chapter_exam_question = try values.decodeIfPresent(String.self, forKey: .chapter_exam_question)
        chapter_select_answer = try values.decodeIfPresent(String.self, forKey: .chapter_select_answer)
        chapter_exam_answer = try values.decodeIfPresent(String.self, forKey: .chapter_exam_answer)
        chapter_answer_status = try values.decodeIfPresent(Int.self, forKey: .chapter_answer_status)
        chapter_exam_hints = try values.decodeIfPresent(String.self, forKey: .chapter_exam_hints)
    }

}

struct submitchapterwisedata : Codable {
    let total_question : Int?
    let total_attend_question : Int?
    let total_correct_answer : Int?
    let total_wrong_answer : Int?
    let total_mark_out_100 : Double?
    let user_time : String?
    let solutions : [Solutionschapterwise]?

    enum CodingKeys: String, CodingKey {

        case total_question = "total_question"
        case total_attend_question = "total_attend_question"
        case total_correct_answer = "total_correct_answer"
        case total_wrong_answer = "total_wrong_answer"
        case total_mark_out_100 = "total_mark_out_100"
        case user_time = "user_time"
        case solutions = "solutions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        total_question = try values.decodeIfPresent(Int.self, forKey: .total_question)
        total_attend_question = try values.decodeIfPresent(Int.self, forKey: .total_attend_question)
        total_correct_answer = try values.decodeIfPresent(Int.self, forKey: .total_correct_answer)
        total_wrong_answer = try values.decodeIfPresent(Int.self, forKey: .total_wrong_answer)
        total_mark_out_100 = try values.decodeIfPresent(Double.self, forKey: .total_mark_out_100)
        user_time = try values.decodeIfPresent(String.self, forKey: .user_time)
        solutions = try values.decodeIfPresent([Solutionschapterwise].self, forKey: .solutions)
    }

}

struct Submittchapterwiseexamclass : Codable {
    let data : submitchapterwisedata?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(submitchapterwisedata.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

//get_cf_year_month


struct Yearmonthdata : Codable {
    let year : [Year]?
    let month : [Month]?

    enum CodingKeys: String, CodingKey {

        case year = "year"
        case month = "month"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        year = try values.decodeIfPresent([Year].self, forKey: .year)
        month = try values.decodeIfPresent([Month].self, forKey: .month)
    }

}


struct Yearmonthclass : Codable {
    let status : Bool?
    let message : String?
    let data : Yearmonthdata?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Yearmonthdata.self, forKey: .data)
    }

}


struct Month : Codable {
    let month_id : String?
    let short : String?
    let month : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case month_id = "month_id"
        case short = "short"
        case month = "month"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        month_id = try values.decodeIfPresent(String.self, forKey: .month_id)
        short = try values.decodeIfPresent(String.self, forKey: .short)
        month = try values.decodeIfPresent(String.self, forKey: .month)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}



struct Year : Codable {
    let year_id : String?
    let year : String?
    let created_at : String?
    let status : String?

    enum CodingKeys: String, CodingKey {

        case year_id = "year_id"
        case year = "year"
        case created_at = "created_at"
        case status = "status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        year_id = try values.decodeIfPresent(String.self, forKey: .year_id)
        year = try values.decodeIfPresent(String.self, forKey: .year)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
    }

}

//get_current_affairs_pdf



struct PdfData : Codable {
    let ca_id : String?
    let year_id : String?
    let month_id : String?
    let ca_pdf : String?
    let ca_exam_time : String?
    let created_at : String?
    let status : String?
    let ca_exam_time_ms : Int?
    let pdf_url : String?
    let exam_instructions : String?

    enum CodingKeys: String, CodingKey {

        case ca_id = "ca_id"
        case year_id = "year_id"
        case month_id = "month_id"
        case ca_pdf = "ca_pdf"
        case ca_exam_time = "ca_exam_time"
        case created_at = "created_at"
        case status = "status"
        case ca_exam_time_ms = "ca_exam_time_ms"
        case pdf_url = "pdf_url"
        case exam_instructions = "exam_instructions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ca_id = try values.decodeIfPresent(String.self, forKey: .ca_id)
        year_id = try values.decodeIfPresent(String.self, forKey: .year_id)
        month_id = try values.decodeIfPresent(String.self, forKey: .month_id)
        ca_pdf = try values.decodeIfPresent(String.self, forKey: .ca_pdf)
        ca_exam_time = try values.decodeIfPresent(String.self, forKey: .ca_exam_time)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        ca_exam_time_ms = try values.decodeIfPresent(Int.self, forKey: .ca_exam_time_ms)
        pdf_url = try values.decodeIfPresent(String.self, forKey: .pdf_url)
        exam_instructions = try values.decodeIfPresent(String.self, forKey: .exam_instructions)
    }

}


struct Currentpdfclass : Codable {
    let status : Bool?
    let message : String?
    let data : PdfData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(PdfData.self, forKey: .data)
    }

}


//get_current_affairs_questions

struct CurrentaffairData : Codable {
    let ca_question_id : String?
    let ca_id : String?
    let ca_question : String?
    let ca_option1 : String?
    let ca_option2 : String?
    let ca_option3 : String?
    let ca_option4 : String?
    let ca_answer : String?
    let ca_hints : String?
    let created_at : String?
    let status : String?
    var isselected :Int?

    enum CodingKeys: String, CodingKey {

        case ca_question_id = "ca_question_id"
        case ca_id = "ca_id"
        case ca_question = "ca_question"
        case ca_option1 = "ca_option1"
        case ca_option2 = "ca_option2"
        case ca_option3 = "ca_option3"
        case ca_option4 = "ca_option4"
        case ca_answer = "ca_answer"
        case ca_hints = "ca_hints"
        case created_at = "created_at"
        case status = "status"
        case isselected = "isselected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ca_question_id = try values.decodeIfPresent(String.self, forKey: .ca_question_id)
        ca_id = try values.decodeIfPresent(String.self, forKey: .ca_id)
        ca_question = try values.decodeIfPresent(String.self, forKey: .ca_question)
        ca_option1 = try values.decodeIfPresent(String.self, forKey: .ca_option1)
        ca_option2 = try values.decodeIfPresent(String.self, forKey: .ca_option2)
        ca_option3 = try values.decodeIfPresent(String.self, forKey: .ca_option3)
        ca_option4 = try values.decodeIfPresent(String.self, forKey: .ca_option4)
        ca_answer = try values.decodeIfPresent(String.self, forKey: .ca_answer)
        ca_hints = try values.decodeIfPresent(String.self, forKey: .ca_hints)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        isselected = try values.decodeIfPresent(Int.self, forKey: .isselected)
    }

}


struct Currentaffairsqustnclass : Codable {
    let status : Bool?
    let message : String?
    let data : [CurrentaffairData]?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent([CurrentaffairData].self, forKey: .data)
    }

}
//submit_ca_exam


struct CAData : Codable {
    let report : CAReport?

    enum CodingKeys: String, CodingKey {

        case report = "report"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report = try values.decodeIfPresent(CAReport.self, forKey: .report)
    }

}

struct Submittcaexamclass : Codable {
    let data : CAData?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(CAData.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}



struct CAReport : Codable {
    let statistics : [String]?
    let total_question : Int?
    let total_attend_question : Int?
    let total_correct_answer : Int?
    let total_wrong_answer : Int?
    let total_mark_out_100 : Double?
    let total_mark : Double?
    let current_user_rank : String?
    let exam_time : String?
    let user_time : String?
    let total_user : Int?
    let ca_id : String?
    let ca_exam_result_id : Int?

    enum CodingKeys: String, CodingKey {

        case statistics = "statistics"
        case total_question = "total_question"
        case total_attend_question = "total_attend_question"
        case total_correct_answer = "total_correct_answer"
        case total_wrong_answer = "total_wrong_answer"
        case total_mark_out_100 = "total_mark_out_100"
        case total_mark = "total_mark"
        case current_user_rank = "current_user_rank"
        case exam_time = "exam_time"
        case user_time = "user_time"
        case total_user = "total_user"
        case ca_id = "ca_id"
        case ca_exam_result_id = "ca_exam_result_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statistics = try values.decodeIfPresent([String].self, forKey: .statistics)
        total_question = try values.decodeIfPresent(Int.self, forKey: .total_question)
        total_attend_question = try values.decodeIfPresent(Int.self, forKey: .total_attend_question)
        total_correct_answer = try values.decodeIfPresent(Int.self, forKey: .total_correct_answer)
        total_wrong_answer = try values.decodeIfPresent(Int.self, forKey: .total_wrong_answer)
        total_mark_out_100 = try values.decodeIfPresent(Double.self, forKey: .total_mark_out_100)
        total_mark = try values.decodeIfPresent(Double.self, forKey: .total_mark)
        current_user_rank = try values.decodeIfPresent(String.self, forKey: .current_user_rank)
        exam_time = try values.decodeIfPresent(String.self, forKey: .exam_time)
        user_time = try values.decodeIfPresent(String.self, forKey: .user_time)
        total_user = try values.decodeIfPresent(Int.self, forKey: .total_user)
        ca_id = try values.decodeIfPresent(String.self, forKey: .ca_id)
        ca_exam_result_id = try values.decodeIfPresent(Int.self, forKey: .ca_exam_result_id)
    }

}
//ca_exam_solution

struct CAsolutionData : Codable {
    let solution : CASolution?

    enum CodingKeys: String, CodingKey {

        case solution = "solution"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        solution = try values.decodeIfPresent(CASolution.self, forKey: .solution)
    }

}


struct CAsolutionclass : Codable {
    let data : CAsolutionData?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(CAsolutionData.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}



struct CAQuestions : Codable {
    let ca_exam_detail_id : String?
    let ca_exam_result_id : String?
    let ca_question_id : String?
    let ca_selected_answer : String?
    let ca_answer_status : String?
    let psc_user_id : String?
    let question_answer : String?
    let question : String?
    let psc_hints : String?

    enum CodingKeys: String, CodingKey {

        case ca_exam_detail_id = "ca_exam_detail_id"
        case ca_exam_result_id = "ca_exam_result_id"
        case ca_question_id = "ca_question_id"
        case ca_selected_answer = "ca_selected_answer"
        case ca_answer_status = "ca_answer_status"
        case psc_user_id = "psc_user_id"
        case question_answer = "question_answer"
        case question = "question"
        case psc_hints = "psc_hints"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ca_exam_detail_id = try values.decodeIfPresent(String.self, forKey: .ca_exam_detail_id)
        ca_exam_result_id = try values.decodeIfPresent(String.self, forKey: .ca_exam_result_id)
        ca_question_id = try values.decodeIfPresent(String.self, forKey: .ca_question_id)
        ca_selected_answer = try values.decodeIfPresent(String.self, forKey: .ca_selected_answer)
        ca_answer_status = try values.decodeIfPresent(String.self, forKey: .ca_answer_status)
        psc_user_id = try values.decodeIfPresent(String.self, forKey: .psc_user_id)
        question_answer = try values.decodeIfPresent(String.self, forKey: .question_answer)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        psc_hints = try values.decodeIfPresent(String.self, forKey: .psc_hints)
    }

}


struct CASolution : Codable {
    let questions : [CAQuestions]?

    enum CodingKeys: String, CodingKey {

        case questions = "questions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        questions = try values.decodeIfPresent([CAQuestions].self, forKey: .questions)
    }

}
//get_week_wise_exam_questions

struct WeekwisequstnData : Codable {
    let week_exam : Week_exam?
    let questions : [WeekQuestions]?

    enum CodingKeys: String, CodingKey {

        case week_exam = "week_exam"
        case questions = "questions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        week_exam = try values.decodeIfPresent(Week_exam.self, forKey: .week_exam)
        questions = try values.decodeIfPresent([WeekQuestions].self, forKey: .questions)
    }

}

struct Weekwiseexamqustnclass : Codable {
    let status : Bool?
    let message : String?
    let data : WeekwisequstnData?

    enum CodingKeys: String, CodingKey {

        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(WeekwisequstnData.self, forKey: .data)
    }

}


struct WeekQuestions : Codable {
    let exam_question_id : String?
    let week_exam_id : String?
    let question : String?
    let option1 : String?
    let option2 : String?
    let option3 : String?
    let option4 : String?
    let answer : String?
    let hints : String?
    let created_at : String?
    let status : String?
    var isselected:Int?

    enum CodingKeys: String, CodingKey {

        case exam_question_id = "exam_question_id"
        case week_exam_id = "week_exam_id"
        case question = "question"
        case option1 = "option1"
        case option2 = "option2"
        case option3 = "option3"
        case option4 = "option4"
        case answer = "answer"
        case hints = "hints"
        case created_at = "created_at"
        case status = "status"
        case isselected = "isselected"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        exam_question_id = try values.decodeIfPresent(String.self, forKey: .exam_question_id)
        week_exam_id = try values.decodeIfPresent(String.self, forKey: .week_exam_id)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        option1 = try values.decodeIfPresent(String.self, forKey: .option1)
        option2 = try values.decodeIfPresent(String.self, forKey: .option2)
        option3 = try values.decodeIfPresent(String.self, forKey: .option3)
        option4 = try values.decodeIfPresent(String.self, forKey: .option4)
        answer = try values.decodeIfPresent(String.self, forKey: .answer)
        hints = try values.decodeIfPresent(String.self, forKey: .hints)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
         isselected = try values.decodeIfPresent(Int.self, forKey: .isselected)
    }

}


struct Week_exam : Codable {
    let week_exam_id : String?
    let preliminary_id : String?
    let main_exam_id : String?
    let week_id : String?
    let exam_name : String?
    let exam_instructions : String?
    let exam_time : String?
    let color_code : String?
    let created_at : String?
    let status : String?
    let exam_time_ms : Int?

    enum CodingKeys: String, CodingKey {

        case week_exam_id = "week_exam_id"
        case preliminary_id = "preliminary_id"
        case main_exam_id = "main_exam_id"
        case week_id = "week_id"
        case exam_name = "exam_name"
        case exam_instructions = "exam_instructions"
        case exam_time = "exam_time"
        case color_code = "color_code"
        case created_at = "created_at"
        case status = "status"
        case exam_time_ms = "exam_time_ms"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        week_exam_id = try values.decodeIfPresent(String.self, forKey: .week_exam_id)
        preliminary_id = try values.decodeIfPresent(String.self, forKey: .preliminary_id)
        main_exam_id = try values.decodeIfPresent(String.self, forKey: .main_exam_id)
        week_id = try values.decodeIfPresent(String.self, forKey: .week_id)
        exam_name = try values.decodeIfPresent(String.self, forKey: .exam_name)
        exam_instructions = try values.decodeIfPresent(String.self, forKey: .exam_instructions)
        exam_time = try values.decodeIfPresent(String.self, forKey: .exam_time)
        color_code = try values.decodeIfPresent(String.self, forKey: .color_code)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        exam_time_ms = try values.decodeIfPresent(Int.self, forKey: .exam_time_ms)
    }

}
//submit_week_wise_exam
struct submitweekexamData : Codable {
    let report : SubmitweekexamReport?

    enum CodingKeys: String, CodingKey {

        case report = "report"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        report = try values.decodeIfPresent(SubmitweekexamReport.self, forKey: .report)
    }

}



struct Submitweekexamclass : Codable {
    let data : submitweekexamData?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(submitweekexamData.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}

struct SubmitweekexamReport : Codable {
    let statistics : [String]?
    let total_question : Int?
    let total_attend_question : Int?
    let total_correct_answer : Int?
    let total_wrong_answer : Int?
    let total_mark_out_100 : Double?
    let total_mark : Double?
    let current_user_rank : String?
    let exam_time : String?
    let user_time : String?
    let total_user : Int?
    let week_exam_id : String?
    let week_exam_result_id : Int?

    enum CodingKeys: String, CodingKey {

        case statistics = "statistics"
        case total_question = "total_question"
        case total_attend_question = "total_attend_question"
        case total_correct_answer = "total_correct_answer"
        case total_wrong_answer = "total_wrong_answer"
        case total_mark_out_100 = "total_mark_out_100"
        case total_mark = "total_mark"
        case current_user_rank = "current_user_rank"
        case exam_time = "exam_time"
        case user_time = "user_time"
        case total_user = "total_user"
        case week_exam_id = "week_exam_id"
        case week_exam_result_id = "week_exam_result_id"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        statistics = try values.decodeIfPresent([String].self, forKey: .statistics)
        total_question = try values.decodeIfPresent(Int.self, forKey: .total_question)
        total_attend_question = try values.decodeIfPresent(Int.self, forKey: .total_attend_question)
        total_correct_answer = try values.decodeIfPresent(Int.self, forKey: .total_correct_answer)
        total_wrong_answer = try values.decodeIfPresent(Int.self, forKey: .total_wrong_answer)
        total_mark_out_100 = try values.decodeIfPresent(Double.self, forKey: .total_mark_out_100)
        total_mark = try values.decodeIfPresent(Double.self, forKey: .total_mark)
        current_user_rank = try values.decodeIfPresent(String.self, forKey: .current_user_rank)
        exam_time = try values.decodeIfPresent(String.self, forKey: .exam_time)
        user_time = try values.decodeIfPresent(String.self, forKey: .user_time)
        total_user = try values.decodeIfPresent(Int.self, forKey: .total_user)
        week_exam_id = try values.decodeIfPresent(String.self, forKey: .week_exam_id)
        week_exam_result_id = try values.decodeIfPresent(Int.self, forKey: .week_exam_result_id)
    }

}

//week_exam_solution
struct WeeksolutionData : Codable {
    let solution : WeekexamSolution?

    enum CodingKeys: String, CodingKey {

        case solution = "solution"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        solution = try values.decodeIfPresent(WeekexamSolution.self, forKey: .solution)
    }

}



struct weeksolutionclass : Codable {
    let data : WeeksolutionData?
    let status : Bool?
    let message : String?

    enum CodingKeys: String, CodingKey {

        case data = "data"
        case status = "status"
        case message = "message"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        data = try values.decodeIfPresent(WeeksolutionData.self, forKey: .data)
        status = try values.decodeIfPresent(Bool.self, forKey: .status)
        message = try values.decodeIfPresent(String.self, forKey: .message)
    }

}



struct WeeksolutionQuestions : Codable {
    let exam_question_id : String?
    let week_exam_id : String?
    let question : String?
    let option1 : String?
    let option2 : String?
    let option3 : String?
    let option4 : String?
    let answer : String?
    let hints : String?
    let created_at : String?
    let status : String?
    let selected_answer : String?
    let answer_status : String?

    enum CodingKeys: String, CodingKey {

        case exam_question_id = "exam_question_id"
        case week_exam_id = "week_exam_id"
        case question = "question"
        case option1 = "option1"
        case option2 = "option2"
        case option3 = "option3"
        case option4 = "option4"
        case answer = "answer"
        case hints = "hints"
        case created_at = "created_at"
        case status = "status"
        case selected_answer = "selected_answer"
        case answer_status = "answer_status"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        exam_question_id = try values.decodeIfPresent(String.self, forKey: .exam_question_id)
        week_exam_id = try values.decodeIfPresent(String.self, forKey: .week_exam_id)
        question = try values.decodeIfPresent(String.self, forKey: .question)
        option1 = try values.decodeIfPresent(String.self, forKey: .option1)
        option2 = try values.decodeIfPresent(String.self, forKey: .option2)
        option3 = try values.decodeIfPresent(String.self, forKey: .option3)
        option4 = try values.decodeIfPresent(String.self, forKey: .option4)
        answer = try values.decodeIfPresent(String.self, forKey: .answer)
        hints = try values.decodeIfPresent(String.self, forKey: .hints)
        created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        selected_answer = try values.decodeIfPresent(String.self, forKey: .selected_answer)
        answer_status = try values.decodeIfPresent(String.self, forKey: .answer_status)
    }

}

struct WeekexamSolution : Codable {
    let questions : [WeeksolutionQuestions]?

    enum CodingKeys: String, CodingKey {

        case questions = "questions"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        questions = try values.decodeIfPresent([WeeksolutionQuestions].self, forKey: .questions)
    }

}
