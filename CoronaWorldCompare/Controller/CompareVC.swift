//
//  CompareVC.swift
//  CoronaWorldCompare
//
//  Created by Bartu akman on 19.04.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class CompareVC: UIViewController {
    typealias DownloadComplete = () -> ()

    
    @IBOutlet weak var searchLabelFirst: UITextField!
    
 
    @IBOutlet weak var tableview: UITableView!
    var myCountries =  [Country]()
    var BASE_URL = "https://corona.lmao.ninja/v2/"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.separatorStyle = .none
        let nib = UINib(nibName: "CountryCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: "countrycell")
        // Do any additional setup after loading the view.
    }
    
    @IBAction func compareButtonClicked(_ sender: UIButton) {
        if   let text = searchLabelFirst.text {
            getCountry(countrySearchName: text)
 
            
        }
        
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func resultButtonClicked(_ sender: UIButton) {
        findResult()
 
    }
    func findResult(){
        var minDeathArray  =  [Int]()
        for country in myCountries {
            
            minDeathArray.append(country.countryDeath)
        }
        
         if let minDeath = minDeathArray.min(), let index = minDeathArray.index(of: minDeath) {
            print(index)
            resultLabel.text = myCountries[index].countryName
            
        }

        
        
        
    }
    
    
    func getCountry(countrySearchName: String) {
           
             var LAST_URL = BASE_URL + "countries/"
             LAST_URL = LAST_URL + countrySearchName
             print(LAST_URL)
           Alamofire.request(LAST_URL).responseObject { (response: DataResponse<CoronaCountries>) in
                 let countryInfos = response.result.value
             if let countryName = countryInfos?.countryName,
                let death = countryInfos?.deaths,
                let   test = countryInfos?.tests,
                let cases = countryInfos?.cases{
                 
 
          let country =       Country(countryName: countryName, countryCase: cases, countryDeath: death, countryTest: test)
              //  print(country.countryCase)
                
 
                self.myCountries.append(country)
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
 
                

             }
           }

      //  self.myCountries.removeAll()


      
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CompareVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableview.dequeueReusableCell(withIdentifier: "countrycell", for: indexPath) as! CountryCell
                  let myCell = myCountries[indexPath.row]
    
        cell.updateUI(cell: myCell)
        
        return cell
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}
