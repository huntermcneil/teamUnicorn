//
//  Player.swift
//  DevSmash
//
//  Created by Hunter McNeil on 7/13/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import Foundation
import UIKit

class Player: Codable {

    var name: String
    var health: String
    var stamina: String
    var bio: String
//    var playerImage: Image
    
    init(name: String, health: String, stamina: String, bio: String) {
    self.name = name
    self.health = health
    self.stamina = stamina
    self.bio = bio
//    self.playerImage = playerImage
    }
}

//struct Image: Codable{
//    let imageData: Data?
//
//    init(withImage image: UIImage) {
//        self.imageData = image.pngData()
//    }
//
//    func getImage() -> UIImage? {
//        guard let imageData = self.imageData else {
//            return nil
//        }
//        let image = UIImage(data: imageData)
//
//        return image
//    }
//}


extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        return lhs.name == rhs.name && lhs.health == rhs.health && lhs.stamina == rhs.stamina && lhs.bio == rhs.bio
//            && lhs.playerImage == rhs.playerImage
    }
}
