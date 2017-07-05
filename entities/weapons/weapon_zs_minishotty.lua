-- ? Limetric Studios ( www.limetricstudios.com ) -- All rights reserved.

-- See LICENSE.txt for license information

if SERVER then


        SWEP.PrintName = "'Farter' Shotgun"

end

if CLIENT then

	SWEP.PrintName = "'Farter' Shotgun"                        
	SWEP.ViewModelFlip = false
	SWEP.IconLetter = "0"
	killicon.AddFont( "weapon_zs_minishotty", "HL2MPTypeDeath", SWEP.IconLetter, Color( 255, 255, 255, 255 ) )

end

SWEP.Base                                = "weapon_zs_base"

SWEP.UseHands = false

SWEP.ViewModel                        = Model ( "models/weapons/v_supershorty/v_supershorty.mdl" )
SWEP.WorldModel                        = Model ( "models/weapons/w_supershorty.mdl" )

SWEP.Weight                                = 2

SWEP.Slot = 2
SWEP.Type = "Shotgun"
SWEP.ConeMax = 0.085
SWEP.ConeMin = 0.08

SWEP.HoldType = "shotgun"

SWEP.Primary.Sound                        = Sound("Weapon_Shotgun.Single")

SWEP.Primary.Recoil                        = 5
SWEP.Primary.Damage                        = 7
SWEP.Primary.NumShots                = 6
SWEP.Primary.ClipSize                = 6
SWEP.Primary.Delay                        = 0.8
SWEP.Primary.Automatic                = false

SWEP.Primary.Ammo                        = "buckshot"



SWEP.IsShotgun = true



SWEP.IronSightsPos = Vector(-3.36, -9.016, 2.2)

SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.ReloadDelay = 1
SWEP.reloadtimer = 0
SWEP.nextreloadfinish = 0

function SWEP:Reload()
	if self.reloading then return end

	if self:Clip1() < self.Primary.ClipSize and 0 < self.Owner:GetAmmoCount(self.Primary.Ammo) then
		self:SetNextPrimaryFire(CurTime() + self.ReloadDelay)
		self.reloading = true
		self.reloadtimer = CurTime() + self.ReloadDelay
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_START)
		--self.Owner:RestartGesture(ACT_HL2MP_GESTURE_RELOAD_SHOTGUN)
	end

	self:SetIronsights(false)
end

function SWEP:Think()
	if self.reloading and self.reloadtimer < CurTime() then
		self.reloadtimer = CurTime() + self.ReloadDelay
		self:SendWeaponAnim(ACT_VM_RELOAD)

		self.Owner:RemoveAmmo(1, self.Primary.Ammo, false)
		self:SetClip1(self:Clip1() + 1)
		self:EmitSound("Weapon_Shotgun.Reload")

		if self.Primary.ClipSize <= self:Clip1() or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0 then
			self.nextreloadfinish = CurTime() + self.ReloadDelay
			self.reloading = false
			self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		end
	end

	local nextreloadfinish = self.nextreloadfinish
	if nextreloadfinish ~= 0 and nextreloadfinish < CurTime() then
		self:EmitSound("Weapon_M3.Pump")
		self:SendWeaponAnim(ACT_SHOTGUN_PUMP)
		self.nextreloadfinish = 0
	end

	if self:GetIronsights() and not self.Owner:KeyDown(IN_ATTACK2) then
		self:SetIronsights(false)
	end
end

function SWEP:CanPrimaryAttack()
	if self.Owner:IsHolding() then return false end

	if self:Clip1() <= 0 then
		self:EmitSound("Weapon_Shotgun.Empty")
		self:SetNextPrimaryFire(CurTime() + 0.25)
		return false
	end

	if self.reloading then
		if 0 < self:Clip1() then
			self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
		else
			self:SendWeaponAnim(ACT_VM_IDLE)
		end
		self.reloading = false
		self:SetNextPrimaryFire(CurTime() + 0.25)
		return false
	end

	return true
end

function SWEP:SecondaryAttack()
end