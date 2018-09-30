-- © Limetric Studios ( www.limetricstudios.com ) -- All rights reserved.
-- See LICENSE.txt for license information

include("shared.lua")

function ENT:Initialize()
	if not IsValid(MySelf) or MySelf:Team() ~= TEAM_HUMAN or not MySelf:Alive() then
		return
	end
end

ENT.LineColor = Color(210, 0, 0, 50)
function ENT:Draw()
	local suppliesAvailable = true

	self.LineColor = Color(0, math.abs(100 * math.sin(CurTime() * 2)), 0, 100)

	self:DrawModel()

	if not IsValid(MySelf) or MySelf:Team() ~= TEAM_HUMAN then
		return
	end

	--Check for distance with local player
	local pos = self:GetPos() + Vector(0,0,45)
	if pos:Distance(MySelf:GetPos()) > 256 then
		return
	end
		  
	local angle = (MySelf:GetPos() - pos):Angle()
	angle.p = 0
	angle.y = angle.y + 90
	angle.r = angle.r + 90

	cam.Start3D2D(pos,angle,0.26)
	cam.IgnoreZ(true)
	--draw.SimpleTextOutlined("Weapons and Supplies", "ArialBoldSeven", 0, -100, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,255)) --New
	draw.SimpleTextOutlined("SkillShop", "ArialBoldSeven", 0, -20, Color(255,255,255,200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0,0,0,250)) --New
	
		
	--Get list of available weapons the player will most likely receive
	--local suppliesList = GetBestAvailableWeapons()
	local text = "USE | Browse shop "

		--draw.SimpleTextOutlined(text, "ArialBoldFour", 0, -85, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1, Color(0,0,0,255)) --New
		draw.SimpleTextOutlined(text, "ArialBoldFour", 0, 20, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1, Color(0,0,0,250)) --New

 		--not currently implemented
 		--draw.SimpleTextOutlined("F3 | Salvage weapons for SP!", "ArialBoldFour", 0, 0, Color(255,255,255,250), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER,1, Color(0,0,0,200)) --New
 
	cam.End3D2D()
	cam.IgnoreZ(false)
end
