//
//  WebViewController.swift
//  TSD_UIWebView
//
//  Created by Anton Zyabkin on 05.07.2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    
    private let webview : WKWebView = {
        
        let preferences = WKWebpagePreferences ()
        preferences.allowsContentJavaScript = true
        
        let configuration = WKWebViewConfiguration ()
        configuration.defaultWebpagePreferences = preferences
        let webview = WKWebView (frame: .zero, configuration: configuration)
             
        
        return webview
    }()
    
    private let url : URL
    
    init (url: URL, title: String) {
        self.url = url
        super .init(nibName: nil, bundle: nil)
        self.title = title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(webview)
        webview.load(URLRequest(url: url))
        doneButton ()
        refreshButton ()
    }
    
    
    
    override func viewDidLayoutSubviews() {
        webview.frame = view.bounds
    }
    
    private func doneButton () {
        navigationItem.leftBarButtonItem = UIBarButtonItem (title: "Done", style: .done, target: self, action: #selector(doneButtonDidPressed))
    }
    
    private func refreshButton () {
        navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem: .refresh, target: self, action: #selector(refreshButtonDidPressed))
    }
    
    @objc func doneButtonDidPressed () {
    dismiss(animated: true)
    }
    
    @objc func refreshButtonDidPressed () {
        webview.reload()
    }
}
