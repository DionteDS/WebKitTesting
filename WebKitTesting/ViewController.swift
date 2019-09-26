//
//  ViewController.swift
//  WebKitTesting
//
//  Created by Dionte Silmon on 9/25/19.
//  Copyright © 2019 Dionte Silmon. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        urlTextField.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Create the url
        
        let urlString:String = "https://www.Google.com"
        let url:URL = URL(string: urlString)!
        
        // Create the request to grab the url contents
        
        let urlRequest:URLRequest = URLRequest(url: url)
        
        // Load the request
        
        webView.load(urlRequest)
        
        // Set the textField to the url string
        urlTextField.text = urlString
    }
    
    //MARK: - TextField Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let urlString:String = urlTextField.text!
        let url:URL = URL(string: urlString)!
        let urlRequest:URLRequest = URLRequest(url: url)
        
        webView.load(urlRequest)
        
        textField.resignFirstResponder()
        
        return true
    }


}

