-- � Limetric Studios ( www.limetricstudios.com ) -- All rights reserved.
-- See LICENSE.txt for license information

AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "'Chipper' Shotgun"
	SWEP.Author	= "Pufulet, Ported by Duby"
	SWEP.Slot = 0
	SWEP.SlotPos = 0

	
	SWEP.ViewModelFlip = false
	
	SWEP.HUD3DBone = "v_weapon.xm1014_Bolt"
	SWEP.HUD3DPos = Vector(-1, 0, 0)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02
	
	SWEP.ViewModelBoneMods = {
		["v_weapon.M3_TRIGGER"] = { scale = Vector(0.899, 0.899, 0.899), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["v_weapon.M3_PARENT"] = { scale = Vector(0.899, 0.899, 0.899), pos = Vector(-1, 0.05, 0.4), angle = Angle(0, 0, 0) },
		["v_weapon.M3_SHELL"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["v_weapon.M3_CHAMBER"] = { scale = Vector(0.899, 0.899, 0.899), pos = Vector(0, 0.037, 0), angle = Angle(0, 0, 0) }
	}
SWEP.WElements = {
		["actual_grip"] = { type = "Model", model = "models/props_docks/dock01_pole01a_128.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.2, 0.8, 0.518), angle = Angle(5.843, 0, 0), size = Vector(0.2, 0.1, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["barrel"] = { type = "Model", model = "models/props_docks/dock03_pole01a_256.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "grip", pos = Vector(-1.558, 0, 0), angle = Angle(180, 0, 0), size = Vector(0.119, 0.119, 0.14), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["handle"] = { type = "Model", model = "models/props_wasteland/prison_pipefaucet001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "grip", pos = Vector(0, 0, 18.181), angle = Angle(0, -90, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["barrel+"] = { type = "Model", model = "models/props_docks/piling_cluster01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "grip", pos = Vector(0.518, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["grip"] = { type = "Model", model = "models/props_docks/dock01_pole01a_128.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(15.064, 0.8, -4.676), angle = Angle(78.311, 0, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.VElements = {
		["handle+"] = { type = "Model", model = "models/props_docks/piling_cluster01a.mdl", bone = "v_weapon.M3_PARENT", rel = "handle", pos = Vector(0.2, 2.599, 1.1), angle = Angle(180, 180, 92.337), size = Vector(0.017, 0.017, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["handle"] = { type = "Model", model = "models/props_wasteland/prison_pipefaucet001a.mdl", bone = "v_weapon.M3_PARENT", rel = "", pos = Vector(0, -3.201, 4.675), angle = Angle(180, 0, -94.676), size = Vector(0.8, 0.8, 0.8), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["grip"] = { type = "Model", model = "models/props_docks/dock01_pole01a_128.mdl", bone = "v_weapon.M3_PARENT", rel = "", pos = Vector(0, -0.401, 1.557), angle = Angle(0, 0, 75.973), size = Vector(0.059, 0.159, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["barrel+++"] = { type = "Model", model = "models/props_c17/pipe_cap005.mdl", bone = "v_weapon.M3_PARENT", rel = "barrel", pos = Vector(0, 0.159, 11.5), angle = Angle(90, 0, 0), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "halflife/black", skin = 0, bodygroup = {} },
		["barrel"] = { type = "Model", model = "models/props_docks/dockpole01a.mdl", bone = "v_weapon.M3_PARENT", rel = "", pos = Vector(0, -3.5, -11), angle = Angle(0, 0, 0), size = Vector(0.1, 0.15, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pumper+++"] = { type = "Model", model = "models/props_pipes/pipeset02d_64_001a.mdl", bone = "v_weapon.M3_PUMP", rel = "pumper++", pos = Vector(-3.636, 0, 0.05), angle = Angle(0, -180, 0), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["pumper++"] = { type = "Model", model = "models/props_pipes/pipeset02d_64_001a.mdl", bone = "v_weapon.M3_PUMP", rel = "", pos = Vector(-0.7, -0.519, -1.558), angle = Angle(90, -24.546, 90), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["barrel++++"] = { type = "Model", model = "models/props_docks/dock03_pole01a_256.mdl", bone = "v_weapon.M3_PARENT", rel = "barrel", pos = Vector(-0.519, -0.9, 8.831), angle = Angle(0, -180, -180), size = Vector(0.039, 0.039, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["barrel++"] = { type = "Model", model = "models/props_docks/piling_cluster01a.mdl", bone = "v_weapon.M3_PUMP", rel = "", pos = Vector(-0.201, 0.5, -3.636), angle = Angle(180, 71.299, 180), size = Vector(0.029, 0.029, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["shell"] = { type = "Model", model = "models/props_docks/piling_cluster01a.mdl", bone = "v_weapon.M3_SHELL", rel = "", pos = Vector(0, 0, -0.7), angle = Angle(0, 90, 0), size = Vector(0.017, 0.017, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["barrel+"] = { type = "Model", model = "models/props_docks/dock03_pole01a_256.mdl", bone = "v_weapon.M3_PARENT", rel = "", pos = Vector(0, -4.5, -9.87), angle = Angle(0, 0, 180), size = Vector(0.059, 0.059, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}	
	SWEP.ViewModelFOV = 60
--	killicon.AddFont("weapon_zs_chipper", "CSKillIcons", SWEP.IconLetter, Color(255, 255, 255, 255 ))
end

SWEP.Base				= "weapon_zs_base"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= true

--SWEP.ViewModel			= Model ( "models/weapons/cstrike/c_shot_xm1014.mdl" )
SWEP.ViewModel			= Model ( "models/weapons/cstrike/c_shot_m3super90.mdl" )
SWEP.UseHands = true
SWEP.WorldModel			= Model ( "models/weapons/w_shot_m3super90.mdl" )

SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.HoldType = "shotgun"

SWEP.Primary.Sound 			= Sound("Weapon_Shotgun.Single")
SWEP.Primary.Recoil			= 2
SWEP.Primary.Damage			= 4
SWEP.Primary.NumShots		= 5
SWEP.Primary.ClipSize		= 6
SWEP.Primary.Delay			= 0.75
SWEP.Primary.DefaultClip	= 40
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "buckshot"

SWEP.MaxAmmo			    = 70

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.ReloadDelay = 0.47

SWEP.reloadtimer = 0
SWEP.nextreloadfinish = 0

SWEP.ConeMax = 0.055
SWEP.ConeMin = 0.0275

SWEP.IronSightsPos = Vector(-7.3, 9, 2.3) --Vector(-7.3, 9, 2.3)
SWEP.IronSightsAng = Vector(0, -1, 0)


function SWEP:Reload()
	if self.reloading then
		return
	end
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

		if self.Primary.ClipSize <= self:Clip1() or self.Owner:GetAmmoCount(self.Primary.Ammo) <= 0 then
			self.nextreloadfinish = CurTime() + self.ReloadDelay
			self.reloading = false
			self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
		end
	end

	local nextreloadfinish = self.nextreloadfinish
	if nextreloadfinish ~= 0 and nextreloadfinish < CurTime() then
		self:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)
		self.nextreloadfinish = 0
	end

	if self:GetIronsights() and not self.Owner:KeyDown(IN_ATTACK2) then
		self:SetIronsights(false)
	end
	
end



function SWEP:SecondaryAttack()
end