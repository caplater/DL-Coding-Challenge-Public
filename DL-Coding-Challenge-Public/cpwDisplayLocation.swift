//
//	cpwDisplayLocation.swift
//
//	Created by Charles Plater on 9/10/2016
//	Copyright © 2016 Charles Plater. All rights reserved.
//	Model file Generated using JSON Modeler: http://www.jbsolutions.net/json-modeler

import Foundation

class cpwDisplayLocation {

	var city : String!
	var country : String!
	var countryIso3166 : String!
	var elevation : String!
	var full : String!
	var latitude : String!
	var longitude : String!
	var magic : String!
	var state : String!
	var stateName : String!
	var wmo : String!
	var zip : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		city = dictionary["city"] as? String
		country = dictionary["country"] as? String
		countryIso3166 = dictionary["country_iso3166"] as? String
		elevation = dictionary["elevation"] as? String
		full = dictionary["full"] as? String
		latitude = dictionary["latitude"] as? String
		longitude = dictionary["longitude"] as? String
		magic = dictionary["magic"] as? String
		state = dictionary["state"] as? String
		stateName = dictionary["state_name"] as? String
		wmo = dictionary["wmo"] as? String
		zip = dictionary["zip"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if city != nil{
			dictionary["city"] = city
		}
		if country != nil{
			dictionary["country"] = country
		}
		if countryIso3166 != nil{
			dictionary["country_iso3166"] = countryIso3166
		}
		if elevation != nil{
			dictionary["elevation"] = elevation
		}
		if full != nil{
			dictionary["full"] = full
		}
		if latitude != nil{
			dictionary["latitude"] = latitude
		}
		if longitude != nil{
			dictionary["longitude"] = longitude
		}
		if magic != nil{
			dictionary["magic"] = magic
		}
		if state != nil{
			dictionary["state"] = state
		}
		if stateName != nil{
			dictionary["state_name"] = stateName
		}
		if wmo != nil{
			dictionary["wmo"] = wmo
		}
		if zip != nil{
			dictionary["zip"] = zip
		}
		return dictionary
	}

}
