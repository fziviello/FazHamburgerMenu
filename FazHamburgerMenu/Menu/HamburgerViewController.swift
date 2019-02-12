//
//  BaseViewController.swift
//  test2
//
//  Created by Fabio Ziviello on 25/10/2018.
//  Copyright © 2018 Fabio Ziviello. All rights reserved.
//

import UIKit


class HamburgerViewController: UIViewController, HamburgerProtocol {
    
    var menuVC : HamburgerTableViewController!

    override func viewDidLoad() {
        menuVC = self.storyboard!.instantiateViewController(withIdentifier: "HamburgerViewController") as? HamburgerTableViewController
        super.viewDidLoad()
    }
    
    private func getLoggedMenu(){
        menuVC.menuArray.append(HamburgerModel.init(storyBoardID:"ProfileVC", title: "Profilo", icon: "PlayIcon"))
    }
    
    private func getUserMenu(){
        menuVC.menuArray.append(HamburgerModel.init(storyBoardID:"LoginVC", title: "Login", icon: "HomeIcon"))
        menuVC.menuArray.append(HamburgerModel.init(storyBoardID:"ContattiVC", title: "Contatti", icon: "PlayIcon"))
    }
    
    func addHamburgerMenuButton(Route: String){
       
        let btnShowMenu = UIButton(type: UIButton.ButtonType.system)

        btnShowMenu.setImage(self.createButtonHamburgerImage(), for: UIControl.State())
        btnShowMenu.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        btnShowMenu.addTarget(self, action: #selector(HamburgerViewController.onSlideMenuButtonPressed(_:)), for: UIControl.Event.touchUpInside)
        let customBarItem = UIBarButtonItem(customView: btnShowMenu)
        self.navigationItem.leftBarButtonItem = customBarItem;
        
        switch Route {
        case HamburgertRoutingState.ROUTE_LOGGED:
                getLoggedMenu()
            break
        case HamburgertRoutingState.ROUTE_USER:
                getUserMenu()
            break
        default:
            getUserMenu()
        }
        
    }
 
    func HamburgerItemSelectedAtIndex(_ index: Int32) {
        if(index > -1) //SE MENU APERTO
        {
            let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: menuVC.menuArray[Int(index)].storyBoardID)
            let currentViewController : UIViewController = self.navigationController!.topViewController!
            
            if(currentViewController.restorationIdentifier != nil)
            {
                if (currentViewController.restorationIdentifier! != destViewController.restorationIdentifier!){
                   self.navigationController!.pushViewController(destViewController, animated: true)
                 }
            }
            else
            {
                print("Non hai settato il restorationIdentifier nello storyboard");
            }
        
        }
    }
   
    private func createButtonHamburgerImage() -> UIImage {
        var defaultMenuImage = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        
        if (sender.tag == -1)
        {
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = -1
        
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
