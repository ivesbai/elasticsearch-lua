-- Importing modules
local PostUpgrade = require "elasticsearch.endpoints.Indices.PostUpgrade"
local MockTransport = require "lib.MockTransport"
local getmetatable = getmetatable

-- Setting up environment
local _ENV = lunit.TEST_CASE "tests.endpoints.IndicesTest.PostUpgradeTest"

-- Declaring local variables
local endpoint
local mockTransport = MockTransport:new()

-- Testing the constructor
function constructorTest()
  assert_function(PostUpgrade.new)
  local o = PostUpgrade:new()
  assert_not_nil(o)
  local mt = getmetatable(o)
  assert_table(mt)
  assert_equal(mt, mt.__index)
end

-- The setup function
function setup()
  endpoint = PostUpgrade:new{
    transport = mockTransport
  }
end

-- Testing request
function requestTest()
  mockTransport.method = "POST"
  mockTransport.uri = "/_upgrade"
  mockTransport.params = {}
  mockTransport.body = nil

  endpoint:setParams{}

  local _, err = endpoint:request()
  assert_nil(err)
end

-- Testing name request
function requestNameTest()
  mockTransport.method = "POST"
  mockTransport.uri = "/twitter/_upgrade"
  mockTransport.params = {}
  mockTransport.body = nil

  endpoint:setParams{
    index = "twitter"
  }

  local _, err = endpoint:request()
  assert_nil(err)
end
