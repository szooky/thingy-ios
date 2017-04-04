//
//  Thing+Mock.swift
//  Thingy
//
//  Created by Filip Szukala on 09/01/2017.
//  Copyright © 2017 Filip Szukala. All rights reserved.
//

import Foundation

extension Thing {
    
    class func get(variant: Int) -> Thing {
        let thing = Thing()
        
        switch variant {
        case 0:
            thing.name = "Alfa Romeo GT Blackline"
            thing.profileImageURL = "alfa1"
            thing.gallery = ["alfa1", "alfa2", "alfa3"]
            thing.stories = [Story.get(variant: 0)]
            thing.comments = Comment.getAll()
            thing.description = "Alfa Romeo GT, limited Blackline edition, original 18 inch Blackline III wheels, full Blackline Satin Chrome Package, Black&Red Interior with red stiching, blacked out reflectors, double pipes. Sadly diesel engine though."
            
        case 1:
            thing.name = "Blacked out C63 AMG Coupe"
            thing.profileImageURL = "black_gold_amg"
            thing.gallery = ["black_gold_amg","camo_rs6","black_hurracan"]
            thing.stories = Story.getAll()
            thing.comments = Comment.getAll()
            thing.description = "The 2017 C-class coupe rollout begins next spring, with the rear-drive C300 and all-wheel-drive C300 4MATIC, which, like the C300/C300 4MATIC sedans, are powered by a turbocharged 2.0-liter four-cylinder engine good for 241 horsepower and 273 lb-ft of torque. The only transmission is a seven-speed automatic, and Mercedes’ Dynamic Select adjustable-chassis system is standard fare. Also standard are 18-inch wheels, all-season tires, and a sport suspension that has the coupe riding 0.6-inch closer to the ground than the sedan. An optional Sport Appearance package brings Airmatic springs and 18-inch AMG-styled wheels, plus an AMG body kit, a more chrome-intensive grille, AMG pedals, and a flat-bottom steering wheel."
        case 2:
            thing.name = "Camo RS6 with Miltek Exhaust"
            thing.profileImageURL = "camo_rs6"
            thing.gallery = ["camo_rs6","black_gold_amg","black_hurracan"]
            thing.stories = [Story.get(variant: variant)]
            thing.comments = [Comment.get(variant: variant)]
            thing.description = "Audi revealed the details of the C7 RS6 on December 5, 2012.[25] Its 4.0 twin-turbo TFSI V8 engine develops 412 kW (560 PS; 553 bhp) and 700 N·m (516 lbf·ft) of torque. This will enable the RS6 Avant to accelerate from 0 to 100 km/h (62.1 mph) in 3.9 seconds. The top speed is limited to 250 km/h (155.3 mph) by default. By adding the optional Dynamic or Dynamic Plus package, this top speed is increased to respectively 280 km/h (174.0 mph) or 305 km/h (189.5 mph). Audi claims an average fuel consumption of 8.8 L/100 km (27 mpg-US) and CO2 emissions of 229g/km. In order to accomplish this Audi has added a start-stop system and a cylinder on demand system. The RS6 Avant uses an 8-speed tiptronic gearbox."

            
        default:
            thing.name = "Wide body, engine in the tail, chrome lips, V12"
            thing.profileImageURL = "black_hurracan"
            thing.gallery = ["black_hurracan","black_gold_amg","camo_rs6"]
            thing.stories = [Story.get(variant: variant)]
            thing.comments = [Comment.get(variant: variant)]
            thing.description = "he Huracán LP 580-2 is a lower cost derivative of the Huracán 610-4 that differs mostly in having an engine tuned only to 580 PS and only driving the rear wheels. It has the same 5.2-liter V-10 engine as the 610-4, except tuned to 572 hp (580 PS; 427 kW) and 533 N·m (393 lb·ft). Lamborghini claims it will do 0–100 km/h (0–62 mph) in 3.4 seconds and 0–200 km/h (0–124 mph) in 10.1 seconds. The top speed is claimed to be as high as 320 km/h (199 mph). It also features slight visual differences to the LP610-4 variant of the car - with a different front fascia and a larger air vent at the rear of the car.[20] The seven-speed dual-clutch transmission is the same as used in the 610-4. The base level 580-2 costs US$201,100, about US$40,000 less than the base level 610-4."
        }
        
        return thing
    }
    
    class func getAll() -> [Thing] {
        var things = [Thing]()
        
        for index in 1...3 {
            things.append(Thing.get(variant: index))
        }
        
        return things
    }
}
