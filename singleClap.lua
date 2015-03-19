scriptId = 'com.clapper.singleclap'
scriptTitle = "Single Clap"
scriptDetailsURL = ""
myo.setLockingPolicy("none")

function onPoseEdge(pose, edge)
    myo.debug("onPoseEdge: " .. pose .. ": " .. edge)
    
    pose = conditionallySwapWave(pose)
    
    local keyEdge = edge == "off" and "up" or "down"
    
    if (pose == "waveOut") then
        onWaveOut(keyEdge)        
    elseif (pose == "waveIn") then
        onWaveIn(keyEdge)
    elseif (pose == "fist") then
        onFist(keyEdge)
    elseif (pose == "fingersSpread") then
        onFingersSpread(keyEdge)            
    end
end
 
function onWaveOut(keyEdge)
    myo.debug("Next")
    --myo.vibrate("short")
    myo.keyboard("tab", keyEdge)
end
 
function onWaveIn(keyEdge)
    myo.debug("Previous")
    --myo.vibrate("short")
    --myo.vibrate("short")
    myo.keyboard("tab",keyEdge,"shift")
end
 
 
function onFist(keyEdge)
    myo.debug("Enter")    
    --myo.vibrate("medium")
    myo.keyboard("return",keyEdge)
end
 
function onFingersSpread(keyEdge)
    myo.debug("Escape")
    --myo.vibrate("long")
    myo.keyboard("escape", keyEdge)
end

function onForegroundWindowChange(app, title)
  return true
end