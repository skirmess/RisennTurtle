
-- Copyright (c) 2025 Sven Kirmess

local initFrame = CreateFrame("Frame", "RisennTurtleInitFrame", UIParent)

initFrame:RegisterEvent("PLAYER_ENTERING_WORLD")

local function Risenn_CancelShadowForm()
	local i=0
	while not (GetPlayerBuff(i) == -1)
	do
		if(strfind(GetPlayerBuffTexture(GetPlayerBuff(i)), "Spell_Shadow_Shadowform"))
		then
			CancelPlayerBuff(GetPlayerBuff(i))
		end
		i = i + 1
	end
end

local function Risenn_TravelWithHerbs()
	if not GetTrackingTexture()
	then
		CastSpellByName("Find Herbs")
	end

	local _,_,a = GetShapeshiftFormInfo(4)
	if a then
		CastShapeshiftForm(4)
	else
		local _, _, a = GetShapeshiftFormInfo(2)
		if a then
			CastShapeshiftForm(2)
		else
			UIErrorsFrame:UnregisterEvent"UI_ERROR_MESSAGE"
			CastShapeshiftForm(2)
			CastShapeshiftForm(4)
			UIErrorsFrame:RegisterEvent"UI_ERROR_MESSAGE"
		end
	end
end

initFrame:SetScript("OnEvent", function()

	if ( event == "PLAYER_ENTERING_WORLD" ) then
		this:UnregisterEvent("PLAYER_ENTERING_WORLD")

		SLASH_RISENN1 = "/cancelshadowform"
		SlashCmdList["RISENN"] = function() Risenn_CancelShadowForm(msg) end

		SLASH_TRAVELHERB1 = "/travelherb"
		SlashCmdList["TRAVELHERB"] = function() Risenn_TravelWithHerbs(msg) end
	end

end)
