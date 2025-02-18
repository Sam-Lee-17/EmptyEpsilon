template = ShipTemplate():setName("Ship_Test_Larp"):setLocaleName(_("Ship_Test_Larp")):setClass(_("Corvette"), _("Destroyer")):setModel("battleship_destroyer_1_upgraded"):setType("playership")
template:setDescription(_([[The battle Docker can send drones to explore , fight and support a war field.]]))
template:setDockClasses("Drone")
template:setRadarTrace("radar_dread.png")
template:setHull(100)
template:setCombatManeuver(400, 250)
template:setShields(200, 200, 200, 200)
template:setSpeed(90, 10, 20)
template:setJumpDrive(true)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,100, -20, 1500.0, 6.0, 8)
template:setBeam(1,100,  20, 1500.0, 6.0, 8)
template:setBeam(2,100, 180, 1500.0, 6.0, 8)
template:setTubes(5, 8.0) -- Amount of torpedo tubes, and loading time of the tubes.
template:weaponTubeDisallowMissle(0, "Mine"):weaponTubeDisallowMissle(1, "Mine")
template:weaponTubeDisallowMissle(2, "Mine"):weaponTubeDisallowMissle(3, "Mine")
template:setTubeDirection(4, 180):setWeaponTubeExclusiveFor(4, "Mine")
template:setWeaponStorage("Homing", 12)
template:setWeaponStorage("Nuke", 4)
template:setWeaponStorage("Mine", 8)
template:setWeaponStorage("EMP", 6)
template:setTubeDirection(0, 0)
template:setTubeDirection(1, 0)
template:setTubeDirection(2,  -90)
template:setTubeDirection(3,  90)
template:setDocks(2, 1, 1, 1, 1, 1)
template:addDrones("L3 Mouse", 1)
template:addDrones("L3 Cat", 1)
template:addDrones("H9 Owl", 1)
template:addDrones("M19 Rino", 1)
template:setTractorBeam(2000, 100)

template:addRoomSystem(1, 0, 2, 1, "Maneuver");
template:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
template:addRoomSystem(2, 2, 2, 1, "Drones");
template:addRoomSystem(0, 3, 1, 2, "RearShield");
template:addRoomSystem(1, 3, 2, 2, "Reactor");
template:addRoomSystem(3, 3, 2, 2, "Warp");
template:addRoomSystem(5, 3, 1, 2, "JumpDrive");
template:addRoomTitle(6, 3, 2, 1, "Commands center");
template:addRoomSystem(6, 4, 2, 1, "Docks");
template:addRoomSystem(8, 3, 1, 2, "FrontShield");
template:addRoomSystem(2, 5, 2, 1, "Oxygen");
template:addRoomSystem(1, 6, 2, 1, "MissileSystem");
template:addRoomSystem(1, 7, 2, 1, "Impulse");
template:addDoor(1, 1, true);
template:addDoor(2, 2, true);
template:addDoor(3, 3, true);
template:addDoor(1, 3, false);
template:addDoor(3, 4, false);
template:addDoor(3, 5, true);
template:addDoor(2, 6, true);
template:addDoor(1, 7, true);
template:addDoor(5, 3, false);
template:addDoor(6, 3, false);
template:addDoor(6, 4, false);
template:addDoor(8, 3, false);
template:addDoor(8, 4, false);

template:setHasOxygenGenerator(true);
template:setOxygenZone(0, "Test", 100.0, 0.1, 0.1);

-- To choose recorded ship template or not
template = ShipTemplate():setName("Not recorded ship"):setClass("Secret", "Secret"):setModel("AtlasHeavyFighterYellow"):setRecorded(false)

