//
//  CountryAndStateModel.swift
//  SGlobe
//
//  Created by Bhushan Tambe on 06/03/23.
//

import Foundation
import CoreLocation

struct Country: Identifiable {
    let id: Int
    var countryName: LocalizedStringResource = ""
    var states_C: [LocalizedStringResource] = []
   
}

struct StatesAndCoordinates: Identifiable{
    
    let id: Int
    var stateName: String
    var coordinates: CLLocationCoordinate2D
    var famousPlaces: [LocalizedStringResource] = []
}


let countryListWithStates = [Country(id: 0, countryName: "India",states_C: ["Maharashtra","Kerala","Rajasthan","Kolkata"]),
                   Country(id: 1,countryName: "Australia",states_C: ["New South Wales","Victoria","Queensland","Western Australia"]),
                   Country(id: 2,countryName: "Japan",states_C: ["Tokyo","Osaka","Sapporo","Nagoya"]),
                   Country(id: 3,countryName: "Indonesia",states_C: ["Bali","East Kalimantan","West Sumatra","Maluku"]),
                   Country(id: 4,countryName: "New Zealand",states_C: ["Auckland","Wellington","Nelson","Canterbury"]),
                   Country(id: 5,countryName: "West Indies",states_C: ["Barbados","Cuba","Antigua and Barbuda","Dominica"])]



let stateWithCoordinates = [StatesAndCoordinates(id: 0, stateName: "Maharashtra",          coordinates: CLLocationCoordinate2D(latitude: 19.7515, longitude: 75.7139),famousPlaces : ["Rajgad Fort","Ajanta and Ellora","Shivneri Fort"]),
                            StatesAndCoordinates(id: 1, stateName: "Kerala",               coordinates: CLLocationCoordinate2D(latitude: 10.1632, longitude: 76.6413),famousPlaces : ["Munnar","Kochi","Thiruvananthapuram"]),
                            StatesAndCoordinates(id: 2, stateName: "Rajasthan",            coordinates: CLLocationCoordinate2D(latitude: 27.0238, longitude: 74.2179),famousPlaces : ["DAUSA","DHOLPUR","HANUMANGARH"]),
                            StatesAndCoordinates(id: 3, stateName: "Kolkata",              coordinates: CLLocationCoordinate2D(latitude: 22.5726, longitude: 88.3639),famousPlaces : ["Howrah Bridge","Victoria Memorial","Babu Ghat"]),
                            StatesAndCoordinates(id: 4, stateName: "New South Wales",      coordinates: CLLocationCoordinate2D(latitude: -32.58436455342332, longitude: 146.1958162660368),famousPlaces : ["Byron Bay","Sydney","Hunter Valley"]),
                            StatesAndCoordinates(id: 5, stateName: "Victoria",             coordinates: CLLocationCoordinate2D(latitude: -36.964516620919966,  longitude: 144.19223557270075),famousPlaces : ["Bendigo","Ballarat","Healesville"]),
                            StatesAndCoordinates(id: 6, stateName: "Queensland",           coordinates: CLLocationCoordinate2D(latitude: -22.99191155437295, longitude: 144.78096846138456),famousPlaces : ["Gold Coast","Bundaberg","Townsville"]),
                            StatesAndCoordinates(id: 7, stateName: "Western Australia",    coordinates: CLLocationCoordinate2D(latitude: -26.409175410080742, longitude:122.56585627402191),famousPlaces : ["Perth","The Kimberley","Ningaloo Reef"]),
                            StatesAndCoordinates(id: 8, stateName: "Tokyo",                coordinates: CLLocationCoordinate2D(latitude: 35.48654005827612, longitude: 139.77135481406984),famousPlaces : ["Sensoji Temple","Meiji Jingu","Hamarikyu Gardens"]),
                            StatesAndCoordinates(id: 9, stateName: "Osaka",                coordinates: CLLocationCoordinate2D(latitude: 35.174034999075985,longitude: 135.54778307902856),famousPlaces : ["Tempozan Marketplace","Kids Plaza Osaka","Universal Studios Japan"]),
                            StatesAndCoordinates(id: 10, stateName: "Sapporo",             coordinates: CLLocationCoordinate2D(latitude: 43.42583013859839,longitude: 141.54713723208764),famousPlaces : ["Susukino","Moerenuma Park","Odori Park"]),
                            StatesAndCoordinates(id: 11, stateName: "Nagoya",              coordinates: CLLocationCoordinate2D(latitude: 35.12533559575436, longitude: 137.2689785815536),famousPlaces : ["Nagoya Station","Sakae / Fushimi"]),
                            StatesAndCoordinates(id: 12, stateName: "Bali",                coordinates: CLLocationCoordinate2D(latitude: -8.414319540334565, longitude: 115.1922210235965),famousPlaces : ["Mount Batur","Bali swing"]),
                            StatesAndCoordinates(id: 13, stateName: "East Kalimantan",     coordinates: CLLocationCoordinate2D(latitude: 0.5159753238051923, longitude: 116.4492904295802),famousPlaces : ["BIG Mall","Mahakam River"]),
                            StatesAndCoordinates(id: 14, stateName: "West Sumatra",        coordinates: CLLocationCoordinate2D(latitude: -0.7093826567477549,longitude: 100.81243812518947),famousPlaces : ["China Town","Siti Nurbaya Bridge"]),
                            StatesAndCoordinates(id: 15, stateName: "Maluku",              coordinates: CLLocationCoordinate2D(latitude: -3.192569331733925, longitude: 130.12517947892465),famousPlaces : ["Pulau Seram","Pulau Kei"]),
                            StatesAndCoordinates(id: 16, stateName: "Auckland",            coordinates: CLLocationCoordinate2D(latitude: -36.8509, longitude: 174.7645),famousPlaces : ["The Skytower","MOTAT"]),
                            StatesAndCoordinates(id: 17, stateName: "Wellington",          coordinates: CLLocationCoordinate2D(latitude: -41.2924, longitude: 174.7787),famousPlaces : ["Bucket Fountain","Weta Workshop"]),
                            StatesAndCoordinates(id: 18, stateName: "Nelson",              coordinates: CLLocationCoordinate2D(latitude: -41.2985, longitude: 173.2444),famousPlaces : ["Rabbit Island","Queen's garden"]),
                            StatesAndCoordinates(id: 19, stateName: "Canterbury",          coordinates: CLLocationCoordinate2D(latitude: -43.7542, longitude: 171.1637),famousPlaces : ["Christchurch","Akaroa"]),
                            StatesAndCoordinates(id: 20, stateName: "Barbados",            coordinates: CLLocationCoordinate2D(latitude: 13.1939, longitude: -59.5432),famousPlaces : ["Harrison's Cave","Shirley Heights"]),
                            StatesAndCoordinates(id: 21, stateName: "Cuba",                coordinates: CLLocationCoordinate2D(latitude: 21.5218, longitude: -78.7812),famousPlaces : ["Shirley Heights","Bottom Bay"]),
                            StatesAndCoordinates(id: 22, stateName: "Antigua and Barbuda", coordinates: CLLocationCoordinate2D(latitude: 17.0608, longitude: -61.7964),famousPlaces : ["Shirley Heights","Devil's Bridge"]),
                            StatesAndCoordinates(id: 23, stateName: "Dominica",            coordinates: CLLocationCoordinate2D(latitude: 15.4150, longitude: -61.3710),famousPlaces : ["Boiling Lake","Titou Gorge"])]

    
