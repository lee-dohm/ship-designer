# Hyperspace Fuel Calculation

> From https://www.reddit.com/r/EliteDangerous/comments/30nx4u/the_hyperspace_fuel_equation_documented/

I couldn't find clear documentation, anywhere, for the amount of fuel required for a hyperspace jump or the list of parameters that go into that calculation, so I decided to try to investigate this myself. After experimenting in-game, finding pieces of scattered information in-game, and compiling it all into a spreadsheet, I believe I now know what this equation is.

**FuelConsumedPerJump = LinearConstant \* 0.001 \* ( Distance \* ShipMass / FSDOptimalMass ) ^ PowerConstant**

* **FuelConsumedPerJump:** Exactly what it says, in Tons.
* **LinearConstant:** This is a number that depends only upon the Rating (not Class) of the Frame Shift Drive.
    * A: 12
    * B: 10
    * C: 8
    * D: 10
    * E: 11
* **Distance:** The distance to be jumped, in light years.
* **ShipMass:** The mass of the entire ship and its contents in Tons, including cargo and fuel, before fuel is removed for the hyperspace jump.
* **FSDOptimalMass:** Whatever number the Outfitters reports for the Frame Shift Drive, in Tons. The mass of the ship can exceed this value.
* **PowerConstant:** This is a number that depends only upon the Class (not Rating) of the Frame Shift Drive.
    * 2: 2.00
    * 3: 2.15
    * 4: 2.30
    * 5: 2.45
    * 6: 2.60
    * 7: 2.75
    * 8: 2.90

It's worth pointing out that I'm NOT the first player to figure this out. Presumably, EDShipyard already knows this equation because their calculated numbers for my ship and fittings match the reported in-game numbers for my ship, and I reverse-engineered the equation from EDShipyard's route planning tool. However, the equation isn't clearly documented anywhere that I could find, so I'm filling in the documentation gap.

TAKEAWAYS:
1. Fuel consumption is a function of (Distance * ShipMass). It doesn't matter what either number is, so long as you know the mathematical product of the two. In other words, increasing the distance you jump by 10% or increasing the mass of your ship by 10% will do the same thing to your fuel consumption. Cutting your mass in half doubles your max jump distance, assuming that all other factors remain constant.
2. Corollary to the above: the mass of the ship is subject to the same exponent as the distance of the jump.
3. It's good to have an appreciation for how much longer jumps are costing a ship. A Sidewinder that triples it's jump distance will increasing it's fuel costs by a factor of 9, but an Anaconda trying the same thing is increasing it's fuel costs by a factor of about 17.4 (=32.6 ).

Sources:
* http://www.edshipyard.com/
* http://starchart.club/about/
* My own experimentation
