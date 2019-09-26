//
//  ViewController.swift
//  WebKitTesting
//
//  Created by Dionte Silmon on 9/25/19.
//  Copyright © 2019 Dionte Silmon. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    @IBOutlet weak var urlTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the delegates
        urlTextField.delegate = self
        webView.navigationDelegate = self
        
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
    
    //MARK: - Back Button Action
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        // If true allow the user to use the back button
        // to navigate back
        if webView.canGoBack {
            webView.goBack()
        }
        
    }
    
    
    //MARK: - Forward Button Action
    
    @IBAction func forwardButtonTapped(_ sender: UIButton) {
        
        // If true allow the user to use the forward button
        // to navigate forward
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    //MARK: - WKNavigationDelegate Methods
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // Allows the back button to be enable if the user wants to go back to the previous page.
        backButton.isEnabled = webView.canGoBack
        
        // Allows the forward button to be enable if the user wants to go forward to the previous page
        forwardButton.isEnabled = webView.canGoForward
        
        urlTextField.text = webView.url?.absoluteString
        
    }


}

