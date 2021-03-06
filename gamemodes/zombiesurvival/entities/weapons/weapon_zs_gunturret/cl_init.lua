include("shared.lua")

SWEP.PrintName = "Gun Turret"
SWEP.Description = "This automated turret requires constant upkeep to be useful.\nPress PRIMARY ATTACK to deploy the turret.\nPress SECONDARY ATTACK and RELOAD to rotate the turret.\nPress USE on a deployed turret to give it some of your SMG ammunition.\nPress USE on a deployed turret with no owner (blue light) to reclaim it."
SWEP.DrawCrosshair = false

SWEP.Slot = 4
SWEP.SlotPos = 0
SWEP.ViewModelFOV = 60

function SWEP:DrawHUD()

	if GetConVarNumber("crosshair") ~= 1 then return end
	self:DrawCrosshairDot()
	

	surface.SetFont("ZSHUDFont2")
	local text = translate.Get("right_click_to_hammer_nail")
	local nails = self:GetPrimaryAmmoCount()
	local nTEXW, nTEXH = surface.GetTextSize(text)

	draw.SimpleText("Turret", "ZSHUDFont2", ScrW() - nTEXW * 0.4 - 24, ScrH() - nTEXH * 2, nails > 0 and COLOR_GREY or COLOR_GREY, TEXT_ALIGN_CENTER)

	local w, h = ScrW(), ScrH()	
	draw.RoundedBox( 12, w * 0.85, h * 0.9, w * 0.08, h * 0.09, Color(1, 1, 1, 100) )
	
end

function SWEP:Deploy()
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	return true
end

function SWEP:DrawWorldModel()
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel

function SWEP:PrimaryAttack()
end

function SWEP:DrawWeaponSelection(...)
	return self:BaseDrawWeaponSelection(...)
end

function SWEP:Think()
	if self.Owner:KeyDown(IN_ATTACK2) then
		self:RotateGhost(FrameTime() * 60)
	end
	if self.Owner:KeyDown(IN_RELOAD) then
		self:RotateGhost(FrameTime() * -60)
	end
end

local nextclick = 0
function SWEP:RotateGhost(amount)
	if nextclick <= RealTime() then
		surface.PlaySound("npc/headcrab_poison/ph_step4.wav")
		nextclick = RealTime() + 0.3
	end
	RunConsoleCommand("_zs_ghostrotation", math.NormalizeAngle(GetConVarNumber("_zs_ghostrotation") + amount))
end
