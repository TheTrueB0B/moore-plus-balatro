
-- Mod Icon
SMODS.Atlas({
	key = "modicon",
	path = "modicon.png",
	px = 32,
	py = 32
})

SMODS.Atlas{
    key = 'westonjonkler',
    path = "westonjonkler.png",
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
            return { mult = card.ability.extra.mult }
        end
    end
}

