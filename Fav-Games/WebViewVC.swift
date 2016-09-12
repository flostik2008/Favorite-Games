//
//  WebViewVC.swift
//  Fav-Games
//
//  Created by Evgeny Vlasov on 9/8/16.
//  Copyright © 2016 Evgeny Vlasov. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {
    
    var videoGame: VideoGame!
    var whichLink: String!
    
    var mgLink: String!
    var offLink: String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if whichLink == "official link" {
        
        let urlStr = videoGame.offLink!
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
        }
        else if whichLink == "moby game link" {
        
            print("yo yo yo \(videoGame.mgLink)   ")
            
            let urlStr1 = videoGame.mgLink!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            let url1 = NSURL(string: urlStr1)!
            let request = NSURLRequest(URL: url1)
            webView.loadRequest(request)
            
        }
        
    }
}
