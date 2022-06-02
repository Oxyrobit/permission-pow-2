-- LUA 5.4 REQUIRE

perm = {}

local function IsInTable(var, tab)
	for i = 1, #tab do
		if tab[i] == var then
			return true
		end
	end
	return false
end

function perm:new(permNumber, maxPerm) -- Initialisation
    
    local tb = { permission = permNumber, maxPermission = maxPerm or 0}

    setmetatable ( tb, { __index = perm } )
    
    return tb

end
 -- Renvoie le total des permissions
 -- return int
function perm:getPermission()
    return self.permission
end

-- Renvoie toutes les permissions sous forme de table {1, 2, 4, 8, 16, 32 ..}
-- return table
function perm:getPermissions() 
    local pow = 0
    local permissions = {}
    local x = self.permission
    while (2^(pow + 1) <= x) do
        pow += 1
    end

    while not (x <= 0) do
        if (2^pow) <= x then
            x = x - 2^pow
            permissions[#permissions+1] = math.floor(2^pow)
        end
        pow -= 1
    end

    return permissions
end

function perm:setPermission(number) -- Définis la permission
    self.permission = number
end

function perm:setMaxPermission(number) -- Définis le niveau maximal de permission
    self.maxPermission = number
end

-- Ajoute la permission aux permissions existante (si elle n'est pas déjà présente)
-- return int , new permission
function perm:addPermission(number) 
    local permissions = self:getPermissions()
    
    for i = 1, #permissions do
        if number == permissions[i] then
            return self.permission
        end
    end
    
    self.permission += number
    return self.permission
end

function perm:getMissingPermission() -- renvoie les autorisations manquante (besoin de setMaxPermission )
    if self.maxPermission == 0 then
        return 0
    else
        local permissions = self:getPermissions() -- Permission actuelle
        local max = self.maxPermission -- dernière permisison
        local missiongPermission = {} -- Permission manquantes

        local exp = 1 / (math.log(2)/ math.log(max)) --Obtient l'exposant à la puissance 2 du nombre max
        

        for i = 0, exp do
            local n = IsInTable(2^i, permissions)

            if not (n) then -- Si n'est pas présent dans la table
                
                missiongPermission[#missiongPermission + 1] =  math.floor(2^i)
                
            end
        end

        return missiongPermission
    end


end
-- Retire la permission aux permission existante (si elle est présente)
-- return int , new permission
function perm:deletePermission(number) 
    local permissions = self:getPermissions()
    for i = 1, #permissions do
        if number == permissions[i] then
            self.permission -= number
            return self.permission
        end
    end
    return self.permission
end

-- Est-ce que la permission existe ?
-- return bool
function perm:doesPermissionExist(number) 
    local permissions = self:getPermissions()
    for i = 1, #permissions do
        if number == permissions[i] then
            return true
        end
    end
    return false
end