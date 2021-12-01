//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by hyorin song on 2021/12/01.
//

import Foundation

struct RandomUserResponse: Codable, Identifiable {
    var id =  UUID()
    var name : Name
    var photo : Photo
    private enum CodingKeys: String, CodingKeys {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self
}

struct Name: Codable {
    var title : String
    var first : String
    var last : String
}

struct Photo: Codable {
    var large : String
    var medium : String
    var thumbnail : String
}

struct Info: Codable {
    var seed : String
    var resultsCount : Int
    var page : Int
    var version : String
    private enum CodingKeys: String, CodingKeys {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
    
}

struct RandomUserResponse: Codable, Identifiable {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKeys {
        case results, info
    }
    var description: String{
        return "results.count: \(results.count) / info: \(info.seed)"
    }
}
