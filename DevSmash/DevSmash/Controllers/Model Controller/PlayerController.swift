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
    var players: [Player] = [Player(name: "Stacy", health: "73%", stamina: "62%", bio: "Her maiden name is not Martinez", fightingFrom: "Pleasant View, UT"), Player(name: "Jill", health: "77%", stamina: "50%", bio: "Has many spiders", fightingFrom: ""), Player(name: "Lindsey", health: "90%", stamina: "90% with coffee", bio: "Wants a puppy", fightingFrom: ""), Player(name: "Mathias", health: "100%", stamina: "20%", bio: "Real name is David", fightingFrom: "Layton, UT"), Player(name: "Hunter", health: "7%", stamina: "2%", bio: "Gets married in 11 days", fightingFrom: "Mesa, AZ")]
    
    init () {
        loadFromPersistentStorage()
    }
    
    
    //MARK: - CRUD
    func createPlayer(name: String, health: String, stamina: String, bio: String, fightingFrom: String) {
        let player = Player(name: name, health: health, stamina: stamina, bio: bio, fightingFrom: fightingFrom)
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
