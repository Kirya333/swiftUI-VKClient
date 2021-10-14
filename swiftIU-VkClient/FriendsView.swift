//
//  FriendsView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import SwiftUI

struct FriendsView: View {
    @State private var friends: [Friend] = [
        Friend(lastName: "Tarasov", firstName: "Kirill", avatar: nil, company: "Apple", city: "Los Angels"),
        Friend(lastName: "Pankov", firstName: "Alexey", avatar: "community", company: "Google", city: "Sacramento"),
        Friend(lastName: "Karpenko", firstName: "Mark", avatar: nil, company: "Amazon", city: nil),
        Friend(lastName: "Romashov", firstName: "Vladimir", avatar: nil, company: "Apple", city: "Miami"),
        Friend(lastName: "Arbuzov", firstName: "Ivan", avatar: nil, company: "Facebook", city: nil),
        Friend(lastName: "Black", firstName: "Ivan", avatar: nil, company: "Twitter", city: nil),
        Friend(lastName: "Brown", firstName: "Bob", avatar: nil, company: nil, city: "Malibu")
    ]
    
    var body: some View {
        List(arrayLetter(), rowContent: { section in
            Section(header: Text("\(section.letter)")) {
                ForEach(arrayByLetter(section.letter)) { friend in
                    NavigationLink(destination: FriendPhotosView(friend: friend)) {
                        FriendCellView(friend: friend)
                    }
                }
            }
        })
        .listStyle(.plain)
    }
    
    private func arrayLetter() -> [SectionDataModel] {
        var resultArray = [SectionDataModel]()
        
        for friend in friends {
            let nameLetter = String(friend.lastName.prefix(1))
            let letterModel = SectionDataModel(letter: nameLetter)
            if !resultArray.contains(letterModel) {
                resultArray.append(letterModel)
            }
        }
        
        resultArray = resultArray.sorted(by: { $0.letter < $1.letter })
        
        return resultArray
    }
    
    private func arrayByLetter(_ letter: String) -> [Friend] {
        var resultArray = [Friend]()
        
        for friend in friends {
            let nameLetter = String(friend.lastName.prefix(1))
            if nameLetter == letter {
                resultArray.append(friend)
            }
        }
        
        return resultArray
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
