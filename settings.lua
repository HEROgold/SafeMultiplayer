data:extend(
    {
        {
            type = "int-setting",
            name = "min-players",
            setting_type = "runtime-global",
            default_value = 1,
            minimum_value = -1
        },
        {
            type = "int-setting",
            name = "grace-time",
            setting_type = "runtime-global",
            default_value = 3600,
            maximum_value = 216000,
            minimum_value = 1
        }
    }
)