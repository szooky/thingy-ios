//
//  Database+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 15/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

class Database {
    static let sharedInstance = Database()
    
    let users: [User]?

    private init() {
        users = User.getAll()
        
        attachAuthorsToComments()
    }
    
    private func getThings() -> [Thing] {
        var allThings = [Thing]()
        
        for user in users! {
            if let userThings = user.things {
                allThings.append(contentsOf: userThings)
            }
        }
        
        return allThings
    }
    
    private func attachAuthorsToComments() {
        if let users = self.users {
            for user in users {
                if let things = user.things {
                    for thing in things {
                        if let comments = thing.comments {
                            for comment in comments {
                                let randomNumber:UInt32 = arc4random_uniform(UInt32(users.count))
                                comment.author = users[Int(randomNumber)]
                            }
                        }
                    }
                }
            }
        }
    }
    
}
