-- type: boolean
function blocks.isExactly(args)
	return tostring(args["A"]) == tostring(args["B"])
end

-- type: boolean
function blocks.isLessOrEqual(args)
	return tonumber(args["A"]) <= tonumber(args["B"])
end

-- type: boolean
function blocks.isMoreOrEqual(args)
	return tonumber(args["A"]) >= tonumber(args["B"])
end

-- type: boolean
function blocks.trueBlock()
	return true
end

-- type: boolean
function blocks.falseBlock()
	return false
end

-- type: reporter
function blocks.exponent(args)
	return tonumber(args["A"]) ^ tonumber(args["B"])
end

-- type: reporter
function blocks.pi()
	return math.pi
end

-- type: reporter
function blocks.ternaryOperator(args)
	if args["A"] then
		return args["B"]
	end
	return args["C"]
end

-- type: reporter
function blocks.letters(args)
	return string.sub(tostring(args["STRING"]), assert(tonumber(args["START"])), tonumber(args["END"]))
end

-- type: reporter
function blocks.clamp(args)
	return math.min(math.max(assert(tonumber(args["INPUT"])), tonumber(args["MIN"])), args["MAX"])
end

-- type: reporter
function blocks.currentMillisecond()
	return 0 -- High Precision Time API has not been added yet
end

-- type: reporter
function blocks.fetchFrom()
	return "" -- Network API has not been implemented yet
end

-- type: reporter
function blocks.parseJSON()
	return "" -- JSON API has not been implemented yet
end

-- type: reporter
function blocks.newline()
	return "\n"
end

-- type: boolean
function blocks.stringToBoolean(args)
	if string.lower(tostring(args["STRING"])) == "false" or tonumber(args["STRING"]) == 0 then
		return false
	end
	return true
end

-- type: reporter
function blocks.regexReplace(args)
	return tostring(args["STRING"]):gsub(tostring(args["REGEX"]), tostring(args["NEWSTRING"]))
end
