//
//	cpwWeatherData.swift
//
//	Created by Charles Plater on 9/10/2016
//	Copyright © 2016 Charles Plater. All rights reserved.
//	Model file Generated using JSON Modeler: http://www.jbsolutions.net/json-modeler

import Foundation

class cpwWeatherData {

	var currentObservation : cpwCurrentObservation!
	var response : cpwResponse!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let currentObservationData = dictionary["current_observation"] as? NSDictionary{
			currentObservation = cpwCurrentObservation(fromDictionary: currentObservationData)
		}
		if let responseData = dictionary["response"] as? NSDictionary{
			response = cpwResponse(fromDictionary: responseData)
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if currentObservation != nil{
			dictionary["current_observation"] = currentObservation.toDictionary()
		}
		if response != nil{
			dictionary["response"] = response.toDictionary()
		}
		return dictionary
	}

}
