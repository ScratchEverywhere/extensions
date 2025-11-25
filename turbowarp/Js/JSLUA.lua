--JSLUA
--A SE! extension that adds javascript support
function blocks.print.hello-world
	print("hello world")
end

function blocks.ifjs
	if  then
        -- body
    end
end

function blocks.alert_crash
	print("something went wrong")
end
--THE alert_crash function does not display a specific error code due to the fact that it would use a LOT of commands
function blocks.SE_crash
	return "either SE! crashed or something else happened"
end
--the for block just prints a number,like a countdown or something
function blocks.for
   for x=1,x=2,x=3  do
    print(x)
   end

   
function blocks.return
	return
end
--the return block just returns. just fyi and this project is very early in concept.
function blocks.print
	print("")
end
--this is all in this demo. this is a very early in concept proof and no ETA 
--is out at the moment. a actual compiled file wont be out until most or all javascript functions are ported over.