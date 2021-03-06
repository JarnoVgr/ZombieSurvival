AddCSLuaFile()

SWEP.Base = "weapon_zs_seeker"

SWEP.ViewModel = "models/Weapons/v_zombiearms.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.ZombieOnly = true

SWEP.Primary.Delay = 1.9
SWEP.Primary.Duration = 2
SWEP.Primary.Reach = 60

SWEP.MeleeDelay = 1.9
SWEP.MeleeRange = 60
SWEP.MeleeAnimationDelay = 0.35


function SWEP:PlayAlertSound()
	self.Owner:EmitSound("zombies/seeker/screamclose.wav")
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound


local matSheet = Material("Models/Charple/Charple1_sheet")
function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride(matSheet)
end

local matSheet = Material("Models/Charple/Charple1_sheet")
function SWEP:PreDrawWorldModel(vm)
	render.ModelMaterialOverride(matSheet)
end



function SWEP:SendAttackAnim()
	if self.SwapAnims then
		self:SendWeaponAnim(ACT_VM_HITCENTER)
	else
		self:SendWeaponAnim(ACT_VM_SECONDARYATTACK)
	end
	self.SwapAnims = not self.SwapAnims
end

function SWEP:StartSwinging()
	if self.MeleeAnimationDelay then
		self.NextAttackAnim = CurTime() + self.MeleeAnimationDelay
	else
		self:SendAttackAnim()
	end

	local owner = self.Owner
	owner:DoAttackEvent()

	if SERVER then
		self:PlayAttackSound()
	end
	self:StopMoaning()

	if self.FrozenWhileSwinging then
		owner:SetSpeed(1)
	end

	if self.MeleeDelay > 0 then
		self:SetSwingEndTime(CurTime() + self.MeleeDelay)

		local trace = self.Owner:MeleeTrace(self.MeleeReach, self.MeleeSize, player.GetAll())
		if trace.HitNonWorld then
			trace.IsPreHit = true
			self.PreHit = trace
		end

		self.IdleAnimation = CurTime() + self:SequenceDuration()
	else
		self:Swung()
	end
end

function SWEP:StopSwinging()
	self:SetSwingEndTime(0)
end

function SWEP:SecondaryAtack()
	if SERVER then
		self.Owner:EmitSound("npc/ichthyosaur/water_breath.wav" ) 
	end
end
