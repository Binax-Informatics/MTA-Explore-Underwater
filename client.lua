-- © Copyright, Maximilian Brandmaier (SuperBrandy), 2014
-- All contents of this Project are protected by Copyright.
local EUx
local EUy
local EUz
local EUUnderWater


function EUExplore()
local player = getLocalPlayer()

if(EUUnderWater == false)then

if(isPedInVehicle(player) == true)then
local vehicle = getPedOccupiedVehicle ( player )

if(isElementInWater(vehicle) == false)then
EUUnderWater = true
EUx, EUy, EUz = getElementPosition(vehicle)
setPedCanBeKnockedOffBike ( player, false)
setElementPosition(vehicle, -2088.496, 2014, -43)
else
outputChatBox("You need to be on land")
end

else

if(isElementInWater(player) == false)then
EUUnderWater = true
EUx, EUy, EUz = getElementPosition(player)
setElementPosition(player, -2088.496, 2014, -43)
else
outputChatBox("You need to be on land")
end

end

elseif(EUUnderWater == true)then
EUUnderWater = false
if(isPedInVehicle(player) == true)then
local vehicle = getPedOccupiedVehicle ( player )
setElementPosition(vehicle,EUx, EUy, EUz)
else
setElementPosition(player,EUx, EUy, EUz)
end
end
end

addCommandHandler("explore", EUExplore)

addEventHandler( "onClientResourceStart", getRootElement( ),
function()
EUUnderWater = false
end)

addEventHandler("onClientVehicleExit", getRootElement(), 
function()
if(EUUnderWater == true)then
local player = getLocalPlayer()
setElementPosition(player, EUx, EUy, EUz)
fadeCamera (player, true)
setCameraTarget (player, player)
end
end)