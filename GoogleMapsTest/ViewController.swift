//
//  ViewController.swift
//  GoogleMapsTest
//
//  Created by Developer H on 2020/11/9.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var latitudeTextField: UITextField!
    
    @IBOutlet weak var longitudeTextField: UITextField!
    
    @IBOutlet weak var radiusTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func sureBtnClick() {
        self.view.endEditing(true)
        let mapView = MapViewController()
        if self.longitudeTextField.text?.count ?? 0 > 0 {
            mapView.longitude = Double(self.longitudeTextField.text!) ?? 0.00
        }
        if self.latitudeTextField.text?.count ?? 0 > 0 {
            mapView.latitude = Double(self.latitudeTextField.text!) ?? 0.00
        }
        if self.radiusTextField.text?.count ?? 0 > 0 {
            mapView.radius = Double(self.radiusTextField.text!) ?? 0.00
        }
        self.navigationController?.pushViewController(mapView, animated: true)
    }
    
}
