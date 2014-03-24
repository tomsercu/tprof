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
      prof.data[name] = {num_calls=0, time=0}
   end
   prof.data[name].time = prof.data[name].time + time
   prof.data[name].num_calls = prof.data[name].num_calls + 1

   return time
end

function prof.dump()
   local a = {}
   for k, v in pairs(prof.data) do
      v.name = k
      table.insert(a, v)
   end
   
   table.sort(a, function (a, b) return a.time > b.time end)

   print('PROF')
   for _, v in ipairs(a) do
      print(('%20s %7.1fs %d'):format(v.name, v.time, v.num_calls))
   end
end
