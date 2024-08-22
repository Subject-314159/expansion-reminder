local facts = require("lib.facts")
local DEFAULT_TICKS_PER_DAY = 25000
local MIN_TICKS_PER_DAY = 600

local get_random_fact = function()

    -- Get FFF blog info
    local k = math.random(1, #facts)
    -- Init return array
    local data = {
        fff = facts[k].fff,
        date = facts[k].date,
        title = facts[k].title
    }

    -- Add random in-depth content (if available)
    if facts[k].content then
        -- Make content type array
        local cat = {}
        for type, c in pairs(facts[k].content) do
            table.insert(cat, type)
        end

        -- Get random content type
        local rnd = math.random(1, #cat)
        local rcat = cat[rnd]
        local content = facts[k].content[rcat]

        -- Get random description
        local description = content[math.random(1, #content)]
        data.detail = {
            name = description.name or nil,
            summary = description.summary or nil,
            description = description.description or nil
        }
    end

    return data
end
-- Return data structure
-- local data = {
--     date = "Mmm DD YYYY",
--     fff = "FFF #123",
--     title = "Blog post title",
--     detail = { -- Optional, data.detail not always present
--         name = "Name",
--         summary = "Short description",
--         description = "What it is" -- Optional, data.detail.description not always present
--     }
-- }

local remind = function()
    global.days_without_expansion = (global.days_without_expansion or 0) + 1
    if settings.global["er_remind-days"].value then
        local i = global.remind_idx or 1
        game.print({"expansion-reminder.days-without-expansion-" .. i, global.days_without_expansion})
        if i >= 3 then
            i = 1
        else
            i = i + 1
        end
        global.remind_idx = i
    end

    if settings.global["er_remind-facts"].value then
        local fact = get_random_fact()

        local j = math.random(1, 3)
        game.print({"expansion-reminder.fact-" .. j, fact.fff, fact.date, fact.title})
        if fact.detail then
            game.print(fact.detail.summary)
        end
    end
end

local manual_tick_update = function()
    -- Increase day tick counter
    global.ticks_since_last_day = (global.ticks_since_last_day or 0) + 1

    -- Correct for ticks per day
    if not global.ticks_per_day then
        global.ticks_per_day = DEFAULT_TICKS_PER_DAY
    elseif global.ticks_per_day < MIN_TICKS_PER_DAY then
        global.ticks_per_day = DEFAULT_TICKS_PER_DAY
    end

    -- Check if day has passed
    if global.ticks_since_last_day >= global.ticks_per_day then
        -- Reset day tick counter and remind player
        global.ticks_since_last_day = 0
        remind()
    end
end

script.on_event(defines.events.on_tick, function(e)
    -- Get Nauvis or first available surface
    local surface = game.get_surface(1)
    if not surface then
        for _, s in pairs(game.surfaces) do
            surface = s
            return
        end
    end

    -- Determine midnight
    if surface then
        if surface.always_day or surface.freeze_daytime or surface.ticks_per_day < MIN_TICKS_PER_DAY then
            -- Manual counting for surfaces that have always day or where there is no daytime (or days last less than 10sec to prevent annoyance)
            manual_tick_update()
        else
            -- Correct surface daytime for midnight
            local time = surface.daytime - 0.5
            if time < 0 then
                time = time + 1
            end

            -- Remember last tick's daytime and current daytime
            global.previous_daytime = global.daytime or 0
            global.daytime = time

            -- Check for new night
            if global.previous_daytime > global.daytime then
                -- Remind the player
                remind()

                -- Update the global.surface ticks per day, since it could be that other mods have updated it in the meantime
                global.ticks_per_day = surface.ticks_per_day
            end
        end
    else
        manual_tick_update()
    end
end)

local register_remote_interfaces = function()
    -- Remove our old interface if exists
    if remote.interfaces["friday-facts"] then
        remote.remove_interface("friday-facts")
    end

    -- Add our interface again
    local functions = {
        ["get-random-fact"] = get_random_fact
    }
    remote.add_interface("friday-facts", functions)
end

script.on_init(function(e)
    register_remote_interfaces()
end)

script.on_load(function(e)
    register_remote_interfaces()
end)
