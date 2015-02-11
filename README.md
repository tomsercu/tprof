# tprof

Simple torch profiler. Forked from jure zbontar's prof-torch.

Intstallation instructions:
```bash
cd tmp
git clone https://github.com/tomsercu/tprof
cd tprof
luarocks build tprof-1.0-1.rockspec
```

Example:
```lua
require 'tprof'
tprof.tic('all')
for epoch=1,10 do
   tprof.tic('epoch')
   for batch=1,5 do
      tprof.tic('batch')
      tprof.tic('forward')
      os.execute('sleep 0.02')
      tprof.toc('forward')
      tprof.tic('backward')
      os.execute('sleep 0.04')
      tprof.toc('backward')
      tprof.toc('batch')
   end
   tprof.toc('epoch')
end
tprof.toc('all')
tprof.dump()
```

Output:
```
      Time     Calls       Avg       Min       Max  Name
    3.4733         1    3.4733    3.4733    3.4733  all 
    3.4733        10    0.3473    0.3462    0.3501  epoch
    3.4730        50    0.0695    0.0690    0.0733  batch
    2.2373        50    0.0447    0.0445    0.0484  backward
    1.2351        50    0.0247    0.0244    0.0259  forward
```
