//
//  ViewController.swift
//  PeticionISBN
//
//  Created by Luis Gómez on 28/2/16.
//  Copyright © 2016 luisgomez. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var pintaResultado: String = "" //Variable para pintar el resultado en pantalla

    @IBOutlet weak var isbnIntroducido: UITextField! //Variable que captura el ISBN Introducido por el usuario
    
    @IBOutlet weak var resultadoIsbn: UITextView!  //Outlet de TextView
    
    override func viewWillAppear(animated: Bool) {
        self.resultadoIsbn.text = "Aqui aparecerá el Resultado de tu Búsqueda" //Valor inicial del TextView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        isbnIntroducido.delegate=self
    }
    
    @IBAction func backgroundTap(sender:UIControl){  //Funcion que esconde el teclado al tocar en el fondo
        isbnIntroducido.resignFirstResponder()
        
    }
    
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        sender.resignFirstResponder() //Desaparece el teclado
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func isbnTecleado(sender: AnyObject){  //Funcion de busqueda con la tecla Intro
        
        
        let urlsCuerpo = "https://openlibrary.org/api/books?jscmd=data&format=json&bibkeys=ISBN:" //Cuerpo del link
        let urlsIsbnIntroducido = self.isbnIntroducido.text!  //ISBN introducido por el usuario
        let urls = urlsCuerpo+urlsIsbnIntroducido   //url completo
        
        let url = NSURL(string: urls)
        let datos:NSData? = NSData(contentsOfURL: url!)
        
        if datos == nil {   //Si no hay conexion con internet la variable datos estará vacia
            
            pintaResultado = "Error de Conexion!!"
        }else {               //Si hay conexion a internet la variable datos no estará vacia
            
       
            let texto = NSString(data:datos!, encoding:NSUTF8StringEncoding)
            print(texto!)
                if texto == "{}" || texto == ""{   //Miramos si el ISBN produce una búsqueda vacia...
                    pintaResultado = "ISBN Incorrecto"
            
        
                    }
         
                else{                                  //Aqui muestra los datos en pantalla cuando el ISBN es correcto
                    pintaResultado = String(texto)
                }
        resultadoIsbn.text = String(pintaResultado)
        
        }
        resultadoIsbn.text = String(pintaResultado)
    }
        
    @IBAction func clearIsbn(sender: AnyObject) {    //Funcion del Boton "Clear"
        
        self.isbnIntroducido.text = ""
        self.resultadoIsbn.text = "Prueba con otro ISBN!!"
    }

    

}

