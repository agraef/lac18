
-- some FP goodies

function map(list, fn)
   local res = {}
   for k, v in ipairs(list) do
      table.insert(res, fn(v))
   end
   return res
end

function reduce(list, acc, fn)
   for k, v in ipairs(list) do
      acc = fn(acc, v)
   end
   return acc
end

function collect(list, acc, fn)
   local res = {acc}
   for k, v in ipairs(list) do
      acc = fn(acc, v)
      table.insert(res, acc)
   end
   return res
end

function sum(list)
   return reduce(list, 0, function(a,b) return a+b end)
end

function prd(list)
   return reduce(list, 1, function(a,b) return a*b end)
end

function sums(list)
   return collect(list, 0, function(a,b) return a+b end)
end

function prds(list)
   return collect(list, 1, function(a,b) return a*b end)
end

-- reverse a table

function reverse(list)
   local res = {}
   for k, v in ipairs(list) do
      table.insert(res, 1, v)
   end
   return res
end

-- arithmetic sequences

function seq(from, to, step, fn)
   -- both step and fn are optional; if fn is supplied, it should denote a
   -- function to be applied to all values in the sequence (poor man's list
   -- comprehension)
   if type(step) == "function" then
      fn = step; step = 1
   else
      step = step or 1;
   end
   fn = fn or function(x) return x end -- identity
   local sgn = step>=0 and 1 or -1
   local res = {}
   while sgn*(to-from) >= 0 do
      table.insert(res, fn(from))
      from = from + step
   end
   return res
end
