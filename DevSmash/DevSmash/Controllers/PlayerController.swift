//
//  PlayerController.swift
//  DevSmash
//
//  Created by Mathias on 7/21/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import Foundation
import UIKit

class PlayerController {
    
    static var shared = PlayerController()
    
    var players: [Player] = []
    
    init () {
        //loadFromPersistentStorage()
    }
    
    func createPlayer(name: String, health: String, stamina: String, bio: String, playerImage: UIImage) {
        let player = Player(name: name, health: health, stamina: stamina, bio: bio, playerImage: playerImage)
        players.append(player)
        //saveToPersistentStorage()
    }
    
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "devSmash.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStorage() {
        let jsonEncoder = JSONEncoder()
        do {
            
        }
    }
}
