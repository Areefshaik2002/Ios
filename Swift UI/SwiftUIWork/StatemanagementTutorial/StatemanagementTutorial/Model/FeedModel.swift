//
//  FeedModel.swift
//  StatemanagementTutorial
//
//  Created by Shaik Areef on 12/02/25.
//

import Foundation

class FeedModel : ObservableObject{
    @Published var posts:[Post] = [
        Post(id: 1, content: "Charming Car", isLiked: false),
        Post(id: 2, content: "Flying eagle", isLiked: false),
        Post(id: 3, content: "Dancing monkey", isLiked: false)
    ]
    
    func toggleLike(for post:Post){
        if let index = posts.firstIndex(where: {
            $0.id == post.id
        }){
            posts[index].isLiked.toggle()
        }
    }
    
}

struct Post:Identifiable{
    var id:Int
    var content:String
    var isLiked:Bool
}
