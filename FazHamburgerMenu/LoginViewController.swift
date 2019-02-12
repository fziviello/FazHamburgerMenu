//
//  ViewController.swift
//  FazHamburgerMenu
//
//  Created by Fabio Ziviello on 12/02/2019.
//  Copyright © 2019 Fabio Ziviello. All rights reserved.
//

import UIKit

class LoginViewController: HamburgerViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Test GUEST USER
        addHamburgerMenuButton(Route: HamburgertRoutingState.ROUTE_USER)
      
        // MARK: - Test LOGGED USER
        //addHamburgerMenuButton(Route: HamburgertRoutingState.ROUTE_LOGGED)
    }


}

