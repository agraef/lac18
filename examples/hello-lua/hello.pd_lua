local hello = pd.Class:new():register("hello")

function hello:initialize(sel, atoms)
   self.inlets = 1
   self.outlets = 1
   self.n = 0
   return true
end

function hello:in_1_bang()
   self.n = self.n+1
   self:outlet(1, "float", {self.n})
end

function hello:in_1_float(n)
   self.n = n
end

function hello:in_1(sel, atoms)
   self:outlet(1, "hello, " .. sel, {})
end
