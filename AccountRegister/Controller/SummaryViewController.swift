//
//  SummaryViewController.swift
//  AccountRegister
//
//  Created by dohien on 7/11/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController {

    @IBOutlet weak var defaultName: UILabel!
    @IBOutlet weak var defaultCity: UILabel!
    @IBOutlet weak var defaultCounty: UILabel!
    @IBOutlet weak var defaultGender: UILabel!
    @IBOutlet weak var defaultage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
    }
    func configure() {
        if let name = UserDefaults.standard.string(forKey: "name"), let city = UserDefaults.standard.string(forKey: "city"), let county = UserDefaults.standard.string(forKey: "district"), let gender = UserDefaults.standard.string(forKey: "gender"), let age = UserDefaults.standard.string(forKey: "age") {
            defaultName.text = name
            defaultCity.text = city
            defaultCounty.text = county
            defaultGender.text = gender
            defaultage.text = age
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
