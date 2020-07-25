//
//  ApiService.swift
//  CoronaWorldCompare
//
//  Created by Bartu akman on 4.07.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
protocol  ApiServiceDelegate {
    func onSuccess(_response: Any?, _requestCode: RequestCode)
    func onFailure(_error: Error?, _requestCode: RequestCode)

}
enum RequestCode {
    case getCoronaAllCases
}
class ApiService {
    // apiservice struct
   static var delegate: ApiServiceDelegate?
  static  let BASE_URL = "https://corona.lmao.ninja/v2/"
    // good
  static  func getCases() {
           _ = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
           let LAST_URL = BASE_URL + "all"
            Alamofire.request(LAST_URL).responseObject { (response: DataResponse<CoronaLast>) in
                
                if response.error != nil {
                    delegate?.onFailure(_error: response.error, _requestCode: .getCoronaAllCases)
                    
                    
                } else {
                    let coronaAllResponse = response.result.value
                                  if   let death = coronaAllResponse?.deaths ,
                                      let cases = coronaAllResponse?.cases {
                                   print(death)
                                     // self.totalCasesLabel.text = "\(cases)"
                                      // self.totalDeatchLabel.text = "\(death)"
                                  }
                               
                       
                                delegate?.onSuccess(_response: coronaAllResponse, _requestCode: .getCoronaAllCases)

                }
               
           }

      
        }
    
    
    
}
