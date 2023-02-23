print("loaded rgpt")
function os.capture(cmd, raw)
  local f = assert(io.popen(cmd, 'r'))
  local s = assert(f:read('*a'))
  f:close()
  if raw then return s end
  s = string.gsub(s, '^%s+', '')
  s = string.gsub(s, '%s+$', '')
  s = string.gsub(s, '[\n\r]+', ' ')
  return s
end
function Read_file()
    local current_path = vim.api.nvim_buf_get_name(0)
    local handle = io.popen(string.format("rgpt --input \"$(git diff %s)\"", current_path))
    if handle == nil then
       print("The output is not right")
       os.exit(1)
    end
    local result = handle:read("*a")
    handle:close()
    print(result)
end


