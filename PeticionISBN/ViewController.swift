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
    
    @IBAction func searchIsbn(sender: AnyObject) {
        
        let urlsCuerpo = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:"
        let urlsIsbnIntroducido = self.isbnIntroducido.text!
        let urls = urlsCuerpo+urlsIsbnIntroducido
        
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
        print(texto!)
        
    }
    
        
        

    

}

