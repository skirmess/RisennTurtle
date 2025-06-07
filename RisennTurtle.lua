
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

initFrame:SetScript("OnEvent", function()

	if ( event == "PLAYER_ENTERING_WORLD" ) then
		this:UnregisterEvent("PLAYER_ENTERING_WORLD")

		SLASH_RISENN1 = "/cancelshadowform"
		SlashCmdList["RISENN"] = function() Risenn_CancelShadowForm(msg) end
	end

end)
