Vapour.utils = {
  file = {
    exists = function(f)
    local fp = io.open(f, "r")
    if fp ~= nil then io.close(fp) return true else return false end
  end
  }
}
