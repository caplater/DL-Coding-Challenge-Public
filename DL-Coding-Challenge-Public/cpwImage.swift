//
//	cpwImage.swift
//
//	Created by Charles Plater on 9/10/2016
//	Copyright © 2016 Charles Plater. All rights reserved.
//	Model file Generated using JSON Modeler: http://www.jbsolutions.net/json-modeler

import Foundation

class cpwImage {

	var link : String!
	var title : String!
	var url : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		link = dictionary["link"] as? String
		title = dictionary["title"] as? String
		url = dictionary["url"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if link != nil{
			dictionary["link"] = link
		}
		if title != nil{
			dictionary["title"] = title
		}
		if url != nil{
			dictionary["url"] = url
		}
		return dictionary
	}

}
