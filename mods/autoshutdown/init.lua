local CHECK_INTERVAL = 60
local check_timer = 0

minetest.register_globalstep(function(dtime)
	check_timer = check_timer + dtime
	if check_timer < CHECK_INTERVAL then
		return
	end
	check_timer = 0

	local shutdown_time = {year=2000, month=1, day=1} -- year, month and day are not important.
	local timestring = minetest.settings:get("autoshutdown.time")
	if not timestring then
		minetest.log("warning", "[autoshutdown] Disabling autoshutdown because shutdown time is not set in minetest.conf.")
		return
	end
	shutdown_time.hour, shutdown_time.min = string.match(timestring, "(%d%d):(%d%d)")
	shutdown_time.hour, shutdown_time.min  = tonumber(shutdown_time.hour), tonumber(shutdown_time.min)
	if not shutdown_time.hour or not shutdown_time.min then
		minetest.log("error", "[autoshutdown] Invalid time format in minetest.conf.")
		return
	end

	if os.date("%H:%M") == os.date("%H:%M", os.time(shutdown_time) - 10 * 60) then
		minetest.chat_send_all("Info: the server will shutdown for power saving purposes in 10 minutes.")
		minetest.chat_send_all("Info: le serveur va s'arrêter dans un but d'économie d'énergie dans 10 minutes.")
	elseif os.date("%H:%M") == os.date("%H:%M", os.time(shutdown_time) - 5 * 60) then
		minetest.chat_send_all("Info: the server will shutdown for power saving purposes in 5 minutes.")
		minetest.chat_send_all("Info: le serveur va s'arrêter dans un but d'économie d'énergie dans 5 minutes.")
	elseif os.date("%H:%M") == os.date("%H:%M", os.time(shutdown_time) - 60) then
		minetest.chat_send_all("Info: the server will shutdown for power saving purposes in a minute.")
		minetest.chat_send_all("Info: le serveur va s'arrêter dans un but d'économie d'énergie dans une minute.")
	elseif os.date("%H:%M") == os.date("%H:%M", os.time(shutdown_time)) then
		minetest.request_shutdown("Le serveur s'arrête ce soir dans un but d'économie d'énergie jusqu'à demain matin à 8:30.\nThe server is shutting down until tomorrow 8:30 AM for power saving purposes. Sorry for the inconvenience.", false)
	end
end)
