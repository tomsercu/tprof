require 'libprof'

prof.data = {}
prof.start_time = {}

function prof.tic(name)
   name = name or '_nil'
   assert(prof.start_time[name] == nil)
   prof.start_time[name] = prof.time()
end

function prof.toc(name)
   name = name or '_nil'
   local time = prof.time() - prof.start_time[name]
   prof.start_time[name] = nil
   
   if prof.data[name] == nil then
      prof.data[name] = {}
   end
   table.insert(prof.data[name], time)
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

function prof.dump()
   local a = {}
   for k, v in pairs(prof.data) do
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
