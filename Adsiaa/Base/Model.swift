//
//  Model.swift
//  Adsiaa
//
//  Created by appleguru on 29/10/20.
//  Copyright © 2020 SohelRana. All rights reserved.
//

import Foundation

struct TeamActivity: Codable {
    
    let id: Int?
    let name: String?
    let image: String?
    let rank: String?
    
    enum CodingKeys: String, CodingKey {
        case image = "image_url"
        case id
        case rank
        case name
    }
}

struct LogInActivity:Codable {
    let success: Bool?
    let token: String?
    let user: userinfo?
}

struct logOutActivity: Codable {
    let success: Bool?
    let message: String?
}

struct userinfo:Codable {
    let name: String?
    let email: String?
    let phone: String?
    let address: String?
    let image: String?
}
struct APIError: Codable {
    let statusCode: Int?
    let data: ErrosClass?
    
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case data
    }
}

struct ErrosClass: Codable {
    let errors: Errors?
}

struct Errors: Codable {
    let code: String?
    let messages: [String]?
}

struct profileInfo:Codable {
    let success: Bool?
    let user:user?
}
struct user: Codable {
    let name : String?
    let email : String?
    let username : String?
    let phone : String?
    let address: String?
    let image : String?
}

struct catData: Codable {
    let next: String?
    let previous: String?
    let results : [catInfo]
}

struct catInfo: Codable {
    let id : Int
    let title: String?
}

struct plans: Codable {
    let next: String?
    let previous: String?
    let results: [PlanData]?
}

struct PlanData: Codable {
    let id: Int
    let images: [planImage]?
    let image:String?
    let price:Double?
    let old_price:Double?
    let title:String?
    let description:String?
    let total_quantity:Int?
    let sold_quantity:Int?
}
struct planImage: Codable {
   let plan_image: String?
}

struct getReview: Codable {
    let users: userReviewInfo?
    let star:Int?
    let descriptions:String?
}

struct userReviewInfo: Codable {
    let username:String?
    let name: String?
    let user_image:String?
}

struct addToCartInfo: Codable {
    let success: Bool
    let message: String?
}
struct getCartInfo: Codable {
    let success: Bool
    let message: String?
    let data:[planData]?
    let total: Double?
}

struct planData: Codable {
    let id : Int
    let quantity: Int?
    let plan:[plan]?
}

struct plan: Codable {
    let id: Int
    let title: String?
    let image:String?
    let price:Double?
    let old_price:Double?
    let review:[planReview]?
}
struct planReview: Codable {
    let id:Int
    let star:Int
}

struct increaseQTY: Codable {
    let success: Bool
    let message: String?
    let data:[qtyData]?
    let total: Double?
}

struct qtyData: Codable {
    let quantity: Int?
}
struct updateProfileData: Codable {
    let name:String?
    let image: String?
}

struct sendEmail: Codable {
    let success: Bool
    let message:String?
}
