//
//	cpwFeature.swift
//
//	Created by Charles Plater on 9/10/2016
//	Copyright © 2016 Charles Plater. All rights reserved.
//	Model file Generated using JSON Modeler: http://www.jbsolutions.net/json-modeler

import Foundation

class cpwFeature {

	var conditions : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		conditions = dictionary["conditions"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if conditions != nil{
			dictionary["conditions"] = conditions
		}
		return dictionary
	}

}
