local pprint = require('pprint')
local Schema = require('schema')

local Player = Schema({
    ["name"] = "string",
    ["x"] = "number",
    ["y"] = "number",

    ["on_change"] = function(changes)
    end,
    ["on_remove"] = function()
    end,

    -- field order
    ["_order"] = {"name", "x", "y"}
})

local State = Schema({
    ["fieldString"] = "string",
    ["fieldNumber"] = "number",
    ["player"] = Player,
    ["arrayOfPlayers"] = { Player },
    ["mapOfPlayers"] = { map = Player },

    -- field order
    ["_order"] = {"fieldString", "fieldNumber", "player", "arrayOfPlayers", "mapOfPlayers"}
})

-- -- number
-- local encoded_state = {1, 50}

-- -- string
-- local encoded_state = {0, 171, 72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100}

-- -- empty Player
-- local encoded_state = {2, 193}

-- -- Player with properties
local encoded_state = {2, 0, 164, 74, 97, 107, 101, 1, 100, 2, 204, 200, 193}

local state = State:new()
state:decode(encoded_state)

pprint(state)