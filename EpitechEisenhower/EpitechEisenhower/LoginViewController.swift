//
//  ViewController.swift
//  EpitechEisenhower
//
//  Created by fauquette fred on 25/09/17.
//  Copyright © 2017 Epitech. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var passwordBGView: UIView!
    @IBOutlet weak var emailBGView: UIView!
    @IBOutlet weak var height: NSLayoutConstraint!
    @IBOutlet weak var connectButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        emailBGView.layer.cornerRadius = 10
        passwordBGView.layer.cornerRadius = 10
        connectButton.layer.cornerRadius = 10
        
        signInButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connect(_ sender: Any) {
        performSegue(withIdentifier: "showHome", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHome" {
            if let destination = segue.destination as? HomeViewController {
                destination.monTitre = "truc"
            }
        }
    }
    
}

