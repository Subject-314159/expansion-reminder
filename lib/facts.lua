-- Data structure
local details = {
    name = "Name",
    summary = "Short description",
    description = "(optional) What it is"
}
local facts_structure = {{
    date = "Mmm DD YYYY",
    fff = "FFF #123",
    title = "Blog post title",
    content = {
        new_entities = {details, {...}},
        new_items = {details, {...}},
        new_concepts = {details, {...}},
        new_enemies = {details, {...}},
        new_qol = {details, {...}},
        background = {details, {...}},
        optimizations = {details, {...}}
    }
}}

local facts = {{
    date = "Aug 16 2024",
    fff = "FFF #424",
    title = "Gleba Pentapod Enemies",
    content = {
        new_enemies = {{
            name = "Wrigglers",
            summary = "Wrigglers are small pentapods whose strength lies in numbers",
            description = "Wrigglers are newly hatched pentapods with average damage. They are very weak individually, but strong in large numbers, and can be spawned by both strafers and stompers."
        }, {
            name = "Strafers",
            summary = "Strafers are fast, agile pentapods",
            description = "Strafers are fast, agile creatures that circle targets at a distance and spit out wrigglers, which can go over walls. Strafers can outrange both gun and laser turrets, and will back off when suffering damage."
        }, {
            name = "Stompers",
            summary = "Stompers are slow but strong and cause splash damage by stomping",
            description = "Stompers are slow and heavily armored that attack with both their crushing feet and a close-range spit. Their feet deal high damage in a small area of effect. When killed, stompers spawn a cluster of wrigglers."
        }},
        new_concepts = {{
            name = "Pollution",
            sumamry = "Pollution on Gleba comes in the form of spores and aromas",
            description = "Gleba's atmosphere naturally absorbs most pollution from industrial buildings. Instead, 'pollution' comes in the form of spores and aroma from biological harvesting and processing, which will attract the native pentapods."
        }, {
            name = "Egg rafts",
            summary = "Egg rafts are the pentapod equivalent of spawners",
            description = "Pentapods spawn in egg rafts, found in Gleba's marshlands. Egg rafts drop pentapod eggs when destroyed, a key ingredient in crafting the biochamber. With some research, pentapod eggs can be automated at the risk of them spoiling and hatching into wrigglers."
        }, {
            name = "Pentapods",
            summary = "Pentapods are the native enemies on Gleba",
            description = "Pentapods are new spider-like enemies native to Gleba. They have three units: wrigglers, strafers and stompers. Strafers and stompers are able to walk over walls. They are attracted to spores and aroma from biological harvesting and processing, which is the 'pollution' on Gleba."
        }}
    }
}, {
    date = "Aug 09 2024",
    fff = "FFF #423",
    title = "Reseach info tooltip & Online players GUI",
    content = {
        new_qol = {{
            name = "Research info tooltip",
            summary = "Research info tooltip displays science production",
            description = "When hovering over the research progress on the top right, a pop-up shows the progress of that schience, how much science is produced/consumes and how long it takes for that research to finish."
        }, {
            name = "Pin and Alert cameras",
            summary = "Hover over an alert or pin and a camera pops up on that specific location",
            description = "Quickly hover over an alert or pin to see what the current status is. For the pin, the zoom of the camera is configurable, so you can adjust it so you can see everything you need to at a glance."
        }, {
            name = "Online players GUI",
            summary = "The new players window allows you to see who is online and what they are doing",
            description = "A new 'Players' button will appear in the top-right, which shows a window with all players online and which planet they are on. Hover over a player and a camera will pop up so you can see what they are doing."
        }}
    }
}, {
    date = "Aug 02 2024",
    fff = "FFF #422",
    title = "Tesla Turret",
    content = {
        new_entities = {{
            name = "Tesla turret",
            summary = "The Tesla turret is an electric turret which fires a chaining beam of lightning",
            description = "The Tesla turret is an electric turret like the Laser turret and takes up a 4x4 area. The Tesla turret is much more powerful and much more power hungry than the Laser turret. Once the primary beam hits a target they are strongly positively charged causing secondary arcs of lightning that can chain to other nearby targets."
        }, {
            name = "Tesla gun",
            summary = "The Tesla gun requires ammo and functions in a similar way to the tesla turret.",
            description = "The Tesla gun version is geared more towards crowd control than other hand-held weapons. Compared to the tesla turret, it can chain for longer and has a higher forking chance."
        }},
        details = {
            {
                name = "Tesla turret design",
                summary = "Earendel talks about the evolution of the Tesla turret."
            },
            name = "The electric beam saga",
            summary = "Jaroslaw talks about how the graphics of the electric beam is designed"
        }
    }
}, {
    date = "Jul 26 2024",
    fff = "FFF #421",
    title = "Optimizations 2.0",
    content = {
        optimizations = {
            {
                name = "Roboports optimization",
                summary = "Roboports are only  activated when they need to perform an action",
                description = "Roboports are only activated when a robot needs to charge or in one of the other rare situations where they need to do things. With this change the update time spent on Roboports dropped from an average of 1ms to 0.025ms per tick."
            },
            {
                name = "Radar logic optimization",
                summary = "Radar scanning is performed on the whole map instead of per-radar range",
                details = "Radars (and Roboports) register chunks as 'keep revealed' instead of each radar scanning a chunk in it's range. By combining the coverage in this way the complete surface can be scanned in one go without the same chunk being scanned by multiple radars. This resulted in an overall 3.6% performance improvement."
            },
            {
                name = "Belt reader and multithreading",
                summary = "Belts that do not interfere with each other are now handled with multithreading"
            },
            name = "Smarter update of worker robots",
            summary = "Most of the time robots are just traveling and doesn't need to be updated every tick",
            description = "By changing the worker robot update logic each robot now has a move intention. Once the intention is known the robot doesn't need to be updated every tick and the rendering code can just pretend the robot is moving. This results in an average overall performance gain of 10-25%."
        },
        new_qol = {{
            name = "Roboport radar",
            summary = "Roboports will have a small 'built-in' radar range of 2 chunks."
        }, {
            name = "Lamp always ON",
            summary = "Lamps no longer require power and are always on.",
            description = "With the introduction of RGB lamps it is possible to create images, however having to place substations every so ofter makes the image slightly ugly. Next to that, on space platforms it is always day so lamps do not turn on. Long story short, lamps no longer require power and can be set to Always ON."
        }}
    }
}, {
    date = "Jul 19 2024",
    fff = "FFF #420",
    title = "Fusion Reactor",
    content = {
        new_entities = {{
            name = "Fusion reactor",
            summary = "The Fusion reactor makes plasma with an energy value of 100MW",
            description = "The Fusion reactor uses fusion fuel cells and cold cooland to generate plasma. The fusion reactor has 8 connection points and each connection point gives a neighbor bonus of +100%, with a maximum of +500%."
        }, {
            name = "Fusion generator",
            summary = "The fusion generator converts plasma from the fusion reactor into electricity and warm coolant.",
            description = "The fusion generator generates electricity from the plasma, and returns an equal amount of warm coolant. It has a maximum power output of 50MW. If the plasma is hotter, then the generator will consume less plasma to make the same amount of electricity. Generators have plasma pass-through connections and when connected to the end of an already connected generator they share the plasma."
        }},
        new_items = {{
            name = "Portable fusion reactor",
            summary = "The 'new' Portable fusion reactor is a more powerful upgrade of the Portable fission reactor",
            description = "With the introduction of fusion power, the 'old' fusion reactor has been renamed to 'Portable fission reactor'. The new 'Portable fusion reactor' is unlocked with the fusion system and generates 2.5MW at base quality or 6.25MW if legendary."
        }},
        new_concepts = {{
            name = "Plasma",
            summary = "Plasma is generated in a Fusion reactor and used in a Fusion generator to produce electricity."
        }},
        background = {{
            name = "Fusion power development",
            summary = "Earendel and V453000 talk about the fusion system, graphics design and reactor-generator lay outs."
        }}
    }
}, {
    date = "Jul 12 2024",
    fff = "FFF #419",
    title = "Display Panel & Inserter pickup fixes",
    content = {
        new_entities = {{
            name = "Display panel",
            summary = "In the Display Panel GUI, players can type a message to be shown.",
            details = "The Display panel is a new building that displays signal icons and custom messages, in-game or on the map screen. It can be connected to the circuit network to set conditions."
        }},
        optimizations = {{
            name = "Inserter pickup fixes",
            summary = "The extension speed of inserters got buffed in order to keep up with the new faster transport belts"
        }}
    }
}, {
    date = "Jul 05 2024",
    fff = "FFF #418",
    title = "Space Age release date",
    content = {
        background = {{
            name = "Release date",
            summary = "The Factorio: Space Age expansion is planned to be released on October 21st 2024 with a sales price of $35."
        }}
    }
}, {
    date = "Jun 28 2024",
    fff = "FFF #417",
    title = "Space Age development",
    content = {
        background = {{
            name = "Development status",
            summary = "Kovarex gives a high level overview of the Space Age development status, which started already back in 2021."
        }}
    }
}, {
    date = "Jun 21 2024",
    fff = "FFF #416",
    title = "Fluids 2.0",
    content = {
        background = {{
            name = "Fluid mechanics",
            summary = " Pipes now have essentially unlimited throughput",
            details = "The fluid system has been completely rewritten. A fluid pushed into a segment of pipes is now fully available across the entire stretch of pipes equally. Machines 'push' fluids into pipes at an unlimited rate, and 'pull' at a rate equal to how full a segment is."
        }}
    }
}, {
    date = "Jun 14 2024",
    fff = "FFF #415",
    title = "Fix, Improve, Optimize",
    content = {
        background = {{
            name = "Deterministic multithreading",
            summary = "Solved a desync bug which was caused by multiple computers using different number of CPU cores."
        }},
        new_qol = {
            {
                name = "Multiplayer auto-pause",
                summary = "When new players join servers the game is now auto-paused so that the players can catch up."
            },
            name = "Faster construction robot tasks",
            summary = "Worker robots are much more responsive by combining the roboport logistic area, which results in a better user experience and much faster worker robot tick update."
        }
    }
}, {
    date = "Jun 07 2024",
    fff = "FFF #414",
    title = "Spoils of Agriculture",
    content = {
        new_entities = {{
            name = "Agricultural tower",
            summary = "Agricultural towers harvest trees within range and can replant certain plants with seeds.",
            description = "The Agricultural tower is a new machine unlocked on Gleba. It automatically harvests trees in its range. Harvesting a plan yields fruits and seeds can then be put back into the Agricultural tower to seed a new plan."
        }, {
            name = "Biochamber",
            summary = "The Biochamber processes biological products.",
            description = "The Biochamber is a new machine unlocked on Gleba. It is used to process all of the plant fruits into more industrial products like carbon fiber or a mysterious material called Bioflux. The quirk of the Biochamber is that it needs to be fed Nutrients to operate."
        }},
        new_concepts = {{
            name = "Spoilage",
            summary = "Fruit and most other biological products will eventually spoil, which turns into a new item called Spoilage.",
            description = "Spoilage can be burned in a boiler, semi-destroyed in the recycler, or processed into half-spoiled nutrients. Spoilable items are used as ingredients in a few non-spoilable items. Once that final item is created, it does not degrade further. Inserters will be able to prioritize the most or least spoiled items."
        }},
        new_items = {{
            name = "Agricultural science pack",
            summary = "The agricultural science pack, crafted on Gleba, will also spoil, which will reduce its research value.",
            description = "The new Agricultural science packs do spoil which reduces their value for research, so you will be incentivized to try to bring home the freshest science packs you can."
        }}
    }
}, {
    date = "May 31 2024",
    fff = "FFF #413",
    title = "Gleba",
    content = {
        new_planets = {{
            name = "Gleba",
            summary = "Gleba, a world overgrown with trees and mushrooms whose biological products eventually degrade into spoilage."
        }}
    }
}, {
    date = "May 24 2024",
    fff = "FFF #412",
    title = "Undo/Redo improvements & Car Latency driving"
}, {
    date = "May 17 2024",
    fff = "FFF #411",
    title = "All about asteroids"
}, {
    date = "May 10 2024",
    fff = "FFF #410",
    title = "Rocket turret & Target priorities"
}, {
    date = "May 03 2024",
    fff = "FFF #409",
    title = "Diminishing beacons"
}, {
    date = "Apr 26 2024",
    fff = "FFF #408",
    title = "Statistics improvements, Linux adventures"
}, {
    date = "Apr 19 2024",
    fff = "FFF #407",
    title = "Automating a soundtrack"
}, {
    date = "Apr 12 2024",
    fff = "FFF #406",
    title = "Space Age Music"
}, {
    date = "Apr 05 2024",
    fff = "FFF #405",
    title = "Whole belt reader, New logistics GUI"
}, {
    date = "Mar 29 2024",
    fff = "FFF #404",
    title = "Frustration not found"
}, {
    date = "Mar 22 2024",
    fff = "FFF #403",
    title = "Train stops 2.0"
}, {
    date = "Mar 15 2024",
    fff = "FFF #402",
    title = "Lightspeed circuits"
}, {
    date = "Mar 08 2024",
    fff = "FFF #401",
    title = "New terrain, new planet"
}, {
    date = "Mar 01 2024",
    fff = "FFF #400",
    title = "Chart search and Pins"
}, {
    date = "Feb 23 2024",
    fff = "FFF #399",
    title = "Trash to Treasure"
}, {
    date = "Feb 16 2024",
    fff = "FFF #398",
    title = "Fulgora"
}, {
    date = "Feb 09 2024",
    fff = "FFF #397",
    title = "Factoriopedia"
}, {
    date = "Feb 02 2024",
    fff = "FFF #396",
    title = "Sound improvements in 2.0"
}, {
    date = "Jan 26 2024",
    fff = "FFF #395",
    title = "Generic interrupts and Train stop priority"
}, {
    date = "Jan 19 2024",
    fff = "FFF #394",
    title = "Assembler flipping and circuit control"
}, {
    date = "Jan 12 2024",
    fff = "FFF #393",
    title = "Putting things on top of other things"
}, {
    date = "Jan 05 2024",
    fff = "FFF #392",
    title = "Parametrised blueprints"
}, {
    date = "Dec 29 2023",
    fff = "FFF #391",
    title = "2023 recap"
}, {
    date = "Dec 22 2023",
    fff = "FFF #390",
    title = "Noise expressions 2.0"
}, {
    date = "Dec 15 2023",
    fff = "FFF #389",
    title = "Train control improvements"
}, {
    date = "Dec 08 2023",
    fff = "FFF #388",
    title = "Smaller things for 2.0"
}, {
    date = "Dec 01 2023",
    fff = "FFF #387",
    title = "Swimming in lava"
}, {
    date = "Nov 24 2023",
    fff = "FFF #386",
    title = "Vulcanus"
}, {
    date = "Nov 17 2023",
    fff = "FFF #385",
    title = "Asteroid Collector"
}, {
    date = "Nov 10 2023",
    fff = "FFF #384",
    title = "Combinators 2.0"
}, {
    date = "Nov 03 2023",
    fff = "FFF #383",
    title = "Super force building"
}, {
    date = "Oct 27 2023",
    fff = "FFF #382",
    title = "Logistic groups"
}, {
    date = "Oct 20 2023",
    fff = "FFF #381",
    title = "Space Platforms"
}, {
    date = "Oct 13 2023",
    fff = "FFF #380",
    title = "Remote view"
}, {
    date = "Oct 06 2023",
    fff = "FFF #379",
    title = "Abstract rewiring"
}, {
    date = "Sep 29 2023",
    fff = "FFF #378",
    title = "Trains on another level"
}, {
    date = "Sep 22 2023",
    fff = "FFF #377",
    title = "New new rails"
}, {
    date = "Sep 15 2023",
    fff = "FFF #376",
    title = "Research and Technology"
}, {
    date = "Sep 08 2023",
    fff = "FFF #375",
    title = "Quality"
}, {
    date = "Sep 01 2023",
    fff = "FFF #374",
    title = "Smarter robots"
}, {
    date = "Aug 25 2023",
    fff = "FFF #373",
    title = "Factorio: Space Age"
}}
return facts
