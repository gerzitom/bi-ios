//
//  Comment.swift
//  FITstagram
//
//  Created by Igor Rosocha on 10/11/21.
//

import Foundation

struct Comment: Identifiable, Decodable {
    let id: String
    let author: User
    let text: String
    let likes: Int
    
    init(id: String, author: Author, text: String) {
        self.id = id
        self.author = author
        self.text = text
        self.likes = 0
    }
    
    enum Keys: CodingKey{
        case id, author, text, postedAt, likes
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        id = try container.decode(String.self, forKey: .id)
        author = try container.decode(Author.self, forKey: .author)
        let likes = try container.decode([Author].self, forKey: .likes)
        self.likes = likes.count
        text = try container.decode(String.self, forKey: .text)
    }
    
}
