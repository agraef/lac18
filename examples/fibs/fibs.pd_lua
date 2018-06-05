local fibs = pd.Class:new():register("fibs")

function fibs:initialize(sel, atoms)
   self.inlets = 1
   self.outlets = 2
   self.a, self.b = 0, 1
   self.m = #atoms > 0 and type(atoms[1]) == "number" and atoms[1] or 10
   pd.post(string.format("fibs: modulus %d", self.m))
   return true
end

function fibs:in_1_bang()
   local a, b = self.a, self.b
   self.a, self.b = b, (a+b) % self.m
   self:outlet(2, "float", {b})
   self:outlet(1, "float", {a})
end

function fibs:in_1_float(f)
   self.m = f
   self.a, self.b = 0, 1
   pd.post(string.format("fibs: modulus %d", self.m))
end

function fibs:in_1_reset()
   self.a, self.b = 0, 1
end
