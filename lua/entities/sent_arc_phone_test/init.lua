-- This shit is under copyright.
-- Any 3rd party content has been used as either public domain or with permission.
-- � Copyright 2014 Aritz Beobide-Cardinal All rights reserved.
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include('shared.lua')
ENT.ARitzDDProtected = true
function ENT:Initialize()
	self:SetModel( "models/ap/phone/phone_model.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self.phys = self:GetPhysicsObject()
	if self.phys:IsValid() then
		self.phys:Wake()
	end
	self:SetUseType(SIMPLE_USE)
	--self:SetCollisionGroup( COLLISION_GROUP_DEBRIS )
end
function ENT:SpawnFunction( ply, tr )
 	if ( !tr.Hit ) then return end
	local blarg = ents.Create ("sent_arc_phone_test")
	blarg:SetPos(tr.HitPos + tr.HitNormal * 40)
	blarg:Spawn()
	blarg:Activate()
	return blarg
end
--[[
function ENT:OnTakeDamage(dmg)
	self:TakePhysicsDamage(dmg); -- React physically when getting shot/blown
	self.OurHealth = self.OurHealth - dmg:GetDamage(); -- Reduce the amount of damage took from our health-variable
	MsgN(self.OurHealth)
	if(self.OurHealth <= 0) then -- If our health-variable is zero or below it
		
	end
end
]]
function ENT:Think()

end

function ENT:OnRemove()

end

function ENT:Use( ply, caller )--self:StopHack()

end
