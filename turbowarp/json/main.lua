-- type: boolean
function blocks.json_is_valid(args)
	return json.decode(tostring(args["json"])) == nil
end

-- type: boolean
function blocks.json_is(args)
	if args["types"] == "Array" then
		return #json.decode(tostring(args["json"])) > 0
	end
	return #json.decode(tostring(args["json"])) <= 0 -- IDK if the `<` is necessary here
end

-- type: reporter
function blocks.json_get_all(args)
	local out = {}
	for k, v in pairs(json.decode(tostring(args["json"]))) do
		if args["Stype"] == "keys" then
			table.insert(out, k)
		elseif args["Stype"] == "values" then
			table.insert(out, v)
		else
			table.insert(out, { k, v })
		end
	end
	return json.encode(out)
end

-- type: reporter
function blocks.json_new(args)
	if args["json"] == "Object" then
		return "{}"
	end
	return "[]"
end

-- type: boolean
function blocks.json_has_key(args)
	return json.decode(tostring(args["json"]))[tostring(args["key"])] ~= nil
end

-- type: boolean
function blocks.json_has_value(args)
	local data = json.decode(tostring(args["json"]))
	for i = 1, #data do
		if data[i] == args["value"] then
			return true
		end
	end
	return false
end

-- type: boolean
function blocks.json_equal(args)
	local equal = json.decode(tostring(args["json1"])) == json.decode(tostring(args["json2"]))
	if args["equal"] == "=" then
		return equal
	end
	return not equal
end

-- type: reporter
function blocks.json_length(args)
	local i = 0
	for _, _ in json.decode(tostring(args["json"])) do
		i = i + 1
	end
	return i
end

-- type: reporter
function blocks.json_get(args)
	return json.decode(tostring(args["json"]))[tostring(args["key"])]
end

-- type: reporter
function blocks.json_set(args)
	local data = json.decode(tostring(args[json]))
	data[tostring(args["item"])] = args["value"]
	return json.encode(data)
end

-- type: reporter
function blocks.json_delete(args)
	local data = json.decode(tostring(args[json]))
	table.remove(data, tostring(args["item"]))
	return json.encode(data)
end

-- type: reporter
function blocks.json_length(args)
	return #json.decode(tostring(args["json"]))
end

-- type: reporter
function blocks.json_array_get(args)
	return json.decode(tostring(args["json"]))[tonumber(args["item"])]
end

-- type: reporter
function blocks.json_array_push(args)
	local data = json.decode(tostring(args[json]))
	table.insert(data, tostring(args["item"]))
	return json.encode(data)
end

-- type: reporter
function blocks.json_array_set(args)
	local data = json.decode(tostring(args[json]))
	data[tonumber(args["pos"])] = tostring(args["item"])
	return json.encode(data)
end

-- type: reporter
function blocks.json_array_push(args)
	local data = json.decode(tostring(args[json]))
	table.insert(data, assert(tonumber(args["pos"])), tostring(args["item"]))
	return json.encode(data)
end

-- type: reporter
function blocks.json_array_delete(args)
	local data = json.decode(tostring(args[json]))
	table.remove(data, tonumber(args["item"]))
	return json.encode(data)
end

-- type: reporter
function blocks.json_array_remove_all(args)
	local data = json.decode(tostring(args[json]))
	local i = 1
	local size = #data
	while i <= size do
		if data[i] == args["item"] then
			data[i] = data[size]
			data[size] = nil
			size = size - 1
		else
			i = i + 1
		end
	end
	return data
end

-- type: reporter
function blocks.json_array_itemH(args)
	local i = 0
	for k, v in json.decode(tostring(args["json"])) do
		if v == args["item"] then
			i = k
			break
		end
	end
	return i
end

-- TODO: Add "Advanced" and "Lists" sections
