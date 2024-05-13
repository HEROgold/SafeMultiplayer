local min_players

local function update_forces_ceasefire()
    local all_forces = game.forces
    local enemy_table = {}

    for _, force in pairs(all_forces) do
        if #force.players <= 0 then
            goto continue
        end

        enemy_table[force.index] = {}
        if #force.connected_players < min_players then
            for _, force2 in pairs(all_forces) do
                force.is_enemy(force2)
                force.set_cease_fire(force2, false)
                enemy_table[force.index][force2.index] = true
            end
        else
            for _, force in pairs(all_forces) do
                for _, force2 in pairs(all_forces) do
                    if enemy_table[force.index][force2.index] then
                        force.set_cease_fire(force2, false)
                        enemy_table[force.index][force2.index] = false
                    end
                end
            end
        end
    end
    ::continue::
end

script.on_event(defines.events.on_player_joined_game,
    function(event)
        update_forces_ceasefire()
    end
)
script.on_event(defines.events.on_player_left_game,
    function(event)
        update_forces_ceasefire()
    end
)
