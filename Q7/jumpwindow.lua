local topPanelButton = nil
local jumpWindow = nil
local jumpButton = nil

local buffer = 30 --Buffer to keep button away from absolute extremities of window

local buttonMoveSpeed = 3

function init()
    connect(g_game, { onGameEnd = destroy })

    -- Initialize top panel button used to open jump window.
    -- Based on questlog, placed on left side and using same logo
    topPanelButton = modules.client_topmenu.addLeftGameToggleButton('jumpPanelButton', tr('Jump Window'), '/images/topbuttons/questlog', toggleJumpWindow)
    topPanelButton:setOn(false)

    -- Initialize the jump window and button. Window is initially hidden
    jumpWindow = g_ui.displayUI('jumpwindow.otui', modules.game_interface.getLeftPanel())
    jumpWindow:hide()
    jumpButton = jumpWindow:recursiveGetChildById("jumpButton")

    -- Start periodic event to move the button, periodically triggers function moveButton
    periodicalEvent(moveButton, nil, 15)
end

--Standard shutdown functions, clean up objects
function terminate()
    disconnect(g_game, { onGameEnd = destroy })
end

function destroy()
    jumpWindow:destroy()
    topPanelButton:destroy()
end

-- Open and close window using top panel button to avoid need for close button
function toggleJumpWindow()
    if topPanelButton:isOn() then
        topPanelButton:setOn(false)
        jumpWindow:hide()
    else
        topPanelButton:setOn(true)
        jumpWindow:show()
        jumpButtonReset()
    end
end

--Function triggered by periodic event, moves button by buttonMoveSpeed units on each tick of event
function moveButton()
    local windowPos = jumpWindow:getPosition()
    local buttonPos = jumpButton:getPosition()

    buttonPos.x = buttonPos.x - buttonMoveSpeed --Button moves to the left (x value decreases right to left)

    -- Reset the button if it moves outside the window
    local buttonWidth = jumpButton:getWidth()
    if buttonPos.x - buffer < windowPos.x then
        jumpButtonReset()
    else
        jumpButton:setPosition(buttonPos)
    end
end

--Reset the button if it is pressed
function jumpButtonPressed()
    jumpButtonReset()
end

--Reset function resets the x position of the button leaving buffer room
--The y position is chosen randomly anywhere within the window on reset, given buffer space
function jumpButtonReset() 
    local windowWidth = jumpWindow:getWidth()
    local windowPos = jumpWindow:getPosition()
    local windowHeight = jumpWindow:getHeight()

    local buttonPos = jumpButton:getPosition()
    local buttonWidth = jumpButton:getWidth()
    local buttonHeight = jumpButton:getHeight()
    
    buttonPos.x = windowPos.x + windowWidth - buttonWidth - buffer
    buttonPos.y = math.random(windowPos.y + buttonHeight + buffer, windowPos.y + windowHeight - buttonHeight - buffer)

    jumpButton:setPosition(buttonPos)
end

