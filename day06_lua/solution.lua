buffer = io.read("*l")
registry = {}
bufferMarkSize = 4 -- 14 for solution_b

function is_unique(arr)
  local seen = {}
  for i, el in ipairs(arr) do
    if seen[el] then return false end
    seen[el] = true
  end
  return true
end

for i = 1, #buffer do
    local c = buffer:sub(i,i)
    table.insert(registry, c)
    
	if #registry > bufferMarkSize then table.remove(registry, 1) end
	
	if #registry == bufferMarkSize and is_unique(registry) then
		print(i)
		return
	end
end

