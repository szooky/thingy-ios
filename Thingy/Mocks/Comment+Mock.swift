//
//  Comment+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 14/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension Comment {
    
    class func get(variant: Int) -> Comment {
        let comment = Comment()
        
        switch variant {
        case 1:
            comment.message = "Love it 😍!"
            
        case 2:
            comment.message = "This is great 🔥🚗❤️!"
            
        default:
            comment.message = "The 911 goes like an everyman supercar, but is no longer priced like one. A boggo Carrera is £76,412, and it’s dangerously easy to top six figures when speccing. And don’t go thinking the downsized engine is a ticket to supermini economy – Porsche claims a 4.2mpg improvement versus the old model, but in our hands it nevertheless failed to top 30mpg. It’s still very economical for such a powerful piece of kit, but not the hop, skip and jump over an old 911 the spiel would have you believe."
            
        }
        
        return comment
    }
    
    class func getAll() -> [Comment] {
        var comments = [Comment]()
        
        for index in 1...3 {
            comments.append(Comment.get(variant: index))
        }
        
        return comments
    }
    
}
