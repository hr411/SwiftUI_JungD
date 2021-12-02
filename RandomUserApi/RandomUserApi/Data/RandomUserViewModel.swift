//
//  RandomUserViewModel.swift
//  RandomUserApi
//
//  Created by hyorin song on 2021/12/01.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    init(){
        print(#fileID, #function, #line, "")
        fetchRandomUsers()
    }
    
    func fetchRandomUsers(){
        print(#fileID, #function, #line, "")
        AF.request(baseUrl)
            .publishDecodable(type: RandomUserResponse.self)
            .compactMap{$0.value}
            .map{$0.results}
            .sink(receiveCompletion: {completion in print("데이터스트림 완료")}, receiveValue: {receivedValue in print("받은 값 : \(receivedValue.count)")
                  self.randomUsers = receivedValue
            }).store(in: &subscription)
        
    }
}
