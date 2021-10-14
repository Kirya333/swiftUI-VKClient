//
//  Photo.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import Foundation

class Photo: Identifiable {
    let id: UUID = UUID()
    let url: String
    let likesCount: Int
    let userLikes: Int
    
    init(url: String, likesCount: Int, userLikes: Int) {
        self.url = url
        self.likesCount = likesCount
        self.userLikes = userLikes
    }
}
