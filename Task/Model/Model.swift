//
//  Model.swift
//  Task
//
//  Created by vinumurugan E on 24/02/22.
//

import Foundation

struct GitHub:Decodable {
    let items:[Items]?
}

struct Items:Codable {
    let id:Int?
    let full_name:String?
    let description:String?
    let created_at:String?
    let updated_at:String?
    let pushed_at:String?
    let language:String?
    let default_branch:String?
    let size:Int?
    let clone_url:String?
    let owner:Owners?
}

struct Owners:Codable {
    let avatar_url:String?
    let type:String?
}





