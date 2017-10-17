//
//  SendingVC.swift
//  DelegateMayhem
//
//  Created by Zach Budisch on 10/17/17.
//  Copyright © 2017 Zbudisch. All rights reserved.
//

import UIKit

protocol DataSentDelegate{
    func userDidEnterData(data: String)
}

class SendingVC: UIViewController {
    
    @IBOutlet weak var dataEntryTextField: UITextField!
    var delegate: DataSentDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

}
    @IBAction func SendButtonwasPressed(_ sender: Any) {
        if delegate != nil{
            if dataEntryTextField.text != nil{
                let data = dataEntryTextField.text
                delegate?.userDidEnterData(data: data!)
                dismiss(animated: true, completion: nil)
            }
        }
    }
    
    
}
