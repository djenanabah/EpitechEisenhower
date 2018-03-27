//
//  HomeRouter.swift
//  EpitechEisenhower
//
//  Created by Djenaba Bah on 22/03/2018.
//  Copyright © 2018 Epitech. All rights reserved.
//

import UIKit

protocol HomeRouter {
    
    func cellWasSelected(task: TaskModel)
    func cellAddTaskSelected()
}

struct HomeRouterImp {
    var view: UIViewController?
    var userId:String?
}

extension HomeRouterImp: HomeRouter {
    
    func cellWasSelected(task: TaskModel) {
     /* if let detailViewController = UIStoryboard(name: "Main",
                                                   bundle: nil).instantiateViewController(withIdentifier: "detailVC") as? UserDetailViewController {
            detailViewController.setModel(model: user)
            view?.navigationController?.pushViewController(detailViewController, animated: true)
        }*/
    }
    
    func cellAddTaskSelected(){
        if let taskVC = UIStoryboard(name: "Main",
                                     bundle: nil).instantiateViewController(withIdentifier: "TaskViewController") as? TaskViewController {
            let router = TaskRouterImp(view: taskVC)
            var presenter = TaskPresenterImp(view: taskVC, router: router)
            let interactor = TaskInteractorImp(presenter: presenter, userID: userId)
            presenter.setInteractor(interactor: interactor)
            taskVC.presenter = presenter
            view?.navigationController?.pushViewController(taskVC, animated: true)
        }
    }
}


