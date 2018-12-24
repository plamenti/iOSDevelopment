//
//  ViewController.swift
//  BitcoinTicker
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    let baseURL = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let currencyArray = ["EUR", "USD", "GBP", "BGN"]
    var finalURL = ""

    //Pre-setup IBOutlets
    @IBOutlet weak var bitcoinPriceLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        getBitcoinData(url: constructUrl(index: 0), currency: currencyArray[0])
    }

    
    //TODO: Place your 3 UIPickerView delegate methods here
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        getBitcoinData(url: constructUrl(index: row), currency: currencyArray[row])
    }
    
    func constructUrl(index: Int) -> String {
        return baseURL + currencyArray[index]
    }
    
    
    //MARK: - Networking
    /***************************************************************/
    
    func getBitcoinData(url: String, currency: String) {
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {

                    print("Sucess! Got the bitcoin prices data")
                    let bitcoinJSON : JSON = JSON(response.result.value!)
                    print(bitcoinJSON)

                    self.updateBitcoinData(json: bitcoinJSON, currency: currency)

                } else {
                    print("Error: \(String(describing: response.result.error))")
                    self.bitcoinPriceLabel.text = "Connection Issues"
                }
            }

    }
    
    //MARK: - JSON Parsing
    /***************************************************************/
    
    func updateBitcoinData(json : JSON, currency: String) {
        
        if let tempResult = json["ask"].double {
            bitcoinPriceLabel.text = "\(String (tempResult)) \(currency)"
        } else {
            bitcoinPriceLabel.text = "Data iunavailable!"
        }
    }

}

