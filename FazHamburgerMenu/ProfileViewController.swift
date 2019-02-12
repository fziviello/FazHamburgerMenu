//
//  ProfileViewController.swift
//  FazHamburgerMenu
//
//  Created by Fabio Ziviello on 12/02/2019.
//  Copyright © 2019 Fabio Ziviello. All rights reserved.
//

import UIKit

class ProfileViewController: HamburgerViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addHamburgerMenuButton(Route: HamburgertRoutingState.ROUTE_LOGGED)
    }
}
