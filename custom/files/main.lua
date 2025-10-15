-- type: reporter
function blocks.read(args)
	return files.read(tostring(args["PATH"]))
end

-- type: command
function blocks.write(args)
	return files.write(tostring(args["PATH"]), tostring(args["CONTENT"]))
end

-- type: command
function blocks.append(args)
	return files.append(tostring(args["PATH"]), tostring(args["CONTENT"]))
end

-- type: command
function blocks.mkdir(args)
	files.mkdir(tostring(args["PATH"]))
end

-- type: command
function blocks.ls(args)
	-- Requires runtime API which isn't implemented yet
end
