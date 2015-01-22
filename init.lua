require 'libtprof'

tprof.data = {}
tprof.start_time = {}

function tprof.tic(name)
   name = name or '_nil'
   assert(tprof.start_time[name] == nil)
   tprof.start_time[name] = tprof.time()
end

function tprof.toc(name)
   name = name or '_nil'
   local time = tprof.time() - tprof.start_time[name]
   tprof.start_time[name] = nil
   
   if tprof.data[name] == nil then
      tprof.data[name] = {}
   end
   table.insert(tprof.data[name], time)
   return time
end

function sum(xs) 
   local acc = 0
   for k, v in ipairs(xs) do
      acc = acc + v
   end
   return acc
end

function range(xs)
   local min = xs[1]
   local max = xs[1]
   for k, v in ipairs(xs) do
      if v < min then
         min = v
      end

      if v > max then
         max = v
      end
   end
   return min, max
end

function tprof.dump()
   local a = {}
   for k, v in pairs(tprof.data) do
      v.name = k
      table.insert(a, v)
   end
   
   table.sort(a, function (a, b) return sum(a) > sum(b) end)

   print('      Time     Calls       Avg       Min       Max  Name')
   for _, v in ipairs(a) do
      local time = sum(v)
      local min, max = range(v)
      print((' %9.4f %9d %9.4f %9.4f %9.4f  %s'):format(time, #v, time / #v, min, max, v.name))
   end
end
