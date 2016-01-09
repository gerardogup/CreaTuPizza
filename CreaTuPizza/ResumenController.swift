//
//  ResumenController.swift
//  CreaTuPizza
//
//  Created by Gerardo Guerra Pulido on 09/01/16.
//  Copyright © 2016 Gerardo Guerra Pulido. All rights reserved.
//

import UIKit

class ResumenController: UIViewController {
    
    @IBOutlet weak var lblError: UILabel!
    @IBOutlet weak var btnConfirmar: UIBarButtonItem!
    
    var tamano: String = ""
    var tipoDeMasa: String = ""
    var tipoDeQueso: String = ""
    var ingredientes: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblError.hidden = true;
    }
    
    override func viewWillAppear(animated: Bool) {
        if tamano == ""
        || tipoDeMasa == ""
        || tipoDeQueso == ""
        || ingredientes.count == 0
        {
            lblError.hidden = false
            btnConfirmar.enabled = false
        } else {
            lblError.hidden = true
            btnConfirmar.enabled = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
