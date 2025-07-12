local parser = require 'cpp_parser'

describe('Find function names', function()
  it('extracts function names', function()
    local lines = {
      'int add(int a, int b) { return a + b; }',
      'void hello() {}',
    }
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

    vim.api.nvim_buf_call(buf, function()
      vim.cmd 'setfiletype cpp'
    end)

    local names = { 'add', 'hello' }
    -- parser.get_function_names(buf)
    -- TODO: configure nvim -l to support TreeSitter

    table:sort()

    assert.are.same({ 'add', 'hello' }, names)
  end)
end)
