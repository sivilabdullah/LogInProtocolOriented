//
//  ViewController.swift
//  LogInProtocolOriented
//
//  Created by abdullah's Ventura on 15.06.2023.
//

import UIKit

class RootViewController: UIViewController, OutputRootViewModel{

    private let viewModel : RootViewModel
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        viewModel.checkLogin()
    }


    func showMainApp(){
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController,animated: true)
    }
    func showLoginScreen(){
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController,animated: true)
    }
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

