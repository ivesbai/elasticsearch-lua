-------------------------------------------------------------------------------
-- Importing modules
-------------------------------------------------------------------------------
local CatEndpoint = require "elasticsearch.endpoints.Cat.CatEndpoint"

-------------------------------------------------------------------------------
-- Declaring module
-------------------------------------------------------------------------------
local Shards = CatEndpoint:new()

-------------------------------------------------------------------------------
-- Declaring Instance variables
-------------------------------------------------------------------------------

-- The parameters that are allowed to be used in params
Shards.allowedParams = {
  ["local"] = true,
  ["bytes"] = true,
  ["master_timeout"] = true,
  ["h"] = true,
  ["help"] = true,
  ["v"] = true
}

-------------------------------------------------------------------------------
-- Function to calculate the http request method
--
-- @return    string    The HTTP request method
-------------------------------------------------------------------------------
function Shards:getMethod()
  return "GET"
end

-------------------------------------------------------------------------------
-- Function to calculate the URI
--
-- @return    string    The URI
-------------------------------------------------------------------------------
function Shards:getUri()
  local uri = "/_cat/shards"

  if self.index ~= nil then
    uri = uri .. "/" .. self.index
  end
  
  return uri
end

-------------------------------------------------------------------------------
-- Returns an instance of Shards class
-------------------------------------------------------------------------------
function Shards:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

return Shards
