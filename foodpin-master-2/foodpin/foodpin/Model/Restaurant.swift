//
//  Restaurant.swift
//  foodpin
//
//  Created by 張宸瑋 on 2021/11/8.
//

import Foundation
struct Restaurant: Hashable {
    var name: String = ""
    var type: String = ""
    var location: String = ""
    var phone: String = ""
    var summary: String = ""
    var image: String = ""
    var img2: String = ""
    var isFavorite: Bool = false
}

extension Restaurant {
    
    static func generateData( sourceArray: inout [Restaurant]) {
        sourceArray = [
            Restaurant(name: "Basketball", type: "10 people game", location: "Basketball is a team sport in which two teams, most commonly of five players each, opposing one another on a rectangular court, compete with the primary objective of shooting a basketball (approximately 9.4 inches (24 cm) in diameter) through the defender's hoop", phone: "", summary: "", image: "basketball.jpg",img2: "basketballicon"),
            Restaurant(name: "Football", type: "22 people game", location: "Association football more commonly known as football or soccer, a sport played between 2 slides of 11 players with a spherical ball. Football is the worlds most popular sport.", phone: "", summary: "", image: "football.jpg",img2: "footballicon"),
            Restaurant(name: "Baseball", type: "18 people game", location: "Baseball is a bat-and-ball game played between two opposing teams, typically of nine players each, that take turns batting and fielding.", phone: "", summary: "", image: "Baseball.jpg",img2: "baseicon"),
            Restaurant(name: "Tennis", type: "2~4 people game", location: "Each player uses a tennis racket that is strung with cord to strike a hollow rubber ball covered with felt over or around a net and into the opponent's court", phone: "", summary: "", image: "Tennis.jpg",img2: "tenicon"),
            Restaurant(name: "Running", type: "no limit", location: "Running has been described as the worlds most accessible sport. Running can be in the form of racing not only for completion but also fitness, it can also, be used when training for sports that have running or endurance components.", phone: "", summary: "", image: "running.jpg",img2: "Runningicon"),
            Restaurant(name: "Volleyball", type: "12 people game", location: "Each team tries to score points by grounding a ball on the other team's court under organized rules.", phone: "232-434222", summary: "A great local cafe for breakfast and lunch! Located in a quiet area in Sheung Wan, we offer pork chop buns, HK french toast, and many more. We open from 7 AM to 4:30 PM.", image: "Volleyball.jpg",img2: "voicon"),
            Restaurant(name: "Golf", type: "individual", location: "Golf is a game played on a large open air course, in which a small hard ball is struck with a club into a series of small holes in the ground, the object being to use the fewest possible strokes to complete the course.", phone: "982-434343", summary: "We make everything by hand with the best possible ingredients, from organic sourdoughs to pastries and cakes. A combination of great produce, good strong coffee, artisanal skill and hard work creates the honest, soulful, delectable bites that have made Bourke Street Bakery famous. Visit us at one of our many Sydney locations!", image: "Golf.jpg",img2: "vector-golf-icon-png_297514"),
            Restaurant(name: "Table Tennis", type: "2-4 people game", location: "A point is scored when a player fails to return the ball within the rules. Play is fast and demands quick reactions.", phone: "", summary: "", image: "TableTennis.jpg",img2: "table-tennis-icon-racket-ball-ping-pong-sport-icon-isolated_138676-524.jpg"),
            Restaurant(name: "Swimming", type: "individual", location: "Swimming is the sport or activity of propelling oneself through water using the limbs. ", phone: "", summary: "", image: "Swimming.jpg",img2: "swicon"),
            Restaurant(name: "Surfing", type: "individual", location: "Surfing is a surface water sport in which an individual, a surfer (or two in tandem surfing), uses a board to ride on the forward section, or face, of a moving wave of water, which usually carries the surfer towards the shore.", phone: "", summary: "", image: "Surfing.jpg",img2: "surfer-flat-icon-travel-and-tourism-surfing-vector-14753648"),
            Restaurant(name: "Skateboarding", type: "individual", location: "Skateboarding is an action sport originating in the United States that involves riding and performing tricks using a skateboard, as well as a recreational activity, an art form, an entertainment industry job, and a method of transportation.", phone: "", summary: "", image: "Skate.jpg",img2: "teenager-boy-skateboarder-isolated-on-white-vector-36321914"),
        ]
        
    }
    
}
