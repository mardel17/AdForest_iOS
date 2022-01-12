//
//  RejectedAdsStatus.swift
//  AdForest
//
//  Created by Apple on 9/11/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation

struct RejectedAdsStatus{
    
    var featuredType : String!
    var featuredTypeText : String!
    var status : String!
    var statusText : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: [String:Any]){
        featuredType = dictionary["featured_type"] as? String
        featuredTypeText = dictionary["featured_type_text"] as? String
        status = dictionary["status"] as? String
        statusText = dictionary["status_text"] as? String
    }
    
    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if featuredType != nil{
            dictionary["featured_type"] = featuredType
        }
        if featuredTypeText != nil{
            dictionary["featured_type_text"] = featuredTypeText
        }
        if status != nil{
            dictionary["status"] = status
        }
        if statusText != nil{
            dictionary["status_text"] = statusText
        }
        return dictionary
    }
    
}
