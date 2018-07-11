//
//  DataSevice.swift
//  AccountRegister
//
//  Created by dohien on 7/11/18.
//  Copyright © 2018 hiền hihi. All rights reserved.
//

import Foundation
typealias DICT = Dictionary <AnyHashable, Any>
class DataSevice {
    static let  shareds : DataSevice = DataSevice()
    private var _dataCity : [CitiesCode]?
    var dataCity : [CitiesCode] {
        get {
            if _dataCity == nil {
                getDataCity()
            }
            return _dataCity ?? []
        }
        set {
            _dataCity = newValue
        }
    }
    func getDataCity(){
        _dataCity = []
        guard let plistPath = Bundle.main.path(forResource: "Cities", ofType: "plist") else { return  }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return  }
        do {
            guard let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil) as? DICT else { return  }
            guard let dictionary = plistDict["Cities"] as? [DICT] else { return  }
            for cityDictionary in dictionary {
                if let city = CitiesCode(dictionary: cityDictionary){
//                    print(city.name, city.cityCode)
                    _dataCity?.append(city)
                }
            }
        } catch  {
            print("Error")
        }
    }
    private var _dataDict : [DistrictCode]?
    var dataDict : [DistrictCode]{
        get {
            if _dataDict == nil{
                getDataDistrict()
            }
            return _dataDict ?? []
        }
        set {
            _dataDict = newValue
        }
    }
    func getDataDistrict(){
        _dataDict = []
        guard let plistPath = Bundle.main.path(forResource: "Districts", ofType: "plist") else { return  }
        guard let plistData = FileManager.default.contents(atPath: plistPath) else { return  }
        do {
            guard let plistDict = try PropertyListSerialization.propertyList(from: plistData, options: .mutableContainersAndLeaves, format: nil)  as? DICT else { return  }
            guard let dictionary = plistDict["Districts"] as? [DICT] else { return }
            for dictDictionary in dictionary {
                if let dict = DistrictCode(dictionary: dictDictionary){
//                    print(dict.name, dict.cityCode, dict.districtCode)
                    _dataDict?.append(dict)
                }
            }
        } catch  {
            print("Error")
        }
    }
    func getPlist(citieData : Int) -> [DistrictCode]{
        getDataDistrict()
        var dataFilited : [DistrictCode] = []
        for score in _dataDict ?? [] {
            if score.cityCode == citieData {
                dataFilited.append(score)
            }
        }
        return dataFilited
    }
}
