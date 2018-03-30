//
//  HomeRouter.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import UIKit

protocol RegisterRouter {
    func buttonWasSelected(user: UserModel)
}

struct TaskRouterImp {
    var view: UIViewController?
}

extension RegisterRouterImp: RegisterRouter {
    func buttonWasSelected(user: UserModel) {
       /* if let detailViewController = UIStoryboard(name: "Main",
                                                   bundle: nil).instantiateViewController(withIdentifier: "detailVC") as? UserDetailViewController {
            detailViewController.setModel(model: user)
            view?.navigationController?.pushViewController(detailViewController, animated: true)
        }*/
    }
}
