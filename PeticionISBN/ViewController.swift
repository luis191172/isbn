//
//  ViewController.swift
//  PeticionISBN
//
//  Created by Luis Gómez on 28/2/16.
//  Copyright © 2016 luisgomez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var isbnIntroducido: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchISBN(sender: AnyObject) {
        
        let urls1:String = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let urls2 = self.isbnIntroducido.text!
        
        let urls = urls1+urls2
        
       // print(urls2)
       // print(urls)
        
        
        
        let url = NSURL(string: urls)
        let sesion = NSURLSession.sharedSession()
        let bloque = { (datos: NSData?, resp:NSURLResponse?, error: NSError?) -> Void in let texto = NSString(data: datos!, encoding: NSUTF8StringEncoding)
            print(texto!)
        }
        
        let dt = sesion.dataTaskWithURL(url!, completionHandler: bloque)
       dt.resume()
        
        
        
        
    }
    func clearISBN(sender: AnyObject) {
        
    }
}

