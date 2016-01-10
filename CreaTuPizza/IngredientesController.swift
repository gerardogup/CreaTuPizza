//
//  IngredientesController.swift
//  CreaTuPizza
//
//  Created by Gerardo Guerra Pulido on 09/01/16.
//  Copyright © 2016 Gerardo Guerra Pulido. All rights reserved.
//

import UIKit

class IngredientesController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        for ingrediente in Pizza.ingredientes {
            let switchTag = self.view.viewWithTag(Pizza.opcionesDeIngredientes.indexOf(ingrediente)!) as? UISwitch
            switchTag!.on = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modificarIngredientes(sender: UISwitch) {
        if sender.on {
            if Pizza.ingredientes.count < 5 {
                Pizza.ingredientes.append(Pizza.opcionesDeIngredientes[sender.tag])
            } else {
                let alerta = UIAlertController(title: "", message: "Debes seleccionar máximo 5 ingredientes.", preferredStyle: UIAlertControllerStyle.Alert)
                alerta.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (action: UIAlertAction!) in
                    alerta.dismissViewControllerAnimated(true, completion: nil)
                    sender.on = false
                }))
                presentViewController(alerta, animated: true, completion: nil)
            }
        } else {
            Pizza.ingredientes.removeAtIndex(Pizza.ingredientes.indexOf(Pizza.opcionesDeIngredientes[sender.tag])!)
        }
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
