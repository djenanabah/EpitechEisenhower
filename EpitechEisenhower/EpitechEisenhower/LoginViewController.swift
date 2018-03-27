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
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var authImp : EpitechAuth?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        emailBGView.layer.cornerRadius = 10
        passwordBGView.layer.cornerRadius = 10
        connectButton.layer.cornerRadius = 10
        
        signInButton.layer.cornerRadius = 10
        
        authImp = EpitechAuthImp()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func connect(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        authImp?.signInUser(email: email,
                            password: password,
                            completion: {[weak self] (result) in
                                switch result {
                                case .success :
                                    if let homeVC = UIStoryboard(name: "Main",
                                                                 bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                                       // let router = HomeRouterImp(view: homeVC)
                                       // var presenter = HomePresenterImp(view: homeVC, router: router)
                                       // let interactor = HomeInteractorImp(presenter: presenter, resultsManager: ResultsManagerImp.sharedInstance)
                                        //presenter.setInteractor(interactor: interactor)
                                       // homeVC.presenter = presenter
                                        self?.navigationController?.pushViewController(homeVC, animated: true)
                                    }
                                    
                                case .failure(let error):
                                    print(error)
                                }
        })
       // performSegue(withIdentifier: "showHome", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHome" {
            if let destination = segue.destination as? HomeViewController {
                destination.monTitre = "truc"
            }
        }
    }
    
}

