//
//  ResumenController.swift
//  CreaTuPizza
//
//  Created by Gerardo Guerra Pulido on 09/01/16.
//  Copyright © 2016 Gerardo Guerra Pulido. All rights reserved.
//

import UIKit

class ResumenController: UIViewController {

    @IBOutlet weak var lblMensaje: UILabel!
    @IBOutlet weak var btnConfirmar: UIBarButtonItem!
    @IBOutlet weak var lblTamano: UILabel!
    @IBOutlet weak var lblMasa: UILabel!
    @IBOutlet weak var lblQueso: UILabel!
    @IBOutlet weak var lblIngredientes: UILabel!
    @IBOutlet weak var lblLabelIngredientes: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblMensaje.hidden = true;
    }
    
    override func viewWillAppear(animated: Bool) {
        //mostrar los valores de la orden
        lblTamano.text = Pizza.tamano
        lblMasa.text = Pizza.masa
        lblQueso.text = Pizza.queso
        lblIngredientes.text = ""
        lblLabelIngredientes.text = String(Pizza.ingredientes.count) + " Ingredientes:"
        for ingrediente in Pizza.ingredientes {
            if lblIngredientes.text != "" {
                lblIngredientes.text = lblIngredientes.text! + "\n"
            }
            lblIngredientes.text = lblIngredientes.text! + ingrediente
        }
        
        
        //validar si se puede confirmar
        if Pizza.tamano == "No Seleccionado"
        || Pizza.masa == "No Seleccionado"
        || Pizza.queso == "No Seleccionado"
        || Pizza.ingredientes.count == 0
        {
            lblMensaje.text = "No es posible confirmar la orden sin completar la selección. Por favor regresa y completa tu orden."
            lblMensaje.textColor = UIColor.redColor()
            lblMensaje.hidden = false
            btnConfirmar.enabled = false
        } else {
            lblMensaje.hidden = true
            btnConfirmar.enabled = true
        }
    }
    
    @IBAction func confirmarOrden(sender: UIBarButtonItem) {
        lblMensaje.text = "¡Gracias por tu orden. En 20 minutos estará lista tu pizza!"
        lblMensaje.textColor = UIColor(red: 65/255, green: 168/255, blue: 30/255, alpha: 1)
        lblMensaje.hidden = false
        navigationItem.rightBarButtonItems = []
        self.navigationItem.setHidesBackButton(true, animated:true);
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
