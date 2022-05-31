-- LUA 5.4 REQUIRE

local funcs = {}

function funcs:new(tb, number) -- Initialisation
    tb = tb or {}
    setmetatable(tb, self)
    self.__index = self
    self.permission = number or 0

    return tb
end
 -- Renvoie le total des permissions
 -- return int
function funcs:getPermission()
    return self.permission
end

-- Renvoie toutes les permissions sous forme de table {1, 2, 4, 8, 16, 32 ..}
-- return table
function funcs:getPermissions() 
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

function funcs:setPermission(number) -- Définis la permission
    self.permission = number
end

-- Ajoute la permission aux permissions existante (si elle n'est pas déjà présente)
-- return int , new permission
function funcs:addPermission(number) 
    local permissions = self:getPermissions()
    for i = 1, #permissions do
        if number == permissions[i] then
            return self.permission
        end
    end
    
    self.permission += number
    return self.permission
end

-- Retire la permission aux permission existante (si elle est présente)
-- return int , new permission
function funcs:deletePermission(number) 
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
function funcs:doesPermissionExist(number) 
    local permissions = self:getPermissions()
    for i = 1, #permissions do
        if number == permissions[i] then
            return true
        end
    end
    return false
end