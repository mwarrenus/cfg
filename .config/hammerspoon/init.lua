-- defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
hs.loadSpoon('Calendar')
-- from https://github.com/jasonrudolph/ControlEscape.spoon
-- hs.loadSpoon('ControlEscape'):start() 
local ctrlTap = require('ctrlTap'); -- simpler version

-- http://www.hammerspoon.org/go/#simplemenubar
caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("😳") -- or AWAKE
    else
        caffeine:setTitle("😴") -- or SLEEPY
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end