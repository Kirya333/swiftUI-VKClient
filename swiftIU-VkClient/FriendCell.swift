//
//  FriendCell.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 10.10.2021.
//

import SwiftUI

struct FriendCell: View {
    var body: some View {
        HStack {
            AvatarImage {
                Image("camera")
            }
            
            VStack (alignment: .leading){
                Text("Name & Surname")
                
                Text("Compony, City")
                    .font(.footnote)
                    .fontWeight(.thin)
            }
            .lineLimit(1)

            Spacer()
        }
    }
}

struct FriendCell_Previews: PreviewProvider {
    static var previews: some View {
        FriendCell()
    }
}
