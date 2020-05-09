//
//  ViewController.swift
//  CoronaWorldCompare
//
//  Created by Bartu akman on 19.04.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
class ViewController: UIViewController {
    
    var BASE_URL = "https://corona.lmao.ninja/v2/"

    @IBOutlet weak var totalDeatchLabel: UILabel!
    @IBOutlet weak var totalCasesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
         getCases()
      //  getCountryCases()
      //  getCountry(countrySearchName: "Turkey")
        // Do any additional setup after loading the view.
        
        
    }
    func pushVC(ViewControllerIdentifier: String){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                               let newViewController = storyBoard.instantiateViewController(withIdentifier: ViewControllerIdentifier)
        newViewController.modalPresentationStyle = .fullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func comparePush(_ sender: UIButton) {
           
        pushVC(ViewControllerIdentifier: "CompareVC")
    }
    
    func getCases() {
        _ = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        let LAST_URL = BASE_URL + "all"

        Alamofire.request(LAST_URL).responseObject { (response: DataResponse<CoronaLast>) in
             let coronaAllResponse = response.result.value
            if   let death = coronaAllResponse?.deaths ,
                let cases = coronaAllResponse?.cases {
                self.totalCasesLabel.text = "\(cases)"
                 self.totalDeatchLabel.text = "\(death)"
            }
 
 
        }
   
     }
    
    
 
 

}

import ObjectMapper

class CoronaLast: Mappable {
    
    var cases: Int?
    var todayCases: Int?
    var deaths: Int?
    var todayDeaths: Int?
    var recovered: Int?
    var active: Int?
    var critical: Int?
    var tests: Int?
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        cases <- map["cases"]
        todayCases <- map["todayCases"]
        deaths <- map["deaths"]
        todayDeaths <- map["todayDeaths"]
        recovered <- map["recovered"]
        active <- map["active"]
        critical <- map["critical"]
        tests <- map["tests"]
        
    }
    
}

class CoronaCountries: Mappable {
    var  countryName: String?
    var  cases: Int?
    var todayCases: Int?
    var deaths: Int?
    var todayDeaths: Int?
    var recovered: Int?
    var active: Int?
    var critical: Int?
    var tests: Int?
    var continent: String?
    var countryInfo: CountryInfo?
    required init?(map: Map) {
         
    }
    
    func mapping(map: Map) {
        countryName <- map["country"]
        cases <- map["cases"]
        todayCases <- map["todayCases"]
        deaths <- map["deaths"]
        todayDeaths <- map["todayDeaths"]
        recovered <- map["recovered"]
        active <- map["active"]
        critical <- map["critical"]
        tests <- map["tests"]
        continent <- map["continent"]
        countryInfo <- map["countryInfo"]

    }
    
}

class CountryInfo: Mappable {
    var lat: Int?
    var long: Int?
    var flag: String?
    
    required init?(map: Map) {
         
    }
    
     func mapping(map: Map) {
        lat <- map["lat"]
        long <- map["long"]
        flag <- map["flag"]

    }
    
    
       
       
       
       
   }
