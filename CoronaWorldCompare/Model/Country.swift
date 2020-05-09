//
//  Country.swift
//  CoronaWorldCompare
//
//  Created by Bartu akman on 19.04.2020.
//  Copyright © 2020 Bartu akman. All rights reserved.
//

import Foundation
class Country {
    
        private var _countryName: String!
        private var _countryCase: Int!
        private var _countryDeath: Int!
        private var _countryTest: Int!
 
        var countryName: String {
            return _countryName
        }
        var countryCase: Int {
                  return _countryCase
              }
        var countryDeath: Int {
              return _countryDeath
          }
    
        var countryTest: Int {
              return _countryTest
          }
        
     
      
    init(countryName: String, countryCase: Int , countryDeath: Int, countryTest: Int ) {
              _countryName = countryName
             _countryCase = countryCase
             _countryDeath = countryDeath
             _countryTest = countryTest
            
    }
    
}
