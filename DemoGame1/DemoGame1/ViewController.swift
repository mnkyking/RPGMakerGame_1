//
//  ViewController.swift
//  DemoGame1
//
//  Created by Robin G on 4/11/21.
//  https://forums.rpgmakerweb.com/index.php?threads/ios-app-creation-tutorial-for-mz-mv-xcode-12.128674/

import UIKit
// Add WebKit
import WebKit

// Add WKNavigationDelegate, WKUIDelegate for navigation and ui delegation
class ViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {

    var webView: WKWebView!

    // This gets called when loading the WKWebView
    override func loadView() {
        super.loadView()
   
        webView = WKWebView()
   
        let webViewConfig = WKWebViewConfiguration()
        webViewConfig.dataDetectorTypes = []
        webViewConfig.allowsInlineMediaPlayback = true
        webViewConfig.mediaTypesRequiringUserActionForPlayback = []
        webView = WKWebView(frame: view.frame, configuration: webViewConfig)
        webView.configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
   
    }

    // Called after the WebView was created
    override func viewDidLoad() {
        super.viewDidLoad()
   
        let htmlPath = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "www")!
        webView.loadFileURL(htmlPath, allowingReadAccessTo: htmlPath)
   
        webView.navigationDelegate = self
        webView.uiDelegate = self
        view = webView
    }
   
    // This is to allow JavaScript Alert() for debugging
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        // alert
        let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in
            completionHandler()
        }
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
