M = {}

function M.get_tree_root(bufnr, lang)
  local parser = vim.treesitter.get_parser(bufnr, lang)
  local tree = parser:parse()[1]
  return tree:root()
end

function M.get_function_names(bufnr)
  local root = M.get_tree_root(bufnr, 'cpp')
  local query = vim.treesitter.query.parse(
    'cpp',
    [[
  (function_definition
    declarator: (function_declarator
      declarator: (identifier) @func_name)) ]]
  )

  local names = {}

  for _, match in query:iter_matches(root, bufnr, 0, -1) do
    local node = match[1]
    table.insert(names, vim.treesitter.get_node_text(node, bufnr))
  end
  return names
end

return M
