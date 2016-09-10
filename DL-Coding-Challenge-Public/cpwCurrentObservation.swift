//
//	cpwCurrentObservation.swift
//
//	Created by Charles Plater on 9/10/2016
//	Copyright © 2016 Charles Plater. All rights reserved.
//	Model file Generated using JSON Modeler: http://www.jbsolutions.net/json-modeler

import Foundation

class cpwCurrentObservation {

	var uV : String!
	var dewpointC : Int!
	var dewpointF : Int!
	var dewpointString : String!
	var displayLocation : cpwDisplayLocation!
	var estimated : cpwEstimated!
	var feelslikeC : String!
	var feelslikeF : String!
	var feelslikeString : String!
	var forecastUrl : String!
	var heatIndexC : String!
	var heatIndexF : String!
	var heatIndexString : String!
	var historyUrl : String!
	var icon : String!
	var iconUrl : String!
	var image : cpwImage!
	var localEpoch : String!
	var localTimeRfc822 : String!
	var localTzLong : String!
	var localTzOffset : String!
	var localTzShort : String!
	var nowcast : String!
	var obUrl : String!
	var observationEpoch : String!
	var observationLocation : cpwObservationLocation!
	var observationTime : String!
	var observationTimeRfc822 : String!
	var precip1hrIn : String!
	var precip1hrMetric : String!
	var precip1hrString : String!
	var precipTodayIn : String!
	var precipTodayMetric : String!
	var precipTodayString : String!
	var pressureIn : String!
	var pressureMb : String!
	var pressureTrend : String!
	var relativeHumidity : String!
	var solarradiation : String!
	var stationId : String!
	var tempC : Float!
	var tempF : Float!
	var temperatureString : String!
	var visibilityKm : String!
	var visibilityMi : String!
	var weather : String!
	var windDegrees : Int!
	var windDir : String!
	var windGustKph : String!
	var windGustMph : String!
	var windKph : Float!
	var windMph : Float!
	var windString : String!
	var windchillC : String!
	var windchillF : String!
	var windchillString : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		uV = dictionary["UV"] as? String
		dewpointC = dictionary["dewpoint_c"] as? Int
		dewpointF = dictionary["dewpoint_f"] as? Int
		dewpointString = dictionary["dewpoint_string"] as? String
		if let displayLocationData = dictionary["display_location"] as? NSDictionary{
			displayLocation = cpwDisplayLocation(fromDictionary: displayLocationData)
		}
		if let estimatedData = dictionary["estimated"] as? NSDictionary{
			estimated = cpwEstimated(fromDictionary: estimatedData)
		}
		feelslikeC = dictionary["feelslike_c"] as? String
		feelslikeF = dictionary["feelslike_f"] as? String
		feelslikeString = dictionary["feelslike_string"] as? String
		forecastUrl = dictionary["forecast_url"] as? String
		heatIndexC = dictionary["heat_index_c"] as? String
		heatIndexF = dictionary["heat_index_f"] as? String
		heatIndexString = dictionary["heat_index_string"] as? String
		historyUrl = dictionary["history_url"] as? String
		icon = dictionary["icon"] as? String
		iconUrl = dictionary["icon_url"] as? String
		if let imageData = dictionary["image"] as? NSDictionary{
			image = cpwImage(fromDictionary: imageData)
		}
		localEpoch = dictionary["local_epoch"] as? String
		localTimeRfc822 = dictionary["local_time_rfc822"] as? String
		localTzLong = dictionary["local_tz_long"] as? String
		localTzOffset = dictionary["local_tz_offset"] as? String
		localTzShort = dictionary["local_tz_short"] as? String
		nowcast = dictionary["nowcast"] as? String
		obUrl = dictionary["ob_url"] as? String
		observationEpoch = dictionary["observation_epoch"] as? String
		if let observationLocationData = dictionary["observation_location"] as? NSDictionary{
			observationLocation = cpwObservationLocation(fromDictionary: observationLocationData)
		}
		observationTime = dictionary["observation_time"] as? String
		observationTimeRfc822 = dictionary["observation_time_rfc822"] as? String
		precip1hrIn = dictionary["precip_1hr_in"] as? String
		precip1hrMetric = dictionary["precip_1hr_metric"] as? String
		precip1hrString = dictionary["precip_1hr_string"] as? String
		precipTodayIn = dictionary["precip_today_in"] as? String
		precipTodayMetric = dictionary["precip_today_metric"] as? String
		precipTodayString = dictionary["precip_today_string"] as? String
		pressureIn = dictionary["pressure_in"] as? String
		pressureMb = dictionary["pressure_mb"] as? String
		pressureTrend = dictionary["pressure_trend"] as? String
		relativeHumidity = dictionary["relative_humidity"] as? String
		solarradiation = dictionary["solarradiation"] as? String
		stationId = dictionary["station_id"] as? String
		tempC = dictionary["temp_c"] as? Float
		tempF = dictionary["temp_f"] as? Float
		temperatureString = dictionary["temperature_string"] as? String
		visibilityKm = dictionary["visibility_km"] as? String
		visibilityMi = dictionary["visibility_mi"] as? String
		weather = dictionary["weather"] as? String
		windDegrees = dictionary["wind_degrees"] as? Int
		windDir = dictionary["wind_dir"] as? String
		windGustKph = dictionary["wind_gust_kph"] as? String
		windGustMph = dictionary["wind_gust_mph"] as? String
		windKph = dictionary["wind_kph"] as? Float
		windMph = dictionary["wind_mph"] as? Float
		windString = dictionary["wind_string"] as? String
		windchillC = dictionary["windchill_c"] as? String
		windchillF = dictionary["windchill_f"] as? String
		windchillString = dictionary["windchill_string"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if uV != nil{
			dictionary["UV"] = uV
		}
		if dewpointC != nil{
			dictionary["dewpoint_c"] = dewpointC
		}
		if dewpointF != nil{
			dictionary["dewpoint_f"] = dewpointF
		}
		if dewpointString != nil{
			dictionary["dewpoint_string"] = dewpointString
		}
		if displayLocation != nil{
			dictionary["display_location"] = displayLocation.toDictionary()
		}
		if estimated != nil{
			dictionary["estimated"] = estimated.toDictionary()
		}
		if feelslikeC != nil{
			dictionary["feelslike_c"] = feelslikeC
		}
		if feelslikeF != nil{
			dictionary["feelslike_f"] = feelslikeF
		}
		if feelslikeString != nil{
			dictionary["feelslike_string"] = feelslikeString
		}
		if forecastUrl != nil{
			dictionary["forecast_url"] = forecastUrl
		}
		if heatIndexC != nil{
			dictionary["heat_index_c"] = heatIndexC
		}
		if heatIndexF != nil{
			dictionary["heat_index_f"] = heatIndexF
		}
		if heatIndexString != nil{
			dictionary["heat_index_string"] = heatIndexString
		}
		if historyUrl != nil{
			dictionary["history_url"] = historyUrl
		}
		if icon != nil{
			dictionary["icon"] = icon
		}
		if iconUrl != nil{
			dictionary["icon_url"] = iconUrl
		}
		if image != nil{
			dictionary["image"] = image.toDictionary()
		}
		if localEpoch != nil{
			dictionary["local_epoch"] = localEpoch
		}
		if localTimeRfc822 != nil{
			dictionary["local_time_rfc822"] = localTimeRfc822
		}
		if localTzLong != nil{
			dictionary["local_tz_long"] = localTzLong
		}
		if localTzOffset != nil{
			dictionary["local_tz_offset"] = localTzOffset
		}
		if localTzShort != nil{
			dictionary["local_tz_short"] = localTzShort
		}
		if nowcast != nil{
			dictionary["nowcast"] = nowcast
		}
		if obUrl != nil{
			dictionary["ob_url"] = obUrl
		}
		if observationEpoch != nil{
			dictionary["observation_epoch"] = observationEpoch
		}
		if observationLocation != nil{
			dictionary["observation_location"] = observationLocation.toDictionary()
		}
		if observationTime != nil{
			dictionary["observation_time"] = observationTime
		}
		if observationTimeRfc822 != nil{
			dictionary["observation_time_rfc822"] = observationTimeRfc822
		}
		if precip1hrIn != nil{
			dictionary["precip_1hr_in"] = precip1hrIn
		}
		if precip1hrMetric != nil{
			dictionary["precip_1hr_metric"] = precip1hrMetric
		}
		if precip1hrString != nil{
			dictionary["precip_1hr_string"] = precip1hrString
		}
		if precipTodayIn != nil{
			dictionary["precip_today_in"] = precipTodayIn
		}
		if precipTodayMetric != nil{
			dictionary["precip_today_metric"] = precipTodayMetric
		}
		if precipTodayString != nil{
			dictionary["precip_today_string"] = precipTodayString
		}
		if pressureIn != nil{
			dictionary["pressure_in"] = pressureIn
		}
		if pressureMb != nil{
			dictionary["pressure_mb"] = pressureMb
		}
		if pressureTrend != nil{
			dictionary["pressure_trend"] = pressureTrend
		}
		if relativeHumidity != nil{
			dictionary["relative_humidity"] = relativeHumidity
		}
		if solarradiation != nil{
			dictionary["solarradiation"] = solarradiation
		}
		if stationId != nil{
			dictionary["station_id"] = stationId
		}
		if tempC != nil{
			dictionary["temp_c"] = tempC
		}
		if tempF != nil{
			dictionary["temp_f"] = tempF
		}
		if temperatureString != nil{
			dictionary["temperature_string"] = temperatureString
		}
		if visibilityKm != nil{
			dictionary["visibility_km"] = visibilityKm
		}
		if visibilityMi != nil{
			dictionary["visibility_mi"] = visibilityMi
		}
		if weather != nil{
			dictionary["weather"] = weather
		}
		if windDegrees != nil{
			dictionary["wind_degrees"] = windDegrees
		}
		if windDir != nil{
			dictionary["wind_dir"] = windDir
		}
		if windGustKph != nil{
			dictionary["wind_gust_kph"] = windGustKph
		}
		if windGustMph != nil{
			dictionary["wind_gust_mph"] = windGustMph
		}
		if windKph != nil{
			dictionary["wind_kph"] = windKph
		}
		if windMph != nil{
			dictionary["wind_mph"] = windMph
		}
		if windString != nil{
			dictionary["wind_string"] = windString
		}
		if windchillC != nil{
			dictionary["windchill_c"] = windchillC
		}
		if windchillF != nil{
			dictionary["windchill_f"] = windchillF
		}
		if windchillString != nil{
			dictionary["windchill_string"] = windchillString
		}
		return dictionary
	}

}
