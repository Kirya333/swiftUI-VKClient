//
//  FriendCellView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import SwiftUI

struct FriendCellView: View {
    let friend: Friend
    
    var body: some View {
        HStack {
            AvatarImage {
                Image("\(self.friend.avatar ?? "camera")")
            }
            
            VStack (alignment: .leading) {
                Text("\(self.friend.getFullName())")
                
                Text("\(self.friend.userInfo)")
                    .font(.footnote)
                    .fontWeight(.thin)
            }
            .lineLimit(1)

            Spacer()
        }
    }
}

struct FriendCellView_Previews: PreviewProvider {
    static var previews: some View {
        FriendCellView(friend: Friend(lastName: "Tarasov", firstName: "Kirill", avatar: nil, company: "Apple", city: "Los Angels"))
    }
}
