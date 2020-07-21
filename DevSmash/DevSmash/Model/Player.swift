//
//  Player.swift
//  DevSmash
//
//  Created by Hunter McNeil on 7/13/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import Foundation
import UIKit

class Player {
    
    var name: String
    var health: String
    var stamina: String
    var bio: String
    var playerImage: UIImage
    
    init(name: String, health: String, stamina: String, bio: String, playerImage: UIImage) {
    self.name = name
    self.health = health
    self.stamina = stamina
    self.bio = bio
    self.playerImage = playerImage
    }
}
