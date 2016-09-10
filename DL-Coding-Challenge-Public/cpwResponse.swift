//
//	cpwResponse.swift
//
//	Created by Charles Plater on 9/10/2016
//	Copyright © 2016 Charles Plater. All rights reserved.
//	Model file Generated using JSON Modeler: http://www.jbsolutions.net/json-modeler

import Foundation

class cpwResponse {

	var features : cpwFeature!
	var termsofService : String!
	var version : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let featuresData = dictionary["features"] as? NSDictionary{
			features = cpwFeature(fromDictionary: featuresData)
		}
		termsofService = dictionary["termsofService"] as? String
		version = dictionary["version"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if features != nil{
			dictionary["features"] = features.toDictionary()
		}
		if termsofService != nil{
			dictionary["termsofService"] = termsofService
		}
		if version != nil{
			dictionary["version"] = version
		}
		return dictionary
	}

}
