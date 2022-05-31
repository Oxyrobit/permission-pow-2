# permission-pow-2
LUA pow 2 system permission


# How to use
```lua
local perm = funcs:new(nil, 127)

perm:getpermission() -- 127
perm:getPermissions() -- {1, 2, 4, 8, 16, 32 ..}
perm:setPermission(int)
perm:addPermission(int) -- return new permission
perm:deletePermission(int) -- return new permission
perm:doesPermissionExist(int) -- BOOL
```

Discord : ITS TRAINING MEN#1111
