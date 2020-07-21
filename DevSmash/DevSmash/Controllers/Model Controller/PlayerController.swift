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
    
    //MARK: - Shared Instance
    static var shared = PlayerController()
    //MARK: - SOT
    var players: [Player] = []
    
    init () {
        loadFromPersistentStorage()
    }
    
    
    //MARK: - CRUD
    func createPlayer(name: String, health: String, stamina: String, bio: String) {
        let player = Player(name: name, health: health, stamina: stamina, bio: bio)
        players.append(player)
        saveToPersistentStorage()
    }
    
    func deletePlayer(player: Player) {
        guard let index = players.firstIndex(of: player) else {return}
        players.remove(at: index)
        saveToPersistentStorage()
    }
    
    
    //MARK: - Persistence
    private func fileURL() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileName = "devSmash.json"
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        return documentsDirectoryURL
    }
    
    private func saveToPersistentStorage() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(players)
            try data.write(to: fileURL())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func loadFromPersistentStorage() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let players = try jsonDecoder.decode([Player].self, from: data)
            self.players = players
        } catch {
            print(error.localizedDescription)
        }
    }
}
