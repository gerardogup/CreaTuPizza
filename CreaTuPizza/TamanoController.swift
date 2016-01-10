//
//  TamanoController.swift
//  CreaTuPizza
//
//  Created by Gerardo Guerra Pulido on 09/01/16.
//  Copyright © 2016 Gerardo Guerra Pulido. All rights reserved.
//

import UIKit

class TamanoController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pvTamano: UIPickerView!
    
    var data = Pizza.opcionesDeTamano
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.pvTamano.dataSource = self
        self.pvTamano.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        Pizza.tamano = data[pvTamano.selectedRowInComponent(0)]
    }
    
    override func viewWillAppear(animated: Bool) {
        if Pizza.tamano != "" {
            pvTamano.selectRow(Pizza.opcionesDeTamano.indexOf(Pizza.tamano)!, inComponent: 0, animated: true)
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // Column count: use one column.
        return 1
    }
    
    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int {
            
            // Row count: rows equals array length.
            return data.count
    }
    
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String? {
            
            // Return a string from the array for this row.
            return data[row]
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
