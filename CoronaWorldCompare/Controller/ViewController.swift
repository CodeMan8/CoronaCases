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
class ViewController: UIViewController,ApiServiceDelegate {
    func onFailure(_error: Error?, _requestCode: RequestCode) {
        
        if let error = _error {
            self.totalCasesLabel.text =  error.localizedDescription
                                 self.totalDeatchLabel.text = "RequestError:\(_requestCode)"
        }
     
    }
    
    func onSuccess(_response: Any?, _requestCode: RequestCode) {
        let coronaAllResponse = _response as! CoronaLast
        if   let death = coronaAllResponse.deaths ,
                     let cases = coronaAllResponse.cases {
                     self.totalCasesLabel.text = "\(cases)"
                      self.totalDeatchLabel.text = "\(death)"
                 }
    }
    
    //
    
    var BASE_URL = "https://corona.lmao.ninja/v2/"

    @IBOutlet weak var totalDeatchLabel: UILabel!
    @IBOutlet weak var totalCasesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiService.delegate = self
        ApiService.getCases()
       //  getCases()
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
