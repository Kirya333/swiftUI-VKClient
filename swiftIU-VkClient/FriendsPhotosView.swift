//
//  FriendsPhotosView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import SwiftUI
import ASCollectionView

struct FriendPhotosView: View {
    let friend: Friend
    
    @State private var photos: [Photo] = [
        Photo(url: "community", likesCount: 23, userLikes: 0),
        Photo(url: "camera", likesCount: 23, userLikes: 1),
        Photo(url: "vkImage", likesCount: 1, userLikes: 0)
    ]
    
    var body: some View {
        ASCollectionView(data: photos) { photo, _ in
            FriendPhotoCellView(photo: photo)
        }.layout {
            .grid(
                layoutMode: .fixedNumberOfColumns(3),
                itemSpacing: 0,
                lineSpacing: 16
            )
        }.navigationTitle(self.friend.getFullName())
    }
}

struct FriendPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPhotosView(friend: Friend(lastName: "Tarasov", firstName: "Kirill", avatar: nil, company: nil, city: "Moscow"))
    }
}
