# Car-Interface
This was a final group project for a class that explored the intersection of music and computers / devices.
In essence it is meant to "simulate" the experience of driving in a car. For full functionality an iPhone with AirBeam or equivalent is needed and it must be connected to
a laptop with that same app. The iphone, as we used it, was tapped to the front of an rc-car. Users could drive around the car which would beam back video data as well
as data about acceleration. This information was used by this interface to create an abstract music experience. 

The experience featured components such as a semi-randomly sampled beat made exclusively from car noises with a tempo determined by the cars speed - estimated from the acceleration
data. The image data made a drone that would change pitch depending on the color in the frame, a loose approximation of density (more light = fewer people). As part of the interface 
there are things such as a "radio" which plays selected songs on a few stations, a break pedeal to slow the tempo manually, windshield wipers a horn and more. Lastly,
on the radio there is an option to choose the setting such as on a country or in a city which impacts the choice of music on the radio as well as some of the randomly 
sampled sounds for the beat.

The music was coded primarily in Max_MSP which is a visual coding application and using chuck a music-optimized programming language. You'll need both to run the program. 
It should still work with out the car or phone but will just be missing out on some features and certainly less fun. The main file is --project.maxpat which calls all of the other files.
