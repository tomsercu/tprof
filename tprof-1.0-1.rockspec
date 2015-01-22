package = "tprof"
version = "1.0-1"
source = {
  url = "git://github.com/tomsercu/tprof",
  tag = "master"
}

description = {
  summary = "Simple torch profiler.",
  detailed = [[ 
    Simple torch profiler
  ]],
  homepage = "",
  license = "BSD"
}
dependencies = {
}
build = {
  type = "command",
  build_command = [[
cmake -E make_directory build;
cd build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)";
$(MAKE)
]],
  install_command = "cd build && $(MAKE) install"
}
