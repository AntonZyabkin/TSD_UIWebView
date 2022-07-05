//
//  ViewController.swift
//  TSD_UIWebView
//
//  Created by Anton Zyabkin on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {

    private let button : UIButton = {
        let button = UIButton ()
        button.backgroundColor = .link
        button.setTitle("Press to go to our web site", for: .normal)
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(button)
        button.addTarget(self, action: #selector(didTaped), for: .touchUpInside)
        button.frame = CGRect (x: 0, y: 0, width: 250, height: 50)
        button.center = view.center
        
    }


    
    @objc func didTaped () {
        
        guard let url = URL (string: "https://www.ozon.ru/") else {
            print ("faled")
            return
        }
         let vc = WebViewController (url: url, title: "Google")
        let navVc = UINavigationController (rootViewController: vc)
        present(navVc, animated: true)
    }
}

