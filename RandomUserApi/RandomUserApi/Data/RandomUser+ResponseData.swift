//
//  RandomUser+ResponseData.swift
//  RandomUserApi
//
//  Created by hyorin song on 2021/12/01.
//

import Foundation

struct RandomUser: Codable, Identifiable, CustomStringConvertible {
    var id =  UUID()
    var name : Name
    var photo : Photo
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case photo = "picture"
    }
    static func getDummy() -> Self{
        print(#fileID, #function, #line, "")
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
    
    var profileImgUrl : URL{
        get{
            URL(string: photo.medium)!
        }
    }
    
    var description: String{
        return name.description
    }
}

struct Name: Codable, CustomStringConvertible {
    var title : String
    var first : String
    var last : String
    var description: String{
        return "[\(title)] \(last), \(first)"
    }
    static func getDummy() -> Self{
        print(#fileID, #function, #line, "")
        return Name(title: "유투버", first: "요구르트", last: "쏭")
    }
    
}

struct Photo: Codable {
    var large : String
    var medium : String
    var thumbnail : String
    static func getDummy() -> Self{
        print(#fileID, #function, #line, "")
        return Photo(large: "https://randomuser.me/api/portraits/women/52.jpg", medium: "https://randomuser.me/api/portraits/women/52.jpg", thumbnail: "https://randomuser.me/api/portraits/women/52.jpg")
    }
}


struct Info : Codable, CustomStringConvertible {
    var seed : String
    var resultsCount : Int
    var page : Int
    var version : String
    private enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case resultsCount = "results"
        case page = "page"
        case version = "version"
    }
    var description: String {
        return "seed: \(seed) / version: \(version) / resultsCount: \(resultsCount), page: \(page)"
    }
}


struct RandomUserResponse: Codable, CustomStringConvertible {
    var results: [RandomUser]
    var info: Info
    private enum CodingKeys: String, CodingKey {
        case results, info
    }
    var description: String{
        return "results.count: \(results.count) / info: \(info.seed)"
    }
}
