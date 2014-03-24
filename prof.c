#include <stdlib.h>
#include <sys/time.h>

#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"

static int time(lua_State *L)
{
	struct timeval tv;
	gettimeofday(&tv, NULL);
	lua_pushnumber(L, tv.tv_sec + (double)tv.tv_usec / 1000000);
	return 1;
}

static const struct luaL_Reg funcs[] = {
	{"time", time},
	{NULL, NULL}
};

int luaopen_libprof(lua_State *L) {
	luaL_openlib(L, "prof", funcs, 0);
	return 1;
}
