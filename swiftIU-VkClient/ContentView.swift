//
//  ContentView.swift
//  swiftIU-VkClient
//
//  Created by Кирилл Тарасов on 13.10.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        NavigationView {
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)
                
                NavigationLink(
                    destination:
                        TabView {
                            FriendsView()
                                .tabItem {
                                    Image(systemName: "person.circle")
                                    Text("Friends")
                                }
                            GroupsView()
                                .tabItem {
                                    Image(systemName: "person.3")
                                    Text("Groups")
                                }
                            NewsView()
                                .tabItem {
                                    Image(systemName: "newspaper")
                                    Text("News")
                                }
                        }
                        .navigationBarBackButtonHidden(true),
                    isActive: $shouldShowMainView,
                    label: {
                        EmptyView()
                    }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
