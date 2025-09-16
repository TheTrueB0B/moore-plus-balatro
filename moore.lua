
-- Mod Icon
SMODS.Atlas({
	key = "modicon",
	path = "modicon.png",
	px = 32,
	py = 32
})



SMODS.current_mod.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 6}, nodes = {
        {n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
            {n = G.UIT.C, config = { align = "c", padding = 0 }, nodes = {
                { n = G.UIT.T, config = { text = "Weston Mode", scale = 0.35, colour = G.C.UI.TEXT_LIGHT }},
            }},
            {n = G.UIT.C, config = { align = "cl", padding = 0.05 }, nodes = {
                create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, ref_table = G.SETTINGS, ref_value = 'weston_mode' },
                print("weston_mode")
            }},
        }},
    }}
end

-- Weston Moore
if weston_mode then -- adds weston_mode functionality
  weston_sprite = "westonmode.png"
else
  weston_sprite = "westonjonkler.png"
end

SMODS.Atlas{
    key = 'westonjonkler',
    path = weston_sprite,
    px = 71,
    py = 95
}

SMODS.Joker {
    key = "weston_moore",
    pos = { x = 0, y = 0 },
    rarity = 2,
    blueprint_compat = true,
    cost = 7,
    discovered = true,
    atlas = 'westonjonkler',
    config = { extra = { mult = 7 }, },
    loc_txt = {
        name = "Weston Moore",
        text = {
            "Each played {C:attention}7{} gives",
            "{C:red,s:1.1}+#1#{} Mult",
        },
    },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 7 then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

