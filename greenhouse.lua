-- local kr_icons_size = false

-- if krastorio.general.getSafeSettingValue("kr-large-icons") then
--   kr_icons_size = true
-- end

local hit_effects = require("__base__/prototypes/entity/hit-effects")
-- require ("sound-util")

local greenhouse_working_sound = {
  filename = "__Wood_Gasification_updated__/graphics/greenhouse/greenhouse.ogg",
  volume = 1, --0.75
  idle_sound = { filename = "__base__/sound/idle1.ogg" },
  aggregation = {
    max_count = 3,
    remove = false,
    count_already_playing = true,
  },
}

data:extend({
  {
    type = "assembling-machine",
    name = "kr-greenhouse",
    icon_size = 64,
    icon = "__Wood_Gasification_updated__/graphics/greenhouse/greenhouse.png",
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { hardness = 1, mining_time = 1, result = "kr-greenhouse" },
    max_health = 500,
    corpse = "kr-big-random-pipes-remnant",
    dying_explosion = "big-explosion",
    damaged_trigger_effect = hit_effects.entity(),
    {
      { type = "impact", percent = 50 },
    },
    fluid_boxes = {
      {
        production_type = "input",
        -- pipe_picture = kr_pipe_path,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections = {
          { type = "input-output", position = { 0, -4 } },
          { type = "input-output", position = { -4, 0 } },
          { type = "input-output", position = { 4, 0 } },
          { type = "input-output", position = { 0, 4 } },
        },
      },
      off_when_no_fluid_recipe = false,
    },
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    fast_replaceable_group = "kr-greenhouse",
    module_slots = 3,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    graphics_set = {
      animation = {
        layers = {
          {
            filename = "__Wood_Gasification_updated__/graphics/greenhouse/hr-greenhouse.png",
            priority = "high",
            width = 512,
            height = 512,
            frame_count = 1,
            scale = 0.5,
          },
          {
            filename = "__Wood_Gasification_updated__/graphics/greenhouse/hr-greenhouse-sh.png",
            priority = "high",
            width = 512,
            height = 512,
            shift = { 0.32, 0 },
            frame_count = 1,
            draw_as_shadow = true,
            scale = 0.5,
          },
        },
      },
      working_visualisations =
        {
          {
            animation = util.sprite_load("__Wood_Gasification_updated__/graphics/greenhouse/greenhouse maskworking-hr.png",
            {
              priority = "high",
              frame_count = 10,
              animation_speed = 0.25,
              tint_as_overlay = true,
              scale = 0.5
            }),
          },
          {
            effect = "uranium-glow",
            fadeout = true,
            light = {intensity = 0.2, size = 9.9, shift = {0, 0}, color = {0, 1, 0}}
          },
          -- draw_as_light = true,
          {
            effect = "uranium-glow",
            fadeout = true,
            animation = {
              layers = {
              {
                filename = "__Wood_Gasification_updated__/graphics/greenhouse/hr-greenhouse-light.png",
                width = 512,
                height = 512,
                frame_count = 1,
                repeat_count = 10,
                scale = 0.5,
                animation_speed = 0.35,
              },
              {
                filename = "__Wood_Gasification_updated__/graphics/greenhouse/greenhouse/hr-greenhouse-working.png",
                width = 512,
                height = 512,
                frame_count = 10,
                line_length = 5,
                scale = 0.5,
                animation_speed = 0.35
              }
            },
          },
        },
      },
    },
    crafting_categories = { "growing" },
    -- vehicle_impact_sound = sounds.generic_impact,
    working_sound = greenhouse_working_sound,
    crafting_speed = 1,
    return_ingredients_on_change = true,
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      emissions_per_minute = { pollution = -5 },
    },
    energy_usage = "144.8KW",
    ingredient_count = 4,
  },
})
