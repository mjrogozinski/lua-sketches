local my_module = require 'my_module'
local eq = assert.equals

describe('my_module', function()
  it('adds numbers correctly', function()
    local result = my_module.add(2, 3)
    eq(result, 5)
  end)

  it('handles zero', function()
    local result = my_module.add(0, 0)
    eq(result, 0)
  end)

  it('just works', function()
    eq(my_module.add(1, 1), 2)
  end)

  it('subtracts', function()
    eq(my_module.sub(1, 1), 0)
  end)
end)
