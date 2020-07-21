//
//  MathiasViewController.swift
//  DevSmash
//
//  Created by Mathias on 7/21/20.
//  Copyright © 2020 Hunter McNeil. All rights reserved.
//

import UIKit

class MathiasViewController: UIViewController {

    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var staminaLabel: UILabel!
    @IBOutlet weak var fightingFromLabel: UILabel!
    @IBOutlet weak var funFactLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews(player: PlayerController.shared.players[3])
    }
    
    func updateViews(player: Player) {
        healthLabel.text = player.health
        staminaLabel.text = player.stamina
        fightingFromLabel.text = player.fightingFrom
        funFactLabel.text = player.bio
    }
}
