--Question 5 script: Called by typing "frigo"
--Creates ice tornados in a repeating sequence of areas around the caster
--Spell definition in spells.xml
--Area definition in spells.lua

--Set the damage and effect types of the cell for all 4 effect areas
local combat = {}
for i = 1, 4 do
	combat[i] = Combat()
	combat[i]:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
	combat[i]:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
end

--Initialize the effect areas, setup in spells.lua
combat[1]:setArea(createCombatArea(AREA_DIAMOND_STAGE1))
combat[2]:setArea(createCombatArea(AREA_DIAMOND_STAGE2))
combat[3]:setArea(createCombatArea(AREA_DIAMOND_STAGE3))
combat[4]:setArea(createCombatArea(AREA_DIAMOND_STAGE4))

--Set the damage level of the spell for all 4 effect areas
for i = 1, 4 do
	function onGetFormulaValues(player, level, magicLevel)
		local min = (level / 5) + (magicLevel * 5.5) + 25
		local max = (level / 5) + (magicLevel * 11) + 50
		return -min, -max
	end
	combat[i]:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
end

--Executes the spell on an individual effect area
local function freezeStage(parameters, combatStage)
	return combatStage:execute(parameters.creature, parameters.variant)
end

--One cycle of execution, executing the spell in all 4 areas
--Each new area triggered after 1/4 second for total of approx 1s cycle
local function freezeCycle(creature, variant)
	local parameters = { creature = creature, variant = variant}
	addEvent(freezeStage, 0, parameters, combat[1])
	addEvent(freezeStage, 250, parameters, combat[2])
	addEvent(freezeStage, 500, parameters, combat[3])
	addEvent(freezeStage, 750, parameters, combat[4])
	return TRUE
end

--Triggered when "frigo" is caster
--Spell is made up of 3 cycles through the 4 effect areas
--Total time approx 3 seconds
function onCastSpell(creature, variant)
	addEvent(freezeCycle, 0, creature:getId(), variant)
	addEvent(freezeCycle, 1000, creature:getId(), variant)
	addEvent(freezeCycle, 2000, creature:getId(), variant)
	return TRUE
end
