local gfs = require("gears.filesystem")

local lock_screen = {}

local config_dir = gfs.get_configuration_dir()
package.cpath = package.cpath .. ";" .. config_dir .. "mods/?.so;"

lock_screen.init = function()
	local pam = require("liblua_pam")
	lock_screen.authenticate = function(password)
		return pam.auth_current_user(password)
	end
	-- require("layout.lockscreen.lock") -- ERROR LULALIB_PAM
end

return lock_screen

