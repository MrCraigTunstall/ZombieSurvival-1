-- © Limetric Studios ( www.limetricstudios.com ) -- All rights reserved.
-- See LICENSE.txt for license information

AddCSLuaFile()

-- Melee base
SWEP.Base = "weapon_zs_melee_base"

if CLIENT then
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["keyboard"] = { type = "Model", model = "models/props/cs_office/computer_keyboard.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.147, 1.246, -6.666), angle = Angle(0, -180, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
	["keyboard"] = { type = "Model", model = "models/props/cs_office/computer_keyboard.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.302, 5.831, -6.351), angle = Angle(-175.459, -100.792, -96.282), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger31"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59.13, 0) },
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -38.262, 0) },
		["ValveBiped.Bip01_R_Finger42"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(8.696, 71.304, 0) },
		["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -8.697, 0) },
		["ValveBiped.Bip01_R_Finger22"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 40.094, 0) },
		["ValveBiped.Bip01_R_Finger41"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 22.608, 0) },
		["ValveBiped.Bip01_R_Finger21"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 53.7, 0) },
		["ValveBiped.Bip01_R_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 80, 0) },
		["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 91.885, 0) },
		["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 74.782, 0) },
		["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 64.347, 0) },
		["ValveBiped.Bip01_R_Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 33.042, 0) },
		["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 76.522, 0) },
		["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 42.113, 0) },
		["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -5.218, 0) }
	}

	killicon.AddFont("weapon_zs_melee_keyboard", "ZSKillicons", "d", Color(255, 255, 255, 255))
end

-- Model paths
SWEP.ViewModel = Model("models/weapons/c_crowbar.mdl")
SWEP.UseHands = true
SWEP.WorldModel = Model("models/weapons/w_knife_t.mdl")

-- Name and fov
SWEP.PrintName = "Keyboard"

-- Slot position
SWEP.Slot = 0
SWEP.Weight = 1
SWEP.Type = "Melee"
-- Damage, distane, delay
SWEP.HumanClass = "berserker"
SWEP.MeleeSize = 1.0
SWEP.DamageType = DMG_CLUB
SWEP.MeleeDamage = 40
SWEP.MeleeRange = 52
SWEP.Primary.Delay = 1
SWEP.SwingTime = 0.65
SWEP.SwingRotation = Angle(30, -30, -30)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingHoldType = "melee"


function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/keyboard/keyboard_hit-0"..math.random(1, 4)..".wav")
end
