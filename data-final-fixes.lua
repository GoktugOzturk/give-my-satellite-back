-- Re-add the satellite item that Space Age removes
data:extend({
  {
    type = "item",
    name = "satellite",
    icon = "__base__/graphics/icons/satellite.png",
    subgroup = "space-related",
    order = "d[rocket-parts]-e[satellite]",
    stack_size = 1,
    weight = 1000 * 1000, -- 1 ton in grams
    rocket_launch_products = {{type = "item", name = "space-science-pack", amount = 1000}},
    send_to_orbit_mode = "automated"
  }
})

-- Re-add the satellite recipe
data:extend({
  {
    type = "recipe",
    name = "satellite",
    energy_required = 5,
    enabled = false,
    category = "crafting",
    ingredients =
    {
      {type = "item", name = "low-density-structure", amount = 100},
      {type = "item", name = "solar-panel", amount = 100},
      {type = "item", name = "accumulator", amount = 100},
      {type = "item", name = "radar", amount = 5},
      {type = "item", name = "processing-unit", amount = 100},
      {type = "item", name = "rocket-fuel", amount = 50}
    },
    results = {{type = "item", name = "satellite", amount = 1}},
    requester_paste_multiplier = 1
  }
})

-- Re-add the satellite recipe unlock to rocket-silo technology
local rocket_silo_tech = data.raw.technology["rocket-silo"]
if rocket_silo_tech then
  table.insert(rocket_silo_tech.effects, {
    type = "unlock-recipe",
    recipe = "satellite"
  })
end
