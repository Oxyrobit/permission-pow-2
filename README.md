# permission-pow-2
LUA pow 2 system permission


# How to use
```lua
local perm = funcs:new(nil, 127)

perm:getpermission() -- 127
perm:getPermissions() -- tb {1, 2, 4, 8, 16, 32 ..}
perm:setPermission(int)
perm:addPermission(int) -- return new permission
perm:deletePermission(int) -- return new permission
perm:doesPermissionExist(int) -- BOOL
perm:setMaxPermission(int) -- Set last permission (eg: 32)
perm:getMissingPermission() -- return tb of missing permission or return 0
```

Discord : ITS TRAINING MEN#1111
