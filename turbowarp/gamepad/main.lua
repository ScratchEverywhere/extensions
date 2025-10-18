local buttonMap = {
	["any"] = "any",
	["1"] = "A",
	["2"] = "B",
	["3"] = "X",
	["4"] = "Y",
	["5"] = "shoulderL",
	["6"] = "shoulderR",
	["7"] = "LT",
	["8"] = "RT",
	["9"] = "back",
	["10"] = "start",
	["11"] = "LeftStickPressed",
	["12"] = "RightStickPressed",
	["13"] = "dpadUp",
	["14"] = "dpadDown",
	["15"] = "dpadLeft",
	["16"] = "dpadDown",
}

function hasController()
	for _, device in ipairs(input.devices) do
		if device == "controller" then
			return true
		end
	end
	return false
end

-- type: boolean
function blocks.gamepadConnected(args)
	if args["pad"] ~= "any" and tostring(args["pad"]) ~= "1" then
		return false
	end
	return hasController()
end

-- type: boolean
function blocks.buttonDown(args)
	if (args["i"] ~= "any" and tostring(args["i"]) ~= "1") or not hasController() then
		return false
	end
	return input.buttonDown(buttonMap[tostring(args["b"])])
end

-- type: reporter
function blocks.buttonValue(args)
	if
		(args["i"] ~= "any" and tostring(args["i"]) ~= "1")
		or not hasController()
		or not input.buttonDown(buttonMap[tostring(args["b"])])
	then
		return 0
	end
	return 1
end

-- type: reporter
function blocks.axisValue(args)
	if (args["i"] ~= "any" and tostring(args["i"]) ~= "1") or not hasController() then
		return 0
	end
	if tostring(args["b"]) == "1" then
		return input.getAxis("left", "x")
	end
	if tostring(args["b"]) == "2" then
		return input.getAxis("left", "y")
	end
	if tostring(args["b"]) == "3" then
		return input.getAxis("right", "x")
	end
	return input.getAxis("right", "y")
end

-- type: reporter
function blocks.axisDirection(args)
	if (args["pad"] ~= "any" and tostring(args["pad"]) ~= "1") or not hasController() then
		return 0
	end
	local joy = "right"
	if tostring(args["axis"]) == "1" then
		joy = "left"
	end
	local dir = math.deg(math.atan2(input.getAxis(joy, "x"), -input.getAxis(joy, "y")))
	if dir < 0 then
		dir = dir + 360
	end
	return dir
end

-- type: reporter
function blocks.axisMagnitude()
	if (args["pad"] ~= "any" and tostring(args["pad"]) ~= "1") or not hasController() then
		return 0
	end
	local joy = "right"
	if tostring(args["axis"]) == "1" then
		joy = "left"
	end
	return math.sqrt(input.getAxis(joy, "x") ^ 2 + input.getAxis(joy, "y") ^ 2)
end

-- type: command
function blocks.rumble() end -- SE! doesn't support rumble

-- type: command
function blocks.setAxisDeadzone() end -- SE! doesn't support changing the deadzones
