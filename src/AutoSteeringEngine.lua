AutoSteeringEngine = {}

AIVECurrentModDir = g_currentModDirectory
AIVEModsDirectory = g_modsDirectory.."/"

local AIVEFrontPackerT = {}
local AIVEFrontPackerC = 0

function AutoSteeringEngine.globalsReset( createIfMissing )

	AIVEGlobals = {}
	AIVEGlobals.devFeatures  = 0
	AIVEGlobals.staticRoot   = 0
	AIVEGlobals.chainBorder  = 0
	AIVEGlobals.chainLen     = { 2, 4, 6, 8, 10, 12 }
	AIVEGlobals.chain2Len    = { 2, 4, 6, 8, 10, 12 }
	AIVEGlobals.chainStart   = 0
	AIVEGlobals.chainDivideIn  = 0
	AIVEGlobals.chainDivideOut = 0
	AIVEGlobals.widthDec     = 0
	AIVEGlobals.widthMaxDec  = 0
	AIVEGlobals.angleStep    = 0
	AIVEGlobals.angleStepInc = 0
	AIVEGlobals.angleStepDec = 0
	AIVEGlobals.angleStepMax = 0
	AIVEGlobals.fixAngleStep = 0
	AIVEGlobals.angleFactorInside = 0
	AIVEGlobals.angleFactorNoFix = 0
	AIVEGlobals.angleSafety  = 0
	AIVEGlobals.maxLooking   = 0
	AIVEGlobals.minLooking   = 0
	AIVEGlobals.minLkgFactor = 0
	AIVEGlobals.maxRotation  = 0
	AIVEGlobals.maxRotationC = 0
	AIVEGlobals.maxRotationU = 0
	AIVEGlobals.minRadius    = 0
	AIVEGlobals.aiSteering   = 0
	AIVEGlobals.aiSteeringD  = 0
	AIVEGlobals.artSteering  = 0
	AIVEGlobals.artSteeringD = 0
  AIVEGlobals.average      = 0
  AIVEGlobals.reverseDir   = 0
	AIVEGlobals.minMidDist   = 0
	AIVEGlobals.showTrace    = 0
	AIVEGlobals.minLength    = 0
	AIVEGlobals.roueSupport  = 0
	AIVEGlobals.artAxisRot   = 0
	AIVEGlobals.artAxisShift = 0
	AIVEGlobals.showChannels = 0
	AIVEGlobals.stepLog2     = 0
	AIVEGlobals.yieldCount   = 0
	AIVEGlobals.zeroAngle    = 0
	AIVEGlobals.zeroAngle2   = 0
	AIVEGlobals.colliMask    = 0
	AIVEGlobals.fruitIgnoreSq= 0
	AIVEGlobals.chainIgnoreSq= 0
	AIVEGlobals.ignoreDist   = 0
	AIVEGlobals.colliStep    = 0
	AIVEGlobals.getIsHired   = 0
	AIVEGlobals.widthOffset  = 0
	AIVEGlobals.shiftFixZ    = 0
	AIVEGlobals.zeroWidth    = 0
	AIVEGlobals.smoothFactor = 0
	AIVEGlobals.smoothMax    = 0
	AIVEGlobals.limitOutside = 0
	AIVEGlobals.limitInside  = 0
	AIVEGlobals.maxDtSumT     = 0
	AIVEGlobals.maxDtSum      = 0
	AIVEGlobals.maxDtDist     = 0
	AIVEGlobals.maxDtDistD    = 0
	AIVEGlobals.maxDtAngle    = 0
	AIVEGlobals.maxDetectDt   = 0
	AIVEGlobals.maxDetectZ0   = 0
	AIVEGlobals.maxDetectZ1   = 0
	AIVEGlobals.maxDetectZ2   = 0
	AIVEGlobals.maxDetectZ3   = 0
	AIVEGlobals.maxDetectMin  = 0
	AIVEGlobals.maxDetectMax  = 0
	AIVEGlobals.showStat      = 0
	AIVEGlobals.ploughTransport = 0
	AIVEGlobals.maxSpeed      = 0
	AIVEGlobals.maxTurnCheck  = 0
	AIVEGlobals.maxToolAngle  = 0
	AIVEGlobals.maxToolAngle2 = 0
	AIVEGlobals.maxToolAngleF = 0
	AIVEGlobals.enableAUTurn  = 0
	AIVEGlobals.enableYUTurn  = 0
	AIVEGlobals.enableKUTurn  = 0
	AIVEGlobals.aiRescueDistSq= 0
	AIVEGlobals.raiseNoFruits = 0
	AIVEGlobals.lowerAdvance  = 0
	AIVEGlobals.showInfo      = 0
	AIVEGlobals.borderBuffer  = 0
	AIVEGlobals.chainStep0    = 0
	AIVEGlobals.chainStep1    = 0
	AIVEGlobals.chainStep2    = 0
	AIVEGlobals.chainStep3    = 0
	AIVEGlobals.chainStep4    = 0
	AIVEGlobals.chain2Step0   = 0
	AIVEGlobals.chain2Step1   = 0
	AIVEGlobals.chain2Step2   = 0
	AIVEGlobals.chain2Step3   = 0
	AIVEGlobals.chain2Step4   = 0
	AIVEGlobals.chain3Step0   = 0
	AIVEGlobals.chain3Step1   = 0
	AIVEGlobals.chain3Step2   = 0
	AIVEGlobals.chain3Step3   = 0
	AIVEGlobals.chain3Step4   = 0
	AIVEGlobals.collectCbr    = 0
	AIVEGlobals.testOutside   = 0
	AIVEGlobals.safetyFactor  = 0
	AIVEGlobals.debug1        = 0
	AIVEGlobals.debug2        = 0
	AIVEGlobals.straightTA    = 0
	AIVEGlobals.detectLevel3  = 0
	AIVEGlobals.maxBorder2    = 0
	AIVEGlobals.useFBB123     = 0
	
	local file
	file = AIVECurrentModDir.."autoSteeringEngineConfig.xml"
	if fileExists(file) then	
		print('AutoSteeringEngine: loading settings from "'..tostring(file)..'"')
		AutoSteeringEngine.globalsLoad( file )	
	else
		print("ERROR: NO GLOBALS IN "..file)
	end
	
	file = AIVEModsDirectory.."autoSteeringEngineConfig.xml"
	if fileExists(file) then	
		print('AutoSteeringEngine: loading settings from "'..tostring(file)..'"')
		AutoSteeringEngine.globalsLoad( file )	
	elseif createIfMissing then
		AutoSteeringEngine.globalsCreate()
	end
	
	print("AutoSteeringEngine initialized")
end
	
function AutoSteeringEngine.globalsLoad( file )	

	local xmlFile = loadXMLFile( "AIVE", file, "AIVEGlobals" )
	for name,value in pairs(AIVEGlobals) do
		local tp = Utils.getNoNil( getXMLString(xmlFile, "AIVEGlobals." .. name .. "#type"), "int" )
		if     tp == "bool" then
			local bool = getXMLBool( xmlFile, "AIVEGlobals." .. name .. "#value" )
			if bool ~= nil then
				if bool then AIVEGlobals[name] = 1 else AIVEGlobals[name] = 0 end
			end
		--print(file..": "..name.." = "..AIVEGlobals[name])
		elseif tp == "float" then
			local float = getXMLFloat( xmlFile, "AIVEGlobals." .. name .. "#value" )
			if float ~= nil then AIVEGlobals[name] = float end
		--print(file..": "..name.." = "..AIVEGlobals[name])
		elseif tp == "degree" then
			local float = getXMLFloat( xmlFile, "AIVEGlobals." .. name .. "#value" )
			if float ~= nil then AIVEGlobals[name] = math.rad( float ) end
		--print(file..": "..name.." = "..AIVEGlobals[name])
		elseif tp == "int" then
			local int = getXMLInt( xmlFile, "AIVEGlobals." .. name .. "#value" )
			if int ~= nil then AIVEGlobals[name] = int end
		--print(file..": "..name.." = "..AIVEGlobals[name])
		elseif tp == "vector" then
			local str = getXMLString( xmlFile, "AIVEGlobals." .. name .. "#value" )
		--print('<name type="'..tp..'" value="'..tostring(str)..'"/>')
			if str ~= nil then AIVEGlobals[name] = { Utils.getVectorFromString( str ) } end
		else
			print(file..": "..name..": invalid XML type : "..tp)
		end
	end
end

function AutoSteeringEngine.globalsCreate()	

	local file = g_modsDirectory.."/autoSteeringEngineConfig.xml"

	local xmlFile = createXMLFile( "AIVE", file, "AIVEGlobals" )
	for name,value in pairs(AIVEGlobals) do
		if     value == 0 then
			setXMLString( xmlFile, "AIVEGlobals." .. name .. "#type", "bool" )
			setXMLBool( xmlFile, "AIVEGlobals." .. name .. "#value", false )
		elseif value == 1 then
			setXMLString( xmlFile, "AIVEGlobals." .. name .. "#type", "bool" )
			setXMLBool( xmlFile, "AIVEGlobals." .. name .. "#value", true )
		elseif math.abs( value - math.floor( value ) ) > 1E-6 then
			setXMLString( xmlFile, "AIVEGlobals." .. name .. "#type", "float" )
			setXMLFloat( xmlFile, "AIVEGlobals." .. name .. "#value", value )
		else 
			setXMLInt( xmlFile, "AIVEGlobals." .. name .. "#value", value )
		end
	end
	
	saveXMLFile(xmlFile)	
end
	

AutoSteeringEngine.resetCounter = 0
AutoSteeringEngine.globalsReset( false )

AIVEStatus = {}
AIVEStatus.initial  = 0
AIVEStatus.steering = 1
AIVEStatus.rotation = 2
AIVEStatus.position = 3
AIVEStatus.border   = 4

------------------------------------------------------------------------
-- processChainRotateRefNode
------------------------------------------------------------------------
function AutoSteeringEngine.processChainRotateRefNode( vehicle, tp, tool )

	local ofs, idx
	if vehicle.aiveChain.leftActive	then
		ofs = -tp.offset 
		idx = tp.nodeLeft 
	else
		ofs = tp.offset 
		idx = tp.nodeRight
	end

	local vx, vy, vz = getWorldRotation( vehicle.aiveChain.refNode )
	local tx, ty, tz = getWorldRotation( idx )
	unlink( tool.refNodeRot )
	link( idx, tool.refNodeRot )
	setTranslation( tool.refNodeRot, ofs, 0, 0 )
	setRotation( tool.refNodeRot, vx-tx, vy-ty, vz-tz )
	
end

------------------------------------------------------------------------
-- processChainSetAngle
------------------------------------------------------------------------
function AutoSteeringEngine.processChainSetAngle( vehicle, a, j, indexMax )
	local indexStraight = indexMax + 1
	if     a == 0 then
		for i=1,indexMax do
			if math.abs( vehicle.aiveChain.nodes[i].angle ) > 1E-5 then
				AutoSteeringEngine.setChainStatus( vehicle, i, AIVEStatus.initial )
			end
			vehicle.aiveChain.nodes[i].angle = 0
		end
	elseif a > 0 then
		for i=1,j do
			if math.abs( vehicle.aiveChain.nodes[i].angle ) > 1E-5 then
				AutoSteeringEngine.setChainStatus( vehicle, i, AIVEStatus.initial )
			end
			vehicle.aiveChain.nodes[i].angle = 0
		end
		for i=j+1,indexMax do
			if math.abs( vehicle.aiveChain.nodes[i].angle - a ) > 1E-5 then
				AutoSteeringEngine.setChainStatus( vehicle, i, AIVEStatus.initial )
			end
			vehicle.aiveChain.nodes[i].angle = a
		end		
	else
		for i=1,j do
			if math.abs( vehicle.aiveChain.nodes[i].angle - a ) > 1E-5 then
				AutoSteeringEngine.setChainStatus( vehicle, i, AIVEStatus.initial )
			end
			vehicle.aiveChain.nodes[i].angle = a
		end
		indexStraight = j+1
		if indexStraight <= indexMax then
			if math.abs( vehicle.aiveChain.nodes[indexStraight].angle + a ) > 1E-5 then
				AutoSteeringEngine.setChainStatus( vehicle, indexStraight, AIVEStatus.initial )
			end
			vehicle.aiveChain.nodes[indexStraight].angle = -a
		end
		indexStraight = indexStraight + 1
	end

	AutoSteeringEngine.setChainStraight( vehicle, indexStraight )		
	AutoSteeringEngine.applyRotation( vehicle )	
end

------------------------------------------------------------------------
-- processChainGetScore
------------------------------------------------------------------------
function AutoSteeringEngine.processChainGetScore( a, bi, ti, bo, to, ll, j )
	if     bi > 0 then
		local s = 100 - math.max( 0, 60 - ll )
		
		if bi > 1e6 then
			return s + 1
		end
		return s + 1e-6 * bi
	elseif bo <= 0     then
		return 21 + a
	elseif bo >= to    then
		return 31 - a
	elseif bo <= AIVEGlobals.maxBorder2    then
		return 1 - bo / AIVEGlobals.maxBorder2 + 0.5 * math.abs( a )
	elseif bo >= AIVEGlobals.maxBorder2+1e6 then
		return 11
	else
		return 10 + 1e-6 * ( bo - AIVEGlobals.maxBorder2 )
	end
	
	print("ERROR in AutoSteeringEngine.processChainGetScore: "..tostring(a)..", "..tostring(bi)..", "..tostring(bo))
	return 9999
end

------------------------------------------------------------------------
-- processChainResult
------------------------------------------------------------------------
function AutoSteeringEngine.processChainResult( best, a, bi, ti, bo, to, ll, j, m )
	local s = AutoSteeringEngine.processChainGetScore( a, bi, ti, bo, to, ll, j )
	if best.score == nil or best.score > s then
		best.score    = s
		best.indexMin = j
		best.indexMax = m
		best.angle    = a
		best.border   = bi
		best.border2  = bo
		best.distance = ll
	end
	return s
end

------------------------------------------------------------------------
-- processChainStep
------------------------------------------------------------------------
function AutoSteeringEngine.processChainStep( vehicle, best, a, j, m, f )
	AutoSteeringEngine.processChainSetAngle( vehicle, a, j, m )
	local bi, ti, bo, to, ll = AutoSteeringEngine.getAllChainBorders( vehicle, AIVEGlobals.chainStart, m, f )
	local s = AutoSteeringEngine.processChainResult( best, a, bi, ti, bo, to, ll, j, m )
	if bi > 0 or bo > 0 then
		return true, bi, bo
	end
	return false, bi, bo, s
end

------------------------------------------------------------------------
-- processChain
------------------------------------------------------------------------
function AutoSteeringEngine.processChain( vehicle, smooth, useBuffer, inField, mode, offsetAngle )

	if vehicle.aiveChain.toolParams == nil or table.getn( vehicle.aiveChain.toolParams ) < 1 then
		return false, 0,0
	end

	local s = 1 
	if smooth ~= nil and smooth > 0 then
		s = Utils.clamp( 1 - smooth, 0.1, 1 ) 
	end 
	
	AutoSteeringEngine.initSteering( vehicle )	
	
	if vehicle.aiveChain.width <= 0 then
		print("Empty width!")
		return false, 0,0
	end
	
	vehicle.acIamDetecting = true

	vehicle.aiveChain.valid   = false
	vehicle.aiveChain.smooth  = nil
	vehicle.aiveChain.inField = false
	
	if s < 1 then
		vehicle.aiveChain.smooth      = s
		vehicle.aiveChain.angleFactor = vehicle.aiveChain.angleFactor * vehicle.aiveChain.smooth
	end
	
	if inField then
		vehicle.aiveChain.inField = true
	end
	
	if AIVEGlobals.collectCbr > 0 then
		vehicle.aiveChain.collectCbr	= true
		vehicle.aiveChain.cbr	      = {} 
		vehicle.aiveChain.pcl        = {}
	else
		vehicle.aiveChain.collectCbr	= nil
		vehicle.aiveChain.cbr	      = nil
		vehicle.aiveChain.pcl        = nil
	end		

	local detected    = false
	local angle       = 0
	local border      = 0
	local indexMax0   = math.min( vehicle.aiveChain.chainMax, vehicle.aiveChain.chainStep2 )

	while   indexMax0 < vehicle.aiveChain.chainMax
			and vehicle.aiveChain.nodes[indexMax0].distance < vehicle.aiveChain.width do
		indexMax0 = indexMax0 + 1
	end
	
	local indexMax    = indexMax0
	local chainBorder
	
	vehicle.aiveProcessChainInfo = ""
		
	if      vehicle.aiveChain.inField
			and vehicle.aiveChain.chainStep1 > 0 
			and vehicle.aiveChain.chainStep1 < indexMax 
			and vehicle.aiveChain.maxLooking > 0.1 then
		local turnAngle = AutoSteeringEngine.getTurnAngle( vehicle )
		if vehicle.aiveChain.leftActive then
			turnAngle = -turnAngle
		end
		
		local ma = 0.2 * vehicle.aiveChain.maxLooking
		if -vehicle.aiveChain.maxLooking < turnAngle and turnAngle < ma then
			local im
			if AutoSteeringEngine.hasFruits( vehicle, -1 ) then
				im = vehicle.aiveChain.chainStep1
			else
				im = math.min( indexMax, math.max( 1, AIVEGlobals.chainBorder ) )
			end
		
			if turnAngle > -ma and im < indexMax then
				im = math.min( indexMax, im + math.floor( ( indexMax - im ) * ( turnAngle + ma ) / ( ma + ma ) + 0.5 ) )
			end
			local tl = AutoSteeringEngine.getTraceLength( vehicle )
			local ml = math.max( vehicle.aiveChain.nodes[indexMax].distance - tl, math.max( vehicle.aiveChain.width, vehicle.aiveChain.radius ) )
			while   indexMax > im
 			    and vehicle.aiveChain.nodes[indexMax-1].distance >= ml do
				indexMax = indexMax - 1
			end
		end
		
	--print(tostring(math.floor( math.deg( turnAngle ) + 0.5 )).." => "..tostring( indexMax ).." / "..tostring( vehicle.aiveChain.chainStep2 ))
		
		chainBorder = Utils.clamp( AIVEGlobals.chainBorder, 1, indexMax )
	else
		chainBorder = indexMax
	end
	
	AutoSteeringEngine.syncRootNode( vehicle, Utils.getNoNil( offsetAngle, 0 ) )
	local best = {}

	local j0 = Utils.clamp( vehicle.aiveChain.chainStep0, 1, indexMax )
	local j1 = Utils.clamp( vehicle.aiveChain.chainStep4, 1, indexMax )
	
	for i=1,vehicle.aiveChain.chainMax do
		vehicle.aiveChain.nodes[i].detected = false
	end
			
	while true do

		if mode == nil or mode == 0 then	
			local d, bi, bo = AutoSteeringEngine.processChainStep( vehicle, best, 0, indexMax, indexMax, vehicle.aiveChain.inField )
			if d then
				-- maybe we are too close
				detected = true
				
				for step=1,AIVEGlobals.chainDivideOut do
					local exitLoop = false
					local a2 = step / AIVEGlobals.chainDivideOut	
				--local a = math.min( 0.6*a2*(a2+0.666666667), 1 )
					local a = 1-math.sin( 0.5*math.pi*(1-a2) )
					
					local j = 0
					while j < indexMax do
						d, bi, bo = AutoSteeringEngine.processChainStep( vehicle, best, a, j, indexMax, vehicle.aiveChain.inField )
							
						if     bi >  0 then
							break
						elseif bo <= AIVEGlobals.maxBorder2 then
						-- not s < 0 (50% border) but s < a => the bigger the angle the close we may get to the border
							exitLoop = true
						end
						
						if j > 0 or j1 < 1 then
							j = j + 1
						else
							j = j1
						end
					end

					if exitLoop then
						break
					end
				end
			
			elseif AutoSteeringEngine.processChainStep( vehicle, best, -1,  indexMax, indexMax, vehicle.aiveChain.inField )
					or AutoSteeringEngine.processChainStep( vehicle, best, -0.5,indexMax, indexMax, vehicle.aiveChain.inField ) 
					then 
				-- get closer to border
				detected = true
				
				for step=1,AIVEGlobals.chainDivideIn do
					local exitLoop = false
					local a2 = step / AIVEGlobals.chainDivideIn	
				--local a = - math.min( a2*a2, 1 )
				--local a = - math.min( 0.6*a2*(a2+0.666666667), 1 )
					local a = math.sin( 0.5*math.pi*(1-a2) )-1
					
					for j=j0,indexMax do
						d, bi, bo = AutoSteeringEngine.processChainStep( vehicle, best, a, j, indexMax, vehicle.aiveChain.inField )
						
						if bi > 0 then		
							local k1 = -1
							for k=1,indexMax do
								if vehicle.aiveChain.nodes[k].hasBorder then
									k1 = k
									break
								end
							end
							vehicle.aiveProcessChainInfo = vehicle.aiveProcessChainInfo..string.format("bi>0: %2d %2d %2d %2d %2d\n",step,j,bi,bo,k1)
							if j == j0 and AIVEGlobals.debug1 > 0 then
								-- exit completely
								exitLoop = true
							end
							break
						end
						
						if bo > AIVEGlobals.maxBorder2 then
							vehicle.aiveProcessChainInfo = vehicle.aiveProcessChainInfo..string.format("bo>0: %2d %2d %2d %2d\n",step,j,bi,bo)
							if j == j0 then
								-- too close to border => it will not get better
								exitLoop = true
							end
							break
						end
					end

					if exitLoop then
						break
					end
				end
			end
			
		else--if mode == 1 or mode == 2 then
			best = { math.huge, indexMax, indexMax, 0, 0, math.huge }
			
			local stepStart = -AIVEGlobals.chainDivideIn
			local stepEnd   =  AIVEGlobals.chainDivideOut
			local stepStep  = 1
			
			if mode == 2 then
				stepStart, stepEnd = stepEnd, stepStart 
				stepStep = -1
			end
		
			for step=stepStart,stepEnd,stepStep do
				local a2 = 0
				if     step < 0 then
					a2 = -step / AIVEGlobals.chainDivideIn	
				elseif step > 0 then
					a2 = step / AIVEGlobals.chainDivideOut 
				end
					
				local a = 1-math.sin( 0.5*math.pi*(1-a2) )
				local j = indexMax 
				if     step < 0 then
					a = -a
				elseif step > 0 then
					j = 0
				end
						
				while true do 
					local d, bi, bo = AutoSteeringEngine.processChainStep( vehicle, best, a, j, indexMax, vehicle.aiveChain.inField )
					detected = detected or d
					
					if     step < 0 then
						j = j - 1
						if j < j0 then
							break 
						end
					elseif step > 0 then
						if j > 0 or j1 < 1 then
							j = j + 1
						else
							j = j1
						end
						if j >= indexMax then
							break
						end
					else
						break
					end
				end
			
				if detected and best.score <= 0 then
					break
				end
			end
		end
		
		if detected or indexMax >= vehicle.aiveChain.chainMax then
			break
		end
		
		indexMax  = indexMax + 1 
	end
	
--print(tostring(best.score)..", "..tostring(best.angle)..", "..tostring(best.indexMin)..", "..tostring(best.indexMax)..", "..tostring(best.border)..", "..tostring(best.border2)..", "..tostring(best.distance))
	
	local j  = best.indexMin
	indexMax = best.indexMax
	local a  = best.angle
	border   = best.border
	length   = best.distance
	
	AutoSteeringEngine.processChainSetAngle( vehicle, a, j, indexMax )	
	border, total = AutoSteeringEngine.getAllChainBorders( vehicle, AIVEGlobals.chainStart, indexMax, vehicle.aiveChain.inField )
		
	while border > 0 and indexMax > chainBorder do 
		indexMax      = indexMax - 1 
		border, total = AutoSteeringEngine.getAllChainBorders( vehicle, AIVEGlobals.chainStart, indexMax, vehicle.aiveChain.inField )
		if total <= 0 then
			indexMax      = indexMax + 1 
			border, total = AutoSteeringEngine.getAllChainBorders( vehicle, AIVEGlobals.chainStart, indexMax, vehicle.aiveChain.inField )
			break
		end 
	end
	
--angle = vehicle.aiveChain.nodes[1].steering
--for i=2,j do
--	if math.abs( angle ) < math.abs( vehicle.aiveChain.nodes[j].steering ) then
--		angle = vehicle.aiveChain.nodes[j].steering
--	end
--end


	local wx,wy,wz 
	if math.abs( vehicle.aiveChain.nodes[1].angle ) < 1e-6 then
		wx,wy,wz = localToWorld( vehicle.aiveChain.refNode, 0, 0, 5 )
	else
		local i = best.indexMin
		if vehicle.aiveChain.nodes[1].angle > 0 then
			i = best.indexMax
		end
		wx,wy,wz = getWorldTranslation( vehicle.aiveChain.nodes[i+1].index )
	end
	vehicle.aiveChain.lastWorldTarget = { wx, wy, wz }
	
	AutoSteeringEngine.processIsAtEnd( vehicle, a )	
	
	vehicle.aiveChain.lastIndexMax = indexMax 	
	
	if detected and border > 0 then
		detected = false 
	end
	
	angle = AutoSteeringEngine.getSteeringAngleFromWorldTarget( vehicle, wx, wy, wz )
--local tx,tz = AutoSteeringEngine.getWorldTargetFromSteeringAngle( vehicle, angle )
--local ta    = AutoSteeringEngine.getSteeringAngleFromWorldTarget( vehicle, tx, wy, tz )
--
--print(AutoSteeringEngine.radToString(vehicle.aiveChain.nodes[1].steering).." / "..AutoSteeringEngine.radToString(angle).." / "..AutoSteeringEngine.radToString(ta).." ("..tostring(wx)..","..tostring(wz)..") / ("..tostring(tx)..","..tostring(tz)..")")
	return detected, angle, border, wx, wy, wz, length
end

------------------------------------------------------------------------
-- syncRootNode
------------------------------------------------------------------------
function AutoSteeringEngine.syncRootNode( vehicle, offsetAngle )

	if AIVEGlobals.staticRoot <= 0 then
		return false
	end

	local x0, y0, z0 = getWorldTranslation( g_currentMission.terrainRootNode )
	local x1, y1, z1 = AutoSteeringEngine.getAiWorldPosition( vehicle )
	x1 = x1 - x0
	y1 = y1 - y0
	z1 = z1 - z0
	local x2, y2, z2 = getTranslation( vehicle.aiveChain.rootNode )
	if     math.abs( x1-x2 ) > 1E-2 
			or math.abs( y1-y2 ) > 1E-2 
			or math.abs( z1-z2 ) > 1E-2 then 
		vehicle.aiveChain.valid = false 
		setTranslation( vehicle.aiveChain.rootNode, x1, y1, z1 )
	end 
	vehicle.aiveChain.rootTrans = { x1, y1, z1 }
		
	x0, y0, z0 = getWorldRotation( g_currentMission.terrainRootNode )
	x1, y1, z1 = getWorldRotation( vehicle.aiveChain.refNode )
	x1 = x1 - x0
	y1 = y1 - y0
	z1 = z1 - z0
		
	if AIVEGlobals.straightTA > 0 and offsetAngle ~= nil then
		y1 = y1 + offsetAngle 
	end
	
	local x2, y2, z2 = getRotation( vehicle.aiveChain.rootNode )
	if     math.abs( x1-x2 ) > 1E-3 
			or math.abs( y1-y2 ) > 1E-3 
			or math.abs( z1-z2 ) > 1E-3 then 
		vehicle.aiveChain.valid = false 
		setRotation( vehicle.aiveChain.rootNode, x1, y1, z1 )
	end
	vehicle.aiveChain.rootRot = { x1, y1, z1 }
	
	AutoSteeringEngine.setChainStatus( vehicle, 1, AIVEStatus.rotation )
	
	return true
end 

------------------------------------------------------------------------
-- getAiWorldPosition
------------------------------------------------------------------------
function AutoSteeringEngine.getAiWorldPosition( vehicle )
	if      vehicle.acAiPos ~= nil
			and vehicle.isServer 
			and vehicle.aiIsStarted then
		return unpack( vehicle.acAiPos )
	end
	return getWorldTranslation( vehicle.aiveChain.refNode )
end

------------------------------------------------------------------------
-- getIsAtEnd
------------------------------------------------------------------------
function AutoSteeringEngine.getIsAtEnd( vehicle )		
	return vehicle.aiveChain.isAtEnd
end

------------------------------------------------------------------------
-- processIsAtEnd
------------------------------------------------------------------------
function AutoSteeringEngine.processIsAtEnd( vehicle, a )		

	vehicle.aiveChain.isAtEnd = vehicle.aiveChain.inField

	if vehicle.aiveChain.isAtEnd and AutoSteeringEngine.hasFruitsInFront( vehicle ) then
		vehicle.aiveChain.isAtEnd = false
	end
	
--if vehicle.aiveChain.isAtEnd then
--	local cs = math.min( math.max( vehicle.aiveChain.chainStep0, 1 ) + 2, vehicle.aiveChain.chainMax )	
--	local ce = Utils.clamp( vehicle.aiveChain.chainStep3, cs, vehicle.aiveChain.chainMax )
--	for i=ce,cs,-1 do 
--		if vehicle.aiveChain.nodes[i].detected then
--			vehicle.aiveChain.isAtEnd = false
--			break
--		end
--		if vehicle.aiveChain.nodes[i].distance < AIVEGlobals.ignoreDist - math.max( 0, vehicle.aiveChain.maxZ ) then
--			break
--		end
--	end
--end
		
	if      AIVEGlobals.widthDec > 0 
			and vehicle.aiveChain.inField 
			and not vehicle.aiveChain.isAtEnd
			and AutoSteeringEngine.hasFruits( vehicle, -1 ) then
		local x,_,z = AutoSteeringEngine.getAiWorldPosition( vehicle )
		local lsq
		if vehicle.aiveChain.offsetWx == nil then
			vehicle.aiveChain.offsetWx = x
			vehicle.aiveChain.offsetWz = z
			lsq = 0
		else
			lsq = ( vehicle.aiveChain.offsetWx - x )^2 + ( vehicle.aiveChain.offsetWz - z )^2
		end
		if type( vehicle.aiveChain.angleStatistics ) ~= "table" then
			vehicle.aiveChain.angleStatistics = {}
		end
		
		if lsq > vehicle.aiveChain.nodes[vehicle.aiveChain.chainStep0+1].distance^2 then
			vehicle.aiveChain.offsetWx = x
			vehicle.aiveChain.offsetWz = z
			vehicle.aiveChain.angleSum = nil
			local tmp2 = table.getn( vehicle.aiveChain.angleStatistics )
			if tmp2 > 1000 then
				local tmp1 = {}
				for i=1,1000 do
					table.insert(tmp1,vehicle.aiveChain.angleStatistics[tmp2-1000+i])
				end
				vehicle.aiveChain.angleStatistics = tmp1
			end
			
			local steps        = 80
			local stepDist     = 2/steps
			local first        = math.max( 1, 0.1 / stepDist )
			local offsetInside = stepDist
			
			if vehicle.aiveChain.leftActive	then
				offsetInside = -offsetInside
			end
			
			local dist = nil
			for l=first,steps do
				local b, t = 0, 0
				for j,toolParam in pairs(vehicle.aiveChain.toolParams) do
					for i=1,vehicle.aiveChain.chainStep0 do
						local xp,_,zp = AutoSteeringEngine.getChainPoint( vehicle, i, toolParam )		
						local xc,_,zc = AutoSteeringEngine.getChainPoint( vehicle, i+1, toolParam )		
						local bj, tj  = AutoSteeringEngine.getFruitArea( vehicle, xp, zp, xc, zc, l * offsetInside, toolParam.i )			
						b = b + bj
						t = t + tj
					end
				end
				
				if b > 0 then
					dist = l * stepDist
					break
				end
			end
			
			if     dist == nil then
				vehicle.aiveChain.offsetAvg = nil
			else
				if vehicle.aiveChain.offsetAvg == nil then
					vehicle.aiveChain.offsetAvg = dist 
				else
					vehicle.aiveChain.offsetAvg = vehicle.aiveChain.offsetAvg + 0.5 * ( dist - vehicle.aiveChain.offsetAvg )
				end			
				
				local target = vehicle.aiveChain.offsetStd
				if     vehicle.aiveChain.offsetAvg > target + stepDist then
					vehicle.aiveChain.safetyFactor = math.max(  0, vehicle.aiveChain.safetyFactor - 0.1 )
				elseif vehicle.aiveChain.offsetAvg < target - stepDist then
					vehicle.aiveChain.safetyFactor = math.min( 10, vehicle.aiveChain.safetyFactor + 0.1 )
				end
			end			
		end
		
		table.insert(vehicle.aiveChain.angleStatistics,a)
		
		if vehicle.aiveChain.angleSum == nil then
			vehicle.aiveChain.angleSum   = 0
			vehicle.aiveChain.angleCnt   = 0
			vehicle.aiveChain.angleSumSq = 0
			for _,a in pairs(vehicle.aiveChain.angleStatistics) do
				vehicle.aiveChain.angleSum   = vehicle.aiveChain.angleSum + a
				vehicle.aiveChain.angleCnt   = vehicle.aiveChain.angleCnt + 1
				vehicle.aiveChain.angleSumSq = vehicle.aiveChain.angleSumSq + a*a
			end
		else
			vehicle.aiveChain.angleSum   = vehicle.aiveChain.angleSum + a
			vehicle.aiveChain.angleCnt   = vehicle.aiveChain.angleCnt + 1
			vehicle.aiveChain.angleSumSq = vehicle.aiveChain.angleSumSq + a*a
		end
		
		vehicle.aiveChain.angleAvg = vehicle.aiveChain.angleSum / vehicle.aiveChain.angleCnt
		vehicle.aiveChain.angleVar = vehicle.aiveChain.angleSumSq - vehicle.aiveChain.angleCnt * vehicle.aiveChain.angleAvg * vehicle.aiveChain.angleAvg
		
		-- rounding!!!
		if vehicle.aiveChain.angleCnt <= 1 or vehicle.aiveChain.angleVar <= 0 then
			vehicle.aiveChain.angleStd = 0
		else
			vehicle.aiveChain.angleStd = math.sqrt( vehicle.aiveChain.angleVar / ( vehicle.aiveChain.angleCnt - 1 ) )
		end
		vehicle.aiveChain.safetyFactor = math.max( vehicle.aiveChain.angleStd * 10, vehicle.aiveChain.safetyFactor )
		
	elseif vehicle.aiveChain.offsetWx ~= nil and not vehicle.aiveChain.inField then
		vehicle.aiveChain.offsetWx = nil
		vehicle.aiveChain.offsetWz = nil
	end

	return vehicle.aiveChain.isAtEnd 
end
		
------------------------------------------------------------------------
-- checkChain
------------------------------------------------------------------------
function AutoSteeringEngine.checkChain( vehicle, iRefNode, wheelBase, maxSteering, widthOffset, turnOffset, isInverted, useFrontPacker, speedFactor )

	local resetTools = false
	
	if vehicle.isReverseDriving then
		isInverted = not isInverted
	end

	if     vehicle.aiveChain == nil
			or vehicle.aiveChain.resetCounter == nil
			or vehicle.aiveChain.resetCounter < AutoSteeringEngine.resetCounter then
		AutoSteeringEngine.initChain( vehicle, iRefNode, wheelBase, maxSteering, widthOffset, turnOffset )
	else
		vehicle.aiveChain.wheelBase   = wheelBase
		vehicle.aiveChain.invWheelBase = 1 / wheelBase
		vehicle.aiveChain.maxSteering = maxSteering
	end	

	AutoSteeringEngine.currentSteeringAngle( vehicle, isInverted )

	if getfenv(0)["modSoilMod2"] == nil then
		if vehicle.aiveChain.useFrontPacker ~= nil and vehicle.aiveChain.useFrontPacker ~= useFrontPacker then
			resetTools = true
		end
	else
		vehicle.aiveChain.useFrontPacker = false
	end

	if maxSteering ~= nil and 1E-4 < maxSteering and maxSteering < 0.5 * math.pi then
		vehicle.aiveChain.radius    = wheelBase / math.tan( maxSteering )
	else
		vehicle.aiveChain.radius    = 5
	end
	
	vehicle.aiveChain.isInverted	   = isInverted
	vehicle.aiveChain.useFrontPacker = useFrontPacker 
	
	AutoSteeringEngine.checkTools1( vehicle, resetTools )
	vehicle.aiveChain.wantedSpeed    = speedFactor * AutoSteeringEngine.getToolsSpeedLimit( vehicle )
	
end

------------------------------------------------------------------------
-- getWidthOffset
------------------------------------------------------------------------
function AutoSteeringEngine.getWidthOffsetStd( vehicle, width )
	local scale  = Utils.getNoNil( vehicle.aiTurnWidthScale, 0.95 )
	local diff   = Utils.getNoNil( vehicle.aiTurnWidthMaxDifference, 0.5 )
	return math.max( AIVEGlobals.testOutside, 0.5 * ( width - math.max(width * scale, width - diff) ) )
end
------------------------------------------------------------------------
-- getWidthOffset
------------------------------------------------------------------------
function AutoSteeringEngine.getWidthOffset( vehicle, width, widthOffset, widthFactor )
	return -widthOffset
end

------------------------------------------------------------------------
-- addToolsRec
------------------------------------------------------------------------
function AutoSteeringEngine.addToolsRec( vehicle, obj )
	if obj ~= nil and obj.attachedImplements ~= nil then
		for _, implement in pairs(obj.attachedImplements) do
			if      implement.object                    ~= nil 
					and implement.object.attacherJoint      ~= nil 
					and implement.object.attacherJoint.node ~= nil then					
				local iCultivator = AutoSteeringEngine.addTool( vehicle,implement )
				if      vehicle.aiveChain.useFrontPacker
						and iCultivator > 0
						and SpecializationUtil.hasSpecialization(Cultivator, implement.object.specializations) then
				--vehicle.aiveChain.tools[iCultivator].aiTerrainDetailChannel1 = g_currentMission.ploughChannel
				--vehicle.aiveChain.tools[iCultivator].aiTerrainDetailChannel2 = -1
				--vehicle.aiveChain.tools[iCultivator].aiTerrainDetailChannel3 = -1
					AutoSteeringEngine.registerFrontPacker( implement.object )
				end
				AutoSteeringEngine.addToolsRec( vehicle, implement.object )
			end
		end	
	end
end

------------------------------------------------------------------------
-- checkTools
------------------------------------------------------------------------
function AutoSteeringEngine.checkTools1( vehicle, reset )

	if vehicle.aiveChain ~= nil and ( vehicle.aiveChain.tools == nil or reset ) then
		AutoSteeringEngine.resetFrontPacker( vehicle )
		AutoSteeringEngine.deleteTools( vehicle )
		vehicle.aiveChain.collisionDists = nil
		vehicle.aiveChain.lastBestAngle = nil
		vehicle.aiveChain.savedAngles   = nil
		
		for _,implement in pairs(vehicle.aiImplementList) do
			AutoSteeringEngine.addTool(vehicle,implement)
		end
		
	--AutoSteeringEngine.addToolsRec( vehicle, vehicle )
	--
	--if vehicle.aiveChain.tools == nil then
	--	AutoSteeringEngine.addTool(vehicle,nil,vehicle,vehicle.aiveChain.refNode)
	--end
	--
		if vehicle.aiveChain.tools == nil then
			vehicle.aiveChain.tools = {}
		end
	end
end
function AutoSteeringEngine.checkTools( vehicle, reset )
	
	AutoSteeringEngine.checkTools1( vehicle, reset )
	
	local dx,dz,zb = 0,0,0
	
	if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		dz = -99
		zb =  99
		for i=1,vehicle.aiveChain.toolCount do
			local doNotIgnore = true
			if vehicle.aiveChain.tools[i].ignoreAI then
				doNotIgnore = false
			end
		--if AIVEFrontPackerT[vehicle.aiveChain.tools[i].obj] then
		--if vehicle.aiveHas.sowingMachine and vehicle.aiveChain.tools[i].isCultivator then
		--	doNotIgnore = false
		--end
			if doNotIgnore then
				local _,_,zDist   = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, vehicle.aiveChain.tools[i].refNode )
				
				local dx1 = vehicle.aiveChain.tools[i].xl-vehicle.aiveChain.tools[i].xr
				local dz1 = vehicle.aiveChain.tools[i].z  + zDist
				local zb1 = vehicle.aiveChain.tools[i].zb + zDist
				if vehicle.aiveChain.tools[i].isSprayer and zb1 < dz1 then
					zb1 = dz1 -1
				end
				
				if dx < dx1 then dx = dx1 end
				if dz < dz1 then dz = dz1 end
				if zb > zb1 then zb = zb1 end
				
			end
		--local wo = AutoSteeringEngine.getWidthOffsetStd( vehicle, dx )
			local wo = vehicle.aiveChain.offsetZ
			if wo ~= nil and wo ~= 0 then
				dx = 0.5 * dx - wo
			else
				dx = 0.5 * dx
			end
		end
	end
	
	return dx,dz,zb
end

------------------------------------------------------------------------
-- getToolsSpeedLimit
------------------------------------------------------------------------
function AutoSteeringEngine.getToolsSpeedLimit( vehicle )

	local speedLimit = 25
	if vehicle.cruiseControl ~= nil and vehicle.cruiseControl.maxSpeed ~= nil then
		speedLimit = vehicle.cruiseControl.maxSpeed
	end

	local s, c = vehicle:getSpeedLimit()

	if speedLimit > s then
		speedLimit = s
	end
	
	if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		for i=1,vehicle.aiveChain.toolCount do
			object = vehicle.aiveChain.tools[i].obj
			if object.checkSpeedLimit and speedLimit > object.speedLimit then
				speedLimit = object.speedLimit
			end
		end
	end
	
	return speedLimit
end

------------------------------------------------------------------------
-- getWantedSpeed
------------------------------------------------------------------------
function AutoSteeringEngine.getWantedSpeed( vehicle, speedLevel )
	if vehicle.aiveChain.wantedSpeed == nil then
		vehicle.aiveChain.wantedSpeed = 0.8 *  AutoSteeringEngine.getToolsSpeedLimit( vehicle )
	else
		vehicle.aiveChain.wantedSpeed = math.min( vehicle.aiveChain.wantedSpeed, AutoSteeringEngine.getToolsSpeedLimit( vehicle ) )
	end
	if vehicle.aiveChain.wantedSpeed < 5 then
		vehicle.aiveChain.wantedSpeed = 5
	end
	
	local wantedSpeed  = 12
		
	if     speedLevel == nil 
			or speedLevel == 2 then
		wantedSpeed = vehicle.aiveChain.wantedSpeed
	elseif speedLevel == 4 then
		wantedSpeed = math.min( 7, vehicle.aiveChain.wantedSpeed )
	elseif speedLevel == 5 then
		wantedSpeed = 1
	elseif speedLevel == 0 then
		wantedSpeed = 0
	elseif speedLevel == 1 then
		wantedSpeed  = math.max( 7, 0.667 * vehicle.aiveChain.wantedSpeed )
	end
				
	return wantedSpeed
end

------------------------------------------------------------------------
-- hasTools
------------------------------------------------------------------------
function AutoSteeringEngine.hasTools( vehicle )
	if      vehicle.aiveChain     ~= nil 
			and vehicle.aiveChain.leftActive  ~= nil 
			and vehicle.aiveChain.toolCount ~= nil 
			and vehicle.aiveChain.toolCount >= 1 then 
		for _,t in pairs(vehicle.aiveChain.tools) do
			if not (t.ignoreAI) then
				return true
			end
		end
	end
	return false 
end

------------------------------------------------------------------------
-- initTools
------------------------------------------------------------------------
function AutoSteeringEngine.initTools( vehicle, maxLooking, leftActive, widthOffset, safetyFactor, headlandDist, collisionDist, turnMode )

	isTurnMode7 = ( vehicle.aiveChain.turnMode == "7" )
	
	if isTurnMode7 then
		if     vehicle.aiveChain.leftActive    == nil or vehicle.aiveChain.leftActive    ~= leftActive
				or vehicle.aiveChain.isTurnMode7 == nil or vehicle.aiveChain.isTurnMode7 ~= isTurnMode7 then
			AutoSteeringEngine.setChainStatus( vehicle, 1, AIVEStatus.initial )
		end
	elseif vehicle.aiveChain.leftActive == nil or vehicle.aiveChain.leftActive ~= leftActive
			or vehicle.aiveChain.headland == nil or vehicle.aiveChain.headland ~= headlandDist then
		AutoSteeringEngine.setChainStatus( vehicle, 1, AIVEStatus.initial )
	end
	
	vehicle.aiveChain.isTurnMode7 = isTurnMode7
	
--vehicle.aiveChain.widthDec    = AIVEGlobals.widthDec * safetyFactor
--if vehicle.aiveChain.safetyFactor == nil then
--	vehicle.aiveChain.safetyFactor = safetyFactor
--end
--vehicle.aiveChain.widthDec    = AIVEGlobals.widthDec * vehicle.aiveChain.safetyFactor
	vehicle.aiveChain.widthDec    = 0
	vehicle.aiveChain.leftActive  = leftActive
	vehicle.aiveChain.headland    = headlandDist
	vehicle.aiveChain.turnMode    = turnMode
	vehicle.aiveChain.maxLooking  = maxLooking	
	vehicle.aiveChain.minLooking  = math.min( math.max( AIVEGlobals.minLooking, maxLooking * AIVEGlobals.minLkgFactor ), 0.5 * vehicle.aiveChain.maxLooking )
	
	local maxRot = 0.5*math.pi
	if     vehicle.aiveChain.turnMode == "C"
			or vehicle.aiveChain.turnMode == "L"
			or vehicle.aiveChain.turnMode == "K"
			or vehicle.aiveChain.turnMode == "7" then
		maxRot = AIVEGlobals.maxRotationC
	else 
		maxRot = AIVEGlobals.maxRotationU
	end 
	
	if vehicle.aiveChain.leftActive then
		vehicle.aiveChain.minRotation = -maxRot 
		vehicle.aiveChain.maxRotation =  math.pi*2/3
	else
		vehicle.aiveChain.minRotation = -math.pi*2/3
		vehicle.aiveChain.maxRotation =  maxRot 
	end
	
	if collisionDist > 1 then
		vehicle.aiveChain.collisionDist = collisionDist 
	else
		vehicle.aiveChain.collisionDist =  0
	end
	vehicle.aiveChain.toolParams  = {}
		
	local currentSeed = nil
	if vehicle.aiveHas.sowingMachine then
		for _,tool in pairs(vehicle.aiveChain.tools) do
			if tool.isSowingMachine then
				currentSeed = tool.obj.seeds[tool.obj.currentSeed]
			end
		end
	end
	
	if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then	
		for i,tool in pairs(vehicle.aiveChain.tools) do
			if tool.obj.aiForceTurnNoBackward then
				vehicle.aiveChain.tools[i].aiForceTurnNoBackward = true
			end
		end
	
		local xa = {}
		local xo = {}
		for i=1,vehicle.aiveChain.toolCount do
		
			local skip      = false
			local skipOther = false
			if vehicle.aiveChain.tools[i].ignoreAI then
				skip      = true
				skipOther = true
			end

			if      vehicle.aiveHas.sowingMachine
					and not ( vehicle.aiveChain.tools[i].isSowingMachine )
					and ( ( vehicle.aiveChain.tools[i].isCultivator and not AutoSteeringEngine.hasFrontPacker( vehicle ) )
						 or vehicle.aiveChain.tools[i].isPlough
						 or vehicle.aiveChain.tools[i].isSprayer )
					 then
				skip      = true
				skipOther = true
		--elseif  vehicle.aiveHas.plough
		--		and not ( vehicle.aiveChain.tools[i].isPlough )
		--		and vehicle.aiveChain.tools[i].isCultivator then
		--	skip      = true
		--	skipOther = true
			end
			
		--if      not ( vehicle.aiveChain.tools[i].isCombine )
		--		and not ( vehicle.aiveChain.tools[i].isMower )
		--		and not ( vehicle.aiveChain.tools[i].isWindrower )
		--		and not ( vehicle.aiveChain.tools[i].isTedder )
		--		and vehicle.aiveChain.tools[i].aiTerrainDetailRequiredMask <= 0
		--		and vehicle.aiveChain.tools[i].aiRequiredFruitType         == FruitUtil.FRUITTYPE_UNKNOWN then
		--	skip      = true
		--	skipOther = true
		--end
			
			if not skip or not skipOther then
				for j=1,vehicle.aiveChain.toolCount do
					if i ~= j then
						if     ( vehicle.aiveChain.tools[i].isCombine      
									or vehicle.aiveChain.tools[i].isPlough       
									or vehicle.aiveChain.tools[i].isCultivator   
									or vehicle.aiveChain.tools[i].isSowingMachine
									or vehicle.aiveChain.tools[i].isSprayer      
									or vehicle.aiveChain.tools[i].isMower        
									or vehicle.aiveChain.tools[i].isTedder       
									or vehicle.aiveChain.tools[i].isWindrower      
									or vehicle.aiveChain.tools[i].outTerrainDetailChannel >= 0
									--or ( vehicle.aiveChain.tools[i].specialType ~= nil and vehicle.aiveChain.tools[i].specialType ~= "" ) 
									 )
								and not ( vehicle.aiveChain.tools[j].ignoreAI )
								and vehicle.aiveChain.tools[i].isCombine       == vehicle.aiveChain.tools[j].isCombine      
								and vehicle.aiveChain.tools[i].isPlough        == vehicle.aiveChain.tools[j].isPlough       
								and vehicle.aiveChain.tools[i].isCultivator    == vehicle.aiveChain.tools[j].isCultivator   
								and vehicle.aiveChain.tools[i].isSowingMachine == vehicle.aiveChain.tools[j].isSowingMachine
								and vehicle.aiveChain.tools[i].isSprayer       == vehicle.aiveChain.tools[j].isSprayer      
								and vehicle.aiveChain.tools[i].isMower         == vehicle.aiveChain.tools[j].isMower        
								and vehicle.aiveChain.tools[i].isTedder        == vehicle.aiveChain.tools[j].isTedder        
								and vehicle.aiveChain.tools[i].isWindrower     == vehicle.aiveChain.tools[j].isWindrower        
								and vehicle.aiveChain.tools[i].outTerrainDetailChannel == vehicle.aiveChain.tools[j].outTerrainDetailChannel 
								--and vehicle.aiveChain.tools[i].specialType == vehicle.aiveChain.tools[j].specialType
								then
							
							local k = i
							for l=1,2 do
								if xa[k] == nil then	
									local tool = vehicle.aiveChain.tools[k]
									local xOffset,_,_ = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode, tool.refNode )
									for m=1,table.getn(tool.marker) do
										local xxx,_,_ = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode, tool.marker[m] )
										xxx = xxx - xOffset
										if tool.invert then xxx = -xxx end
										if xa[k] == nil then
											xa[k] = xxx
											xo[k] = xxx
										elseif vehicle.aiveChain.leftActive then
											if xa[k] < xxx then xa[k] = xxx end
											if xo[k] > xxx then xo[k] = xxx end
										else
											if xa[k] > xxx then xa[k] = xxx end
											if xo[k] < xxx then xo[k] = xxx end
										end
									end
									local xxx = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.refNode )
									xa[k]  = xa[k] + xxx
									xo[k]  = xo[k] + xxx
								end
								
								k = j
							end
							
							if vehicle.aiveChain.leftActive then
								skip      = skip      or ( xa[i] + 0.2 < xa[j] )
								skipOther = skipOther or ( xo[i] - 0.2 > xo[j] )
							else
								skip      = skip      or ( xa[i] - 0.2 > xa[j] )
								skipOther = skipOther or ( xo[i] + 0.2 < xo[j] )
							end					
							
							if skip and skipOther then
								break
							end
						end
					end
				end
			end
			
			local tp = AutoSteeringEngine.getSteeringParameterOfTool( vehicle, i, maxLooking, widthOffset )			
			tp.skip      = skip
			tp.skipOther = skipOther
			vehicle.aiveChain.toolParams[i] = tp
		end
		
		--for i=1,vehicle.aiveChain.toolCount do
		--	if not ( vehicle.aiveChain.tools[i].aiForceTurnNoBackward ) and not ( vehicle.aiveChain.toolParams[i].skip ) then 
		--		local tp = AutoSteeringEngine.getSteeringParameterOfTool( vehicle, i, maxLooking, widthOffset, 0 )
		--		tp.skip = false 
		--		vehicle.aiveChain.toolParams[table.getn(vehicle.aiveChain.toolParams)+1] = tp
		--	end 
		--end 
	end	
	
	AutoSteeringEngine.initSteering( vehicle )
end

function AutoSteeringEngine.reinitToolsWithWidthFactor( vehicle, maxLooking, widthOffset, widthFactor )

	if vehicle.aiveChain.toolParams ~= nil then
		local tpNew = {}
		for i=1,table.getn( vehicle.aiveChain.toolParams ) do
			local tp = AutoSteeringEngine.getSteeringParameterOfTool( vehicle, vehicle.aiveChain.toolParams[i].i, maxLooking, widthOffset, widthFactor )
			tp.skip  = vehicle.aiveChain.toolParams[i].skip
			tpNew[vehicle.aiveChain.toolParams[i].i] = tp
		end
		vehicle.aiveChain.toolParams = tpNew
	end
end

------------------------------------------------------------------------
-- AutoSteeringEngineCallback
------------------------------------------------------------------------
AutoSteeringEngineCallback = {}
function AutoSteeringEngineCallback.create( vehicle )
	local self = {}
	self.vehicle = vehicle
	self.raycast = AutoSteeringEngineCallback.raycast
	self.overlap = AutoSteeringEngineCallback.overlap
	return self
end

------------------------------------------------------------------------
-- AutoSteeringEngineCallback:raycast
------------------------------------------------------------------------
function AutoSteeringEngineCallback:raycast( transformId, x, y, z, distance )
	
	if transformId == g_currentMission.terrainRootNode or ( transformId == nil and distance > 1 ) then
		return true
	end

	local other  = nil
	local nodeId = transformId
	repeat
		other  = g_currentMission.nodeToVehicle[nodeId]
		if other == nil then
			nodeId = getParent( nodeId )	
		end
	until other ~= nil or nodeId == nil or nodeId == 0
	
	if     other == nil then
	--	print("static  "..tostring(getName(transformId)).." @ x: "..tostring(x).." z: "..tostring(z))
		self.vehicle.aiveHasCollision = true

		if AIVECollisionPoints == nil then
			AIVECollisionPoints = {}
		end
		local p = {}
		p.x = x
		p.y = y 
		p.z = z
		table.insert( AIVECollisionPoints, p )
		
		return false
		
	elseif not( other == self.vehicle
					 or self.vehicle.trafficCollisionIgnoreList[transformId]
					 or self.vehicle.trafficCollisionIgnoreList[parent]
					 or self.vehicle.trafficCollisionIgnoreList[parentParent]
					 or AutoSteeringEngine.isAttachedImplement( self.vehicle, object ) ) then
	--	print("vehicle  "..tostring(getName(transformId)))
	--	self.vehicle.aiveHasCollision = true
	--	return false
	end

	return true	
end


------------------------------------------------------------------------
-- AutoSteeringEngineCallback:overlap
------------------------------------------------------------------------
function AutoSteeringEngineCallback:overlap( transformId )

	local parent = getParent(transformId)
	
	if     transformId         == g_currentMission.terrainRootNode 
			or parent              == g_currentMission.terrainRootNode then
		return true
	end

	local parentParent = getParent(parent)	
	local other = g_currentMission.nodeToVehicle[transformId]
	if other == nil then
		other = g_currentMission.nodeToVehicle[parent]
	end
	if other == nil then
		other = g_currentMission.nodeToVehicle[parentParent]
	end			
	
	if     other == nil 
			or not( other == self.vehicle
					 or self.vehicle.trafficCollisionIgnoreList[transformId]
					 or self.vehicle.trafficCollisionIgnoreList[parent]
					 or self.vehicle.trafficCollisionIgnoreList[parentParent]
					 or AutoSteeringEngine.isAttachedImplement( self.vehicle, object ) ) then
		self.vehicle.aiveHasCollision = true
		return false
	end

	return true	
end


------------------------------------------------------------------------
-- hasCollisionHelper
------------------------------------------------------------------------
function AutoSteeringEngine.hasCollisionHelper( vehicle, wx, wz, dx, dz, l, doBreak )
	if boBreak and vehicle.aiveHasCollision then
		return
	end
	
	if     not AutoSteeringEngine.checkField( vehicle, wx + l * dx, wz + l * dz )
			or not AutoSteeringEngine.checkField( vehicle, wx , wz )then										
		local wy = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, wx, 1, wz) 
		local dy = ( getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, wx + l * dx, 1, wz + l * dz) - wy ) / l
		local hasCollision = vehicle.aiveHasCollision
		vehicle.aiveHasCollision = false
		for y=0.5,1.5,AIVEGlobals.colliStep do					
			if vehicle.aiveHasCollision then
				break
			end
			raycastAll(wx, wy + y, wz, dx, dy, dz, "raycast", l, vehicle.aiveCallback )--, nil, AIVEGlobals.colliMask )
		end
		if hasCollision then
			vehicle.aiveHasCollision = true
		end
	end
end

------------------------------------------------------------------------
-- hasCollision
------------------------------------------------------------------------
function AutoSteeringEngine.hasCollision( vehicle, nodeId )
	if vehicle.aiveChain.collisionDist < 1 then return false end
	if AIVEGlobals.colliMask <= 0 then return false end
	if vehicle.aiveChain == nil or vehicle.aiveChain.headlandNode == nil then return false end
	if nodeId == nil then nodeId = vehicle.aiveChain.headlandNode end
	
	if vehicle.aiveChain.collisionDists == nil then
		vehicle.aiveChain.collisionDists = {}
	end
	
	if vehicle.aiveChain.collisionDists[nodeId] == nil then
		if vehicle.aiveCallback == nil then
			vehicle.aiveCallback = AutoSteeringEngineCallback.create( vehicle )
		end
		vehicle.aiveHasCollision = false
	
		if     not AutoSteeringEngine.isFieldAhead( vehicle,  vehicle.aiveChain.collisionDist, nodeId )
				or not AutoSteeringEngine.isFieldAhead( vehicle, -vehicle.aiveChain.collisionDist, nodeId ) then
			local r0 = 1.5
			if vehicle.aiveChain.radius ~= nil then
				r0 = math.max( r0, vehicle.aiveChain.radius )
			end
			if     vehicle.aiveChain.turnMode == "A"
					or vehicle.aiveChain.turnMode == "L" then
				r0 = r0 + math.max( 3, Utils.getNoNil( vehicle.aiveChain.wheelBase, 0 ) + 2 )
			end
			if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
				for _,tool in pairs(vehicle.aiveChain.tools) do
					r0 = math.max( r0, math.max( tool.xl, tool.xr ) )
				end
			end
			
			local wx, wy, wz = getWorldTranslation( nodeId )
			
			local cx1, cx2, cz1, cz2
			
			if AIVECollisionPoints ~= nil and table.getn( AIVECollisionPoints ) > 0 then
				local cl = Utils.vector2LengthSq( r0, vehicle.aiveChain.collisionDist )
			
				for _,p in pairs( AIVECollisionPoints ) do
					--print("x: "..tostring(wx).." z: "..tostring(wz).." p.x: "..tostring(p.x).." p.z: "..tostring(p.z))
					if Utils.vector2LengthSq( wx - p.x, wz - p.z ) <= cl then
						local lx, ly, lz = worldToLocal( nodeId, wx, wy, wz )
						local ax
						if     lx > 1.5 then
							ax = lx							
						elseif lx < -1.5 then
							ax = -lx
						else
							ax = 0
						end						
						local az = math.abs( lz )
						--print("ax: "..tostring(ax).." az: "..tostring(az))
						if ax < 1 and az < 1 then
							--print("found static 1")
							vehicle.aiveHasCollision = true
							break
						elseif  az <= vehicle.aiveChain.collisionDist 
						    and ( ax < 1E-3 or ax <= az * r0 / vehicle.aiveChain.collisionDist ) then
							--print("found static 2")
							vehicle.aiveHasCollision = true
							break
						end
					end
				end
			end
			
			if not vehicle.aiveHasCollision then
				--local maxCl = Utils.vector2Length( r0 + 1.5, vehicle.aiveChain.collisionDist )
				-- left & right
				for f=0,1,AIVEGlobals.colliStep do
					local r          = f * r0 
					local cl         = math.sqrt( r * r + vehicle.aiveChain.collisionDist * vehicle.aiveChain.collisionDist )
					cx1,_,cz1  = localDirectionToWorld( vehicle.aiveChain.headlandNode, r / cl, 0, vehicle.aiveChain.collisionDist / cl )
					cx2,_,cz2  = localDirectionToWorld( vehicle.aiveChain.headlandNode,-r / cl, 0, vehicle.aiveChain.collisionDist / cl )
					--cl = math.min( cl, maxCl )
													
					AutoSteeringEngine.hasCollisionHelper( vehicle, wx, wz, cx1, cz1, cl )
					AutoSteeringEngine.hasCollisionHelper( vehicle, wx, wz,-cx1,-cz1, cl )
					AutoSteeringEngine.hasCollisionHelper( vehicle, wx, wz, cx2, cz2, cl )
					AutoSteeringEngine.hasCollisionHelper( vehicle, wx, wz,-cx2,-cz2, cl )					
				end

				-- the T (front & back)
				cx1,_,cz1  = localDirectionToWorld( vehicle.aiveChain.headlandNode, 1, 0, 0 )
				cx2,_,cz2  = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, 1 )
				for z=-3,0,AIVEGlobals.colliStep do
					local vx, vz
					vx = wx + ( z + vehicle.aiveChain.collisionDist ) * cx2 - r0 * cx1
					vz = wz + ( z + vehicle.aiveChain.collisionDist ) * cz2 - r0 * cz1 					
					AutoSteeringEngine.hasCollisionHelper( vehicle, vx, vz, cx1, cz1, r0 + r0 )
					vx = wx - ( z + vehicle.aiveChain.collisionDist ) * cx2 - r0 * cx1                   
					vz = wz - ( z + vehicle.aiveChain.collisionDist ) * cz2 - r0 * cz1                   
					AutoSteeringEngine.hasCollisionHelper( vehicle, vx, vz, cx1, cz1, r0 + r0 )
				end
				
				-- the middle (vehicle width)
				for x=-1.5,1.5,AIVEGlobals.colliStep do
					vx = wx + x * cx1
					vz = wz + x * cz1 																
					AutoSteeringEngine.hasCollisionHelper( vehicle, vx, vz, cx2, cz2, vehicle.aiveChain.collisionDist )
					AutoSteeringEngine.hasCollisionHelper( vehicle, vx, vz,-cx2,-cz2, vehicle.aiveChain.collisionDist )
				end
			end
		end
		
		vehicle.aiveChain.collisionDists[nodeId] = vehicle.aiveHasCollision
	end
	
	return vehicle.aiveChain.collisionDists[nodeId]
end

------------------------------------------------------------------------
-- isAttachedImplement
------------------------------------------------------------------------
function AutoSteeringEngine.isAttachedImplement( vehicle, object )
	if vehicle == nil or object == nil then
		return false
	end
	if vehicle == object then
		return true
	end
	if vehicle.attachedImplements == nil then
		return false
	end	
	for _, implement in pairs(vehicle.attachedImplements) do
		if AutoSteeringEngine.isAttachedImplement( implement.object, object ) then
			return true
		end
	end		
	return false
end

------------------------------------------------------------------------
-- localToWorld
------------------------------------------------------------------------
function AutoSteeringEngine.localToWorld( reference, node, x, z, inverted )
	local one        = 1
	if inverted then
		one = -1
	end
	local xDx,_,xDz = localDirectionToWorld( reference, x * one, 0, 0 )
	local zDx,_,zDz = localDirectionToWorld( reference, 0, 0, z * one )
	local wx,wy,wz  = getWorldTranslation( node )
	
	return wx + xDx + zDx, wy, wz + xDz + zDz
end

------------------------------------------------------------------------
-- localToWorld
------------------------------------------------------------------------
function AutoSteeringEngine.toolLocalToWorld( vehicle, toolIndex, node, x, z )
	local tool = vehicle.aiveChain.tools[toolIndex]
	if tool.steeringAxleNode == nil then
		return AutoSteeringEngine.localToWorld( vehicle.aiveChain.refNode, node, x, z, false )
	end
	return AutoSteeringEngine.localToWorld( tool.steeringAxleNode, node, x, z, tool.invert )
end
------------------------------------------------------------------------
-- hasLeftFruits
------------------------------------------------------------------------
function AutoSteeringEngine.hasLeftFruits( vehicle )
	
	if not vehicle.isServer then return false end
	
	if AIVEGlobals.useFBB123 > 0 then
		local wx,_,wz = AutoSteeringEngine.getAiWorldPosition( vehicle )
		if vehicle.aiveChain.fbb3 ~= nil and Utils.vector2LengthSq( vehicle.aiveChain.fbb3.x - wx, vehicle.aiveChain.fbb3.z - wz ) < 0.01 then
			return vehicle.aiveChain.fbb3.d
		end
	end
			
	local fruitsDetected = false
	
	if      vehicle.aiveChain      ~= nil 
			and vehicle.aiveChain.leftActive   ~= nil 
			and vehicle.aiveChain.toolCount  ~= nil 
			and vehicle.aiveChain.toolCount  >= 1 
			and vehicle.aiveChain.toolParams ~= nil 
			and vehicle.aiveChain.toolCount  == table.getn( vehicle.aiveChain.toolParams ) then
		for i = 1,vehicle.aiveChain.toolCount do	
			local toolParam = vehicle.aiveChain.toolParams[i]
			local tool      = vehicle.aiveChain.tools[toolParam.i]				
			local front     = math.min( toolParam.zReal, toolParam.zBack )
			local back      = front - 2
			
			local dx,dz
			if tool.steeringAxleNode == nil then
				dx,_,dz = localDirectionToWorld( vehicle.aiveChain.refNode, 0, 0, 1 )
			elseif tool.invert then
				dx,_,dz = localDirectionToWorld( tool.steeringAxleNode, 0, 0, -1 )
			else
				dx,_,dz = localDirectionToWorld( tool.steeringAxleNode, 0, 0, 1 )
			end

			local w = math.min( 2, toolParam.width * 0.8 )
			local ofs, idx			
			if vehicle.aiveChain.leftActive	then
				ofs = w-toolParam.offset 
				idx = toolParam.nodeLeft 
			else
				ofs = toolParam.offset-w
				idx = toolParam.nodeRight
			end
			
			w = w + w
		
			if vehicle.aiveChain.leftActive then
				w = -w
			end

			local xw1,y,zw1 = AutoSteeringEngine.toolLocalToWorld( vehicle, toolParam.i, idx, ofs, back )
			local xw2,y,zw2 = AutoSteeringEngine.toolLocalToWorld( vehicle, toolParam.i, idx, ofs, front )
			
			local lx1,lz1,lx2,lz2,lx3,lz3,lx4,lz4
			dist = front - back
			repeat 
				xw2 = xw1 + dist * dx
				zw2 = zw1 + dist * dz
				lx1,lz1,lx2,lz2,lx3,lz3 = AutoSteeringEngine.getParallelogram( xw1,zw1,xw2,zw2, w, true )
				lx4 = lx3 + lx2 - lx1
				lz4 = lz3 + lz2 - lz1
				
				dist = dist - 0.5
			until dist < 0.5
					or ( vehicle.aiveChain.headland >= 1
					 and ( AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
 						  or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
	 						or AutoSteeringEngine.isChainPointOnField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )
					or ( vehicle.aiveChain.headland < 1
					 and ( AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
					    or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
					    or AutoSteeringEngine.checkField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )

			local lx5 = 0.25 * ( lx1 + lx2 + lx3 + lx4 )
			local lz5 = 0.25 * ( lz1 + lz2 + lz3 + lz4 )
			
			if vehicle.aiveChain.headland < 1 then
				if     AutoSteeringEngine.checkField( vehicle, lx1, lz1 )
						or AutoSteeringEngine.checkField( vehicle, lx2, lz2 )
						or AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
						or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
						or AutoSteeringEngine.checkField( vehicle, lx5, lz5 ) then
					if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, true }
						fruitsDetected = true
						break
					end			
					vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, false }
				end			
			else
				if     AutoSteeringEngine.isChainPointOnField( vehicle, lx1, lz1 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx2, lz2 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx5, lz5 ) then
					if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, true }
						fruitsDetected = true
						break
					end			
					vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, false }
				end			
			end			
		end
	end
	
	if AIVEGlobals.useFBB123 > 0 then
		vehicle.aiveChain.fbb3 = { x=wx, z=wz, d=fruitsDetected }
	end
	
	return fruitsDetected
end

------------------------------------------------------------------------
-- hasLeftFruits
------------------------------------------------------------------------
function AutoSteeringEngine.hasFruitsInFront( vehicle )
	
	if not vehicle.isServer then return false end
	
	if AIVEGlobals.useFBB123 > 0 then
		local wx,_,wz = AutoSteeringEngine.getAiWorldPosition( vehicle )
		if vehicle.aiveChain.fbb2 ~= nil and Utils.vector2LengthSq( vehicle.aiveChain.fbb2.x - wx, vehicle.aiveChain.fbb2.z - wz ) < 0.09 then
			return vehicle.aiveChain.fbb2.d
		end
	end
			
	local fruitsDetected = false
	
	if      vehicle.aiveChain      ~= nil 
			and vehicle.aiveChain.leftActive   ~= nil 
			and vehicle.aiveChain.toolCount  ~= nil 
			and vehicle.aiveChain.toolCount  >= 1 
			and vehicle.aiveChain.toolParams ~= nil 
			and vehicle.aiveChain.toolCount  == table.getn( vehicle.aiveChain.toolParams ) then
		for i = 1,vehicle.aiveChain.toolCount do	
			local toolParam = vehicle.aiveChain.toolParams[i]
			local tool      = vehicle.aiveChain.tools[toolParam.i]				
			local back      = 0
			local front     = back + math.max( 2, 0.7 * toolParam.width )		
			local turnAngle = 0
			
			if vehicle.aiveChain.inField then
				turnAngle = AutoSteeringEngine.getTurnAngle( vehicle )
			elseif vehicle.aiveChain.trace ~= nil then
				if     vehicle.aiveChain.trace.isOutside then
					turnAngle = AutoSteeringEngine.getTurnAngle( vehicle )
				elseif vehicle.aiveChain.trace.isUTurn   then
					turnAngle = AutoSteeringEngine.getTurnAngle( vehicle ) - math.pi
				elseif vehicle.aiveChain.leftActive      then
					turnAngle = AutoSteeringEngine.getTurnAngle( vehicle ) + 0.5 * math.pi
				else
					turnAngle = AutoSteeringEngine.getTurnAngle( vehicle ) - 0.5 * math.pi
				end
			end
			
			if vehicle.aiveChain.leftActive then
				turnAngle = turnAngle - math.pi/12 --15°
			else
				turnAngle = turnAngle + math.pi/12 --15°
			end
			
			setRotation( vehicle.aiveChain.headlandNode, 0, -turnAngle, 0 )
			
			local dx,_,dz = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, 1 )

		--print(AutoSteeringEngine.radToString( turnAngle )..string.format(" => %5.2f %5.2f",dx,dz))
			
			local w = toolParam.width
			local ofs, idx			
			if vehicle.aiveChain.leftActive	then
				ofs = -toolParam.offset 
				idx = toolParam.nodeLeft 
			else
				ofs = toolParam.offset
				idx = toolParam.nodeRight
			end
			
			w = w + w
			if vehicle.aiveChain.leftActive then
				w = -w
			end

			local xw1,y,zw1 = AutoSteeringEngine.toolLocalToWorld( vehicle, toolParam.i, idx, ofs, 0 )
			xw1 = xw1 + back * dx
			zw1 = zw1 + back * dz
		
			local lx1,lz1,lx2,lz2,lx3,lz3,lx4,lz4
			local dist = front - back
			local xw2, zw2

			repeat 
				xw2 = xw1 + dist * dx
				zw2 = zw1 + dist * dz
				lx1,lz1,lx2,lz2,lx3,lz3 = AutoSteeringEngine.getParallelogram( xw1,zw1,xw2,zw2, w, true )
				lx4 = lx3 + lx2 - lx1
				lz4 = lz3 + lz2 - lz1
				
				dist = dist - math.max( 0.5, dist * 0.2 )
			until dist < 0.5
					or ( vehicle.aiveChain.headland >= 1
					 and ( AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
 						  or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
	 						or AutoSteeringEngine.isChainPointOnField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )
					or ( vehicle.aiveChain.headland < 1
					 and ( AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
					    or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
					    or AutoSteeringEngine.checkField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )

			local lx5 = 0.25 * ( lx1 + lx2 + lx3 + lx4 )
			local lz5 = 0.25 * ( lz1 + lz2 + lz3 + lz4 )
			
			if vehicle.aiveChain.headland < 1 then
				if     AutoSteeringEngine.checkField( vehicle, lx1, lz1 )
						or AutoSteeringEngine.checkField( vehicle, lx2, lz2 )
						or AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
						or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
						or AutoSteeringEngine.checkField( vehicle, lx5, lz5 ) then
					if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, true }
						fruitsDetected = true
						break
					end			
					vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, false }
				end			
			else
				if     AutoSteeringEngine.isChainPointOnField( vehicle, lx1, lz1 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx2, lz2 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx5, lz5 ) then
					if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, true }
						fruitsDetected = true
						break
					end			
					vehicle.aiveFruitAreas[vehicle.aiveChain.toolCount+i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, false }
				end			
			end			
		end
	end
	
	if AIVEGlobals.useFBB123 > 0 then
		vehicle.aiveChain.fbb2 = { x=wx, z=wz, d=fruitsDetected }
	end
	
	return fruitsDetected
end

------------------------------------------------------------------------
-- hasFruits
------------------------------------------------------------------------
function AutoSteeringEngine.hasFruits( vehicle )

	if not vehicle.isServer then return false end
	
	if      vehicle.aiveChain.respectStartNode
			and AutoSteeringEngine.getRelativeZTranslation( vehicle.aiveChain.startNode, vehicle.aiveChain.refNode ) < 0 then
		return false
	end	
	
	if AIVEGlobals.useFBB123 > 0 then
		local fbbd = 0.01
		if vehicle.aiveChain.inField then
			fbbd = 0.09
		end
		local wx,_,wz = AutoSteeringEngine.getAiWorldPosition( vehicle )
		if vehicle.aiveChain.fbb1 ~= nil and Utils.vector2LengthSq( vehicle.aiveChain.fbb1.x - wx, vehicle.aiveChain.fbb1.z - wz ) < fbbd then
			return vehicle.aiveChain.fbb1.d, vehicle.aiveChain.fbb1.a 
		end
	end
			
	if AutoSteeringEngine.hasCollision( vehicle ) then 
		vehicle.aiveChain.fbb1 = { x=wx, z=wz, d=false, a=false }
		return false, false
	end
	
	local widthFactor    = 0.8
	
	local fruitsDetected = false
	local fruitsAll      = true
	
	vehicle.aiveFruitAreas = {}
	
	if      vehicle.aiveChain      ~= nil 
			and vehicle.aiveChain.leftActive   ~= nil 
			and vehicle.aiveChain.toolCount  ~= nil 
			and vehicle.aiveChain.toolCount  >= 1 
			and vehicle.aiveChain.toolParams ~= nil 
			and vehicle.aiveChain.toolCount  == table.getn( vehicle.aiveChain.toolParams ) then
		for i = 1,vehicle.aiveChain.toolCount do	
			local toolParam = vehicle.aiveChain.toolParams[i]
			local tool      = vehicle.aiveChain.tools[toolParam.i]
			local gotFruits = false
			local gotField  = false
			local back      = math.min( toolParam.zBack - toolParam.zReal, 0 )
			local front     = math.max( back + 1, 1 )
			
			tool.hasFruits = false
			
			local dx,dz
			if tool.steeringAxleNode == nil then
				dx,_,dz = localDirectionToWorld( vehicle.aiveChain.refNode, 0, 0, 1 )
			elseif tool.invert then
				dx,_,dz = localDirectionToWorld( tool.steeringAxleNode, 0, 0, -1 )
			else
				dx,_,dz = localDirectionToWorld( tool.steeringAxleNode, 0, 0, 1 )
			end

			local ofs, idx
			if vehicle.aiveChain.leftActive	then
				ofs = -toolParam.offset 
				idx = toolParam.nodeLeft 
			else
				ofs = toolParam.offset 
				idx = toolParam.nodeRight
			end
		
			local xw1,y,zw1 = AutoSteeringEngine.toolLocalToWorld( vehicle, toolParam.i, idx, ofs, back )
			local xw2,y,zw2 = AutoSteeringEngine.toolLocalToWorld( vehicle, toolParam.i, idx, ofs, front )
			
			local w = widthFactor * toolParam.width
			if vehicle.aiveChain.leftActive then
				w = -w
			end
			
			local lx1,lz1,lx2,lz2,lx3,lz3,lx4,lz4
			dist = front - back
			repeat 
				xw2 = xw1 + dist * dx
				zw2 = zw1 + dist * dz
				lx1,lz1,lx2,lz2,lx3,lz3 = AutoSteeringEngine.getParallelogram( xw1,zw1,xw2,zw2, w, true )
				lx4 = lx3 + lx2 - lx1
				lz4 = lz3 + lz2 - lz1
				
				dist = dist - 0.5
			until dist < 0.5
					or ( vehicle.aiveChain.headland >= 1
					 and ( AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
 						  or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
	 						or AutoSteeringEngine.isChainPointOnField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )
					or ( vehicle.aiveChain.headland < 1
					 and ( AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
					    or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
					    or AutoSteeringEngine.checkField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )

			local lx5 = 0.25 * ( lx1 + lx2 + lx3 + lx4 )
			local lz5 = 0.25 * ( lz1 + lz2 + lz3 + lz4 )
			
			if dist < front - back - 0.6 then
				dist = dist + 0.5
			end
			
			if vehicle.aiveChain.headland < 1 then
				if     AutoSteeringEngine.checkField( vehicle, lx1, lz1 )
						or AutoSteeringEngine.checkField( vehicle, lx2, lz2 )
						or AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
						or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
						or AutoSteeringEngine.checkField( vehicle, lx5, lz5 ) then
					gotField = true
					if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						gotFruits = true
					end			
				end			
			else
				if     AutoSteeringEngine.isChainPointOnField( vehicle, lx1, lz1 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx2, lz2 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
						or AutoSteeringEngine.isChainPointOnField( vehicle, lx5, lz5 ) then
					gotField = true
					if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						gotFruits = true
					end			
				end			
			end			
			
			vehicle.aiveFruitAreas[i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, gotFruits }

      if not gotFruits then 
				if     tool.ignoreAI then
				-- ignore 
				else
					fruitsAll = false
				end
			end
			
			if gotFruits then
				tool.hasFruits = true
				if     tool.ignoreAI then
				-- ignore 
				else
					fruitsDetected = true				
				end
			elseif tool.targetLowerState and not ( tool.currentLowerState ) and AIVEGlobals.lowerAdvance > 0 then
				-- lower tool in advance
				
				xw1 = xw1 + AIVEGlobals.lowerAdvance * dx
				zw1 = zw1 + AIVEGlobals.lowerAdvance * dz
				dist = front - back
				repeat 
					xw2 = xw1 + dist * dx
					zw2 = zw1 + dist * dz
					lx1,lz1,lx2,lz2,lx3,lz3 = AutoSteeringEngine.getParallelogram( xw1,zw1,xw2,zw2, w, true )
					lx4 = lx3 + lx2 - lx1
					lz4 = lz3 + lz2 - lz1
					
					dist = dist - 0.5
				until dist < 0.5
						or ( vehicle.aiveChain.headland >= 1
						 and ( AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
								or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 )
								or AutoSteeringEngine.isChainPointOnField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )
						or ( vehicle.aiveChain.headland < 1
						 and ( AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
								or AutoSteeringEngine.checkField( vehicle, lx4, lz4 )
								or AutoSteeringEngine.checkField( vehicle, 0.5 * ( lx3 + lx4), 0.5 * ( lz3 + lz4 ) ) ) )

				if vehicle.aiveChain.headland < 1 then
					if     ( AutoSteeringEngine.checkField( vehicle, lx1, lz1 )
								or AutoSteeringEngine.checkField( vehicle, lx2, lz2 )
								or AutoSteeringEngine.checkField( vehicle, lx3, lz3 )
								or AutoSteeringEngine.checkField( vehicle, lx4, lz4 ) )
							and AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						gotFruits = true
					end			
				else
					if     ( AutoSteeringEngine.isChainPointOnField( vehicle, lx1, lz1 )
								or AutoSteeringEngine.isChainPointOnField( vehicle, lx2, lz2 )
								or AutoSteeringEngine.isChainPointOnField( vehicle, lx3, lz3 )
								or AutoSteeringEngine.isChainPointOnField( vehicle, lx4, lz4 ) )
							and AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, w, toolParam.i, true ) > 0 then
						gotFruits = true
					end			
				end		
				
			--vehicle.aiveFruitAreas[i] = { lx1, lz1, lx2, lz2, lx3, lz3, lx4, lz4, gotFruits }
			end
			
			if      gotFruits then
				AutoSteeringEngine.ensureToolIsLowered( vehicle, true, i )
			elseif  AIVEGlobals.raiseNoFruits > 0
					and not ( gotField )
					and vehicle.aiveChain.inField
					and tool.currentLowerState
					and not ( vehicle.aiveHas.combine )
					and ( tool.isSowingMachine
						 or tool.isCultivator
						 or tool.isSprayer
						 or tool.isMower 
						 or tool.isTedder   
						 or tool.isWindrower ) then
				AutoSteeringEngine.raiseToolNoFruits( vehicle, tool.obj )
			end
		end
	end
	
	if AIVEGlobals.useFBB123 > 0 then
		vehicle.aiveChain.fbb1 = { x=wx, z=wz, d=fruitsDetected, a=fruitsAll }
	end
	
	return fruitsDetected, fruitsAll
end

------------------------------------------------------------------------
-- hasFruitsSimple
------------------------------------------------------------------------
function AutoSteeringEngine.hasFruitsSimple( vehicle, xw1, zw1, xw2, zw2, off )
	for i=1,vehicle.aiveChain.toolCount do
		if AutoSteeringEngine.getFruitArea( vehicle, xw1,zw1,xw2,zw2, off, i, true ) > 0 then
			return true
		end
	end
	return false
end

------------------------------------------------------------------------
-- noTurnAtEnd
------------------------------------------------------------------------
function AutoSteeringEngine.noTurnAtEnd( vehicle )

	--local noTurn = false
	--if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
	--	for i=1,vehicle.aiveChain.toolCount do
  --    if vehicle.aiveChain.tools[i].isPlough or vehicle.aiveChain.tools[i].isSprayer or vehicle.aiveChain.tools[i].specialType == "Packomat" or vehicle.aiveChain.tools[i].doubleJoint
	--			then noTurn = true end
	--	end
	--end
	--
	--return noTurn
	
	if      ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 )
			and ( vehicle.aiveHas.plough or vehicle.aiveHas.sprayer or vehicle.aiveHas.doubleJoint ) then 
		return true 
	end
	return false 
end

------------------------------------------------------------------------
-- getNoReverseIndex
------------------------------------------------------------------------
function AutoSteeringEngine.getNoReverseIndex( vehicle )

	return Utils.getNoNil( vehicle.aiveChain.noReverseIndex, 0 )

	--local noReverseIndex = 0
	--
	--if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
	--	for i=1,vehicle.aiveChain.toolCount do
	--		if vehicle.aiveChain.tools[i].aiForceTurnNoBackward and vehicle.aiveChain.tools[i].steeringAxleNode ~= nil then
	--			noReverseIndex = i
	--		end
	--	end
	--end
	--
	--return noReverseIndex
end

------------------------------------------------------------------------
-- getTurnMode
------------------------------------------------------------------------
function AutoSteeringEngine.getTurnMode( vehicle )
	local revUTurn   = true
	local revStraight= true
	local smallUTurn = true
	local zb         = nil
	local noHire     = false
	
	if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		for i=1,vehicle.aiveChain.toolCount do
--		local _,_,z = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, vehicle.aiveChain.tools[i].refNode ) 
--		z = z + 0.5 * ( vehicle.aiveChain.tools[i].zb + vehicle.aiveChain.tools[i].z )
--		--print(tostring(zb).." "..tostring(z))
--		if      zb == nil then
--			zb = z
--		elseif  math.abs( z - zb ) > 2
--		    and ( zb > 0 and z < 0
--		       or zb < 0 and z > 0 ) then
--			smallUTurn = false
--		end
			
			if vehicle.aiveChain.tools[i].noRevStraight then
				revStraight= false
			end
			if      vehicle.aiveChain.tools[i].aiForceTurnNoBackward 
					and vehicle.aiveChain.tools[i].steeringAxleNode ~= nil then
				revUTurn   = false
				smallUTurn = false
--			elseif  vehicle.aiveChain.tools[i].isSprayer then
--				revUTurn   = false
--				smallUTurn = false
--				break
--		elseif  vehicle.aiveChain.tools[i].isCombine 
--				or  vehicle.aiveChain.tools[i].isMower then
--			smallUTurn = false
			end
			
			if vehicle.aiveHas.combine then
				smallUTurn = false
			end
			
--		if vehicle.aiveChain.tools[i].isSprayer then
--			noHire = true
--		end
		end
	end
	
	if not revStraight then
		revUTurn   = false
		smallUTurn = false
	end
	
	return smallUTurn, revUTurn, revStraight, noHire
end
		

------------------------------------------------------------------------
-- getToolAngle
------------------------------------------------------------------------
function AutoSteeringEngine.getToolAngle( vehicle )

	local toolAngle = 0
	local i         = AutoSteeringEngine.getNoReverseIndex( vehicle )
	
	if i>0 then	
		if vehicle.aiveChain.tools[i].checkZRotation then
			local zAngle = AutoSteeringEngine.getRelativeZRotation( vehicle.aiveChain.refNode, vehicle.aiveChain.tools[i].steeringAxleNode )
			if math.abs( zAngle ) > 0.025 then
				local rx2, ry2, rz2 = getRotation( vehicle.aiveChain.tools[i].steeringAxleNode )
				setRotation( vehicle.aiveChain.tools[i].steeringAxleNode, rx2, ry2, rz2 -zAngle )
			--local test = AutoSteeringEngine.getRelativeZRotation( vehicle.aiveChain.refNode, vehicle.aiveChain.tools[i].steeringAxleNode )
			end
		end
		--toolAngle = AutoSteeringEngine.getRelativeYRotation( vehicle.steeringAxleNode, vehicle.aiveChain.tools[i].steeringAxleNode )	
		toolAngle = AutoSteeringEngine.getRelativeYRotation( vehicle.aiveChain.refNode, vehicle.aiveChain.tools[i].steeringAxleNode )	
		
		if vehicle.aiveChain.tools[i].offsetZRotation ~= nil then
			toolAngle = toolAngle + vehicle.aiveChain.tools[i].offsetZRotation
		end
		
		if vehicle.aiveChain.tools[i].invert then
			if toolAngle < 0 then
				toolAngle = toolAngle + math.pi
			else
				toolAngle = toolAngle - math.pi
			end
		end
	end
	
	return toolAngle
end

------------------------------------------------------------------------
-- getAngleFactor
------------------------------------------------------------------------
function AutoSteeringEngine.getAngleFactor( maxLooking )
	if AIVEGlobals.fixAngleStep > 0 or maxLooking == nil or maxLooking >= AIVEGlobals.maxLooking then
		return 1
	end
	return Utils.clamp( Utils.getNoNil( maxLooking, AIVEGlobals.maxLooking ) / AIVEGlobals.maxLooking, 0.1, 1 )
end

------------------------------------------------------------------------
-- getAngleStep
------------------------------------------------------------------------
function AutoSteeringEngine.getAngleStep( vehicle, j, af )
	local f = AIVEGlobals.angleStep + vehicle.aiveChain.nodes[j].length * AIVEGlobals.angleStepInc
	local d = vehicle.aiveChain.nodes[j].distance * AIVEGlobals.angleStepDec
	if d > 0.9 * f then
		f = 0.1 * f
	else
		f = f - d
	end
	f = math.min( f, AIVEGlobals.angleStepMax )
	return f * af
end

------------------------------------------------------------------------
-- isSetAngleZero
------------------------------------------------------------------------
function AutoSteeringEngine.isSetAngleZero( vehicle )
	if AIVEGlobals.zeroAngle > 0 then
		return true
	end
	if not ( vehicle.aiveChain.inField ) then
		return true
	end
	return false
end

------------------------------------------------------------------------
-- setSteeringAngle
------------------------------------------------------------------------
function AutoSteeringEngine.setSteeringAngle( vehicle, angle )
	if AutoSteeringEngine.isSetAngleZero( vehicle ) then
		vehicle.aiveChain.currentSteeringAngle = 0
	elseif vehicle.aiveChain.currentSteeringAngle == nil or math.abs( vehicle.aiveChain.currentSteeringAngle - angle ) > 1E-3 then
		AutoSteeringEngine.setChainStatus( vehicle, 1, AIVEStatus.initial )
		vehicle.aiveChain.currentSteeringAngle = angle
	end 
	if vehicle.aiveChain.minAngle == nil or vehicle.aiveChain.maxAngle == nil then
		vehicle.aiveChain.currentSteeringAngle = angle
	else
		vehicle.aiveChain.currentSteeringAngle = math.min( math.max( angle, vehicle.aiveChain.minAngle ), vehicle.aiveChain.maxAngle )
	end
end

------------------------------------------------------------------------
-- currentSteeringAngle
------------------------------------------------------------------------
function AutoSteeringEngine.currentSteeringAngle( vehicle, isInverted )

	if vehicle.aiveChain == nil then return end

	local steeringAngle = 0		

	if      vehicle.articulatedAxis ~= nil 
			and vehicle.articulatedAxis.componentJoint ~= nil
			and vehicle.articulatedAxis.componentJoint.jointNode ~= nil then
		steeringAngle = 0.5 * math.min( math.max( -vehicle.rotatedTime * vehicle.articulatedAxis.rotSpeed, vehicle.articulatedAxis.rotMin ), vehicle.articulatedAxis.rotMax )
	else
		for _,wheel in pairs(vehicle.wheels) do
			if math.abs(wheel.rotSpeed) > 1E-3 then
				if math.abs( wheel.steeringAngle ) > math.abs( steeringAngle ) then
					if wheel.rotSpeed > 0 then
						steeringAngle = wheel.steeringAngle
					else
						steeringAngle = -wheel.steeringAngle
					end
				end
			end
		end
	end	
	
	--if isInverted or ( isInverted == nil and vehicle.aiveChain ~= nil and vehicle.aiveChain.isInverted ) then
	--	steeringAngle = -steeringAngle
	--end

	vehicle.aiveChain.realSteeringAngle = steeringAngle 
	
	if vehicle.aiveChain.currentSteeringAngle ~= nil and 0 < AIVEGlobals.average and AIVEGlobals.average < 1 then
		steeringAngle = AIVEGlobals.average * steeringAngle + (1-AIVEGlobals.average) * vehicle.aiveChain.currentSteeringAngle
	end
	
	--local neg = false
	--if steeringAngle < 0 then neg = true end
	--
	--local f = math.rad(3)
	--
	--steeringAngle = f * math.floor( math.abs( steeringAngle / f ) + 0.5 )
	--if neg then steeringAngle = -steeringAngle end
	
	if AutoSteeringEngine.isSetAngleZero( vehicle ) then
		AutoSteeringEngine.setSteeringAngle( vehicle, 0 )
	else
		AutoSteeringEngine.setSteeringAngle( vehicle, steeringAngle )
	end
	
	return steeringAngle
end

------------------------------------------------------------------------
-- steer
------------------------------------------------------------------------
function AutoSteeringEngine.steer( vehicle, ... )
	vehicle.aiveSteerParameteters = { ... }
	AutoSteeringEngine.steerDirect( vehicle, ... )
end
function AutoSteeringEngine.steerContinued( vehicle )
	if vehicle.aiveSteerParameteters ~= nil then
		AutoSteeringEngine.steerDirect( vehicle, unpack( vehicle.aiveSteerParameteters ) )
	end
end
function AutoSteeringEngine.steerDirect( vehicle, dt, angle, aiSteeringSpeed, directSteer )
-- precondition: vehicle.rotatedTime is filled from last steering
	if vehicle.aiveChain.isInverted then
		angle = -angle
	end
	if vehicle.isReverseDriving then
		angle = -angle
	end

	if     angle == 0 then
		targetRotTime = 0
	elseif angle  > 0 then
		targetRotTime = vehicle.maxRotTime * math.min( angle / vehicle.aiveChain.maxSteering, 1)
	else
		targetRotTime = vehicle.minRotTime * math.min(-angle / vehicle.aiveChain.maxSteering, 1)
	end
	
	local aiDirectSteering = 1
	if vehicle.articulatedAxis == nil then
		if directSteer then
			aiDirectSteering = AIVEGlobals.aiSteeringD
		else
			aiDirectSteering = AIVEGlobals.aiSteering
		end
	else
		if directSteer then
			aiDirectSteering = AIVEGlobals.artSteeringD
		else
			aiDirectSteering = AIVEGlobals.artSteering
		end
	end
	
	local diff = dt * aiSteeringSpeed
	if aiDirectSteering <= 0 then
		diff = math.min( diff+diff+diff+diff+diff+diff, math.abs( math.min( 1, -aiDirectSteering ) * ( targetRotTime - vehicle.rotatedTime ) ) )
	else
		diff = aiDirectSteering * diff
	end
	
	if targetRotTime > vehicle.rotatedTime then
		vehicle.rotatedTime = math.min(vehicle.rotatedTime + diff, targetRotTime)
	else
		vehicle.rotatedTime = math.max(vehicle.rotatedTime - diff, targetRotTime)
	end
	
	if AutoSteeringEngine.isSetAngleZero( vehicle ) then
		vehicle.aiveChain.currentSteeringAngle = 0
	elseif vehicle.aiveChain.currentSteeringAngle == nil or math.abs( vehicle.aiveChain.currentSteeringAngle - angle ) > 1E-3 then
		AutoSteeringEngine.setChainStatus( vehicle, 1, AIVEStatus.initial )
		vehicle.aiveChain.currentSteeringAngle = angle
	end 
end

------------------------------------------------------------------------
-- getWorldTargetFromSteeringAngle
------------------------------------------------------------------------
function AutoSteeringEngine.getWorldTargetFromSteeringAngle( vehicle, angle, moveForwards )

	local invR = vehicle.aiveChain.invWheelBase * math.tan( angle )	
	local l    = math.max( 1, 0.2 * vehicle.aiveChain.radius ) -- math.min( 5, vehicle.aiveChain.radius )
	local rot  = 2 * math.asin( invR * 0.5 * l )
	local lz   = l * math.cos( rot )
	local lx   = l * math.sin( rot )
	tX,_,tZ = localToWorld( vehicle.aiveChain.refNode, lx, 0, lz )

	return tX, tZ
end

------------------------------------------------------------------------
-- getSteeringAngleFromWorldTarget
------------------------------------------------------------------------
function AutoSteeringEngine.getSteeringAngleFromWorldTarget( vehicle, tX, tY, tZ )

	local y
	if tY == nil then
		y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, tX, 1, tZ)
	else
		y = tY
	end
	
	local lx,_,lz = worldToLocal( vehicle.aiveChain.refNode, tX, y, tZ )
	local l       = Utils.vector2Length( lx, lz )
	
	if l < 1e-3 then 
		return 0
	end
	
	local rot  = math.atan2( lx, lz )
	local invR = 2 * math.sin( 0.5*rot ) / l
	
	return math.atan( vehicle.aiveChain.wheelBase * invR )
end

------------------------------------------------------------------------
-- drive
------------------------------------------------------------------------
function AutoSteeringEngine.drive( vehicle, ... )
	vehicle.aiveDriveParameteters = { ... }
	AutoSteeringEngine.driveDirect( vehicle, ... )
end
function AutoSteeringEngine.driveContinued( vehicle )
	if vehicle.aiveDriveParameteters ~= nil then
		AutoSteeringEngine.driveDirect( vehicle, unpack( vehicle.aiveDriveParameteters ) )
	end
end
function AutoSteeringEngine.driveDirect( vehicle, dt, acceleration, allowedToDrive, moveForwards, speedLevel, useReduceSpeed, slowMaxRpmFactor )
	
  if vehicle.firstTimeRun then
		maxSpeed = AutoSteeringEngine.getMaxSpeed( vehicle, dt, acceleration, allowedToDrive, moveForwards, speedLevel, useReduceSpeed, slowMaxRpmFactor )
		if maxSpeed <= 0 then
			allowedToDrive = false 
			maxSpeed       = 2
		end
		vehicle.motor:setSpeedLimit( maxSpeed )
		
		WheelsUtil.updateWheelsPhysics(vehicle, dt, vehicle.lastSpeed, vehicle.acLastAcc, not allowedToDrive, vehicle.requiredDriveMode)
  end
end

------------------------------------------------------------------------
-- getMaxSpeed
------------------------------------------------------------------------
function AutoSteeringEngine.getMaxSpeed( vehicle, dt, acceleration, allowedToDrive, moveForwards, speedLevel, useReduceSpeed, slowMaxRpmFactor )

	if moveForwards ~= nil then
		if vehicle.aiveChain.isInverted then
			moveForwards = not moveForwards
		end
		if vehicle.isReverseDriving then
			moveForwards = not moveForwards
		end
	end
	
  local acc = acceleration
	local disableChangingDirection = false
	local doHandBrake = false

	local wantedSpeed = AutoSteeringEngine.getWantedSpeed( vehicle, speedLevel )
  if useReduceSpeed then
    acc         = acc * slowMaxRpmFactor
		wantedSpeed = wantedSpeed * slowMaxRpmFactor
  end
	
  if not moveForwards then
    acc = -acc
  end
	
  if not allowedToDrive then
    acc = 0
		wantedSpeed = 0
	end
	
--print("dt: "..tostring(dt)..", wantedSpeed: "..tostring(wantedSpeed).."("..tostring(speedLevel).."), acc:"..tostring(acc).."("..tostring(allowedToDrive)..")")
			
	if vehicle.acLastAcc == nil then
		vehicle.acLastAcc = 0
	end
	if vehicle.acLastWantedSpeed == nil then
		vehicle.acLastWantedSpeed = math.max( 2, vehicle.lastSpeed * 3600 )
	end
		
	if     math.abs( acc ) < 1E-4
			or ( acc > 0 and vehicle.acLastAcc < 0 )
			or ( acc < 0 and vehicle.acLastAcc > 0 ) then
		vehicle.acLastAcc = 0
		wantedSpeed       = 0
		vehicle.acLastWantedSpeed = 0
	else
		vehicle.acLastAcc = vehicle.acLastAcc + Utils.clamp( acc - vehicle.acLastAcc, - dt * 0.0005, dt * 0.0005)
	end
	
	local curSpeed = math.abs( vehicle.lastSpeed * 3600 )
			
	if     wantedSpeed < 1 then		
		vehicle.acLastWantedSpeed = 2
		return 0
	elseif wantedSpeed < 7.5 and wantedSpeed < curSpeed then
		vehicle.acLastWantedSpeed = wantedSpeed
	elseif math.abs( wantedSpeed - curSpeed ) < 0.5 then
		vehicle.acLastWantedSpeed = wantedSpeed
	else
		if wantedSpeed < curSpeed then
			vehicle.acLastWantedSpeed = math.min( vehicle.acLastWantedSpeed, curSpeed )
		else
			vehicle.acLastWantedSpeed = math.max( vehicle.acLastWantedSpeed, curSpeed )
		end
		if vehicle.acLastWantedSpeed < 2 then
			vehicle.acLastWantedSpeed = 2
		end
	
		vehicle.acLastWantedSpeed = vehicle.acLastWantedSpeed + Utils.clamp( wantedSpeed - vehicle.acLastWantedSpeed, -0.0015 * dt, 0.0015 * dt )
	end
	
	return vehicle.acLastWantedSpeed
 end

------------------------------------------------------------------------
-- drawMarker
------------------------------------------------------------------------
function AutoSteeringEngine.drawMarker( vehicle )

	if not vehicle.isServer then return end
	
	if vehicle.debugRendering then
		AutoSteeringEngine.displayDebugInfo( vehicle )
	end

	if vehicle.aiveChain.headland > 0 and vehicle.aiveChain.width ~= nil then		
		AutoSteeringEngine.rotateHeadlandNode( vehicle )
		local w = math.max( 1, 0.25 * vehicle.aiveChain.width )--+ 0.13 * vehicle.aiveChain.headland )		
		local x1,y1,z1 = localToWorld( vehicle.aiveChain.headlandNode, -2 * w, 1, vehicle.aiveChain.headland )
		local x2,y2,z2 = localToWorld( vehicle.aiveChain.headlandNode,  2 * w, 1, vehicle.aiveChain.headland )
		y1 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x1, 1, z1) + 1
		y2 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x2, 1, z2) + 1
		drawDebugLine( x1,y1,z1, 1,1,0, x2,y2,z2, 1,1,0 )
	end
	--if vehicle.aiveChain.collisionDistPoints ~= nil and table.getn( vehicle.aiveChain.collisionDistPoints ) > 0 then
	--	for _,p in pairs(vehicle.aiveChain.collisionDistPoints) do
	--		local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, p.x, 1, p.z)
	--		drawDebugLine(  p.x,y,p.z, 1,0,0, p.x,y+2,p.z, 1,0,0 )
	--		drawDebugPoint( p.x,y+2,p.z, 1, 1, 1, 1 )
	--	end
	--end
	
	if vehicle.acIamDetecting and vehicle.aiveChain.toolParams ~= nil and table.getn( vehicle.aiveChain.toolParams ) > 0 then
		local px,py,pz
		local off = 1
		if not vehicle.aiveChain.leftActive then
			off = -off
		end
					
		for j,tp in pairs(vehicle.aiveChain.toolParams) do		
			if not ( tp.skip ) then
				local c = { 0.5, 0.5, 0.5 }
				if      vehicle.aiveFruitAreas ~= nil 
						and vehicle.aiveFruitAreas[j] ~= nil 
						and vehicle.aiveFruitAreas[j][9] then
					c = { 0, 1, 0 }
				end
				
				local x1,y1,z1 = AutoSteeringEngine.getChainPoint( vehicle, 1, tp )
				y1 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x1, y1, z1 )

				drawDebugLine( x1,y1,z1, c[1],c[2],c[3], x1,y1+1.2,z1, c[1],c[2],c[3] )
				drawDebugPoint( x1,y1+1.2,z1	, 1, 1, 1, 1 )
				
				for i=2,vehicle.aiveChain.chainMax+1 do
					if vehicle.aiveChain.nodes[i].distance > 10 then
						break
					end
					local x2,y2,z2 = AutoSteeringEngine.getChainPoint( vehicle, i, tp )
					y2 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x2, y2, z2 )
					drawDebugLine(  x1,y1+0.1,z1, c[1],c[2],c[3], x2,y2+0.1,z2, c[1],c[2],c[3] )
					drawDebugLine(  x1,y1+0.2,z1, c[1],c[2],c[3], x2,y2+0.2,z2, c[1],c[2],c[3] )
					drawDebugLine(  x1,y1+0.3,z1, c[1],c[2],c[3], x2,y2+0.3,z2, c[1],c[2],c[3] )
					x1 = x2
					y1 = y2
					z1 = z2
				end
			end
		end
	end	
end
	
------------------------------------------------------------------------
-- drawLines
------------------------------------------------------------------------
function AutoSteeringEngine.drawLines( vehicle )

	if not vehicle.isServer then return end
	
	if vehicle.debugRendering then
		AutoSteeringEngine.displayDebugInfo( vehicle )
	end

	local x,_,z = AutoSteeringEngine.getAiWorldPosition( vehicle )
	local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
	drawDebugLine(  x, y, z,0,1,0, x, y+4, z,0,1,0)
	drawDebugPoint( x, y+4, z	, 1, 1, 1, 1 )
	
	if vehicle.aiveChain.lastWorldTarget ~= nil then
		local x1,y1,z1 = unpack( vehicle.aiveChain.lastWorldTarget )
		drawDebugLine(  x1, y1+4, z1,0,1,0, x, y+4, z,0,1,0)
	end
	
	if vehicle.aiveChain.rootNode ~= nil then
		local x1,y1,z1 = localDirectionToWorld( vehicle.aiveChain.rootNode, 0, 0, 4 )
		x1 = x+x1
		y1 = y+y1
		z1 = z+z1
		drawDebugLine(  x1, y1+4.5, z1,1,1,1, x, y+4.5, z,1,1,1)
	end
	
	if vehicle.aiveChain.respectStartNode then
		x,_,z = getWorldTranslation( vehicle.aiveChain.startNode )
		y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
		drawDebugLine(  x, y, z,0,1,0, x, y+4, z,0,1,0)
		drawDebugPoint( x, y+4, z	, 1, 1, 1, 1 )
		x1,_,z1 = localToWorld( vehicle.aiveChain.startNode ,0,0,2 )
		drawDebugLine(  x1, y+3, z1,0,1,0, x, y+3, z,0,1,0)
	end
	
	if  vehicle.aiveChain.trace   ~= nil then
			
		if vehicle.aiveChain.trace.itv1 ~= nil then
			local lx1,lz1,lx2,lz2,lx3,lz3 = unpack( vehicle.aiveChain.trace.itv1 )
			drawDebugLine(lx1,y+0.5,lz1,0,1,0,lx3,y+0.5,lz3,0,1,0)
			drawDebugLine(lx1,y+0.5,lz1,0,1,0,lx2,y+0.5,lz2,0,1,0)
		--local lx4 = lx3 + lx2 - lx1
		--local lz4 = lz3 + lz2 - lz1
		--drawDebugLine(lx4,y+0.5,lz4,0,1,1,lx2,y+0.5,lz2,0,1,1)
		--drawDebugLine(lx4,y+0.5,lz4,0,1,1,lx3,y+0.5,lz3,0,1,1)
		end
		
		if vehicle.aiveChain.trace.itv2 ~= nil then
			local lx1,lz1,lx2,lz2,lx3,lz3 = unpack( vehicle.aiveChain.trace.itv2 )
			drawDebugLine(lx1,y+0.5,lz1,0,0,1,lx3,y+0.5,lz3,0,0,1)
			drawDebugLine(lx1,y+0.5,lz1,0,0,1,lx2,y+0.5,lz2,0,0,1)
		--local lx4 = lx3 + lx2 - lx1
		--local lz4 = lz3 + lz2 - lz1
		--drawDebugLine(lx4,y+0.5,lz4,0,1,1,lx2,y+0.5,lz2,0,1,1)
		--drawDebugLine(lx4,y+0.5,lz4,0,1,1,lx3,y+0.5,lz3,0,1,1)
		end	
	end
	
	if      vehicle.aiveChain.trace    ~= nil 
			and vehicle.aiveChain.trace.ox ~= nil 
			and vehicle.aiveChain.trace.oz ~= nil then
	
		xw1 = vehicle.aiveChain.trace.cx
		zw1 = vehicle.aiveChain.trace.cz
		drawDebugLine(  xw1, y, zw1, 1,0,1, xw1, y+2, zw1 ,1,1,1)
		drawDebugPoint( xw1, y+2, zw1 , 0, 1, 0, 1 )		
		
		xw1 = vehicle.aiveChain.trace.ux
		zw1 = vehicle.aiveChain.trace.uz
		drawDebugLine(  xw1, y, zw1, 1,0,1, xw1, y+2, zw1 ,1,1,1)
		drawDebugPoint( xw1, y+2, zw1 , 0, 0, 1, 1 )		
		
		xw1 = vehicle.aiveChain.trace.ox
		zw1 = vehicle.aiveChain.trace.oz
		drawDebugLine(  xw1, y, zw1, 1,0,1, xw1, y+2, zw1 ,1,1,1)
		drawDebugPoint( xw1, y+2, zw1 , 0, 0, 1, 1 )		
	end		
	
	
	
	if vehicle.aivePoints ~= nil then
		local x,y,z
		for _,p in pairs(vehicle.aivePoints) do
			x = p.wx
			z = p.wz
			y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
			drawDebugLine(  x, y,   z, 1,1,1, x, y+2, z ,1,1,1)
			drawDebugPoint( x, y+2, z, 1,1,1, 1 )		
			
			if p.tool ~= nil then
				for _,t in pairs(p.tool) do
					x = t.wx
					z = t.wz
					y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
					drawDebugLine(  x, y,   z, 0,1,0, x, y+2, z ,0,1,0)
					drawDebugPoint( x, y+2, z, 0,1,0, 1 )		
				end
			end
		end
	end
	
	
		
	if vehicle.aiveChain.headland > 0 then		
		AutoSteeringEngine.rotateHeadlandNode( vehicle )
		local w = math.max( 1, 0.25 * vehicle.aiveChain.width )--+ 0.13 * vehicle.aiveChain.headland )
		for j=-2,2 do
			local d = vehicle.aiveChain.headland + 1
			local x,_,z = localToWorld( vehicle.aiveChain.headlandNode, j * w, 1, d )
			local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z) + 1
			if AutoSteeringEngine.checkField( vehicle, x,z) then
				drawDebugPoint( x,y,z	, 0, 1, 0, 1 )
			else
				drawDebugPoint( x,y,z	, 1, 0, 0, 1 )
			end
			d = - vehicle.aiveChain.headland - 1
			x,_,z = localToWorld( vehicle.aiveChain.headlandNode, j * w, 1, d )
			y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z) + 1
			if AutoSteeringEngine.checkField( vehicle, x,z) then
				drawDebugPoint( x,y,z	, 0, 1, 0, 1 )
			else
				drawDebugPoint( x,y,z	, 1, 0, 0, 1 )
			end
		end
	end

	local indexMax = Utils.getNoNil( vehicle.aiveChain.lastIndexMax, vehicle.aiveChain.chainMax )
		
	if vehicle.aiveChain.toolParams ~= nil and table.getn( vehicle.aiveChain.toolParams ) > 0 then
		local px,py,pz
		local off = 1
		if not vehicle.aiveChain.leftActive then
			off = -off
		end
					
	--for i=1,indexMax+1 do
	--	vehicle.aiveChain.nodes[i].status = AIVEStatus.rotation
	--end
			
		AutoSteeringEngine.getAllChainBorders( vehicle, AIVEGlobals.chainStart, indexMax )
					
		for j=1,table.getn(vehicle.aiveChain.toolParams) do
			local tp = vehicle.aiveChain.toolParams[j]
			if      vehicle.aiveChain.tools ~= nil
					and not ( tp.skip )
					and tp.i ~= nil 
					and vehicle.aiveChain.tools[tp.i] ~= nil 
					and vehicle.aiveChain.tools[tp.i].marker ~= nil then			
				for _,m in pairs(vehicle.aiveChain.tools[tp.i].marker) do
					local xl,_,zl = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, m )
					if Utils.vector2LengthSq( xl-tp.x, zl-tp.z ) > 0.01 then
						local x,_,z = getWorldTranslation( m )
						local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
						drawDebugLine(  x,y,z, 0,0,1, x,y+2,z, 0,0,1 )
						drawDebugPoint( x,y+2,z, 1, 1, 1, 1 )
					end
				end
			
				if vehicle.aiveChain.tools[tp.i].aiBackMarker  ~= nil then
					local x,_,z = getWorldTranslation( vehicle.aiveChain.tools[tp.i].aiBackMarker )
					local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
					drawDebugLine(  x,y,z, 0,1,0, x,y+2,z, 0,1,0 )
					drawDebugPoint( x,y+2,z	, 1, 1, 1, 1 )
				end
				
				if vehicle.aiveChain.tools[tp.i].aiForceTurnNoBackward then
					local x,y,z
					x,_,z = localToWorld( vehicle.aiveChain.refNode, 0, 0, tp.b1 )
					y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
					drawDebugLine(  x,y,z, 0.8,0,0, x,y+2,z, 0.8,0,0 )
					drawDebugPoint( x,y+2,z	, 1, 1, 1, 1 )

					local a = -AutoSteeringEngine.getToolAngle( vehicle )					
					local l = tp.b1 + tp.b2
				--print(tostring(tp.b1).." "..tostring(tp.b2).." "..tostring(math.deg(a)))
					
					x,_,z = localToWorld( vehicle.aiveChain.refNode, math.sin(a) * l, 0, math.cos(a) * l )
					y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
					drawDebugLine(  x,y,z, 1,0.2,0.2, x,y+2,z, 1,0.2,0.2 )
					drawDebugPoint( x,y+2,z	, 1, 1, 1, 1 )
					
					if tp.b3 ~= nil and math.abs( tp.b3 ) > 0.1 then
						local x3,_,z3 = localDirectionToWorld( vehicle.aiveChain.refNode, math.sin(a+a) * tp.b3, 0, math.cos(a+a) * tp.b3 )
						x = x + x3
						z = z + z3
						y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
						drawDebugLine(  x,y,z, 1,1,0, x,y+2,z, 1,1,0 )
						drawDebugPoint( x,y+2,z	, 1, 1, 0, 1 )
					end
				end
				
				x,_,z = localToWorld( vehicle.aiveChain.refNode, tp.x, 0, tp.z )
				y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z)
				drawDebugLine(  x,y,z, 1,0,0, x,y+2,z, 1,0,0 )
				drawDebugPoint( x,y+2,z	, 1, 1, 1, 1 )
				
				if vehicle.acIamDetecting or AIVEGlobals.staticRoot > 0 then
					for i=1,indexMax+1 do
						local wx,wy,wz = AutoSteeringEngine.getChainPoint( vehicle, i, tp )
						
						if      i > 1
								and vehicle.aiveChain.nodes[i-1].tool[tp.i]   ~= nil 
								and vehicle.aiveChain.nodes[i-1].tool[tp.i].t ~= nil then

							local lx1,lz1,lx2,lz2,lx3,lz3 = AutoSteeringEngine.getParallelogram( px, pz, wx, wz, off )
							local ly1 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, lx1, 1, lz1) + 0.5
							local ly2 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, lx2, 1, lz2) + 0.5
							local ly3 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, lx3, 1, lz3) + 0.5

							local c1, c2, c3 = 0, 0, 0
							
							if      vehicle.aiveChain.lastIndexMax ~= nil
									and i-1 > vehicle.aiveChain.lastIndexMax then
								c1 = 0.25
								c2 = 0.25
								c3 = 0.25
							elseif vehicle.aiveChain.nodes[i-1].tool[tp.i].t < 0 then
								c1 = 0.5
								c2 = 0.5
								c3 = 0.5
							elseif vehicle.aiveChain.nodes[i-1].tool[tp.i].b > 0 then
								c1 = 1
							elseif vehicle.aiveChain.nodes[i-1].tool[tp.i].t > 0 then
								if vehicle.aiveChain.nodes[i-1].detected then
									c1 = 0
								else
									c1 = 0.5
								end
								c2 = 1
							else
								c1 = 1
								c2 = 1
							end
							
							drawDebugLine(lx1,ly1,lz1,c1,c2,c3,lx3,ly3,lz3,c1,c2,c3)

							if vehicle.aiveChain.nodes[i-1].tool[tp.i].t < 0 then
								drawDebugLine(lx1,ly1,lz1,0.3,0.3,0.3,lx2,ly2,lz2,0.3,0.3,0.3)
							else
								drawDebugLine(lx1,ly1,lz1,0,0,1,lx2,ly2,lz2,0,0,1)
							end
						end
						
						px = wx 
						pz = wz
					end		
				end
			end

			y = y + 1
			
			if vehicle.aiveFruitAreas ~= nil then
				local fj = j
				for fi=1,2 do			
					if vehicle.aiveFruitAreas[fj] ~= nil and table.getn( vehicle.aiveFruitAreas[fj] ) == 9 then
						local lx1,lz1,lx2,lz2,lx3,lz3,lx4,lz4,g = unpack( vehicle.aiveFruitAreas[fj] )
						local c = {1,0,0}
						if g then
							if tp.skip then
								c = {1,1,0}
							else
								c = {0,1,0}
							end
						end
						
						drawDebugLine(lx1,y,lz1,c[1],c[2],c[3],lx3,y,lz3,c[1],c[2],c[3])
						drawDebugLine(lx1,y,lz1,c[1],c[2],c[3],lx2,y,lz2,c[1],c[2],c[3])
						drawDebugLine(lx4,y,lz4,c[1],c[2],c[3],lx2,y,lz2,c[1],c[2],c[3])
						drawDebugLine(lx4,y,lz4,c[1],c[2],c[3],lx3,y,lz3,c[1],c[2],c[3])
					elseif vehicle.aiveFruitAreas[fj] ~= nil then
						AIVehicleExtension.debugPrint( vehicle, "aiveFruitAreas["..tostring(fj).."]: "..tostring(table.getn( vehicle.aiveFruitAreas[fj] ) ) )
					end
					fj = fj + vehicle.aiveChain.toolCount
				end
			end
		end
	end


	local c1,c2,c3 = 0,0,1
	for i=1,indexMax+1 do
		local wx,wy,wz = getWorldTranslation( vehicle.aiveChain.nodes[i].index )
		wy = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, wx,wy,wz)+0.25
		if i > 1 then
			
			drawDebugLine(px,py,pz,c1,c2,c3,wx,wy,wz,c1,c2,c3)
		end
		
		px = wx 
		py = wy 
		pz = wz
		
		local cx,cy,cz = getWorldTranslation( vehicle.aiveChain.nodes[i].index3 )
		cy = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, cx,cy,cz)+0.25
		drawDebugLine(wx,wy,wz,1,1,1,cx,cy,cz,1,1,1)
		local tx,ty,tz = getWorldTranslation( vehicle.aiveChain.nodes[i].index4 )
		ty = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, tx,ty,tz)+0.25
		drawDebugLine(cx,cy,cz,0.5,0.5,0.5,tx,ty,tz,0.5,0.5,0.5)
		
		cx,cy,cz = localToWorld( vehicle.aiveChain.nodes[i].index4, vehicle.aiveChain.activeX, 0, 0 )
		tx,ty,tz = localToWorld( vehicle.aiveChain.nodes[i].index4, vehicle.aiveChain.otherX, 0, 0 )
		drawDebugLine(cx,cy,cz,1,1,1,tx,ty,tz,1,1,1)		
	end		



	
	if vehicle.aiveChain.cbr ~= nil then
		for _,cbr in pairs( vehicle.aiveChain.cbr ) do
			local lx1,lz1,lx2,lz2,lx3,lz3,b,t = unpack( cbr )
			local ly1 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, lx1, 1, lz1) + 0.25
			local ly2 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, lx2, 1, lz2) + 0.25
			local ly3 = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, lx3, 1, lz3) + 0.25
			local c = { 0.2, 0.2, 0.2 }
			if b > 0 then
				c = { 1, 0, 0 }
			elseif t > 0 then
				c = { 0, 1, 0 }
			end
			
			drawDebugLine(lx1,ly1,lz1,c[1],c[2],c[3],lx3,ly3,lz3,c[1],c[2],c[3])
			drawDebugLine(lx1,ly1,lz1,c[1],c[2],c[3],lx2,ly2,lz2,c[1],c[2],c[3])
		end
	end
	
	if AIVEGlobals.showChannels > 0 then
		if vehicle.aiveTestMap == nil and vehicle.aiveCurrentField ~= nil then
			vehicle.aiveTestMap = vehicle.aiveCurrentField.getPoints()
			if vehicle.aiveTestMap ~= nil then
				print(string.format("points: %i",table.getn(vehicle.aiveTestMap)))
			end
		end
		
		if vehicle.aiveTestMap ~= nil then
			for _,p in pairs( vehicle.aiveTestMap ) do
				x,z = unpack( p )
				local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 1, z) + 2.2
				drawDebugPoint( x, y, z, 1,1,1, 1 )
			end
		end
	end
	
	if      vehicle.aiveChain.trace             ~= nil 
			and vehicle.aiveChain.trace.targetTrace ~= nil then
		local cr = 1
		if vehicle.aiveChain.trace.targetTraceMode > 0 then
			cr = 0
		end
		for i,p in pairs( vehicle.aiveChain.trace.targetTrace ) do
			local y = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, p.x, 1, p.z)
			
		
			drawDebugLine(  p.x, y, p.z,cr,1,0, p.x, y+4, p.z,cr,1,0)
			drawDebugPoint( p.x, y+4, p.z	, 1, 1, 1, 1 )
			drawDebugLine(  p.x, y+2, p.z,cr,1,0, p.x+p.dx, y+2, p.z+p.dz,cr,0,1)
		end
	end
	
end

------------------------------------------------------------------------
-- displayDebugInfo
------------------------------------------------------------------------
function AutoSteeringEngine.displayDebugInfo( vehicle )

	if vehicle.isControlled then
		setTextBold(false)
		setTextColor(1, 1, 1, 1)
		setTextAlignment(RenderText.ALIGN_LEFT)
		
		local fullText = ""
		
		fullText = fullText .. string.format("AIVehicleExtension:") .. "\n"
		
		renderText(0.51, 0.97, 0.02, fullText)		
	end
	
end

------------------------------------------------------------------------
-- getFruitArea
------------------------------------------------------------------------
function AutoSteeringEngine.getFruitArea( vehicle, x1,z1,x2,z2,d,toolIndex,noMinLength )
	local lx1,lz1,lx2,lz2,lx3,lz3 = AutoSteeringEngine.getParallelogram( x1, z1, x2, z2, d, noMinLength )
	return AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[toolIndex], lx1,lz1,lx2,lz2,lx3,lz3,noMinLength )
end
	
------------------------------------------------------------------------
-- getFruitAreaWorldPositions
------------------------------------------------------------------------
function AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, tool, lx1,lz1,lx2,lz2,lx3,lz3,origAI )

	return AIVehicleUtil.getAIAreaOfVehicle( tool.obj, lx1, lz1, lx2, lz2, lx3, lz3 )

end

------------------------------------------------------------------------
-- applySteering
------------------------------------------------------------------------
function AutoSteeringEngine.applySteering( vehicle, toIndex )

	if vehicle.aiveChain.minAngle == nil or vehicle.aiveChain.maxAngle == nil then
		vehicle.aiveChain.minAngle = -vehicle.aiveChain.maxSteering
		vehicle.aiveChain.maxAngle = vehicle.aiveChain.maxSteering
	end

	local a  = vehicle.aiveChain.currentSteeringAngle
	local j0 = vehicle.aiveChain.chainMax+2
	local af = math.abs(vehicle.aiveChain.maxAngle) + math.abs(vehicle.aiveChain.minAngle)
	
	if af > math.abs( vehicle.aiveChain.angleFactor ) then
		af = vehicle.aiveChain.angleFactor
	elseif vehicle.aiveChain.angleFactor < 0 then
		af = -af
	end
	
	local jMax = vehicle.aiveChain.chainMax
	if toIndex ~= nil and toIndex < vehicle.aiveChain.chainMax then 
		jMax = toIndex 
		AutoSteeringEngine.setChainStatus( vehicle, jMax + 1, AIVEStatus.initial )
	end
	for j=1,jMax do 
	--for j=1,vehicle.aiveChain.chainMax+1 do 
		local b = a

		if     AIVEGlobals.zeroAngle2 > 0
				or ( j == 1 and AutoSteeringEngine.isSetAngleZero( vehicle ) ) then 
			local aMin, aMax 
			
			if vehicle.aiveChain.leftActive	then
				aMin, aMax = -vehicle.aiveChain.minAngle, vehicle.aiveChain.maxAngle
			else
				aMin, aMax = vehicle.aiveChain.maxAngle, -vehicle.aiveChain.minAngle
			end
			
			if math.abs( vehicle.aiveChain.nodes[j].angle ) < 1E-4 then
				b = 0 
			elseif vehicle.aiveChain.nodes[j].angle > 0 then 
				-- outside 
				b = aMax * vehicle.aiveChain.nodes[j].angle 
			else 	
				-- inside
				b = aMin * vehicle.aiveChain.nodes[j].angle
			end
			
			if AIVEGlobals.zeroAngle2 > 0 and AIVEGlobals.zeroAngle2 ~= 1 then
				b = b * AIVEGlobals.zeroAngle2
			end
			
			if not vehicle.aiveChain.leftActive	then
				b = -b 
			end
		else	
			b = vehicle.aiveChain.nodes[j].angle * AutoSteeringEngine.getAngleStep( vehicle, j, af )
			if vehicle.aiveChain.nodes[j].angle < 0 then
				b = b * AIVEGlobals.angleFactorInside
			end
			b = b + a
		end
		
		a  = Utils.clamp( b, vehicle.aiveChain.minAngle, vehicle.aiveChain.maxAngle )
		
		if j0 > j and vehicle.aiveChain.nodes[j].status < AIVEStatus.steering then
			j0 = j
		end
		if j >= j0 then
			vehicle.aiveChain.nodes[j].steering  = a
			vehicle.aiveChain.nodes[j].radius    = 1E+6
			if math.abs(a) > 1E-5 then
				vehicle.aiveChain.nodes[j].radius  = vehicle.aiveChain.wheelBase / math.tan( a )
			end
			vehicle.aiveChain.nodes[j].invRadius = vehicle.aiveChain.invWheelBase * math.tan( a )			
			vehicle.aiveChain.nodes[j].status    = AIVEStatus.steering
		end
	end 
end

------------------------------------------------------------------------
-- applyRotation
------------------------------------------------------------------------
function AutoSteeringEngine.applyRotation( vehicle, toIndex )

	local cumulRot, turnAngle = 0, 0
	if vehicle.aiveChain.inField and AutoSteeringEngine.getTraceLength( vehicle ) > 5 then
		turnAngle = Utils.clamp( AutoSteeringEngine.getTurnAngle( vehicle ), -AIVEGlobals.maxRotation, AIVEGlobals.maxRotation )
		cumulRot  = turnAngle
	end 

	if not vehicle.isServer then return end
	
	AutoSteeringEngine.applySteering( vehicle, toIndex )

	local j0 = vehicle.aiveChain.chainMax+2
	local jMax = vehicle.aiveChain.chainMax
	if toIndex ~= nil and toIndex < vehicle.aiveChain.chainMax then 
		jMax = toIndex 
	end
	for j=1,jMax do 
		if j0 > j and vehicle.aiveChain.nodes[j].status < AIVEStatus.rotation then
			j0 = j
		end
		if j >= j0 then
			vehicle.aiveChain.nodes[j].tool = {}		
		
			--vehicle.aiveChain.nodes[j].rotation = math.tan( vehicle.aiveChain.nodes[j].steering ) * vehicle.aiveChain.invWheelBase
			local length = vehicle.aiveChain.nodes[j].length		
			local updateSteering

			if toIndex ~= nil and j > toIndex then
				vehicle.aiveChain.nodes[j].rotation = 0
				updateSteering = true
			else
				vehicle.aiveChain.nodes[j].rotation = 2 * math.asin( Utils.clamp( length * 0.5 * vehicle.aiveChain.nodes[j].invRadius, -1, 1 ) )
				updateSteering = false
			end
			
			--if vehicle.aiveChain.isInverted then
			--	vehicle.aiveChain.nodes[j].rotation = -vehicle.aiveChain.nodes[j].rotation
			--end
			
			local oldCumulRot = cumulRot
			cumulRot = cumulRot + vehicle.aiveChain.nodes[j].rotation
			
			if vehicle.aiveChain.smooth ~= nil then
				local restRot = ( 1 - vehicle.aiveChain.smooth ) * vehicle.aiveChain.nodes[j].rotation
				
				if     ( vehicle.aiveChain.nodes[j].rotation > 0 
						 and turnAngle + cumulRot > 0
						 and not ( vehicle.aiveChain.leftActive ) )
						or ( vehicle.aiveChain.nodes[j].rotation < 0 
						 and turnAngle + cumulRot < 0
						 and vehicle.aiveChain.leftActive ) then
					updateSteering = true
					if math.abs( turnAngle + cumulRot ) > math.abs( restRot ) then	
						vehicle.aiveChain.nodes[j].rotation = vehicle.aiveChain.nodes[j].rotation - restRot
					else
						vehicle.aiveChain.nodes[j].rotation = vehicle.aiveChain.nodes[j].rotation - turnAngle + cumulRot						
					end
				end
			end

			if     cumulRot >  vehicle.aiveChain.maxRotation then
				vehicle.aiveChain.nodes[j].rotation = vehicle.aiveChain.nodes[j].rotation + vehicle.aiveChain.maxRotation - cumulRot
				updateSteering                     = true
			elseif cumulRot < vehicle.aiveChain.minRotation then
				vehicle.aiveChain.nodes[j].rotation = vehicle.aiveChain.nodes[j].rotation + vehicle.aiveChain.minRotation - cumulRot
				updateSteering                     = true
			end
			
			if updateSteering then
				cumulRot = oldCumulRot + vehicle.aiveChain.nodes[j].rotation
				vehicle.aiveChain.nodes[j].invRadius  = math.sin( 0.5 * vehicle.aiveChain.nodes[j].rotation ) * 2 / vehicle.aiveChain.nodes[j].length
				if vehicle.aiveChain.nodes[j].invRadius > 1E-6 then
					vehicle.aiveChain.nodes[j].radius   = 1 / vehicle.aiveChain.nodes[j].invRadius
					vehicle.aiveChain.nodes[j].steering = math.atan2( vehicle.aiveChain.wheelBase, vehicle.aiveChain.nodes[j].radius )
				else
					vehicle.aiveChain.nodes[j].radius   = 1E+6
					vehicle.aiveChain.nodes[j].steering = 0
				end
				vehicle.aiveChain.nodes[j].tool     = {}
			end

			vehicle.aiveChain.nodes[j].cumulRot = cumulRot
			
			setRotation( vehicle.aiveChain.nodes[j].index2, 0, vehicle.aiveChain.nodes[j].rotation, 0 )
			vehicle.aiveChain.nodes[j].status   = AIVEStatus.rotation
		else
			cumulRot = cumulRot + vehicle.aiveChain.nodes[j].rotation
		end
	end 
end

------------------------------------------------------------------------
-- invalidateField
------------------------------------------------------------------------
function AutoSteeringEngine.invalidateField( vehicle, force )
	--if not ( vehicle.aiveFieldIsInvalid ) then print("invalidating field") end
	vehicle.aiveFieldIsInvalid = true
	if force then
		vehicle.aiveCurrentField = nil		
	end
	if vehicle.aiveChain ~= nil then
		vehicle.aiveChain.lastBestAngle  = nil
		vehicle.aiveChain.savedAngles    = nil
	end
end

------------------------------------------------------------------------
-- checkFieldNoBuffer
------------------------------------------------------------------------
 function AutoSteeringEngine.checkFieldNoBuffer( x, z, checkFunction ) 

	if x == nil or z == nil or checkFunction == nil then
		--AIVehicleExtension.printCallstack()
		return false
	end 
	
	if checkFunction == FieldBitmap.isFieldFast then
		return (getDensityAtWorldPos(g_currentMission.terrainDetailId, x, getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 0, z), z) % 16) > 0 
	end 
	
	FieldBitmap.prepareIsField( )
	local startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ = FieldBitmap.getParallelogram( x, z, 0.5, 0.25 )
	local ret = checkFunction( startWorldX, startWorldZ, widthWorldX, widthWorldZ, heightWorldX, heightWorldZ )
	FieldBitmap.cleanupAfterIsField( )
	
	return ret
end

------------------------------------------------------------------------
-- getCheckFunction
------------------------------------------------------------------------
function AutoSteeringEngine.getCheckFunction( vehicle )

	local checkFct, areaTotalFct
	
	checkFct     = FieldBitmap.isFieldFast
	areaTotalFct = FieldBitmap.getAreaTotal

	return checkFct, areaTotalFct
end

------------------------------------------------------------------------
-- checkField
------------------------------------------------------------------------
function AutoSteeringEngine.checkField( vehicle, x, z )

	local stepLog2 = AIVEGlobals.stepLog2

	if vehicle.aiveFieldIsInvalid then
		vehicle.aiveChain.lastX = nil
		vehicle.aiveChain.lastZ = nil 
		vehicle.aiveCurrentFieldCo = nil
		vehicle.aiveCurrentFieldCS = 'dead'
	
		if vehicle.aiveCurrentField ~= nil then
			local x1,_,z1 = localToWorld( vehicle.aiveChain.refNode, 0.5 * ( vehicle.aiveChain.activeX + vehicle.aiveChain.otherX ), 0, 0 )
			if vehicle.aiveCurrentField.getBit( x1, z1 ) then
				vehicle.aiveFieldIsInvalid = false			
			else
				local checkFunction, areaTotalFunction = AutoSteeringEngine.getCheckFunction( vehicle )
				if AutoSteeringEngine.checkFieldNoBuffer( x1, z1, checkFunction ) then
					vehicle.aiveCurrentField = nil	
				end
			end
		end
	end
	
	if vehicle.aiveCurrentField == nil then
		vehicle.aiveFieldIsInvalid = false
		
		local status, hektar = false, 0
		
		if vehicle.aiveCurrentFieldCo == nil then
			local checkFunction, areaTotalFunction = AutoSteeringEngine.getCheckFunction( vehicle )
			local x1,_,z1 = AutoSteeringEngine.getAiWorldPosition( vehicle )
			if vehicle.aiveChain.lastX ~= nil and vehicle.aiveChain.lastZ ~= nil then
				if Utils.vector2LengthSq( vehicle.aiveChain.lastX - x1, vehicle.aiveChain.lastZ - z1 ) < 1 then
					return true
				else
					vehicle.aiveChain.lastX = x1
					vehicle.aiveChain.lastZ = z1 
				end
			end
		
			x1,_,z1 = localToWorld( vehicle.aiveChain.refNode, 0.5 * ( vehicle.aiveChain.activeX + vehicle.aiveChain.otherX ), 0, 0 )
			local found = AutoSteeringEngine.checkFieldNoBuffer( x1, z1, checkFunction )
			
			if not found then
				local i = 1
				repeat
					if vehicle.aiveChain.tools == nil or vehicle.aiveChain.tools[i] == nil then
						break
					end
				
					x1,_,z1 = getWorldTranslation( vehicle.aiveChain.tools[i].steeringAxleNode )
					found   = AutoSteeringEngine.checkFieldNoBuffer( x1, z1, checkFunction )
					if not found then
						for m=1,table.getn( vehicle.aiveChain.tools[i].marker ) do
							x1,_,z1 = getWorldTranslation( vehicle.aiveChain.tools[i].marker[m] )
							found   = AutoSteeringEngine.checkFieldNoBuffer( x1, z1, checkFunction )
							if found then break end
						end
					end
					i = i + 1
				until found
			end
			
			if found then
				stepLog2 = math.log( g_currentMission.terrainDetailMapSize / g_currentMission.terrainSize ) / math.log( 2 )
	
				if AIVEGlobals.yieldCount < 1 then
					if checkFunction == AutoSteeringEngine.checkMowerField then
						vehicle.aiveCurrentField, hektar = FieldBitmap.createForFieldAtWorldPosition( x1, z1, stepLog2, 1, areaTotalFunction, nil, nil, 0 )
					else
						vehicle.aiveCurrentField, hektar = FieldBitmap.createForFieldAtWorldPositionSimple( x1, z1, stepLog2, 1, checkFunction )
					end
					vehicle.aiveCurrentFieldCo = nil
					vehicle.aiveCurrentFieldCS = 'dead'
				else
					if checkFunction == AutoSteeringEngine.checkMowerField then
						vehicle.aiveCurrentFieldCo = coroutine.create( FieldBitmap.createForFieldAtWorldPosition )
						status, vehicle.aiveCurrentField, hektar = coroutine.resume( vehicle.aiveCurrentFieldCo, x1, z1, stepLog2, 1, areaTotalFunction, nil, nil, AIVEGlobals.yieldCount )
					else
						vehicle.aiveCurrentFieldCo = coroutine.create( FieldBitmap.createForFieldAtWorldPositionSimple )
						status, vehicle.aiveCurrentField, hektar = coroutine.resume( vehicle.aiveCurrentFieldCo, x1, z1, stepLog2, 1, checkFunction, AIVEGlobals.yieldCount )
					end
					if status then
						vehicle.aiveCurrentFieldCS = coroutine.status( vehicle.aiveCurrentFieldCo )
					else
						print("Field detection failed: "..tostring(vehicle.aiveCurrentField))
						vehicle.aiveCurrentField   = nil
						vehicle.aiveCurrentFieldCo = nil
						vehicle.aiveCurrentFieldCS = 'dead'
					end
				end
			end
		elseif vehicle.aiveCurrentFieldCS ~= 'dead' then
			status, vehicle.aiveCurrentField, hektar = coroutine.resume( vehicle.aiveCurrentFieldCo )				
			if status then
				vehicle.aiveCurrentFieldCS = coroutine.status( vehicle.aiveCurrentFieldCo )
			else
				print("Field detection failed: "..tostring(vehicle.aiveCurrentField))
				vehicle.aiveCurrentField   = nil
				vehicle.aiveCurrentFieldCo = nil
				vehicle.aiveCurrentFieldCS = 'dead'
			end
		end
		
		if vehicle.aiveCurrentFieldCo ~= nil then
			if vehicle.aiveCurrentFieldCS == 'dead' then
				vehicle.aiveCurrentFieldCo = nil
			else
			--g_currentMission:addWarning(string.format("Field detection is running (%0.3f ha)", hektar), 0.018, 0.033)
				if vehicle.aiveCurrentField ~= nil then
					print("ups")
					vehicle.aiveCurrentField = nil
				end
			end
		end
	end
	
	if vehicle.aiveCurrentField == nil then 
		return true
	else
		return vehicle.aiveCurrentField.getBit( x, z )
	end
end

------------------------------------------------------------------------
-- isFieldAhead
------------------------------------------------------------------------
function AutoSteeringEngine.isFieldAhead( vehicle, distance, node )
	if node == nil then
		node = vehicle.aiveChain.refNode
	end
	
	local w = math.max( 1, 0.25 * vehicle.aiveChain.width )--+ 0.13 * vehicle.aiveChain.headland )
	
	for j=-2,2 do
		local x,y,z = localToWorld( node, j * w, 0, distance )
		if AutoSteeringEngine.checkField( vehicle, x, z ) then return true end
	end
	return false
	
end

------------------------------------------------------------------------
-- initHeadlandVector
------------------------------------------------------------------------
function AutoSteeringEngine.initHeadlandVector( vehicle )

--if vehicle.aiveChain.isTurnMode7 then
--	vehicle.aiveChain.headland = vehicle.aiveChain.width 
--end

	if      vehicle.aiveChain         ~= nil
	    and vehicle.aiveChain.refNode ~= nil then
		local x,_,z = AutoSteeringEngine.getAiWorldPosition( vehicle )
		if     vehicle.aiveChain.collisionDists == nil
				or vehicle.aiveChain.collisionDistX == nil
				or vehicle.aiveChain.collisionDistZ == nil
				or Utils.vector2LengthSq( vehicle.aiveChain.collisionDistX - x, vehicle.aiveChain.collisionDistZ - z ) > 2 then
			vehicle.aiveChain.collisionDists      = {}
			vehicle.aiveChain.collisionDistX      = x
			vehicle.aiveChain.collisionDistZ      = z
			vehicle.aiveChain.collisionDistPoints = nil
		end
	end
	
	if not vehicle.isServer then return end
	
	AutoSteeringEngine.rotateHeadlandNode( vehicle )
	local w = vehicle.aiveChain.width
	local w = math.max( 1, 0.25 * w )--+ 0.13 * vehicle.aiveChain.headland )	
	local d = 0
	if      AIVEGlobals.ignoreDist > 0 
			and vehicle.aiveChain.turnMode  ~= "C"
			and vehicle.aiveChain.turnMode  ~= "L"
			and vehicle.aiveChain.turnMode  ~= "K" 
			and vehicle.aiveChain.turnMode  ~= "7" then
		if d < AIVEGlobals.ignoreDist then
			d = AIVEGlobals.ignoreDist
		end
		if ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
			for i=1,table.getn(vehicle.aiveChain.toolParams) do
				local d2 = math.abs( vehicle.aiveChain.toolParams[i].zReal - vehicle.aiveChain.toolParams[i].zBack )
				if d < d2 and vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i].isSowingMachine then 
					d = d2
				end
			end
		end
	end
	d = d + vehicle.aiveChain.headland
	
	vehicle.aiveChain.headlandVector       = {}
	vehicle.aiveChain.headlandVector.front = {}
	vehicle.aiveChain.headlandVector.back  = {}
	for j=1,5 do
		local front = {}
		front.x,_,front.z   = localDirectionToWorld( vehicle.aiveChain.headlandNode, (j-3)*w, 0, d )
		--front.x1,_,front.z1 = localDirectionToWorld( vehicle.aiveChain.headlandNode, (j-3)*w, 0, 1 )
		vehicle.aiveChain.headlandVector.front[j] = front
		
		local back  = {}
		back.x,_,back.z   = localDirectionToWorld( vehicle.aiveChain.headlandNode, (j-3)*w, 0,-d )
		--back.x1,_,back.z1 = localDirectionToWorld( vehicle.aiveChain.headlandNode, (j-3)*w, 0, 1 )
		vehicle.aiveChain.headlandVector.back[j]  = back
	end
end

------------------------------------------------------------------------
-- isChainPointOnField
------------------------------------------------------------------------
function AutoSteeringEngine.isChainPointOnField( vehicle, xw, zw )
	if not vehicle.isServer then return true end
	
	local front = false
	local back  = false

	for j=1,5 do
		if AutoSteeringEngine.checkField( vehicle, xw + vehicle.aiveChain.headlandVector.front[j].x, zw + vehicle.aiveChain.headlandVector.front[j].z ) then
			front = true
		end
		if AutoSteeringEngine.checkField( vehicle, xw + vehicle.aiveChain.headlandVector.back[j].x, zw + vehicle.aiveChain.headlandVector.back[j].z ) then
			back = true
		end
	end
	
	return front and back
end

------------------------------------------------------------------------
-- isNotHeadland
------------------------------------------------------------------------
function AutoSteeringEngine.isNotHeadland( vehicle, distance )
	local x,y,z
	local fRes  = true
	local angle = AutoSteeringEngine.getTurnAngle( vehicle )
	local dist  = distance
	
	if vehicle.aiveChain.headland < 1E-3 then return true end
	
	if math.abs(angle)> 0.5*math.pi then
		dist = -dist
	end
	
	--if vehicle.aiveChain.headland > 0 then		
		setRotation( vehicle.aiveChain.headlandNode, 0, -angle, 0 )
		
		local d = dist + ( vehicle.aiveChain.headland + 1 )
		for i=0,d do
			if not AutoSteeringEngine.isFieldAhead( vehicle, d, vehicle.aiveChain.headlandNode ) then
				fRes = false
				break
			end
		end
		
		if fRes then
			d = dist - ( vehicle.aiveChain.headland + 1 )
			for i=0,d do
				if not AutoSteeringEngine.isFieldAhead( vehicle, d, vehicle.aiveChain.headlandNode ) then
					fRes = false
					break
				end
			end
		end
	--end
	
	return fRes
end

------------------------------------------------------------------------
-- getChainPoint
------------------------------------------------------------------------
function AutoSteeringEngine.getChainPoint( vehicle, i, tp )

	if not vehicle.isServer then return 0,0 end
	
	local tpx    = tp.x
	local dtpx   = 0
	
	if i > 1 and vehicle.aiveChain.widthDec ~= 0 then
		local w = tp.width
		if 0 < AIVEGlobals.widthMaxDec and AIVEGlobals.widthMaxDec < w then
			w = AIVEGlobals.widthMaxDec
		end
		dtpx = w * vehicle.aiveChain.widthDec * vehicle.aiveChain.nodes[i].distance
	end
	
	if vehicle.aiveChain.leftActive then
		tpx = tpx - dtpx
	else
		tpx = tpx + dtpx
	end
	
	if     vehicle.aiveChain.nodes[i].status < AIVEStatus.position
		--or i == 1
      or vehicle.aiveChain.nodes[i].tool[tp.i]   == nil 
			or vehicle.aiveChain.nodes[i].tool[tp.i].x == nil 
			or vehicle.aiveChain.nodes[i].tool[tp.i].z == nil then

	--if math.abs( vehicle.aiveChain.nodes[i].rotation ) > 1E-3 then
	--	local test1 = math.sin( 0.5 * vehicle.aiveChain.nodes[i].rotation ) * 2 / vehicle.aiveChain.nodes[i].length
	--	local test2 = vehicle.aiveChain.nodes[i].radius * test1
	--	
	--	if math.abs( test2-1 ) > 1E-2 then
	--		print(string.format("Wrong rotation: %d, %3.1f° (%3.1f°), %3.1fm, %3.1fm, %3.1fm, %3.1f", 
	--												i, 
	--												math.deg( vehicle.aiveChain.nodes[i].rotation ), 
	--												math.deg( vehicle.aiveChain.nodes[i].cumulRot ), 
	--												vehicle.aiveChain.nodes[i].radius,
	--												vehicle.aiveChain.nodes[i].invRadius,
	--												test1,
	--												test2 ))
	--	end
	--end
				
		vehicle.aiveChain.nodes[i].tool[tp.i] = {}
		vehicle.aiveChain.nodes[i].tool[tp.i].a = tp.angle 

		setTranslation( vehicle.aiveChain.nodes[i].index3, 0, 0, tp.b1 )
		setTranslation( vehicle.aiveChain.nodes[i].index4, 0, 0, tp.z - tp.b1 )
			
		if i > 1 and math.abs( tp.b2 + tp.b3 ) > 1E-3 then
			if vehicle.aiveChain.nodes[i-1].status < AIVEStatus.position then
				AutoSteeringEngine.getChainPoint( vehicle, i-1, tp )
			end
			
			local dx, dy, dz = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.nodes[i].index, vehicle.aiveChain.nodes[i-1].index4 )
				
			vehicle.aiveChain.nodes[i].tool[tp.i].a = math.atan2( dx, -dz )			
		end	
			
		setRotation( vehicle.aiveChain.nodes[i].index3, 0, -vehicle.aiveChain.nodes[i].tool[tp.i].a, 0 )
			
		local idx = vehicle.aiveChain.nodes[i].index4
		local ofs = tpx
		
		if i == 1 and ( vehicle.aiveChain.tools[tp.i].aiForceTurnNoBackward or AIVEGlobals.shiftFixZ <= 0 ) then
			if vehicle.aiveChain.leftActive	then
				ofs = -tp.offset 
				idx = tp.nodeLeft 
			else
				ofs = tp.offset 
				idx = tp.nodeRight
			end
			vehicle.aiveChain.nodes[i].tool[tp.i].x, vehicle.aiveChain.nodes[i].tool[tp.i].y, vehicle.aiveChain.nodes[i].tool[tp.i].z = AutoSteeringEngine.toolLocalToWorld( vehicle, tp.i, idx, ofs, 0 )
		else
			vehicle.aiveChain.nodes[i].tool[tp.i].x, vehicle.aiveChain.nodes[i].tool[tp.i].y, vehicle.aiveChain.nodes[i].tool[tp.i].z = localToWorld( idx, ofs, 0, 0 )
		end
		
		vehicle.aiveChain.nodes[i].tool[tp.i].x, vehicle.aiveChain.nodes[i].tool[tp.i].z = AutoSteeringEngine.normalizePosition( vehicle, vehicle.aiveChain.nodes[i].tool[tp.i].x, vehicle.aiveChain.nodes[i].tool[tp.i].z )
		
		vehicle.aiveChain.nodes[i].status = AIVEStatus.position
	end

	
	return vehicle.aiveChain.nodes[i].tool[tp.i].x, vehicle.aiveChain.nodes[i].tool[tp.i].y, vehicle.aiveChain.nodes[i].tool[tp.i].z
	
end

------------------------------------------------------------------------
-- normalizePosition
------------------------------------------------------------------------
function AutoSteeringEngine.normalizePosition( vehicle, x, z )
	if vehicle.aiveChain.worldToDensity == nil then
		vehicle.aiveChain.worldToDensity  = 2 * g_currentMission.terrainDetailMapSize / g_currentMission.terrainSize
		vehicle.aiveChain.worldToDensityI = 1 / vehicle.aiveChain.worldToDensity
	end
	
	local nx = math.floor(x*vehicle.aiveChain.worldToDensity+0.5) * vehicle.aiveChain.worldToDensityI
	local nz = math.floor(z*vehicle.aiveChain.worldToDensity+0.5) * vehicle.aiveChain.worldToDensityI
		
	return nx, nz
end

------------------------------------------------------------------------
-- getChainBorder
------------------------------------------------------------------------
function AutoSteeringEngine.getChainBorder( vehicle, i1, i2, toolParam, detectWidth )
	if not vehicle.isServer then return 0,0 end
	
	local b,t    = 0,0
	local bo,to  = 0,0
	local bw,tw  = 0,0
	local d      = false
	local i      = i1
	local count  = 0
	local offsetOutside = -1
	
	if vehicle.aiveChain.leftActive	then
		offsetOutside = 1
	end
	
	local offsetInside  = -toolParam.offsetStd * offsetOutside

	local fcOffset = -offsetOutside * toolParam.width
	local detectedBefore = false 
	if detectWidth then
		detectedBefore = true 
	end
	local dx, _, dz = localDirectionToWorld( vehicle.aiveChain.refNode, -offsetOutside, 0, 0 )
	
	if 1 <= i and i <= vehicle.aiveChain.chainMax then
		local xp,yp,zp = AutoSteeringEngine.getChainPoint( vehicle, i, toolParam )
		local fp       = AutoSteeringEngine.isChainPointOnField( vehicle, xp, zp )
		local ncp      = not AutoSteeringEngine.hasCollision( vehicle, vehicle.aiveChain.nodes[i].index )
		
		while i<=i2 and i<=vehicle.aiveChain.chainMax do			
			local x2,y2,z2 = AutoSteeringEngine.getChainPoint( vehicle, i+1, toolParam )
			local xc       = x2
			local yc       = y2
			local zc       = z2
			local f2       = AutoSteeringEngine.isChainPointOnField( vehicle, xc, zc )
			local fc       = f2
			local ncc      = not AutoSteeringEngine.hasCollision( vehicle, vehicle.aiveChain.nodes[i+1].index )
			
			if vehicle.aiveChain.nodes[i].tool[toolParam.i] == nil then
				AIVehicleExtension.printCallstack()
				AITractor.stopAITractor(vehicle)
			end
			
			local bi, ti = 0, 0
			local bj, tj = 0, 0
			local bk, tk = 0, -1
			local fi     = false
			
			if  		AIVEGlobals.borderBuffer > 0
					and vehicle.aiveChain.nodes[i].status >= AIVEStatus.border
					and vehicle.aiveChain.nodes[i].tool[toolParam.i].b ~= nil
					and vehicle.aiveChain.nodes[i].tool[toolParam.i].t ~= nil then
					
				if vehicle.aiveChain.nodes[i].tool[toolParam.i].t >= 0 then
					fi = true
					bi = vehicle.aiveChain.nodes[i].tool[toolParam.i].b
					ti = vehicle.aiveChain.nodes[i].tool[toolParam.i].t
					bj = vehicle.aiveChain.nodes[i].tool[toolParam.i].bo
					tj = vehicle.aiveChain.nodes[i].tool[toolParam.i].to
				end
				
			else			
				vehicle.aiveChain.nodes[i].status = AIVEStatus.border
				vehicle.aiveChain.nodes[i].tool[toolParam.i].t  = -1
				vehicle.aiveChain.nodes[i].tool[toolParam.i].b  = 0
				vehicle.aiveChain.nodes[i].tool[toolParam.i].bo = 0
				vehicle.aiveChain.nodes[i].tool[toolParam.i].to = 0
				vehicle.aiveChain.nodes[i].tool[toolParam.i].bw = 0
				vehicle.aiveChain.nodes[i].tool[toolParam.i].tw = -1
				
				if ncp and ncc and fp then
						
					local f = 1
					while f > 0.01 do
						xc = xp + f*(x2-xp)
						yc = yp + f*(y2-yp)
						zc = zp + f*(z2-zp)
						fc = f2
						
						if f < 1 then
							fc = AutoSteeringEngine.isChainPointOnField( vehicle, xc, zc )
						end
						if fc then
							fi = true
							break
						end
						f = f - 0.334
					end
					
					if      fi
							and vehicle.aiveChain.respectStartNode 
							and ( AutoSteeringEngine.getRelativeZTranslation( vehicle.aiveChain.startNode, vehicle.aiveChain.nodes[i].index )   < 0
								 or AutoSteeringEngine.getRelativeZTranslation( vehicle.aiveChain.startNode, vehicle.aiveChain.nodes[i+1].index ) < 0 ) then
					--print("respecting start node "..tostring(i))
						fi = false
					end
					
					if fi then	
						vehicle.aiveChain.nodes[i].tool[toolParam.i].t  = 0
						
						bi, ti  = AutoSteeringEngine.getFruitArea( vehicle, xp, zp, xc, zc, offsetOutside, toolParam.i )		
						if math.abs( offsetInside ) > 0.01 and bi <= 0 then
							bj, tj  = AutoSteeringEngine.getFruitArea( vehicle, xp, zp, xc, zc, offsetInside, toolParam.i )			
						end
						
						if vehicle.aiveChain.collectCbr then
							local cbr = { AutoSteeringEngine.getParallelogram( xp, zp, xc, zc, offsetOutside ) }
							cbr[7]    = bi
							cbr[8]    = ti
							if vehicle.aiveChain.cbr == nil then
								vehicle.aiveChain.cbr = {}
							end							
							table.insert( vehicle.aiveChain.cbr, cbr )
						end
						
						vehicle.aiveChain.nodes[i].tool[toolParam.i].b  = bi
						vehicle.aiveChain.nodes[i].tool[toolParam.i].t  = ti
						vehicle.aiveChain.nodes[i].tool[toolParam.i].bo = bj
						vehicle.aiveChain.nodes[i].tool[toolParam.i].to = tj
					end
				end
			end
			
			if toolParam.width < 0.5 or bi > 0 or AIVEGlobals.detectLevel3 <= 0 then
				bk = 0
				tk = 0
				vehicle.aiveChain.nodes[i].tool[toolParam.i].bw = 0
				vehicle.aiveChain.nodes[i].tool[toolParam.i].tw = 0
			elseif bj > 0 then
				bk = bj
				tk = tj
				detectedBefore = true
			elseif tk < 0 then
				local xs, zs, xw, zw, xl, zw
				local l = toolParam.width / Utils.vector2Length( xp-xc, zp-zc )
				
				if fi then
					xs = xp
					zs = zp 
					if l <= 1 then
						xl = xc
						zl = zc 
					end
					
					local xm = xp + 2 * toolParam.width * dx
					local zm = zp + 2 * toolParam.width * dz
					if AutoSteeringEngine.isChainPointOnField( vehicle, xm, zm ) then					
						xw = xm
						zw = zm
					end
				end
				
				if xw == nil then
					for m=10,0,-1 do
						local xm = xp + 0.2 * m * toolParam.width * dx
						local zm = zp + 0.2 * m * toolParam.width * dz
						
						if AutoSteeringEngine.isChainPointOnField( vehicle, xm, zm ) then					
							if xw == nil then
								xw = xm
								zw = zm
								if xs ~= nil then
									break
								end
							else
								xs = xm
								zs = zm
							end
						end
					end
				end
				
				if xl == nil and xs ~= nil and xw ~= nil then
					for n=7,1,-1 do
						local xn = xs + ( xc - xp ) * l * 0.1 * n
						local zn = zs + ( zc - zp ) * l * 0.1 * n

						if AutoSteeringEngine.isChainPointOnField( vehicle, xn, zn ) then
							xl = xn
							zl = zn
							break
						end
					end
				end
				
				if xs ~= nil and xw ~= nil and xl ~= nil then
					bk, tk = AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[toolParam.i], xs, zs ,xw, zw, xl, zl )
					if bk > 0 then
						detectedBefore = true
					end
					if vehicle.aiveChain.collectCbr then
						table.insert( vehicle.aiveChain.cbr, { xs, zs ,xw, zw, xl, zl, bk, tk } )
					end
				--print("1: "..tostring(detectedBefore)..string.format("(%5.2f, %5.2f) (%5.2f, %5.2f) (%5.2f, %5.2f) %5.2f / %5.2f",xs,zs,xw,zw,xl,zl,Utils.vector2Length(xw-xs,zw-zs),Utils.vector2Length(xl-xs,zl-zs))
				--			.." "..tostring(bk).." "..tostring(tk))				
				else
					bk = 0
					tk = 1 
				--print("2: "..tostring(detectedBefore).." "..tostring(xs).." "..tostring(xw).." "..tostring(xl).." "..tostring(bk).." "..tostring(tk))				
				end

				
				vehicle.aiveChain.nodes[i].tool[toolParam.i].bw = bk
				vehicle.aiveChain.nodes[i].tool[toolParam.i].tw = tk
			else
				bk = vehicle.aiveChain.nodes[i].tool[toolParam.i].bw
				tk = vehicle.aiveChain.nodes[i].tool[toolParam.i].tw
			end
			
			if fi then
				b  = b  + bi
				t  = t  + ti
				bo = bo + bj
				to = to + tj
				
				if tk >= 0 then
					bw = bw + bk
					tw = tw + tk
				end
				
				vehicle.aiveChain.nodes[i].isField = true
				if b > 0 then
					vehicle.aiveChain.nodes[i].hasBorder = true
				end
				if bi > 0 or bj > 0 then -- or bk > 0 then
					vehicle.aiveChain.nodes[i].detected = true
					detectedBefore = true
				end
			end
			
			if     b > 0 then
				return b, t, bo, to, vehicle.aiveChain.nodes[i+1].distance
			elseif AIVEGlobals.detectLevel3 > 0 and detectedBefore and bk <= 0 and tk > 0 then
				return b, t, bo, to, vehicle.aiveChain.nodes[i].distance
			end
			
			i = i + 1
			xp = x2
			yp = yc
			zp = z2
			fp = f2
			ncp = ncc
		end
	end
	
	return b, t, bo, to, math.huge
end

------------------------------------------------------------------------
-- getAllChainBorders
------------------------------------------------------------------------
function AutoSteeringEngine.getAllChainBorders( vehicle, i1, i2, detectWidth )
	if not vehicle.isServer then return 0,0,0,0 end
	
	local b,t   = 0,0
	local bo,to = 0,0
	local ll    = 0
	
	if i1 == nil then i1 = 1 end
	if i2 == nil then i2 = vehicle.aiveChain.chainMax end
	
	local i      = i1
	if 1 <= i and i <= vehicle.aiveChain.chainMax then
		while i<=i2 and i<=vehicle.aiveChain.chainMax do				
			vehicle.aiveChain.nodes[i].hasBorder = false
			i = i + 1
		end
	end
		
	for _,tp in pairs(vehicle.aiveChain.toolParams) do	
		if not ( tp.skip ) then
			local bi,ti,bj,tj,l = AutoSteeringEngine.getChainBorder( vehicle, i1, i2, tp, detectWidth )				
			b  = b  + bi
			t  = t  + ti
			bo = bo + bj
			to = to + tj
			ll = math.max( ll, l )
		end
	end
	
	return b,t,bo,to,ll
end

------------------------------------------------------------------------
-- getSteeringParameterOfTool
------------------------------------------------------------------------
function AutoSteeringEngine.getSteeringParameterOfTool( vehicle, toolIndex, maxLooking, widthOffset, widthFactor )
	
	local toolParam = {}
	toolParam.i       = toolIndex

	local tool = vehicle.aiveChain.tools[toolIndex]
	local maxAngle, minAngle
	local xl = -999
	local xr = 999
	local zb = 999
	local il, ir, ib, i1, zl, zr	
	
	toolParam.limitOutside = false
	toolParam.limitInside  = false
	if AIVEGlobals.limitOutside > 0 then --and tool.hasFruits then
		toolParam.limitOutside = true
	end
	if AIVEGlobals.limitInside  > 0 then
		toolParam.limitInside  = true
	end
	
	if tool.aiForceTurnNoBackward then
		local x1, z1, i1
	
--  no reverse allowed	
		local xOffset,_,zOffset = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode, tool.refNode )
		if xOffset == nil or zOffset == nil then
			xOffset = 0 
			zOffset = 0 
		end
		
		if tool.aiBackMarker ~= nil then
			_,_,zb = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode, tool.aiBackMarker )
			if zb == nil then zb = 0 end			
			zb = zb - zOffset
		end
		
		for i=1,table.getn(tool.marker) do
			local xxx,_,zzz = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode, tool.marker[i] )
			xxx = xxx - xOffset
			zzz = zzz - zOffset
			if tool.invert then xxx = -xxx zzz = -zzz end
			if xl < xxx then xl = xxx zl = zzz il = i end
			if xr > xxx then xr = xxx zr = zzz ir = i end
			-- back marker!
			if zb > zzz then zb = zzz ib = i end
		end
		
		local width  = xl - xr		
		local offset = AutoSteeringEngine.getWidthOffset( vehicle, width, widthOffset, widthFactor )
		toolParam.offsetStd = AutoSteeringEngine.getWidthOffsetStd( vehicle, width )
		
		width = width - offset - offset

		if vehicle.aiveChain.leftActive	then
	-- left	
			x1 = xl - offset 
			z1 = zl
			i1 = il
		else
	-- right	
			x1 = xr + offset
			z1 = zr
			i1 = ir
		end
		
		local x0,_,z0 = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.refNode )
		
		zb = zb + z1
		x1 = x1 + x0
		z1 = z1 + z0
		toolParam.zReal = z1
		
	--if vehicle.aiveDebugTimer == nil or vehicle.aiveDebugTimer < g_currentMission.time then
	--	vehicle.aiveDebugTimer = g_currentMission.time + 1000		
	--	print(string.format("l: %1.2f r: %1.2f o: %1.2f xo: %1.2f zo: %1.2f x1: %1.2f z1: %1.2f", xl, xr, offset, xOffset, zOffset, x1, z1 ) )
	--end
		
		local b1,b2,b3 = z1, 0, 0

		local r1 = math.sqrt( x1*x1 + b1*b1 )		
		r1       = ( 1 + AIVEGlobals.minMidDist ) * ( r1 + math.max( 0, -b1 ) )
		local a1 = math.atan( vehicle.aiveChain.wheelBase / r1 )
		
		local toolAngle = 0
	
		if b1 < 0 then
			local _,_,z4  = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.refNode )
			b1 = z4 -- + 0.4
			
			if tool.b1 ~= nil then
				b1 = b1 + tool.b1
			end
			
			if tool.b2 == nil then
				local x3,_,z3 = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode ,tool.marker[i1] )
				if tool.invert then x3 = -x3 z3=-z3 end				
				local _,_,z5  = AutoSteeringEngine.getRelativeTranslation( tool.marker[i1] ,tool.aiBackMarker )
				if tool.invert then z5=-z5 end								
				b2 = z3 - zOffset + 0.5 * z5
			else
				b2 = tool.b2
			end
			
		--if b1 < 0 and b2 < -1 then
		--	b2 = b2 + 0.5
		--	b1 = b1 - 0.5
		--end
			
			if tool.b3 ~= nil then
				b3 = tool.b3
			end
			
			toolAngle = AutoSteeringEngine.getRelativeYRotation( vehicle.aiveChain.refNode, tool.steeringAxleNode )
			if tool.invert then
				if toolAngle < 0 then
					toolAngle = toolAngle + math.pi
				else
					toolAngle = toolAngle - math.pi
				end
			end
			
			if tool.doubleJoint then
				toolAngle = toolAngle + toolAngle
			end

		--z1 = 0.5 * ( b1 + z1 )
		end

		toolParam.x        = x1
		toolParam.z        = z1
		toolParam.zBack    = zb
		toolParam.nodeBack = tool.marker[ib]
		toolParam.nodeLeft = tool.marker[il]
		toolParam.nodeRight= tool.marker[ir]
		toolParam.b1       = b1
		toolParam.b2       = b2
		toolParam.b3       = b3
		toolParam.offset   = offset
		toolParam.width    = width
		toolParam.angle    = toolAngle
		toolParam.minRaduis= r1
		toolParam.refAngle = Utils.clamp( a1, vehicle.aiveChain.minLooking, maxLooking )
		toolParam.refAngle2= maxLooking

	else
		local x1
		local z1 = -999
	
--  normal tool, can be lifted and reverse is possible
		if tool.aiBackMarker ~= nil then
			_,_,zb = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.aiBackMarker )
		end
		
		for i=1,table.getn(tool.marker) do
			local xxx,_,zzz = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.marker[i] )			
			if xl < xxx then xl = xxx zl = zzz il = i end
			if xr > xxx then xr = xxx zr = zzz ir = i end
			-- back marker!
			if zb > zzz then zb = zzz ib = i end
		end

		local width  = xl - xr
		local offset = AutoSteeringEngine.getWidthOffset( vehicle, width, widthOffset, widthFactor )
		toolParam.offsetStd = AutoSteeringEngine.getWidthOffsetStd( vehicle, width )

		width = width - offset - offset

		if vehicle.aiveChain.leftActive	then
	-- left	
			x1 = xl - offset
			z1 = zl
			i1 = il
		else
	-- right		
			x1 = xr + offset
			z1 = zr
			i1 = ir
		end

		toolParam.zReal = z1

		local r1 = math.sqrt( x1*x1 + z1*z1 )		
		r1       = ( 1 + AIVEGlobals.minMidDist ) * ( r1 + math.max( 0, -z1 ) )
		local a1 = math.atan( vehicle.aiveChain.wheelBase / r1 )
		local a2 = maxLooking 
		
		if z1 < 0 and toolParam.offsetStd > 0 and ( toolParam.limitOutside or toolParam.limitInside ) then
			local of = toolParam.offsetStd
			local zf = z1 + 0.1 * ( zb-z1 )
			local r2 = ( zf*zf - of*of ) / ( of+of )
			if vehicle.aiveChain.leftActive then
				r2 = r2 + xl
			else
				r2 = r2 - xr
			end
			--print(tostring(r1).." "..tostring(r2).." "..tostring(z1).." "..tostring(offset).." "..tostring(x1))
			if r2 < r1 then
				r2 = r1
			end
			
			if     toolParam.limitOutside and toolParam.limitInside then
				a2 = Utils.clamp(  math.atan( vehicle.aiveChain.wheelBase / r2 ), vehicle.aiveChain.minLooking, a2 )
				a1 = math.min( a1, a2 )
			elseif toolParam.limitOutside then
				a1 = Utils.clamp(  math.atan( vehicle.aiveChain.wheelBase / r2 ), vehicle.aiveChain.minLooking, a1 )
			end
		end
		
		
	----print(tostring(math.deg(a1)))
	--
	----if tool.isPlough then
	--	--a1 = 0.5 * a1
	----elseif z1 < 0 and vehicle.aiveChain.realSteeringAngle ~= nil then			
	--if AIVEGlobals.shiftFixZ > 0 and z1 < 0 and vehicle.aiveChain.realSteeringAngle ~= nil then			
	--	if math.abs( vehicle.aiveChain.realSteeringAngle ) > 1E-4 then
	--		local rr, xx, bb
	--		if vehicle.aiveChain.realSteeringAngle > 0 then
	--			xx = x1
	--		else
	--			xx = -x1
	--		end				
	--		rr = vehicle.aiveChain.wheelBase / math.tan( math.abs( vehicle.aiveChain.realSteeringAngle ) )
	--		if 0 < xx and xx < rr then
	--			bb = math.atan( -z1 / ( rr - xx ) )
	--		else
	--			bb = math.asin( -z1 / rr )
	--		end
	--						
	--		xx = rr * ( 1 - math.cos( bb ) )
	--		if vehicle.aiveChain.realSteeringAngle > 0 then
	--			x1 = x1 + xx
	--		else
	--			x1 = x1 - xx
	--		end
	--		z1 = z1 + rr * math.sin( bb ) 
	--	else
	--		z1 = 0
	--	end
	--end
		if AIVEGlobals.shiftFixZ > 0 then
			z1 = math.max( z1-0.5, 0.5 * ( z1+zb ) )
		end
		
		toolParam.x        = x1
		toolParam.z        = z1
		toolParam.zBack    = zb
		toolParam.nodeBack = tool.marker[ib]
		toolParam.nodeLeft = tool.marker[il]
		toolParam.nodeRight= tool.marker[ir]
		toolParam.b1       = z1
		toolParam.b2       = 0
		toolParam.b3       = 0
		toolParam.offset   = offset
		toolParam.width    = width
		toolParam.angle    = 0
		toolParam.minRaduis= r1
		toolParam.refAngle = a1
		toolParam.refAngle2= a2
	
	end

	if vehicle.aiveChain.leftActive then
		toolParam.minAngle = -math.min(toolParam.refAngle2, maxLooking )
		toolParam.maxAngle = math.min( toolParam.refAngle,  maxLooking )
	else
		toolParam.minAngle = -math.min(toolParam.refAngle,  maxLooking )
		toolParam.maxAngle = math.min( toolParam.refAngle2, maxLooking )
	end

	-- width is always left - right 
	if vehicle.aiveChain.leftActive then
	-- toolParam.x is left marker (the biggest one) => l - ( l - r ) = l - l + r = r
		toolParam.xOther = toolParam.x - toolParam.width
	else
	-- toolParam.x is right marker => r + l - r = l
		toolParam.xOther = toolParam.x + toolParam.width
	end
	
	return toolParam
end

------------------------------------------------------------------------
-- setChainStatus
------------------------------------------------------------------------
function AutoSteeringEngine.setChainStatus( vehicle, startIndex, newStatus )
	if not vehicle.isServer then 
		print("ERROR: AutoSteeringEngine.setChainStatus called at client")
		return
	end
	
	if vehicle.aiveChain ~= nil and vehicle.aiveChain.nodes ~= nil then
		local i = math.max(startIndex,1)
		while i <= vehicle.aiveChain.chainMax + 1 do
			if vehicle.aiveChain.nodes[i].status > newStatus then
				vehicle.aiveChain.nodes[i].status = newStatus
				vehicle.aiveChain.nodes[i].tool   = {}
			end
			i = i + 1
		end
	end
end

------------------------------------------------------------------------
-- initSteering
------------------------------------------------------------------------
function AutoSteeringEngine.initSteering( vehicle )

	if not vehicle.isServer then
		print("ERROR: AutoSteeringEngine.initSteering called at client")
		return
	end

	local mi = vehicle.aiveChain.minAngle 
	local ma = vehicle.aiveChain.maxAngle

	if vehicle.aiveChain.toolParams == nil or table.getn( vehicle.aiveChain.toolParams ) < 1 then
		vehicle.aiveChain.minAngle  = -vehicle.aiveChain.maxSteering
		vehicle.aiveChain.maxAngle  = vehicle.aiveChain.maxSteering
		vehicle.aiveChain.width     = 0
		vehicle.aiveChain.maxZ      = 0
		vehicle.aiveChain.minZ      = 0
		vehicle.aiveChain.activeX   = 0
		vehicle.aiveChain.otherX    = 0
		vehicle.aiveChain.offsetZ   = 0
		vehicle.aiveChain.backZ     = 0
		vehicle.aiveChain.offsetStd = 0
  else
		vehicle.aiveChain.minAngle  = nil
		vehicle.aiveChain.maxAngle  = nil
		vehicle.aiveChain.activeX   = nil
		vehicle.aiveChain.otherX    = nil
		
		vehicle.aiveChain.width     = 0
		vehicle.aiveChain.maxZ      = nil
		vehicle.aiveChain.minZ      = nil
		vehicle.aiveChain.offsetZ   = nil
		vehicle.aiveChain.backZ     = nil 
		vehicle.aiveChain.offsetStd = 0
		
		for _,tp in pairs(vehicle.aiveChain.toolParams) do							
			if vehicle.aiveChain.maxZ  == nil or vehicle.aiveChain.maxZ < tp.zReal then
				vehicle.aiveChain.maxZ  = tp.zReal
			end
			if vehicle.aiveChain.minZ  == nil or vehicle.aiveChain.minZ > tp.zReal then
				vehicle.aiveChain.minZ  = tp.zReal
			end
			if vehicle.aiveChain.offsetZ == nil then
				vehicle.aiveChain.offsetZ = tp.offset
			end
			local z = 0
			if vehicle.aiveChain.tools[tp.i].isPlough then
				z = math.min( tp.zReal, tp.zBack ) - tp.z
			end
			if vehicle.aiveChain.backZ == nil or vehicle.aiveChain.backZ > z then
				vehicle.aiveChain.backZ = z
			end
			
			local noSkipA = not ( tp.skip )
			local noSkipO = not ( tp.skipOther )
			
			if noSkipA then
				if vehicle.aiveChain.minAngle == nil or vehicle.aiveChain.minAngle < tp.minAngle then
					vehicle.aiveChain.minAngle = tp.minAngle
				end
				if vehicle.aiveChain.maxAngle == nil or vehicle.aiveChain.maxAngle > tp.maxAngle then
					vehicle.aiveChain.maxAngle = tp.maxAngle
				end
				if vehicle.aiveChain.offsetStd < tp.offsetStd then
					vehicle.aiveChain.offsetStd  = tp.offsetStd
				end
			end
			
			if vehicle.aiveChain.leftActive then
				if noSkipA and ( vehicle.aiveChain.activeX  == nil or vehicle.aiveChain.activeX > tp.x ) then
					vehicle.aiveChain.activeX = tp.x
					vehicle.aiveChain.offsetZ  = tp.offset
				end
				if noSkipO and ( vehicle.aiveChain.otherX  == nil or vehicle.aiveChain.otherX   < tp.xOther ) then
					vehicle.aiveChain.otherX  = tp.xOther 
				end
			else
				if noSkipA and ( vehicle.aiveChain.activeX  == nil or vehicle.aiveChain.activeX < tp.x ) then
					vehicle.aiveChain.activeX = tp.x
					vehicle.aiveChain.offsetZ  = tp.offset 
				end
				if noSkipO and ( vehicle.aiveChain.otherX  == nil or vehicle.aiveChain.otherX   > tp.xOther ) then
					vehicle.aiveChain.otherX  = tp.xOther
				end
			end
		end
  end
	
	if     vehicle.aiveChain.activeX == nil 
			or vehicle.aiveChain.otherX  == nil then
		vehicle.aiveChain.width   = 0
		vehicle.aiveChain.activeX = 0
		vehicle.aiveChain.otherX  = 0
	elseif vehicle.aiveChain.leftActive	then
		vehicle.aiveChain.width = vehicle.aiveChain.activeX - vehicle.aiveChain.otherX
	else
		vehicle.aiveChain.width = vehicle.aiveChain.otherX - vehicle.aiveChain.activeX
	end
	
	local fixAttacher = false
	for _,tp in pairs(vehicle.aiveChain.toolParams) do	
		if      vehicle.aiveChain.radius ~= nil
				and not ( tp.skip ) 				
				and not ( vehicle.aiveChain.tools[tp.i].aiForceTurnNoBackward )
				and not ( vehicle.aiveChain.tools[tp.i].ignoreAI )
				and math.abs( tp.x ) < vehicle.aiveChain.radius then
			fixAttacher = true
			break
		end
	end
	
	if not vehicle.aiveChain.leftActive then vehicle.aiveChain.offsetZ = -vehicle.aiveChain.offsetZ end
	
	if vehicle.aiveChain.minAngle == nil then
		vehicle.aiveChain.minAngle = -vehicle.aiveChain.maxSteering
	end
	if vehicle.aiveChain.maxAngle == nil then
		vehicle.aiveChain.maxAngle =  vehicle.aiveChain.maxSteering
	end	
	vehicle.aiveChain.angleFactor = AutoSteeringEngine.getAngleFactor( math.max( math.abs( vehicle.aiveChain.minAngle ), math.abs( vehicle.aiveChain.maxAngle ) ) )
	if not vehicle.aiveChain.leftActive	then
		vehicle.aiveChain.angleFactor = -vehicle.aiveChain.angleFactor
	end 
	
	vehicle.aiveChain.nodes      = vehicle.aiveChain.nodesLow
	vehicle.aiveChain.chainStep0 = AIVEGlobals.chain2Step0
	vehicle.aiveChain.chainStep1 = AIVEGlobals.chain2Step1
	vehicle.aiveChain.chainStep2 = AIVEGlobals.chain2Step2
	vehicle.aiveChain.chainStep3 = AIVEGlobals.chain2Step3
	vehicle.aiveChain.chainStep4 = AIVEGlobals.chain2Step4
	if fixAttacher then
		if vehicle.aiveChain.minZ < 0 then
			vehicle.aiveChain.nodes      = vehicle.aiveChain.nodesFix
			vehicle.aiveChain.chainStep0 = AIVEGlobals.chainStep0
			vehicle.aiveChain.chainStep1 = AIVEGlobals.chainStep1
			vehicle.aiveChain.chainStep2 = AIVEGlobals.chainStep2
			vehicle.aiveChain.chainStep3 = AIVEGlobals.chainStep3
			vehicle.aiveChain.chainStep4 = AIVEGlobals.chainStep4
		else
			vehicle.aiveChain.nodes      = vehicle.aiveChain.nodesLow
			vehicle.aiveChain.chainStep0 = AIVEGlobals.chain3Step0
			vehicle.aiveChain.chainStep1 = AIVEGlobals.chain3Step1
			vehicle.aiveChain.chainStep2 = AIVEGlobals.chain3Step2
			vehicle.aiveChain.chainStep3 = AIVEGlobals.chain3Step3
			vehicle.aiveChain.chainStep4 = AIVEGlobals.chain3Step4
		end
	elseif AIVEGlobals.angleFactorNoFix > 0 then
		vehicle.aiveChain.angleFactor = vehicle.aiveChain.angleFactor * AIVEGlobals.angleFactorNoFix
	end
	vehicle.aiveChain.chainMax = table.getn( vehicle.aiveChain.nodes ) - 1
	
	if mi == nil or ma == nil or math.abs( vehicle.aiveChain.minAngle - mi ) > 1E-4 or math.abs( vehicle.aiveChain.maxAngle - ma ) > 1E-4 then
		AutoSteeringEngine.setChainStatus( vehicle, 1, AIVEStatus.initial )	
		AutoSteeringEngine.applyRotation( vehicle )		
	end

	AutoSteeringEngine.initHeadlandVector( vehicle )	

	if vehicle.aiveChain ~= nil and vehicle.aiveChain.nodes ~= nil then
		for i=1,vehicle.aiveChain.chainMax do	
			vehicle.aiveChain.nodes[i].isField = false
		end	
	end	
	
	vehicle.aiveChain.buffer = {}
end

------------------------------------------------------------------------
-- getChainAngles
------------------------------------------------------------------------
function AutoSteeringEngine.getToolDistance( vehicle )
	if vehicle.aiveChain.maxZ == nil then
		return 0
	end
	return vehicle.aiveChain.maxZ
end

------------------------------------------------------------------------
-- getChainAngles
------------------------------------------------------------------------
function AutoSteeringEngine.getChainAngles( vehicle )
	local chainAngles = {}
	
	for j=1,vehicle.aiveChain.chainMax+1 do 
		chainAngles[j] = vehicle.aiveChain.nodes[j].angle
	end
	
	return chainAngles
end

------------------------------------------------------------------------
-- setChainAngles
------------------------------------------------------------------------
function AutoSteeringEngine.setChainAngles( vehicle, chainAngles, startIndex, mergeFactor )
	AutoSteeringEngine.setChainInt( vehicle, startIndex, "angles", nil, mergeFactor, chainAngles )
end

------------------------------------------------------------------------
-- setChainStraight
------------------------------------------------------------------------
function AutoSteeringEngine.setChainStraight( vehicle, startIndex, startAngle )	
	AutoSteeringEngine.setChainInt( vehicle, startIndex, "straight", startAngle )
end

------------------------------------------------------------------------
-- setChainOutside
------------------------------------------------------------------------
function AutoSteeringEngine.setChainOutside( vehicle, startIndex, angleSafety, smooth )
	AutoSteeringEngine.setChainInt( vehicle, startIndex, "outside", angleSafety, smooth )
end

------------------------------------------------------------------------
-- setChainContinued
------------------------------------------------------------------------
function AutoSteeringEngine.setChainContinued( vehicle, startIndex )
	AutoSteeringEngine.setChainInt( vehicle, startIndex, "continued" )
end

------------------------------------------------------------------------
-- setChainInside
------------------------------------------------------------------------
function AutoSteeringEngine.setChainInside( vehicle, startIndex )
	AutoSteeringEngine.setChainInt( vehicle, startIndex, "inside" )	
end

------------------------------------------------------------------------
-- setChainInt
------------------------------------------------------------------------
function AutoSteeringEngine.setChainInt( vehicle, startIndex, mode, angle, factor, chainAngles )
	if vehicle.aiveChain == nil then
		return
	end
	
	local j0=1
	if startIndex ~= nil then
		j0 = math.max( startIndex, 1 )
	end

	local a 
	if AutoSteeringEngine.isSetAngleZero( vehicle ) then 
	  a = 0 
	else 
	  a = Utils.getNoNil( vehicle.aiveChain.currentSteeringAngle, 0 )
	end 
	local af = Utils.getNoNil( vehicle.aiveChain.angleFactor, AutoSteeringEngine.getAngleFactor( ) )
	
	local angleSafety = Utils.getNoNil( angle, AIVEGlobals.angleSafety )
	
	for j=j0,vehicle.aiveChain.chainMax+1 do 
		local old = vehicle.aiveChain.nodes[j].angle

		if     	mode  == "straight" 
				and angle ~= nil
				and j     == j0 then
			vehicle.aiveChain.nodes[j].angle = angle
		elseif  mode ~= "straight" 
				and AutoSteeringEngine.isNotHeadland( vehicle, vehicle.aiveChain.nodes[j].distance ) then
		
			if     mode == "outside" then
			-- setChainOutside
				vehicle.aiveChain.nodes[j].angle = angleSafety 
			elseif mode == "inside" then
			-- setChainInside
				vehicle.aiveChain.nodes[j].angle = -AIVEGlobals.angleSafety 
			elseif mode == "continued" then
			-- setChainContinued
				vehicle.aiveChain.nodes[j].angle = 0
			elseif mode == "angles" then
			-- setChainAngles
				if chainAngles == nil then
					print("Error: AutoSteeringEngine.setChainInt mode angles with empty chainAngles")				
				else
					vehicle.aiveChain.nodes[j].angle = Utils.getNoNil( chainAngles[j], 0 )
				end
			else
				print("Error: AutoSteeringEngine.setChainInt wrong mode: "..tostring(mode))				
			end
			
			if factor ~= nil then
				if     mode == "outside" then
					if j <= vehicle.aiveChain.chainMax then
						old = 0.8 * old + 0.2 * vehicle.aiveChain.nodes[j+1].angle
					end
					vehicle.aiveChain.nodes[j].angle = vehicle.aiveChain.nodes[j].angle + factor * ( old - vehicle.aiveChain.nodes[j].angle )
					if vehicle.aiveChain.nodes[j].angle < 0 then
						vehicle.aiveChain.nodes[j].angle = 0
					end
				else
					vehicle.aiveChain.nodes[j].angle = vehicle.aiveChain.nodes[j].angle + factor * ( old - vehicle.aiveChain.nodes[j].angle )
				end			
			end
		elseif vehicle.aiveChain.nodes[j].length > 1E-3 then 
			local m  = 5
			local a2 = 1+2^(-m)
			local a1 = -a2
			for step=1,m do
				local a = 0.5 * ( a1 + a2 )
				local b 
				if vehicle.aiveChain.leftActive then
					b =  a
				else
					b = -a
				end
				
				vehicle.aiveChain.nodes[j].angle = b
				AutoSteeringEngine.setChainStatus( vehicle, j, AIVEStatus.initial )
				AutoSteeringEngine.applyRotation( vehicle, j )	
				if math.abs( vehicle.aiveChain.nodes[j].cumulRot ) < 1E-4 then
					break
				elseif vehicle.aiveChain.nodes[j].cumulRot > 0 then
					a2 = a
				else
					a1 = a
				end
			end
			old = vehicle.aiveChain.nodes[j].angle
		else
			vehicle.aiveChain.nodes[j].angle = 0
		end
		
		if math.abs( vehicle.aiveChain.nodes[j].angle - old ) > 1E-5 then
			AutoSteeringEngine.setChainStatus( vehicle, j, AIVEStatus.initial )
		end
	end 
	AutoSteeringEngine.applyRotation( vehicle )			
end

------------------------------------------------------------------------
-- getParallelogram
------------------------------------------------------------------------
function AutoSteeringEngine.getParallelogram( xs, zs, xh, zh, diff, noMinLength )
	local xw, zw, xd, zd
	
	xd = zh - zs
	zd = xs - xh
	
	local l = math.sqrt( xd*xd + zd*zd )
	
	if l < 1E-3 then
		xw = xs
		zw = zs
	elseif noMinLength then
	elseif l < AIVEGlobals.minLength then
		local f = AIVEGlobals.minLength / l
		local x2 = xh - xs
		local z2 = zh - zs
		--xs = xs - f * x2
		--zs = zs - f * z2
		xh = xh + f * x2
		zh = zh + f * z2
		xd = zh - zs
		zd = xs - xh
		l  = math.sqrt( xd*xd + zd*zd )
	end
	
	if 0.999 < l and l < 1.001 then
		xw = xs + diff * xd
		zw = zs + diff * zd
	elseif l > 1E-3 then
		xw = xs + diff * xd / l
		zw = zs + diff * zd / l
	else
		xw = xs
		zw = zs
	end
	
	return xs, zs, xw, zw, xh, zh
end

function AutoSteeringEngine.clearTrace( vehicle )
	vehicle.aiveChain.trace = {}
end

------------------------------------------------------------------------
-- invertsMarkerOnTurn
------------------------------------------------------------------------
function AutoSteeringEngine.invertsMarkerOnTurn( vehicle, tool, turnLeft )
	local res = false		
	if tool ~= nil and tool.obj ~= nil then
		for _, spec in pairs(tool.obj.specializations) do		
			if spec.aiInvertsMarkerOnTurn ~= nil then		
				res = res or spec.aiInvertsMarkerOnTurn(tool.obj, turnLeft)		
			end		
		end		
	end		
	return res		
end		

------------------------------------------------------------------------
-- saveDirection
------------------------------------------------------------------------
function AutoSteeringEngine.saveDirection( vehicle, cumulate, notOutside )

	if vehicle.aiveChain == nil then
		return 
	end

	vehicle.aiveChain.respectStartNode = false

	if vehicle.aiveChain.trace == nil then
		vehicle.aiveChain.trace = {}
	end

	vehicle.aiveChain.trace.a           = nil
	vehicle.aiveChain.trace.l           = nil
	vehicle.aiveChain.trace.isUTurn     = nil
	vehicle.aiveChain.trace.targetTrace = nil
	
	if not ( cumulate ) or vehicle.aiveChain.trace.traceIndex == nil or vehicle.aiveChain.trace.trace == nil then
		vehicle.aiveChain.trace.trace       = {}
		vehicle.aiveChain.trace.traceIndex  = 0
		vehicle.aiveChain.trace.uTrace      = {}
		vehicle.aiveChain.trace.uTraceIndex = 0
		vehicle.aiveChain.trace.sx, _, vehicle.aiveChain.trace.sz = AutoSteeringEngine.getAiWorldPosition( vehicle )
		vehicle.aiveChain.trace.ux          = nil
		vehicle.aiveChain.trace.uz          = nil
		vehicle.aiveChain.trace.cx          = nil
		vehicle.aiveChain.trace.cz          = nil
		vehicle.aiveChain.trace.ox          = nil
		vehicle.aiveChain.trace.oz          = nil
		vehicle.aiveChain.trace.ax          = nil
		vehicle.aiveChain.trace.az          = nil
		vehicle.aiveChain.trace.rx          = nil
		vehicle.aiveChain.trace.rz          = nil
		vehicle.aiveChain.trace.tpBuffer    = {}
	end
	
	if not ( cumulate ) or vehicle.aiveChain.toolParams == nil then
		return 
	end

	local wx,_,wz = localToWorld( vehicle.aiveChain.refNode, vehicle.aiveChain.otherX, 0 , vehicle.aiveChain.backZ )
	
	local saveTurnPoint = nil
	if vehicle.aiveChain.trace.ux == nil then
		saveTurnPoint = true
	elseif cumulate and not ( vehicle.aiveChain.isAtEnd ) then
		saveTurnPoint = true
	elseif Utils.vector2LengthSq( vehicle.aiveChain.trace.x - wx, vehicle.aiveChain.trace.z - wz ) < 0.01 then
		saveTurnPoint = false
	end
	
	vehicle.aiveChain.trace.x = wx
	vehicle.aiveChain.trace.z = wz
	
	if vehicle.aiveChain.leftActive then
		vehicle.aiveChain.trace.dx,_,vehicle.aiveChain.trace.dz = localDirectionToWorld( vehicle.aiveChain.refNode, 1, 0, 0 )
	else
		vehicle.aiveChain.trace.dx,_,vehicle.aiveChain.trace.dz = localDirectionToWorld( vehicle.aiveChain.refNode,-1, 0, 0 )
	end	
	
	local turnXu, turnZc
	local turnZu = vehicle.aiveChain.minZ
	local turnXc = vehicle.aiveChain.otherX
		
	for i,tp in pairs(vehicle.aiveChain.toolParams) do	
		local tpb
		if vehicle.aiveChain.trace.tpBuffer[i] == nil then
			vehicle.aiveChain.trace.tpBuffer[i] = { xA = tp.x, 
			                                        xO = tp.xOther, 
																							zR = tp.zReal }
			tpb = vehicle.aiveChain.trace.tpBuffer[i]
		else
			tpb = vehicle.aiveChain.trace.tpBuffer[i]
			tpb.xA = tpb.xA + 0.05 * ( tp.x      - tpb.xA )
			tpb.xO = tpb.xO + 0.05 * ( tp.xOther - tpb.xO )
			tpb.zR = tpb.zR + 0.05 * ( tp.zReal  - tpb.zR )
		end
		
		local oxr,_,ozr = localToWorld( vehicle.aiveChain.refNode, tpb.xO, 0 , tpb.zR )
		
		local ofs, idx
		if vehicle.aiveChain.leftActive	then
			ofs = tp.offset 
			idx = tp.nodeRight
		else
			ofs = -tp.offset 
			idx = tp.nodeLeft 
		end
		
	--local ox,_,oz = localToWorld( idx, ofs, 0, 2 )
		local ox,_,oz = AutoSteeringEngine.toolLocalToWorld( vehicle, tp.i, idx, ofs, 0, 2 )
		
		if      not ( tp.skipOther and tp.skip ) 
				and ( saveTurnPoint == nil or saveTurnPoint == true )
				and ( ( ( vehicle.aiveChain.headland >= 1
					  and AutoSteeringEngine.isChainPointOnField( vehicle, ox, oz ) )
				   or ( vehicle.aiveChain.headland < 1
					  and AutoSteeringEngine.checkField( vehicle, ox, oz ) ) ) ) then
						
		--local d = Utils.getNoNil( vehicle.aiveChain.trace.lastD, 0.05 ) 
			local d   = 0.7
			local stp = false
			if saveTurnPoint then
				stp = true
		--end
		--
		--while not ( stp ) do
		--	local a, t = AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[tp.i], ox-d,oz-d,ox+d,oz-d,ox-d,oz+d )
		--	if a > 0 then
		--		stp = true
		----elseif t > 0 then
		----	break
		--	end
		--	d = d + 0.05
		--	if d > 1 then
		--		break
		--	end
		--end
		--
		--d = d - 0.05
		--if     d <= 0.05 then
		--	vehicle.aiveChain.trace.lastD = 0.05
		--elseif d >= 0.95 then
		--	vehicle.aiveChain.trace.lastD = 0.95
		--else
		--	vehicle.aiveChain.trace.lastD = d
		--end				
			elseif AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[tp.i], ox-d,oz-d,ox+d,oz-d,ox-d,oz+d ) > 0 then
				stp = true
			end
			
			if stp then			
				saveTurnPoint = true

				vehicle.aiveChain.trace.ox = ox
				vehicle.aiveChain.trace.oz = oz
				local mx,_,mz = worldDirectionToLocal( vehicle.aiveChain.refNode, ox - oxr, 0, oz - ozr )

				if not ( tp.skipOther ) then
					local txu = tpb.xO 				
					if AutoSteeringEngine.invertsMarkerOnTurn( vehicle, vehicle.aiveChain.tools[tp.i], not vehicle.aiveChain.leftActive ) then
						txu = -tpb.xA
					end
					txu = tpb.xO + txu + mx
					
					if     turnXu == nil then
						turnXu = txu 
						turnZu = vehicle.aiveChain.minZ + mz
					elseif vehicle.aiveChain.leftActive then
						if turnXu > txu then
							turnXu = txu 
							turnZu = vehicle.aiveChain.minZ + mz
						end
					else
						if turnXu < txu then
							turnXu = txu 
							turnZu = vehicle.aiveChain.minZ + mz
						end
					end
				end
				
				if not ( tp.skip ) then
					local tzc = tpb.xA
					if vehicle.aiveChain.leftActive then
						tzc = -tzc
					end						
					tzc = tzc + tpb.zR + mz -- + 0.5
					
					if     turnZc == nil then
						turnZc = tzc
						turnXc = vehicle.aiveChain.otherX + mx
					elseif turnZc < tzc then
						turnZc = tzc
						turnXc = vehicle.aiveChain.otherX + mx
					end
				end
			end
		end
	end
	
	if saveTurnPoint then
		if turnXu == nil and vehicle.aiveChain.trace.ux == nil then
			turnXu = vehicle.aiveChain.otherX
			if AIVehicleUtil.invertsMarkerOnTurn( vehicle, not vehicle.aiveChain.leftActive ) then
				turnXu = -vehicle.aiveChain.activeX
			end
			turnXu = turnXu + vehicle.aiveChain.otherX
		end
		if turnZc == nil and vehicle.aiveChain.trace.cx == nil then
			turnZc = vehicle.aiveChain.activeX
			if vehicle.aiveChain.leftActive then
				turnZc = -turnZc 
			end
			turnZc = turnZc + vehicle.aiveChain.minZ -- + 0.5
		end
		
		if turnXu ~= nil then
		--vehicle.aiveChain.trace.ux, _, vehicle.aiveChain.trace.uz = localToWorld( vehicle.aiveChain.refNode, turnXu, 0, turnZu )
			vehicle.aiveChain.trace.ux, _, vehicle.aiveChain.trace.uz = localToWorld( vehicle.aiveChain.headlandNode, turnXu, 0, turnZu )
		end
		if turnZc ~= nil then
		--vehicle.aiveChain.trace.cx, _, vehicle.aiveChain.trace.cz = localToWorld( vehicle.aiveChain.refNode, turnXc, 0, turnZc )
			vehicle.aiveChain.trace.cx, _, vehicle.aiveChain.trace.cz = localToWorld( vehicle.aiveChain.headlandNode, turnXc, 0, turnZc )
		end
	end
	
	if cumulate then
		local vector = {}	
		vector.dx,_,vector.dz = localDirectionToWorld( vehicle.aiveChain.refNode, 0,0,1 )
		vector.px,_,vector.pz = AutoSteeringEngine.getAiWorldPosition( vehicle )
		
		local count = table.getn(vehicle.aiveChain.trace.trace)
		if count > 100 and vehicle.aiveChain.trace.traceIndex == count then
			local x = vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].px - vehicle.aiveChain.trace.trace[1].px
			local z = vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].pz - vehicle.aiveChain.trace.trace[1].pz		
		
			if x*x + z*z > 10000 then 
				vehicle.aiveChain.trace.traceIndex = 0
			end
		end
		vehicle.aiveChain.trace.traceIndex = vehicle.aiveChain.trace.traceIndex + 1
		
		vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex] = vector
		
		AutoSteeringEngine.navigateToSavePoint( vehicle, 0 )

		if vehicle.aiveChain.trace.ax == nil or notOutside then
			vehicle.aiveChain.trace.ax, _, vehicle.aiveChain.trace.az = localToWorld( vehicle.aiveChain.refNode, vehicle.aiveChain.activeX, 0 , vehicle.aiveChain.backZ - 2 )
			vehicle.aiveChain.trace.rx, _, vehicle.aiveChain.trace.rz = localToWorld( vehicle.aiveChain.refNode, 0, 0 , vehicle.aiveChain.backZ - 2 )
		end
	end
end

------------------------------------------------------------------------
-- shiftTurnVector
------------------------------------------------------------------------
function AutoSteeringEngine.shiftTurnVector( vehicle, distance )

	if vehicle.aiveChain.trace.dx == nil then
		return 
	end
		
	vehicle.aiveChain.trace.ux = vehicle.aiveChain.trace.ux + vehicle.aiveChain.trace.dx * distance
	vehicle.aiveChain.trace.uz = vehicle.aiveChain.trace.uz + vehicle.aiveChain.trace.dz * distance
	vehicle.aiveChain.trace.rx = vehicle.aiveChain.trace.rx - vehicle.aiveChain.trace.dz * distance
	vehicle.aiveChain.trace.rz = vehicle.aiveChain.trace.rz - vehicle.aiveChain.trace.dx * distance
	
	if vehicle.aiveChain.leftActive then
		vehicle.aiveChain.trace.cx = vehicle.aiveChain.trace.cx - vehicle.aiveChain.trace.dz * distance
		vehicle.aiveChain.trace.cz = vehicle.aiveChain.trace.cz + vehicle.aiveChain.trace.dx * distance
	else
		vehicle.aiveChain.trace.cx = vehicle.aiveChain.trace.cx + vehicle.aiveChain.trace.dz * distance
		vehicle.aiveChain.trace.cz = vehicle.aiveChain.trace.cz - vehicle.aiveChain.trace.dx * distance
	end
	
	AutoSteeringEngine.navigateToSavePoint( vehicle, 0 )
end

------------------------------------------------------------------------
-- getFirstTraceIndex
------------------------------------------------------------------------
function AutoSteeringEngine.getFirstTraceIndex( vehicle )
	if     vehicle.aiveChain.trace.trace      == nil 
			or vehicle.aiveChain.trace.traceIndex == nil 
			or vehicle.aiveChain.trace.traceIndex < 1 then
		return nil
	end
	local l = table.getn(vehicle.aiveChain.trace.trace)
	if l < 1 then
		return nil
	end
	local i = vehicle.aiveChain.trace.traceIndex + 1
	if i > l then i = 1 end
	return i
end

------------------------------------------------------------------------
-- getTurnVector
------------------------------------------------------------------------
function AutoSteeringEngine.getTurnVector( vehicle, uTurn, turn2Outside )
	if     vehicle.aiveChain.refNode         == nil
			or vehicle.aiveChain.trace   == nil
			or vehicle.aiveChain.trace.x == nil
			or vehicle.aiveChain.trace.z == nil then
		return 0,0
	end

	if uTurn == nil then
		if vehicle.aiveChain.trace.isUTurn == nil then
			return 0,0
		end
		uTurn = vehicle.aiveChain.trace.isUTurn
	end
	
	setRotation( vehicle.aiveChain.headlandNode, 0, -AutoSteeringEngine.getTurnAngle( vehicle ), 0 )
	
	local _,wy,_ = AutoSteeringEngine.getAiWorldPosition( vehicle )
	local wx, wz

	if turn2Outside then
		wx = vehicle.aiveChain.trace.rx
		wz = vehicle.aiveChain.trace.rz 
	elseif uTurn then
		wx = vehicle.aiveChain.trace.ux
		wz = vehicle.aiveChain.trace.uz 
	else
		wx = vehicle.aiveChain.trace.cx
		wz = vehicle.aiveChain.trace.cz 
	end
	
	local x,y,z = worldToLocal( vehicle.aiveChain.headlandNode, wx , wy, wz )
	
	-- change view point...
	x = -x
	
	z = -z
	
	return x,z
end

------------------------------------------------------------------------
-- getToolTurnVector
------------------------------------------------------------------------
function AutoSteeringEngine.getToolTurnVector( vehicle, toolParam )
	if     vehicle.aiveChain.refNode          == nil
			or vehicle.aiveChain.trace    == nil
			or vehicle.aiveChain.trace.ox == nil
			or vehicle.aiveChain.trace.oz == nil then
		print("direction not saved")
		return 0,0
	end
	
	setRotation( vehicle.aiveChain.headlandNode, 0, -AutoSteeringEngine.getTurnAngle( vehicle ), 0 )

	local node, ofs    
	if vehicle.aiveChain.leftActive then
		node = toolParam.nodeLeft
		ofs  = -toolParam.offset
	else
		node = toolParam.nodeRight
		ofs  = toolParam.offset
	end
	local _,wy,_   = AutoSteeringEngine.getAiWorldPosition( vehicle )
	local wx       = vehicle.aiveChain.trace.ox
	local wz       = vehicle.aiveChain.trace.oz
	local ox,_,oz  = worldToLocal( vehicle.aiveChain.headlandNode, wx , wy, wz )
	local tx,_,tz  = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.headlandNode, node )
	local dx,dy,dz = localDirectionToWorld( vehicle.aiveChain.tools[toolParam.i].steeringAxleNode, ofs, 0, 0 )
	dx,dy,dz       = worldDirectionToLocal( vehicle.aiveChain.headlandNode, dx, dy, dz )
	
	return ox-(tx+dx), oz-(tz+dz)
end

------------------------------------------------------------------------
-- getToolsTurnVector
------------------------------------------------------------------------
function AutoSteeringEngine.getToolsTurnVector( vehicle )
	local xMin, xMax, zMin, zMax
	
	if vehicle.aiveChain.toolParams == nil then
		return 0, 0, 0, 0
	end
	
	for _,tp in pairs( vehicle.aiveChain.toolParams ) do
		if not ( tp.skip ) then
			local tx,tz = AutoSteeringEngine.getToolTurnVector( vehicle, tp )
			
			if xMin == nil or xMin > tx then xMin = tx end
			if xMax == nil or xMax < tx then xMax = tx end
			if zMin == nil or zMin > tz then zMin = tz end
			if zMax == nil or zMax < tz then zMax = tz end
		end
	end
	
	if xMin == nil then xMin = 0 end
	if xMax == nil then xMax = 0 end
	if zMin == nil then zMin = 0 end
	if zMax == nil then zMax = 0 end
	
	return xMin, xMax, zMin, zMax
end

------------------------------------------------------------------------
-- rotateHeadlandNode
------------------------------------------------------------------------
function AutoSteeringEngine.rotateHeadlandNode( vehicle )

	setRotation( vehicle.aiveChain.headlandNode, 0, -AutoSteeringEngine.getTurnAngle( vehicle ), 0 )
	
end

------------------------------------------------------------------------
-- initTurnVector
------------------------------------------------------------------------
function AutoSteeringEngine.initTurnVector( vehicle, uTurn, turn2Outside )
	
	if     vehicle.aiveChain.refNode == nil
			or vehicle.aiveChain.trace   == nil
			or vehicle.aiveChain.trace.x == nil
			or vehicle.aiveChain.trace.z == nil then
		return
	end
	
	if vehicle.aiveChain.trace.isUTurn ~= nil then
		return
	end
	
	vehicle.aiveChain.trace.isUTurn   = uTurn
	vehicle.aiveChain.trace.isOutside = turn2Outside
	AutoSteeringEngine.rotateHeadlandNode( vehicle )	
	
	if      vehicle.aiveChain.trace.a ~= nil 
			and vehicle.aiveChain.tools                 ~= nil 
			and vehicle.aiveChain.toolCount             > 0 then	
			
		if turn2Outside then
		-- outside
			local offsetOutside = -1	
			if vehicle.aiveChain.leftActive then
				offsetOutside = -offsetOutside
			end

			local a = -AutoSteeringEngine.getTurnAngle( vehicle )
			local t = {}
			local offset = 4
			local factor = 1
			if vehicle.aiveChain.leftActive then
				factor = -1
			end
			
			local lStart = 2
			local lEnd   = 10
			local lWidth = 1
			
			for f=0.0,1.5,0.1 do
				local d = 90 * f * f
				if f > 0 then d = -d end
					
				t[d]   = {}
				t[d].r = factor * math.rad( d )
				
				setRotation( vehicle.aiveChain.headlandNode, 0, a + t[d].r, 0 )
				
				-- drive direction 
				local ddx,_,ddz = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, 1 )
				-- width 
				local dwx,_,dwz = localDirectionToWorld( vehicle.aiveChain.headlandNode, offsetOutside, 0, 0 )
				
				local xs = vehicle.aiveChain.trace.ax + lStart * ddx
				local zs = vehicle.aiveChain.trace.az + lStart * ddz
				local xw = xs + lWidth * dwx
				local zw = zs + lWidth * dwz
				
				local xh = xs + ddx
				local zh = zs + ddz
				
				for x=1,lEnd do
					local dx, dz
					dx = xs + x * ddx
					dz = zs + x * ddz
					if not AutoSteeringEngine.checkField( vehicle, dx, dz ) then
						break
					end
					xh = dx
					zh = dz
				end
				
				
				t[d].a = 0
				t[d].t = 0
				for _,tp in pairs( vehicle.aiveChain.toolParams ) do
					if not tp.skip then
						local ta, tt = AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[tp.i], xs, zs, xw, zw, xh, zh, true )
						t[d].a = t[d].a + ta
						t[d].t = t[d].t + tt

						if vehicle.aiveChain.collectCbr then
							if vehicle.aiveChain.cbr == nil then
								vehicle.aiveChain.cbr = {}
							end							
							table.insert( vehicle.aiveChain.cbr, { xs, zs, xw, zw, xh, zh, ta, tt } )
						end
					end
				end
				
				if t[d].a <= 0 or t[d].t <= 0 then
					t[d].q = 0
				else
					t[d].q = t[d].a -- / t[d].t 
				end
			end			
			
			local bestQ, bestR, bestD, worstQ
			
			for d,result in pairs( t ) do
				if     bestQ == nil 
						or bestQ > result.q 
						or ( bestQ == result.q and bestD < d ) then
					bestQ = result.q
					bestR = result.r 
					bestD = d
				end
				if     worstQ == nil
						or worstQ < result.q then
					worstQ = result.q
				end
			end
			
			vehicle.aiveChain.trace.a = vehicle.aiveChain.trace.a + bestR
			vehicle.aiveChain.buffer = {}
			
			
			if      vehicle.aiveChain.refNode             ~= nil
					and vehicle.aiveChain.trace       ~= nil
					and vehicle.aiveChain.trace.trace ~= nil 
					and vehicle.aiveChain.trace.traceIndex >= 1 then			
				AutoSteeringEngine.rotateHeadlandNode( vehicle )
				vehicle.aiveChain.respectStartNode = true
				local wx, wy, wz
				wx, wy, wz = getWorldRotation( vehicle.aiveChain.headlandNode )
				setRotation( vehicle.aiveChain.startNode, wx, wy, wz )
				wx = vehicle.aiveChain.trace.rx
				wz = vehicle.aiveChain.trace.rz
				wy = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, wx, 0, wz)
				setTranslation( vehicle.aiveChain.startNode, wx, wy, wz )
			end
			
		elseif uTurn and not ( turn2Outside ) then
		-- U-turn: shift (ux,uz)
			local offsetOutside = -1	
			if vehicle.aiveChain.leftActive then
				offsetOutside = -offsetOutside
			end
		
			local dxz, _,dzz  = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, 1 )
			local dxx, _,dzx  = localDirectionToWorld( vehicle.aiveChain.headlandNode, 1, 0, 0 )			
			local xw0,zw0,xw1,zw1,xw2,zw2 
			local dist = Utils.clamp( AutoSteeringEngine.getTraceLength( vehicle ), AIVEGlobals.ignoreDist + 3, AIVEGlobals.maxTurnCheck )
			local f = offsetOutside * 0.025 * math.abs( vehicle.aiveChain.width )

			for i = 0,40 do
				xw0 = vehicle.aiveChain.trace.ox + f * i * dxx
				zw0 = vehicle.aiveChain.trace.oz + f * i * dzx
				
				xw1 = xw0 - dist * dxz
				zw1 = zw0 - dist * dzz
				xw2 = xw0
				zw2 = zw0
				if vehicle.aiveChain.headland > 0 then
					xw2 = xw2 - AIVEGlobals.ignoreDist * dxz
					zw2 = zw2 - AIVEGlobals.ignoreDist * dzz
				else
					xw2 = xw2 + dxz
					zw2 = zw2 + dzz
				end

				if AIVEGlobals.showTrace > 0 and i == 1 then
					vehicle.aiveChain.trace.itv1 = { AutoSteeringEngine.getParallelogram( xw1, zw1, xw2, zw2, offsetOutside ) }
				end
				
				if not AutoSteeringEngine.hasFruitsSimple( vehicle, xw1, zw1, xw2, zw2, offsetOutside ) then			
					break
				end
			end	
			
			if AIVEGlobals.showTrace > 0 then
				vehicle.aiveChain.trace.itv2 = { AutoSteeringEngine.getParallelogram( xw1, zw1, xw2, zw2, offsetOutside ) }
			end
			
			f = offsetOutside * math.max( 0.1 * vehicle.aiveChain.width, Utils.getNoNil( vehicle.aiveChain.offsetAvg, vehicle.aiveChain.offsetStd ) )
			xw0 = xw0 + f * dxx
			zw0 = zw0 + f * dzx
			
			local dx1,_,dz1 = localDirectionToWorld( vehicle.aiveChain.headlandNode, vehicle.aiveChain.trace.ux - xw0, 0, vehicle.aiveChain.trace.uz - zw0 )
			local dx2,_,dz2 = localDirectionToWorld( vehicle.aiveChain.headlandNode, xw0 - vehicle.aiveChain.trace.ox, 0, zw0 - vehicle.aiveChain.trace.oz )
			
			AIVehicleExtension.debugPrint(string.format("%3.2fm %3.2fm / %3.2fm %3.2fm => %3.2fm %3.2fm (%d)", 
						vehicle.aiveChain.trace.ox,
						vehicle.aiveChain.trace.oz,
						dx1,
						dz1,
						dx2,
						dz2,
						offsetOutside ) )
						
			vehicle.aiveChain.trace.ux = vehicle.aiveChain.trace.ux + xw0 - vehicle.aiveChain.trace.ox
			vehicle.aiveChain.trace.uz = vehicle.aiveChain.trace.uz + zw0 - vehicle.aiveChain.trace.oz
		
		else
		-- 90°: rotate (cx,cz)
			AutoSteeringEngine.rotateHeadlandNode( vehicle )	
			
			local a = -AutoSteeringEngine.getTurnAngle( vehicle )
			local t = {}
			local offset = 1
			local factor = 1
			local width  = 1
			if vehicle.aiveChain.leftActive then
				factor = -factor
			end
			
			do --if false then
				local w = math.max( 2, 0.5 * math.floor( 2 * vehicle.aiveChain.width + 0.5 ) )
				local minShiftZ = -w
				local maxShiftZ = w+w
				local shiftZ, area, total = 0, 0, 0
				local dzx,_,dzz = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, 1 )				
				local dxx,_,dxz = localDirectionToWorld( vehicle.aiveChain.headlandNode, factor * math.cos( math.rad( 15 )), 0, math.sin( math.rad( 15 )) )			
				
				while minShiftZ <= shiftZ and shiftZ <= maxShiftZ do
					area  = 0
					total = 0
					
					for _,tp in pairs( vehicle.aiveChain.toolParams ) do
						local x0 = vehicle.aiveChain.trace.ox + dzx * shiftZ
						local z0 = vehicle.aiveChain.trace.oz + dzz * shiftZ
						if AutoSteeringEngine.checkField( vehicle, x0, z0 ) then	
							local xs = x0 - dxx
							local zs = z0 - dxz
							local xh = xs + dzx
							local zh = zs + dzz
							local xw = x0 + dxx
							local zw = z0 + dxz
							for x=1,w,0.5 do
								vx = x0 + x * dxx
								vz = z0 + x * dxz
								local isOnField = AutoSteeringEngine.checkField( vehicle, vx, vz )
								if isOnField then
									xw = x0 + x * dxx
									zw = z0 + x * dxz
								end
								if not isOnField then
									break
								end
							end
							if not tp.skip then
								local ta, tt = AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[tp.i], xs, zs, xw, zw, xh, zh, true )
								area = area + ta
								total = total + tt
								
								if AIVEGlobals.collectCbr > 0 then
									if vehicle.aiveChain.cbr == nil then
										vehicle.aiveChain.cbr = {}
									end							
									table.insert( vehicle.aiveChain.cbr, { xs, zs, xw, zw, xh, zh, ta, tt } )
								end
								
							end
						end
					end
					
					if     shiftZ > 0 then
						if area <= 0 then
							doShiftZ = shiftZ
							break
						end
						shiftZ = shiftZ + 0.25
					elseif shiftZ < 0 then
						if area > 0 then
							doShiftZ = shiftZ + 0.25
							break
						else
							shiftZ = shiftZ - 0.25 
						end
					else
						if area > 0 then
							shiftZ = shiftZ + 0.25
						else
							shiftZ = shiftZ - 0.25 
						end
					end
				end
				
				if doShiftZ ~= nil then
					vehicle.aiveChain.trace.cx = vehicle.aiveChain.trace.cx + dzx * doShiftZ
					vehicle.aiveChain.trace.ox = vehicle.aiveChain.trace.ox + dzx * doShiftZ
					vehicle.aiveChain.trace.cz = vehicle.aiveChain.trace.cz + dzz * doShiftZ
					vehicle.aiveChain.trace.oz = vehicle.aiveChain.trace.oz + dzz * doShiftZ
					vehicle.aiveChain.buffer = {}
					
					if AIVEGlobals.showTrace > 0 then			
						print(string.format("shiftZ: %1.2fm => area: %d / total: %d",doShiftZ,area,total))
						local x0 = vehicle.aiveChain.trace.cx + dzx * math.abs( vehicle.aiveChain.activeX )
						local z0 = vehicle.aiveChain.trace.cz + dzz * math.abs( vehicle.aiveChain.activeX )
						local xs = x0 - dxx
						local zs = z0 - dxz
						local xh = xs + dzx
						local zh = zs + dzz
						local xw = x0 + dxx
						local zw = z0 + dxz
						
					--print(string.format("xs: %1.2f, zs: %1.2f, xw: %1.2f, zw: %1.2f, xh: %1.2f, zh: %1.2f",xs, zs, xw, zw, xh, zh))
						vehicle.aiveChain.trace.itv2 = { xs, zs, xw, zw, xh, zh }			
					end
				end
			end

			for f=-1.4,1,0.1 do
				local d = 45 * f * f
				if f < 0 then d = -d end
					
				t[d]   = {}
				t[d].r = factor * math.rad( d )
				
				setRotation( vehicle.aiveChain.headlandNode, 0, a + t[d].r, 0 )

				t[d].ox,_,t[d].oz = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, width )				
				t[d].sx,_,t[d].sz = localDirectionToWorld( vehicle.aiveChain.headlandNode, factor, 0, 0 )
				
				local xb = offset 				
				local xs = vehicle.aiveChain.trace.ox + xb * t[d].sx
				local zs = vehicle.aiveChain.trace.oz + xb * t[d].sz				
				local xw = xs + t[d].ox
				local zw = zs + t[d].oz

				local xe = 1
				local xh = xs + xe * t[d].sx
				local zh = zs + xe * t[d].sz
				
				for x=3,10 do
					vx = xs + x * t[d].sx
					vz = zs + x * t[d].sz
					if AutoSteeringEngine.checkField( vehicle, vx, vz ) then
						xh = vx
						zh = vz
						xe = x
					else
						break
					end
				end
				
				while true do					
					t[d].a = 0
					t[d].t = 0
					for _,tp in pairs( vehicle.aiveChain.toolParams ) do
						if not tp.skip then
							local ta, tt = AutoSteeringEngine.getFruitAreaWorldPositions( vehicle, vehicle.aiveChain.tools[tp.i], xs, zs, xw, zw, xh, zh, true )
							t[d].a = t[d].a + ta
							t[d].t = t[d].t + tt
							
						--if AIVEGlobals.collectCbr > 0 then
						--	if vehicle.aiveChain.cbr == nil then
						--		vehicle.aiveChain.cbr = {}
						--	end							
						--	table.insert( vehicle.aiveChain.cbr, { xs, zs, xw, zw, xh, zh, ta, tt } )
						--end
							
						end
					end
					
					if t[d].a <= 0 then
						break
					elseif xe > 1 then
						xb = xb + 1
						xe = xe - 1
						xs = vehicle.aiveChain.trace.ox + xb * t[d].sx
						zs = vehicle.aiveChain.trace.oz + xb * t[d].sz
						xw = xs + t[d].ox
						zw = zs + t[d].oz
					else
						break
					end
				end
				
				t[d].xb = xb
				t[d].xe = xe
				
				if t[d].a <= 0 or t[d].t <= 0 then
					t[d].q = -xb
				else
					t[d].q = t[d].a / t[d].t 
				end
			end			
			
			local bestQ, bestR, bestD, worstQ
			
			for d,result in pairs( t ) do
				if     bestQ == nil 
						or bestQ > result.q 
						or ( bestQ == result.q and bestD < d ) then
					bestQ = result.q
					bestR = result.r 
					bestD = d
				end
				if     worstQ == nil
						or worstQ < result.q then
					worstQ = result.q
				end
			end
			
			if     bestQ > 0 then
				vehicle.aiveChain.trace.a = vehicle.aiveChain.trace.a + factor * math.rad( 90 )
				vehicle.aiveChain.buffer = {}
			elseif bestQ < worstQ then			
				vehicle.aiveChain.trace.a = vehicle.aiveChain.trace.a + bestR
				vehicle.aiveChain.buffer = {}
			end

			if AIVEGlobals.showTrace > 0 then			
				print(string.format( "%3d %3d° %s %0.3f %0.3f %3d %3d", bestD, math.deg(bestR), tostring(vehicle.aiveChain.leftActive), bestQ, worstQ, t[bestD].a, t[bestD].t))
				local xs = vehicle.aiveChain.trace.ox + t[bestD].xb * t[bestD].sx
				local zs = vehicle.aiveChain.trace.oz + t[bestD].xb * t[bestD].sz				
				local xh = xs + t[bestD].xe * t[bestD].sx
				local zh = zs + t[bestD].xe * t[bestD].sz
				local xw = xs + t[bestD].ox
				local zw = zs + t[bestD].oz
				
				vehicle.aiveChain.trace.itv1 = { xs, zs, xw, zw, xh, zh }			
			end
			
			AutoSteeringEngine.rotateHeadlandNode( vehicle )	
		end		
	end
end	

------------------------------------------------------------------------
-- getTurnDistance
------------------------------------------------------------------------
function AutoSteeringEngine.getTurnDistance( vehicle )
	if     vehicle.aiveChain.refNode             == nil
			or vehicle.aiveChain.trace       == nil
			or vehicle.aiveChain.trace.trace == nil 
			or vehicle.aiveChain.trace.traceIndex < 1 then
		return 0
	end
	local _,y,_ = AutoSteeringEngine.getAiWorldPosition( vehicle )
	local x,_,z = worldToLocal( vehicle.aiveChain.refNode, vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].px, y, vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].pz )
	return math.sqrt( x*x + z*z )
end

------------------------------------------------------------------------
-- getTurnDistance
------------------------------------------------------------------------
function AutoSteeringEngine.getTurnDistanceSq( vehicle )
	if     vehicle.aiveChain.refNode             == nil
			or vehicle.aiveChain.trace       == nil
			or vehicle.aiveChain.trace.trace == nil 
			or vehicle.aiveChain.trace.traceIndex < 1 then
		return 0
	end
	local _,y,_ = AutoSteeringEngine.getAiWorldPosition( vehicle )
	local x,_,z = worldToLocal( vehicle.aiveChain.refNode, vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].px, y, vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].pz )
	return x*x + z*z
end

------------------------------------------------------------------------
-- getTraceLength
------------------------------------------------------------------------
function AutoSteeringEngine.getTraceLength( vehicle )
	if     vehicle.aiveChain.refNode         == nil
			or vehicle.aiveChain.trace   == nil then
		return 0
	end
	if     vehicle.aiveChain.trace.sx    == nil
			or vehicle.aiveChain.trace.sz    == nil
			or vehicle.aiveChain.trace.trace == nil then
		return 0
	end
	
	if table.getn(vehicle.aiveChain.trace.trace) < 2 then
		return 0
	end
		
	local i = AutoSteeringEngine.getFirstTraceIndex( vehicle )
	if i == nil then
		return 0
	end
	
	if vehicle.aiveChain.trace.l == nil then
		local x = vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].px - vehicle.aiveChain.trace.sx
		local z = vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].pz - vehicle.aiveChain.trace.sz
		vehicle.aiveChain.trace.l = math.sqrt( x*x + z*z )
	end
	
	return vehicle.aiveChain.trace.l
end

------------------------------------------------------------------------
-- getTurnAngle
------------------------------------------------------------------------
function AutoSteeringEngine.getTurnAngle( vehicle )
	if vehicle.aiveChain.buffer == nil then
		vehicle.aiveChain.buffer = {}
	elseif vehicle.aiveChain.buffer.getTurnAngle ~= nil then
		return vehicle.aiveChain.buffer.getTurnAngle
	end

	if     vehicle.aiveChain.refNode         == nil
			or vehicle.aiveChain.trace   == nil then
		vehicle.aiveChain.buffer.getTurnAngle = 0
		return 0
	end
	if vehicle.aiveChain.trace.a == nil then
		local i = AutoSteeringEngine.getFirstTraceIndex( vehicle )
		if i == nil then
			vehicle.aiveChain.buffer.getTurnAngle = 0
			return 0
		end
		if i == vehicle.aiveChain.trace.traceIndex then
			vehicle.aiveChain.buffer.getTurnAngle = 0
			return 0
		end
		local l = AutoSteeringEngine.getTraceLength( vehicle )
		if l < 2 then
			vehicle.aiveChain.buffer.getTurnAngle = 0
			return 0
		end

		local vx = vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].px - vehicle.aiveChain.trace.trace[i].px
		local vz = vehicle.aiveChain.trace.trace[vehicle.aiveChain.trace.traceIndex].pz - vehicle.aiveChain.trace.trace[i].pz		
		vehicle.aiveChain.trace.a = Utils.getYRotationFromDirection(vx,vz)
		
		if vehicle.aiveChain.trace.a == nil then
			print("NIL!!!!")
		end
	end

	local x,y,z = localDirectionToWorld( vehicle.aiveChain.refNode, 0,0,1 )
	
	local angle = AutoSteeringEngine.normalizeAngle( Utils.getYRotationFromDirection(x,z) - vehicle.aiveChain.trace.a )	

	vehicle.aiveChain.buffer.getTurnAngle = angle
	return angle
end	

------------------------------------------------------------------------
-- getRelativeTranslation
------------------------------------------------------------------------
function AutoSteeringEngine.getRelativeTranslation(root,node)
	if root == nil or node == nil then
		if AIVEGlobals.devFeatures > 0 then AIVehicleExtension.printCallstack() end
		return 0,0,0
	end
	local x,y,z
	local state,result = pcall( getParent, node )
	if not ( state ) then
		if AIVEGlobals.devFeatures > 0 then AIVehicleExtension.printCallstack() end
		return 0,0,0
	elseif result==root then
		x,y,z = getTranslation(node)
	else
		x,y,z = worldToLocal(root,getWorldTranslation(node))
	end
	return x,y,z
end

------------------------------------------------------------------------
-- getRelativeYRotation
------------------------------------------------------------------------
function AutoSteeringEngine.getRelativeYRotation(root,node)
	if root == nil or node == nil then
		AIVehicleExtension.printCallstack()
		return 0
	end
	local x, y, z = worldDirectionToLocal(node, localDirectionToWorld(root, 0, 0, 1))
	local dot = z
	dot = dot / Utils.vector2Length(x, z)
	local angle = math.acos(dot)
	if x < 0 then
		angle = -angle
	end
	return angle
end

------------------------------------------------------------------------
-- getRelativeYRotation
------------------------------------------------------------------------
function AutoSteeringEngine.getRelativeZRotation(root,node)
	if root == nil or node == nil then
		AIVehicleExtension.printCallstack()
		return 0
	end
	local x, y, z = worldDirectionToLocal(node, localDirectionToWorld(root, 0, 1, 0))
	local dot = y
	dot = dot / Utils.vector2Length(x, y)
	local angle = math.acos(dot)
	if x < 0 then
		angle = -angle
	end
	return angle
end

------------------------------------------------------------------------
-- initChain
------------------------------------------------------------------------
function AutoSteeringEngine.initChain( vehicle, iRefNode, wheelBase, maxSteering, widthOffset, turnOffset )
	
	vehicle.aiveChain = {}
	vehicle.aiveChain.resetCounter = AutoSteeringEngine.resetCounter
		
	vehicle.aiveChain.wheelBase    = wheelBase
	vehicle.aiveChain.invWheelBase = 1 / wheelBase
	vehicle.aiveChain.maxSteering  = maxSteering

	if not vehicle.isServer then 
		print("ERROR: AutoSteeringEngine.initChain called at client")
		vehicle.aiveChain.refNode = iRefNode
		return 
	end

	vehicle.aiveChain.refNode      = iRefNode
	vehicle.aiveChain.headlandNode = createTransformGroup( "acHeadland" )
	link( vehicle.aiveChain.refNode, vehicle.aiveChain.headlandNode )

	if AIVEGlobals.staticRoot > 0 then
		vehicle.aiveChain.rootNode   = createTransformGroup( "acChainRoot" )
		link( g_currentMission.terrainRootNode, vehicle.aiveChain.rootNode )
	else
		vehicle.aiveChain.rootNode   = vehicle.aiveChain.refNode 
	end
	--vehicle.aiveChain.otherINode   = createTransformGroup( "acOtherI" )
	--link( vehicle.aiveChain.refNode, vehicle.aiveChain.otherINode )
	vehicle.aiveChain.startNode = createTransformGroup( "acChainStart" )
	link( g_currentMission.terrainRootNode, vehicle.aiveChain.startNode )
	vehicle.aiveChain.respectStartNode = false
	
	for chainType=1,2 do
		local cl0
		local pre 
		
		if chainType == 1 then
			cl0 = AIVEGlobals.chainLen
			pre = "acChainA"
		else
			cl0 = AIVEGlobals.chain2Len
			pre = "acChainB"
		end
	
		local node    = {}
		node.index    = createTransformGroup( pre.."0_lnk" )
		node.index2   = createTransformGroup( pre.."0_rot" )
		node.index3   = createTransformGroup( pre.."0_b1" )
		node.index4   = createTransformGroup( pre.."0_b2" )
		node.status   = 0
		node.angle    = 0
		node.steering = 0
		node.rotation = 0
		node.isField  = false
		node.distance = 0
		node.length   = 0
		node.tool     = {}
		link( vehicle.aiveChain.rootNode, node.index )
		link( node.index, node.index2 )
		link( node.index, node.index3 )
		link( node.index3, node.index4 )

		local distance = 0
		local nodes = {}
		nodes[1] = node
		
		for i,add in pairs( cl0 ) do
			local parent   = nodes[i]
			local text     = string.format("%s%i",pre,i)
			local node2    = {}
			distance       = distance + add
			node2.index    = createTransformGroup( text.."_lnk" )
			node2.index2   = createTransformGroup( text.."_rot" )
			node2.index3   = createTransformGroup( text.."_b1" )
			node2.index4   = createTransformGroup( text.."_b2" )
			node2.status   = 0
			node2.angle    = 0
			node2.steering = 0
			node2.rotation = 0
			node2.isField  = false
			node2.distance = distance
			node2.length   = 0
			node2.tool     = {}
			
			link( parent.index2, node2.index )
			link( node2.index, node2.index2 )
			link( node2.index, node2.index3 )
			link( node2.index3, node2.index4 )
			setTranslation( node2.index, 0,0,add )
			
			nodes[#nodes].length = add
			
			nodes[#nodes+1] = node2
		end
		
		if chainType == 1 then
			vehicle.aiveChain.nodesFix = nodes
		else
			vehicle.aiveChain.nodesLow = nodes
		end
	end	
end

------------------------------------------------------------------------
-- deleteNode
------------------------------------------------------------------------
function AutoSteeringEngine.deleteNode( index, noUnlink )
	return pcall(AutoSteeringEngine.deleteNode1, index, noUnlink )
end

function AutoSteeringEngine.deleteNode1( index, noUnlink )
	if noUnlink then
	else
		unlink( index )
	end
	delete( index )
end

------------------------------------------------------------------------
-- deleteChain
------------------------------------------------------------------------
function AutoSteeringEngine.deleteChain( vehicle )

	AutoSteeringEngine.deleteTools( vehicle )

	if vehicle.aiveChain == nil then return end

	local i
	if vehicle.aiveChain.nodes ~= nil then
		local n = vehicle.aiveChain.nodes
		vehicle.aiveChain.nodes = nil
		for j=-1,vehicle.aiveChain.chainMax-1 do
			i = vehicle.aiveChain.chainMax - j
			AutoSteeringEngine.deleteNode( n[i].index4 )
			AutoSteeringEngine.deleteNode( n[i].index3 )
			AutoSteeringEngine.deleteNode( n[i].index2 )
			AutoSteeringEngine.deleteNode( n[i].index  )
		end
	end

	if vehicle.aiveChain.headlandNode ~= nil then
		AutoSteeringEngine.deleteNode( vehicle.aiveChain.headlandNode )
		vehicle.aiveChain.headlandNode = nil
	end
	
	if AIVEGlobals.staticRoot > 0 and vehicle.aiveChain.rootNode ~= nil then
		AutoSteeringEngine.deleteNode( vehicle.aiveChain.rootNode )
		vehicle.aiveChain.rootNode = nil
	end

	AutoSteeringEngine.deleteNode( vehicle.aiveChain.startNode )
	vehicle.aiveChain.startNode = nil
	
	vehicle.aiveChain = nil
	vehicle.aiveCurrentField = nil		
	
end

------------------------------------------------------------------------
-- getSpecialToolSettings
------------------------------------------------------------------------
function AutoSteeringEngine.getSpecialToolSettings( vehicle )
	local settings = {}
	
	settings.leftOnly  = false
	settings.rightOnly = false
	
	if not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		return settings
	end
	
	for _,tool in pairs(vehicle.aiveChain.tools) do
		if      tool.isPlough then
		--	if     tool.obj.rotationPart               == nil
		--			or tool.obj.rotationPart.turnAnimation == nil then
		--		settings.rightOnly = true
		--	end
		end
		if tool.isCombine then
		--	if tool.xl+tool.xl+tool.xl < -tool.xr then
		--		settings.rightOnly = true
		--	end
		--	if tool.xl > -tool.xr-tool.xr-tool.xr then
		--		settings.leftOnly  = true
		--	end	
		end
	end

	return settings
end

------------------------------------------------------------------------
-- addTool
------------------------------------------------------------------------
function AutoSteeringEngine.addTool( vehicle, implement, ignore )

	local tool       = {}
	local marker     = {}
	local extraNodes = {}
	local object     = vehicle
	local reference  = vehicle.aiveChain.refNode
	
	if implement == nil or implement.object == nil then
		return 
	elseif implement.object ~= vehicle then
		object    = implement.object
		reference = implement.object.attacherJoint.node
	end
	
	--if AtResetCounter == nil or AtResetCounter < 1 then
	--	if object.name ~= nil then print("Adding... "..object.name) else print("Adding something") end
	--end
	
	tool.steeringAxleNode   = object.steeringAxleNode
	if tool.steeringAxleNode == nil then
		tool.steeringAxleNode = object.components[1].node
	end
	
	tool.checkZRotation  = false
	
	if 			getName( object.components[1].node ) == "poettingerServo650" 
			and table.getn(object.components)        >= 2 then
		tool.steeringAxleNode = object.components[2].node
		tool.checkZRotation   = true
	end
	
	if tool.checkZRotation then
		local c = getChild( tool.steeringAxleNode, "AIVESteeringAxle" )
		if c ~= nil and c > 0 then
			tool.steeringAxleNode = c
		else
			local parent = tool.steeringAxleNode
			tool.steeringAxleNode = createTransformGroup( "AIVESteeringAxle" )
			extraNodes[#extraNodes+1] = tool.steeringAxleNode
			link( parent, tool.steeringAxleNode )
		end
	end
	
	local xo,yo,zo = AutoSteeringEngine.getRelativeTranslation( tool.steeringAxleNode, reference )
	
	tool.obj                           = object
	tool.xOffset                       = xo
	tool.zOffset                       = zo
	tool.isAITool                      = false
	tool.specialType                   = ""
	tool.aiTerrainDetailChannel1       = Utils.getNoNil( object.aiTerrainDetailChannel1      ,-1 )
	tool.aiTerrainDetailChannel2       = Utils.getNoNil( object.aiTerrainDetailChannel2      ,-1 )
	tool.aiTerrainDetailChannel3       = Utils.getNoNil( object.aiTerrainDetailChannel3      ,-1 )
	tool.aiTerrainDetailChannel4       = Utils.getNoNil( object.aiTerrainDetailChannel4      ,-1 )
	tool.aiTerrainDetailProhibitedMask = Utils.getNoNil( object.aiTerrainDetailProhibitedMask,0 )
	tool.aiRequiredFruitType           = Utils.getNoNil( object.aiRequiredFruitType          ,FruitUtil.FRUITTYPE_UNKNOWN )
	tool.aiRequiredMinGrowthState      = Utils.getNoNil( object.aiRequiredMinGrowthState     ,0 )
	tool.aiRequiredMaxGrowthState      = Utils.getNoNil( object.aiRequiredMaxGrowthState     ,0 )
	tool.aiProhibitedFruitType         = Utils.getNoNil( object.aiProhibitedFruitType        ,FruitUtil.FRUITTYPE_UNKNOWN )
	tool.aiProhibitedMinGrowthState    = Utils.getNoNil( object.aiProhibitedMinGrowthState   ,0 )
	tool.aiProhibitedMaxGrowthState    = Utils.getNoNil( object.aiProhibitedMaxGrowthState   ,0 )
	tool.b1                            = 0
	tool.b2                            = 0
	tool.b3                            = 0
	tool.invert                        = false
	tool.outTerrainDetailChannel       = -1	
	tool.useAIMarker                   = false
	tool.doubleJoint                   = false
	tool.noRevStraight                 = false
	tool.ignoreAI                      = ignore 
	
	if tool.checkZRotation then
		tool.aiForceTurnNoBackward = true
	elseif  object.aiForceTurnNoBackward then
		tool.aiForceTurnNoBackward = true
	elseif  object.attacherJoint              ~= nil
			and object.attacherJoint.jointType    ~= nil
			and ( object.attacherJoint.jointType  == Vehicle.JOINTTYPE_TRAILERLOW
			   or object.attacherJoint.jointType  == Vehicle.JOINTTYPE_TRAILER ) then
		tool.aiForceTurnNoBackward = true
	elseif object.aiForceTurnNoBackward == nil then
		tool.aiForceTurnNoBackward = false
	end
	
	
	local useAI = true
	tool.isCombine       = SpecializationUtil.hasSpecialization(Combine, object.specializations)
	tool.hasWorkAreas    = SpecializationUtil.hasSpecialization(WorkArea, object.specializations) 
	tool.isTurnOnVehicle = SpecializationUtil.hasSpecialization(TurnOnVehicle, object.specializations)
	tool.isPlough        = SpecializationUtil.hasSpecialization(Plough, object.specializations)
	tool.isCultivator    = SpecializationUtil.hasSpecialization(Cultivator, object.specializations)
	tool.isSowingMachine = SpecializationUtil.hasSpecialization(SowingMachine, object.specializations)
	tool.isSprayer       = SpecializationUtil.hasSpecialization(Sprayer, object.specializations)
	tool.isMower         = SpecializationUtil.hasSpecialization(Mower, object.specializations)
	tool.isFoldable      = SpecializationUtil.hasSpecialization(Foldable, object.specializations)
	
	if tool.isPlough and tool.aiForceTurnNoBackward then
		tool.checkZRotation = true
	end

	if		 object.configFileName == "data/vehicles/tools/horsch/horschPronto9SW.xml" then
		tool.doubleJoint = true
		tool.b1 = 0
		tool.b2 = -6
		tool.b3 = -4
	end
	
	tool.ploughTransport = false
	if      tool.isPlough 
			and tool.aiForceTurnNoBackward 
			and tool.obj.rotationPart.turnAnimation ~= nil
			and tool.obj.playAnimation              ~= nil
			-- plough transport always on
			and ( AIVEGlobals.ploughTransport   > 2
			-- plough transport for vogel&noot and lemken 
				 or ( AIVEGlobals.ploughTransport > 1 
					and ( object.configFileName == "data/vehicles/tools/vogelNoot/vogelNootHeros1000.xml"
						 or ( object.customEnvironment ~= nil 
							and Utils.removeModDirectory(self.configFileName) == "vogelNootHeros1000.xml" ) ) )
			-- plough transport for lemken only
				 or ( AIVEGlobals.ploughTransport > 0 
					and ( object.configFileName == "data/vehicles/tools/lemken/lemkenDiamant12.xml"
						 or ( object.customEnvironment ~= nil 
							and Utils.removeModDirectory(self.configFileName) == "lemkenDiamant12.xml" ) ) ) ) then
		tool.ploughTransport = true
	end
		
	if tool.ignoreAI then
		marker[1] = reference
		marker[2] = reference
	else
-- tool with AI support		
		tool.isAITool = true
		tool.useAIMarker = true
		if AtResetCounter == nil or AtResetCounter < 1 then
			--print("object has AI support")
		end
		
		if object.aiLeftMarker ~= nil then
			marker[#marker+1] = object.aiLeftMarker
		end
		
		if object.aiRightMarker ~= nil then
			marker[#marker+1] = object.aiRightMarker
		end
		
		tool.aiBackMarker = object.aiBackMarker		

		if     tool.isSowingMachine then
			tool.outTerrainDetailChannel = g_currentMission.sowingChannel
		elseif tool.isCultivator then
			tool.outTerrainDetailChannel = g_currentMission.cultivatorChannel
		elseif tool.isPlough then
			tool.outTerrainDetailChannel = g_currentMission.ploughChannel
		end
	end

	if #marker < 1 then 
		--if AtResetCounter == nil or AtResetCounter < 1 then
		--	print("no marker found") 
		--end
		return 0
	end

	if object.aiBackMarker == nil then
		tool.aiBackMarker = marker[1]
	end
	
	tool.refNode = reference		
	tool.marker  = marker
	
	tool.refNodeRot = createTransformGroup( "toolRefNodeRot" )
	setTranslation( tool.refNodeRot, 0, 0, 0 )
	setRotation( tool.refNodeRot, 0, 0, 0 )
	extraNodes[#extraNodes+1] = tool.refNodeRot 
	
  --------------------------------------------------------
	if      implement              ~= nil
			and object.attacherVehicle ~= nil 
			and object.attacherVehicle == vehicle 
			and AutoSteeringEngine.tableGetN( AutoSteeringEngine.getTaJoints2( vehicle, implement, vehicle.aiveChain.refNode, 0 ) ) > 1 then
		tool.doubleJoint = true
	end
	
  --------------------------------------------------------
	-- tool attached to tool
	if vehicle ~= object.attacherVehicle then
		if vehicle.aiveChain.tools == nil then
			return 0
		else
			for i,t in pairs( vehicle.aiveChain.tools ) do
				if t.obj == object.attacherVehicle then
					if t.aiForceTurnNoBackward then
						if tool.aiForceTurnNoBackward then
							tool.doubleJoint = true						
						else
							tool.aiForceTurnNoBackward = true
						end
					end
					if t.doubleJoint then
						tool.doubleJoint = true
					end				
					if ( t.isCultivator or t.isSowingMachine ) and tool.isSprayer then
						tool.ignoreAI = true
					end
					
					break
				end
			end
		end
	end
  --------------------------------------------------------
	if     tool.doubleJoint 
			or ( tool.isPlough 
			 and tool.aiForceTurnNoBackward 
			 and not ( tool.ploughTransport ) ) then
		tool.noRevStraight = true
	end
		
	if tool.checkZRotation and tool.steeringAxleNode ~= nil then
		local node = createTransformGroup( "rotSteeringAxleNode" )
	  link( tool.steeringAxleNode, node )
		extraNodes[#extraNodes+1] = node
	end
	
	if table.getn( extraNodes ) > 0 then
		tool.extraNodes = extraNodes
	end
	
		--if object.lengthOffset ~= nil and object.lengthOffset < 0 then			
	if math.abs( AutoSteeringEngine.getRelativeYRotation( vehicle.aiveChain.refNode, tool.steeringAxleNode ) ) > 0.6 * math.pi then
	-- wrong rotation ???
		--print("wrong rotation")
		tool.invert = not tool.invert
	end	
	--local _,_,rsz = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.steeringAxleNode )
	--if rsz > 1 then
	--	tool.invert = not tool.invert
	--end		
	
	local xl, xr, zz, zb
	
	for i=1,#marker do
		local x,_,z = AutoSteeringEngine.getRelativeTranslation(tool.steeringAxleNode,marker[i])
		if tool.invert then x = -x end
		if xl == nil or xl < x then xl = x end
		if xr == nil or xr > x then xr = x end
		if zz == nil or zz < z then zz = z end
		if zb == nil or zb > z then zb = z end
	end
	
	tool.xl = xl - tool.xOffset
	tool.xr = xr - tool.xOffset
	tool.z  = zz - tool.zOffset
	tool.zb = zb - tool.zOffset
	
	if tool.doubleJoint then
	-- do nothing
	elseif tool.aiForceTurnNoBackward then
		tool.b1 = AutoSteeringEngine.findComponentJointDistance( vehicle, tool, object )
	
		if object.wheels ~= nil then
			local wna,wza=0,0
			for i,wheel in pairs(object.wheels) do
				local f = AutoSteeringEngine.getToolWheelFactor( vehicle, tool, object, i )
				if f > 1E-3 then
					local _,_,wz = AutoSteeringEngine.getRelativeTranslation(tool.steeringAxleNode,wheel.driveNode)
					wza = wza + f * wz
					wna = wna + f		
				end
			end
			if wna > 0 then
				tool.b2 = wza / wna - tool.zOffset
				if tool.invert then tool.b2 = -tool.b2 end
			--print(string.format("wna=%i wza=%f b2=%f ofs=%f",wna,wza,tool.b2,tool.zOffset))
			end
		end
	else
		tool.b1 = tool.z
	end
	
	local i = 0
	
	if vehicle.aiveChain.tools == nil then
		vehicle.aiveChain.tools ={}
		i = 1
	else
		i = table.getn(vehicle.aiveChain.tools) + 1
	end
	
	if SpecializationUtil.hasSpecialization(Combine, vehicle.specializations) then
		vehicle.aiveHas.combine = true 
		vehicle.aiveHas.combineVehicle = true
	end
	
	if not ( tool.ignoreAI ) then
		if tool.isCombine       then vehicle.aiveHas.combine       = true end
		if tool.isPlough        then vehicle.aiveHas.plough        = true end
		if tool.isCultivator    then vehicle.aiveHas.cultivator    = true end
		if tool.isSowingMachine then vehicle.aiveHas.sowingMachine = true end
		if tool.isSprayer       then vehicle.aiveHas.sprayer       = true end
		if tool.isMower         then vehicle.aiveHas.mower         = true end
	end
	
  if tool.isFoldable      then vehicle.aiveHas.foldable      = true end                                                       
  if tool.doubleJoint     then vehicle.aiveHas.doubleJoint   = true end
  if tool.hasWorkAreas    then vehicle.aiveHas.workAreas     = true end
  if tool.isTurnOnVehicle then vehicle.aiveHas.turnOnVehicle = true end
		
	if tool.aiForceTurnNoBackward and ( vehicle.aiveChain.noReverseIndex == nil or vehicle.aiveChain.noReverseIndex < 1 ) then 
		vehicle.aiveChain.noReverseIndex = i 
	end 
	
	vehicle.aiveChain.toolCount = i
	vehicle.aiveChain.tools[i]  = tool
	return i	
end

------------------------------------------------------------------------
-- isToolWheelRelevant
------------------------------------------------------------------------
function AutoSteeringEngine.getToolWheelFactor( vehicle, tool, object, i )
	return Utils.getNoNil( object.wheels[i].lateralStiffness, 1 )
end

------------------------------------------------------------------------
-- deleteTools
------------------------------------------------------------------------
function AutoSteeringEngine.deleteTools( vehicle )

	if vehicle ~= nil and vehicle.aiveChain ~= nil then
		if vehicle.aiveChain.tools ~= nil and vehicle.aiveChain.toolCount > 0 then
			for _,tool in pairs( vehicle.aiveChain.tools ) do
				if tool.extraNodes ~= nil and table.getn( tool.extraNodes ) > 0 then
					for _,n in pairs( tool.extraNodes ) do
						AutoSteeringEngine.deleteNode( n )
					end
				end
			end
		end
		vehicle.aiveChain.toolCount      = 0
		vehicle.aiveChain.tools          = nil
		vehicle.aiveChain.toolParams     = nil
		vehicle.aiveChain.noReverseIndex = 0
	end
	
	vehicle.aiveHas = {}
end

function AutoSteeringEngine.getIsAIReadyForWork( vehicle )
	local allowedToDrive = Vehicle.getIsAIReadyForWork( vehicle )
	for i,tool in pairs(vehicle.aiveChain.tools) do
		if not Vehicle.getIsAIReadyForWork( tool.obj ) then
			allowedToDrive = false
		end
	end
	
	return allowedToDrive
end

------------------------------------------------------------------------
-- checkAllowedToDrive
------------------------------------------------------------------------
function AutoSteeringEngine.checkAllowedToDrive( vehicle, checkFillLevel )

	if vehicle.aiveCurrentFieldCo ~= nil then
		local x,_,z = AutoSteeringEngine.getAiWorldPosition( vehicle )
		AutoSteeringEngine.checkField( vehicle, x, z )
		if vehicle.aiveCurrentFieldCo ~= nil then
			if AIVEGlobals.devFeatures > 0 then print("not allowed to drive I") end
			return false
		end
	end
	
  if     not ( vehicle.isMotorStarted ) 
			or ( vehicle.motorStartTime ~= nil and g_currentMission.time <= vehicle.motorStartTime ) then
		if AIVEGlobals.devFeatures > 0 then print("not allowed to drive IV") end
		return false
	end

	if vehicle.acIsCPStopped then
		vehicle.acIsCPStopped = false
		if AIVEGlobals.devFeatures > 0 then print("not allowed to drive II") end
		return false
	end
	
	if vehicle.aiveChain.tools == nil or table.getn(vehicle.aiveChain.tools) < 1 then
		if AIVEGlobals.devFeatures > 0 then print("not allowed to drive III") end
		return false
	end
	
	local allowedToDrive = true
	
	for i,tool in pairs(vehicle.aiveChain.tools) do
		local self = tool.obj
		local curCapa, maxCapa = 0, 0
		
		if useAIMarker then
			if tool.marker[1] ~= nil then
				tool.marker[1] = tool.obj.aiLeftMarker
			end
			if tool.marker[2] ~= nil then
				tool.marker[2] = tool.obj.aiRightMarker
			end
			tool.aiBackMarker = Utils.getNoNil( tool.obj.aiBackMarker, tool.marker[1] )
		end
		
		if self.fillUnits ~= nil then
			for u,f in pairs( self.fillUnits ) do
				maxCapa = maxCapa + self:getUnitCapacity( u )
				curCapa = curCapa + self:getUnitFillLevel( u )
			end
		end
		
		if  not ( tool.isCombine )
				and checkFillLevel
				and self.capacity  ~= nil
				and self.capacity  > 0 
				and self.fillLevel ~= nil
				and self.fillLevel <= 0 then
			if AIVEGlobals.devFeatures > 0 then print("emtpy") end
			allowedToDrive = false
		end
	end
		
	if not allowedToDrive then
		vehicle.lastNotAllowedToDrive = true
	elseif vehicle.lastNotAllowedToDrive then
		vehicle.lastNotAllowedToDrive = false
		AutoSteeringEngine.setToolsAreLowered( vehicle, true, false )		
	end
	
	return allowedToDrive
end

------------------------------------------------------------------------
-- checkIsAnimPlaying
------------------------------------------------------------------------
function AutoSteeringEngine.checkIsAnimPlaying( vehicle, moveDown )
	
	local isPlaying = false

	if vehicle.aiveChain.tools == nil or table.getn(vehicle.aiveChain.tools) < 1 then
		if AIVEGlobals.devFeatures > 0 then print("no tools") end
		return false, false
	end
	
	if      moveDown 
			and vehicle.aiveHas.combineVehicle
			and vehicle:getCanBeTurnedOn( )
			and not vehicle:getIsTurnedOn( ) then
		vehicle:setIsTurnedOn( true )
		vehicle:aiTurnOn()
	end
	
	for _,tool in pairs(vehicle.aiveChain.tools) do
		--if moveDown and tool.obj.startActivationTime ~= nil and tool.obj.startActivationTime <= g_currentMission.time then
		--	return true
		--end
		if tool.isPlough and tool.obj.rotationPart ~= nil then
			local self = tool.obj
			if self.rotationPart.turnAnimation ~= nil and self.getIsAnimationPlaying ~= nil then
        --local turnAnimTime = self:getAnimationTime(self.rotationPart.turnAnimation)
        --if turnAnimTime < self.rotationPart.touchAnimMaxLimit and turnAnimTime > self.rotationPart.touchAnimMinLimit then
				if self:getIsAnimationPlaying(self.rotationPart.turnAnimation) then
          return true, true
        end
			end
			if  self.rotationPart.node ~= nil then
				local x, y, z = getRotation(self.rotationPart.node)
				local maxRot = self.rotationPart.maxRot
				local minRot = self.rotationPart.minRot
				local eps = self.rotationPart.touchRotLimit
				if eps < math.abs(x - maxRot[1]) and eps < math.abs(x - minRot[1]) or eps < math.abs(y - maxRot[2]) and eps < math.abs(y - minRot[2]) or eps < math.abs(z - maxRot[3]) and eps < math.abs(z - minRot[3]) then
					return true, true
				end
			end
      if self.foldAnimTime ~= nil and (self.foldAnimTime > self.rotationPart.foldMaxLimit or self.foldAnimTime < self.rotationPart.foldMinLimit) then
				return true, true
      end
 		end
		
		if moveDown and tool.targetLowerState then
			if      tool.isTurnOnVehicle
					and tool.obj:getCanBeTurnedOn( )
					and not tool.obj:getIsTurnedOn( ) then
				tool.obj:setIsTurnedOn()
				tool.obj:aiTurnOn()
			end
			
			if tool.currentLowerState then
				local isReady, noSneak = AutoSteeringEngine.checkToolIsReady( tool ) 
				
				if isReady == false and noSneak then
					if AIVEGlobals.devFeatures > 0 then print("tool is not yet ready I") end
					if tool.ignoreAI then
						isPlaying = true
					else
						return true, true
					end
				elseif  isReady                   == nil 
						and tool.waitUntilIsLowered ~= nil 
						and tool.waitUntilIsLowered > g_currentMission.time then
					if AIVEGlobals.devFeatures > 0 then print("tool is not yet ready II") end
					isPlaying = true
				end
			end
		end
		--if moveDown and tool.isFoldable then
		--	local self = tool.obj
		--	if     self.foldMiddleDirection > 0.1 then
		--		if self.foldAnimTime > 1E-3 then
		--			return true
		--		end
		--	elseif self.foldMiddleDirection < -0.1 then
		--		if self.foldAnimTime < 0.999 then
		--			return true
		--		end
		--	end
		--end
	end
	
	return isPlaying, false
end

------------------------------------------------------------------------
-- checkToolIsReady
------------------------------------------------------------------------
function AutoSteeringEngine.checkToolIsReady( tool )
	local result   = nil
	local noSneak  = false
	
	if      tool.isTurnOnVehicle
			and tool.obj:getCanBeTurnedOn( )
			and not tool.obj:getIsTurnedOn( ) then
		return false, true
	end
	
	if      tool.obj.getDoGroundManipulation ~= nil
			and tool.obj:getDoGroundManipulation( ) then
		return true
	end

	if      tool.isPlough       
			and tool.obj.ploughHasGroundContact then
		return true
	elseif  tool.isCultivator   
			and tool.obj.cultivatorHasGroundContact then
		return true
	elseif  tool.isSowingMachine 
			and tool.obj.sowingMachineHasGroundContact then
		return true
	elseif  tool.isSprayer      
			and tool.obj:getIsReadyToSpray( ) then
		return true
	end
	
--if     tool.obj.movingDirection <= 0 
--		or tool.obj.lastSpeed       <= 8.3334e-4 then 
--	-- not moving => is ready to find some work to do...
--	return true, true
--end
	
	if     tool.isPlough        then
		result  = tool.obj.ploughHasGroundContact
		noSneak = true
	elseif tool.isCultivator    then
		result  = tool.obj.cultivatorHasGroundContact
		noSneak = true
	elseif tool.isSowingMachine then
		result  = tool.obj.sowingMachineHasGroundContact
		noSneak = true
	elseif tool.isSprayer       then
		result  = tool.obj:getIsReadyToSpray( )
		noSneak = true
	elseif tool.hasWorkAreas and tool.obj.groundReferenceNodes ~= nil then
		result = nil
		for _,n in pairs(tool.obj.groundReferenceNodes) do
			if n.isActive then
				local x, y, z = getWorldTranslation(n.node)
				local terrainHeight = getTerrainHeightAtWorldPos(g_currentMission.terrainRootNode, x, 0, z)
				y = y - terrainHeight
				if y > n.threshold then			
					result  = false
					noSneak = true
				elseif result == nil then
					result = true
				end
			end
		end
		if result == nil then
			result = false
		end
	end

	if result then return true end
	
	if tool.isCombine and tool.obj.isThreshing ~= nil then
		result = tool.obj.isThreshing
	end

	if     result then 
		return true
	elseif result == nil then
		return nil, false
	end
	return result, noSneak
end

------------------------------------------------------------------------
-- normalizeAngle
------------------------------------------------------------------------
function AutoSteeringEngine.normalizeAngle( b )
	local a = b
	while a >  math.pi do a = a - math.pi - math.pi end
	while a < -math.pi do a = a + math.pi + math.pi end
	return a
end

------------------------------------------------------------------------
-- getMinToolRadius
------------------------------------------------------------------------
function AutoSteeringEngine.getMinToolRadius( vehicle, radius )
	local radiusT = radius
	
	for _,tool in pairs( vehicle.aiveChain.tools ) do
		if tool.aiForceTurnNoBackward then
			local _,_,b1  = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.refNode )
			b1            = math.max( 0, -b1 )
			local b2
			if tool.b2 == nil then
				b2          = math.max( 0, -tool.zb )
			else
				b2          = math.max( 0, -tool.b2 )
			end
			local b3 = 0
			if tool.doubleJoint then
				b3 = tool.b3
			end
			if b1 < 0 and b2 < -1 then
				b2 = b2 + 0.5
				b1 = b1 - 0.5
			end
			
			radiusT = math.min( radiusT, math.sqrt( math.max( radius*radius + b1*b1 - b2*b2 - b3*b3, 0 ) ) )
		end
	end
	
	return radiusT 
end

------------------------------------------------------------------------
-- getMaxSteeringAngle75
------------------------------------------------------------------------
function AutoSteeringEngine.getMaxSteeringAngle75( vehicle, invert )

	if vehicle.aiveChain.trace == nil then
		vehicle.aiveChain.trace = {}
	end
	
	if     vehicle.aiveChain.trace.turn75 == nil then
		vehicle.aiveChain.trace.turn75 = {}
		
		local index   = AutoSteeringEngine.getNoReverseIndex( vehicle )
		local radius  = vehicle.aiveChain.radius
		local radiusT = vehicle.aiveChain.radius
		local alpha   = vehicle.aiveChain.maxSteering
		local radiusE = vehicle.aiveChain.radius
		local diffE   = 0
		local gammaE  = 0
		
		if index > 0 then
			local tool    = vehicle.aiveChain.tools[index]
			local r       = vehicle.aiveChain.radius
			local _,_,b1  = AutoSteeringEngine.getRelativeTranslation( vehicle.aiveChain.refNode, tool.refNode )
			b1            = math.max( 0, -b1 )
			local b2
			if tool.b2 == nil then
				b2          = math.max( 0, -tool.zb )
			else
				b2          = math.max( 0, -tool.b2 )
			end
			local b3 = 0
			if tool.doubleJoint then
				b3 = tool.b3
			end
			if b1 < 0 and b2 < -1 then
				b2 = b2 + 0.5
				b1 = b1 - 0.5
			end

			if vehicle.articulatedAxis == nil then
				local diff   = math.huge
				local alpha1 = 0
				local alpha2 = AIVEGlobals.maxToolAngle
				for f=0,1,0.01 do
					local a1 = f     * AIVEGlobals.maxToolAngle
					local a2 = (1-f) * AIVEGlobals.maxToolAngle
					local d  = math.abs( b1 * math.sin( a2 ) - b1 * math.sin( a1 ) )
					if diff > d then
						diff   = d
						alpha1 = a1
						alpha2 = a2
					end
				end
				
				local ra
				if b1 > b2 then
					ra = b1 / math.sin( alpha1 )
				else
					ra = b2 / math.sin( alpha2 )
				end
				
				radius = math.max( r, ra * math.cos( alpha1 ) )
				alpha  = math.min( vehicle.aiveChain.maxSteering, math.atan( vehicle.aiveChain.wheelBase / radius ) )
			end
			
			radiusT  = math.sqrt( math.max( radius*radius + b1*b1 - b2*b2 - b3*b3, 0 ) )
			radiusE  = r
			diffE    = 0.5 * math.max( 0, radiusE - radiusT )
			gammaE   = math.acos( math.min(math.max( 1 - diffE / radius, 0), 1 ) )
		end
						
		local diffT = vehicle.aiveChain.otherX
		
		if invert then
			diffT = vehicle.aiveChain.activeX
		else
			for i,tool in pairs(vehicle.aiveChain.tools) do
				if tool.isPlough then
					diffT = vehicle.aiveChain.activeX
					break
				end
			end
		end		
		
		if diffT < 0 and ( vehicle.aiveChain.activeX > 0 or vehicle.aiveChain.otherX > 0 ) then -- vehicle.aiveChain.leftActive then
			diffT = -diffT
		end
		
		vehicle.aiveChain.trace.turn75.index   = index 
		vehicle.aiveChain.trace.turn75.radius  = radius
		vehicle.aiveChain.trace.turn75.radiusT = radiusT
		vehicle.aiveChain.trace.turn75.alpha   = alpha
		vehicle.aiveChain.trace.turn75.diffE   = diffE  
		vehicle.aiveChain.trace.turn75.gammaE  = gammaE
		vehicle.aiveChain.trace.turn75.diffT   = diffT
	end
	
	return vehicle.aiveChain.trace.turn75
end

------------------------------------------------------------------------
-- navigateToSavePoint
------------------------------------------------------------------------
function AutoSteeringEngine.navigateToSavePoint( vehicle, turnMode, fallback, Turn75 )

	if turnMode == nil or turnMode <= 0 then
		vehicle.aiveChain.trace.targetTrace = nil
		return 0, false
	end

  -------------------------------------------------------
	local debugOutput = false 
	debugOutput = debugOutput and ( AIVEGlobals.devFeatures > 0 )
  -------------------------------------------------------  

	if     vehicle.aiveChain               == nil
			or vehicle.aiveChain.maxSteering   == nil 
			or vehicle.aiveChain.trace == nil then
		return 0, false
	end
	
	local uTurn = true
	if turnMode == 2 or turnMode == 4 then
		uTurn = false
	end

	local tvx, tvz = AutoSteeringEngine.getTurnVector( vehicle, uTurn )
	local wx,wy,wz = AutoSteeringEngine.getAiWorldPosition( vehicle )
	local angle    = nil
	local d1       = nil
	local onTrack  = true
	local radius   = Utils.getNoNil( vehicle.aiveChain.radius, 5 ) * 1.1
--radius = radius + math.max( 0.1 * radius, 0.5 )
	
	local turn75 
	if     vehicle.aiveChain.trace.targetTrace     == nil
			or vehicle.aiveChain.trace.targetTraceMode ~= turnMode then
		--or math.abs( vehicle.aiveChain.activeX - vehicle.aiveChain.trace.aiveChain.activeX ) > 0.2 then
		
		AutoSteeringEngine.rotateHeadlandNode( vehicle )
		
		vehicle.aiveChain.trace.targetTrace       = {}			
		vehicle.aiveChain.trace.targetTraceMode   = turnMode	
		
		local shiftT = 0
		local rV     = radius
		local rT     = rV
		local mta    = 0.5 * math.pi - AIVEGlobals.maxToolAngle

		if      type( Turn75 ) == "table"
				and Turn75.radius  ~= nil 
				and Turn75.radiusT ~= nil then 
			turn75 = Turn75
		else
			turn75 = AutoSteeringEngine.getMaxSteeringAngle75( vehicle )
		end
	
		if      mta            > 0
				and turn75.radius  > turn75.radiusT then				
			rT     = turn75.radius
			shiftT = turn75.radius - turn75.radiusT
		end
		
		vehicle.aiveChain.trace.targetTraceMinZ = math.min( 0, vehicle.aiveChain.maxZ ) - 20
		
	--print(tostring(vehicle.aiveChain.radius).." "..tostring(rV).." "..tostring(rT).." "..tostring(turn75.radius).." "..tostring(turn75.radiusT))
		
		local p = {}
		if turnMode == 1 or turnMode == 3 then
			local ta      = AutoSteeringEngine.normalizeAngle( math.pi - AutoSteeringEngine.getTurnAngle( vehicle )	)
			local dx,_,dz = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, -1 )
					
			local zz  = 0

			if turnMode == 1 then
				if math.abs( tvx ) > 1 then
					zz = tvz - 0.5 * ( rV + rT )
				else
					zz = tvz
				end
				
				if     tvx >  1 then
					if not vehicle.aiveChain.leftActive then
						shiftT = shiftT - 0.5
					end
				elseif tvx < -1 then
					if vehicle.aiveChain.leftActive then
						shiftT = shiftT - 0.5
					end
				else
					shiftT = 0
				end
			end
			
			if shiftT <= 0 then
				shiftT = 0
				mta    = 0
			end
			
			local shiftZ = zz
			local toa = 0
			if shiftT > 0 and rT > 0 then
				toa = -math.asin( Utils.clamp( 1 - shiftT / rT, 0, 0.5 ) )
				zz  = zz + rT * math.sin( toa )
				if AIVEGlobals.devFeatures > 0 then
					print("***********************************************************")
					print(string.format("%1.3fm %1.3fm => %3d° %1.3fm", shiftT, rT, math.deg( toa ), zz ))
				end
			end			
			
			local zl = zz + 1		
			while zl > vehicle.aiveChain.trace.targetTraceMinZ do
				zl = zl - 1						
				local x,_,z = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, zl )
				x = vehicle.aiveChain.trace.ux + x
				z = vehicle.aiveChain.trace.uz + z
				table.insert( vehicle.aiveChain.trace.targetTrace, 1, { x=x, z=z, dx=dx, dz=dz, a=0, ir=0 } )
			end			
			
			vehicle.aiveChain.trace.targetTraceIOfs = table.getn( vehicle.aiveChain.trace.targetTrace )
			
			if turnMode == 1 and math.abs( tvx ) > 1 then
				for i=1,50 do
					local a = ( 0.5 * math.pi - toa ) * i * 0.02 + toa
					local s = math.sin( a )
					local c = math.cos( a )
					
					local ir, lx, lz					
					if a > mta and rT > rV then
						ir = 1 / rV
						lx = c * rV + math.cos( mta ) * ( rT - rV ) 
						lz = s * rV + math.sin( mta ) * ( rT - rV )
					else
						ir = 1 / rT
						lx = c * rT
						lz = s * rT 
					end
					
					lx = lx - rT + shiftT
					if tvx > 0 then
					-- negative because getTurnVector inverts the sign
						lx = -lx
					end
					lz = lz + shiftZ
										
					x,_,z = localDirectionToWorld( vehicle.aiveChain.headlandNode, lx, 0, lz )
					x = x + vehicle.aiveChain.trace.ux
					z = z + vehicle.aiveChain.trace.uz

					local j = table.getn( vehicle.aiveChain.trace.targetTrace )
					dx = vehicle.aiveChain.trace.targetTrace[j].x - x
					dz = vehicle.aiveChain.trace.targetTrace[j].z - z
					if dx*dx+dz*dz > 0.04 then
						table.insert( vehicle.aiveChain.trace.targetTrace, { x=x, z=z, dx=dx, dz=dz, a=a, ir=ir } )
					end
				end			
			elseif  false -- turnMode       >  1
					and tvz            >= 1 
					and math.abs(tvx)  >= 0.1
					and math.abs( ta ) <= 0.75 * math.pi 
					and ( math.abs( ta ) > 1E-3 or math.abs( tvx ) < 0.1 ) 
					and ( ( ta >= 0 and tvx <= 0 ) or ( ta <= 0 and tvx >= 0 ) ) then
				local r  = radius
				local c  = math.cos( ta ) 
				local s  = math.sin( ta )
				local zo = 0
				local xo = 0
				
				if tvz * ( 1 - c) < math.abs( tvx * s ) then
					r  = tvz / math.abs( s )
					if tvx < 0 then r = -r end
				--xo = xo + tvx - r * ( 1 - c )
				else
					r  = tvx / ( 1 - c )
					zo = tvz - math.abs( r * s )
				end
				
				local iMax = math.max( 2, math.floor( math.abs( ta * r ) + 0.5 ) )
				
				for i=1,iMax do
					local a = ta * i / iMax
			
					x,_,z = localDirectionToWorld( vehicle.aiveChain.headlandNode, xo + r * (1-math.cos( a )), 0, zo + math.abs( r * math.sin( a ) ) )
					x = x + vehicle.aiveChain.trace.ux
					z = z + vehicle.aiveChain.trace.uz
				
					local j = table.getn( vehicle.aiveChain.trace.targetTrace )
					dx = vehicle.aiveChain.trace.targetTrace[j].x - x
					dz = vehicle.aiveChain.trace.targetTrace[j].z - z
					if dx*dx+dz*dz > 0.04 then
						table.insert( vehicle.aiveChain.trace.targetTrace, { x=x, z=z, dx=dx, dz=dz, a=a, ir=1/r } )
					end
				end		
			end
			
		elseif turnMode == 5 then
			-- continue in previous direction 
			local dx,_,dz = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, 1 )
			local zl = 1		
			
			local lx = vehicle.aiveChain.trace.rx
			local lz = vehicle.aiveChain.trace.rz
			
			while zl > vehicle.aiveChain.trace.targetTraceMinZ do
				zl = zl - 1						
				local x,_,z = localDirectionToWorld( vehicle.aiveChain.headlandNode, 0, 0, -zl )
				x = lx + x
				z = lz + z
				table.insert( vehicle.aiveChain.trace.targetTrace, 1, { x=x, z=z, dx=dx, dz=dz, a=0, ir=0 } )
			end			
			
			vehicle.aiveChain.trace.targetTraceIOfs = table.getn( vehicle.aiveChain.trace.targetTrace )
		
		elseif turnMode == 2 or turnMode == 4 then
			-- negative Z is beyond turn point in old direction
			-- negative X is beyond turn point in new direction 
			
			local dx, dz
			if vehicle.aiveChain.leftActive then
				dx,_,dz = localDirectionToWorld( vehicle.aiveChain.headlandNode, -1, 0, 0 )				
			else
				dx,_,dz = localDirectionToWorld( vehicle.aiveChain.headlandNode,  1, 0, 0 )				
			end			
			
			local shiftX = tvx
			if not vehicle.aiveChain.leftActive then
				shiftX = -shiftX 
			end
			
			if shiftT <= 0 then
				shiftT = 0
				mta    = 0
			end
				
			if turnMode == 2 then
				if mta > 0 then
					shiftX = shiftX - rV - math.sin( mta ) * ( rT - rV )
				else
					shiftX = shiftX - rV 
				end
			end
			
			local zz  = shiftX - 2
			local toa = 0
			if shiftT > 0 and rT > 0 then
				toa = -math.asin( Utils.clamp( 1 - shiftT / rT, 0, 0.5 ) )
				zz  = zz + rT * math.sin( toa )
				if AIVEGlobals.devFeatures > 0 then
					print("***********************************************************")
					print(string.format("%1.3fm %1.3fm => %3d° %1.3fm", shiftT, rT, math.deg( toa ), zz ))
				end
			end
			
			local zl = zz + 1						
			while zl > vehicle.aiveChain.trace.targetTraceMinZ do
				zl = zl - 1
				
				local zd = math.min( 0, zl - zz )
				local zf = zl - zd
				local lx = zd + zf
				
				if not vehicle.aiveChain.leftActive then
					lx = -lx
				end
				
				x,_,z = localDirectionToWorld( vehicle.aiveChain.headlandNode, lx, 0, 0 )				
				x = x + vehicle.aiveChain.trace.cx 
				z = z + vehicle.aiveChain.trace.cz 
				table.insert( vehicle.aiveChain.trace.targetTrace, 1, { x=x, z=z, dx=dx, dz=dz, a=0, ir=0 } )
			end			
			
			vehicle.aiveChain.trace.targetTraceIOfs = table.getn( vehicle.aiveChain.trace.targetTrace )
			
			if turnMode == 2 then
				for i=1,50 do
					local a = ( 0.5 * math.pi - toa ) * i * 0.02 + toa
					local s = math.sin( a )
					local c = math.cos( a )
					
					local ir, lx, lz
					if a > mta and rT > rV then
						ir = 1 / rV
						lx = shiftX + s * rV + math.sin( mta ) * ( rT - rV )
						lz = shiftT + c * rV + math.cos( mta ) * ( rT - rV ) 
					else
						ir = 1 / rT
						lx = shiftX + s * rT
						lz = shiftT + c * rT
					end
					
					lz = lz - rT
					if not vehicle.aiveChain.leftActive then
						lx = -lx
					end
					
					if tvz > 1 then
						lz = -lz
					end
					
					x,_,z = localDirectionToWorld( vehicle.aiveChain.headlandNode, lx, 0, lz )
					x = x + vehicle.aiveChain.trace.cx
					z = z + vehicle.aiveChain.trace.cz

					local j = table.getn( vehicle.aiveChain.trace.targetTrace )
					if vehicle.aiveChain.trace.targetTrace[j] ~= nil then
						dx = vehicle.aiveChain.trace.targetTrace[j].x - x
						dz = vehicle.aiveChain.trace.targetTrace[j].z - z
						if dx*dx+dz*dz > 0.04 then
							table.insert( vehicle.aiveChain.trace.targetTrace, { x=x, z=z, dx=dx, dz=dz, a=a, ir=ir } )
						end
					end
				end			
			end
		else
			print("ERROR in AutoSterringEngine.navigateToSavePoint: invalid turn mode: "..tostring(turnMode))
		end

		if table.getn( vehicle.aiveChain.trace.targetTrace ) > vehicle.aiveChain.trace.targetTraceIOfs then
			local p = vehicle.aiveChain.trace.targetTrace[vehicle.aiveChain.trace.targetTraceIOfs]
			local q = vehicle.aiveChain.trace.targetTrace[vehicle.aiveChain.trace.targetTraceIOfs+1]
			local d = math.floor( math.sqrt( (p.x-q.x)^2 + (p.z-q.z)^2 ) ) - 1
			
			for i=1,d do
				x  = p.x + i/(d+1)*(q.x-p.x)
				z  = p.z + i/(d+1)*(q.z-p.z)
				dx = q.x - p.x
				dz = q.z - p.z
				local j = vehicle.aiveChain.trace.targetTraceIOfs + i
				table.insert( vehicle.aiveChain.trace.targetTrace, j, { x=x, z=z, dx=dx, dz=dz, a=0, ir=0 } )
			end			
		end
		
		vehicle.aiveChain.trace.targetTraceMinZ = nil
		if AIVEGlobals.devFeatures > 0 then
			print("***********************************************************")
			for i,p in pairs( vehicle.aiveChain.trace.targetTrace ) do
				local lx,_,lz = worldToLocal( vehicle.aiveChain.refNode, p.x, wy, p.z )
				local kx,_,kz = worldDirectionToLocal( vehicle.aiveChain.refNode, p.dx, 0, p.dz )
				if p.a == nil then
					print(string.format("nil° %1.3fm %1.3fm / %1.3fm %1.3fm",lx,lz,kx,kz ))
				else
					print(string.format("%3d° %1.3fm %1.3fm / %1.3fm %1.3fm",math.deg(p.a),lx,lz,kx,kz ))
				end
			end
			print("***********************************************************")
		end	
	end
	
	if      vehicle.aiveChain.trace.targetTrace       ~= nil 
			and vehicle.aiveChain.trace.targetTraceMode   >  0
			and ( vehicle.aiveChain.trace.targetTraceMinZ == nil
			   or tvz > vehicle.aiveChain.trace.targetTraceMinZ ) then				

		if AutoSteeringEngine.quot2Rad == nil then
			AutoSteeringEngine.quot2Rad = AnimCurve:new(linearInterpolator1)
			
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-22.9037655484312, v=-3.05432619099008 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-7.59575411272514, v=-2.87979326579064 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-4.51070850366206, v=-2.70526034059121 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-3.17159480236321, v=-2.53072741539178 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-2.41421356237309, v=-2.35619449019234 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-1.92098212697117, v=-2.18166156499291 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-1.56968557711749, v=-2.00712863979348 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-1.30322537284121, v=-1.83259571459405 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-1.09130850106927, v=-1.65806278939461 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.916331174017423, v=-1.48352986419518 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.76732698797896, v=-1.30899693899575 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.637070260807493, v=-1.13446401379631 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.520567050551746, v=-0.959931088596881 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.414213562373095, v=-0.785398163397448 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.315298788878984, v=-0.610865238198015 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.22169466264294, v=-0.436332312998582 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.131652497587396, v=-0.261799387799149 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=-0.0436609429085119, v=-0.0872664625997165 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.0436609429085119, v=0.0872664625997165 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.131652497587396, v=0.261799387799149 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.22169466264294, v=0.436332312998582 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.315298788878984, v=0.610865238198015 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.414213562373095, v=0.785398163397448 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.520567050551746, v=0.959931088596881 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.637070260807493, v=1.13446401379631 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.76732698797896, v=1.30899693899575 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=0.916331174017423, v=1.48352986419518 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=1.09130850106927, v=1.65806278939461 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=1.30322537284121, v=1.83259571459405 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=1.56968557711749, v=2.00712863979348 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=1.92098212697117, v=2.18166156499291 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=2.41421356237309, v=2.35619449019234 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=3.17159480236321, v=2.53072741539178 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=4.51070850366206, v=2.70526034059121 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=7.59575411272514, v=2.87979326579064 })
      AutoSteeringEngine.quot2Rad:addKeyframe( { time=22.9037655484312, v=3.05432619099008 })
		end
		
		if debugOutput then
			print("=========================================================")
			local x,_,z = getWorldTranslation( vehicle.aiveChain.refNode )
			print(tostring(x).." "..tostring(z).." / "..tostring(wx).." "..tostring(wz))
		end
		
		local score = {}
		for i=1,5 do
			score[i] = { score = math.huge }
		end
		
		for i,p in pairs(vehicle.aiveChain.trace.targetTrace) do
		--local x,_,z   = worldToLocal( vehicle.aiveChain.refNode, p.x, wy, p.z )
			local x,_,z   = worldDirectionToLocal( vehicle.aiveChain.refNode, p.x-wx, 0, p.z-wz )
			local dx,_,dz = worldDirectionToLocal( vehicle.aiveChain.refNode, p.dx, 0, p.dz )
			
		--if i > 1 then
		--	local q = vehicle.aiveChain.trace.targetTrace[i-1]
		--  dx,_,dz = worldDirectionToLocal( vehicle.aiveChain.refNode, q.x-p.x, 0, q.z-p.z )
		--end
			
			if z > 1 then					
				if debugOutput then
					print(tostring(x).." "..tostring(z).." / "..tostring(dx).." "..tostring(dz))
				end
				
				if math.abs( x ) <= 22.9 * math.abs( z ) then
					local alpha = AutoSteeringEngine.quot2Rad:get( x/z )					
					local beta  = math.atan2( dx, dz )
										
					if math.abs(x) < math.abs(z) then
						a = math.atan2( vehicle.aiveChain.wheelBase * math.sin( alpha ), z )					
					else
						a = math.atan2( vehicle.aiveChain.wheelBase * (1-math.cos( alpha )), math.abs(x) )					
						if x < 0 then
							a = -a
						end
					end
					
					a = a + 0.5 * ( alpha - beta )
					
					if math.abs( a ) <= 1.25 * vehicle.aiveChain.maxSteering then
						local d = x*x+z*z 						
					--local s = 1000 * math.abs( p.ir - math.tan( a ) / vehicle.aiveChain.wheelBase )
						local s = math.abs( 9 - d )
						local b = math.abs( alpha - beta ) 
						
						if debugOutput then
							print("=> "..tostring(math.deg(alpha)).."° "..tostring(math.deg(beta)).."° ===> "..tostring(math.deg(a)).."°")
						end
						
						for j=1,table.getn( score ) do
							if s <= score[j].score then
								for k=table.getn( score )-1, j,-1 do
									if score[k].angle ~= nil then
										score[k+1].score = score[k].score
										score[k+1].angle = score[k].angle
										score[k+1].dist  = score[k].dist 
										score[k+1].beta  = score[k].beta 
										score[k+1].tX    = score[k].tX   
										score[k+1].tZ    = score[k].tZ
									end
								end
								score[j].score = s
								score[j].angle = a
								score[j].dist  = d
								score[j].beta  = b
								score[j].tX    = p.x
								score[j].tZ    = p.z
								break
							end
						end
					end			
				end				
			end
		end
		
		n     = 0
		angle = nil
		bestD = nil
		bestB = nil
		bestX = nil
		bestZ = nil
		
	--for k=1,2 do
		for k=2,2 do
			for j=1,table.getn( score ) do
				if score[j].angle == nil then
					break
				elseif k == 2 or score[j].score < 10 then
					if n > 0 then
						n     = n + 1
						angle = angle + score[j].angle
						bestD = bestD + score[j].dist 
						bestB = bestB + score[j].beta 
						bestX = bestX + score[j].tX
						bestZ = bestZ + score[j].tZ
					else
						n     = 1
						angle = score[j].angle
						bestD = score[j].dist 
						bestB = score[j].beta 						
						bestX = score[j].tX
						bestZ = score[j].tZ
					--if k == 1 then break end
					end
				end
			end
			if n > 0 then
				break
			end
		end
		
		if n > 1 then
			angle = angle / n
			bestD = bestD / n
			bestB = bestB / n
			bestX = bestX / n
			bestZ = bestZ / n
		end
		
		if debugOutput then
			print("---------------------------------")
			for j=1,table.getn( score ) do
				if score[j].angle == nil then
					break
				else
					print(string.format("%2d: s: %2.3f a: %2.1f° d: %2.3fm b: %2.1f°", j, score[j].score, math.deg( score[j].angle ), math.sqrt( score[j].dist ), math.deg( score[j].beta ) ) )
				end
			end
		end
		
		if      angle ~= nil 
				and AIVEGlobals.devFeatures > 0 then
			print(tostring(math.deg(angle)).."° "..tostring(n).." "..tostring(bestD).." "..tostring(bestB))
		end
	end
	
	if angle == nil then
		onTrack = false
		
		if vehicle.aiveChain.trace.targetTraceMode == 1 then
			vehicle.aiveChain.trace.targetTraceMode = 0
		end
		
		if fallback ~= nil then
			angle = fallback( vehicle, uTurn )
			if AIVEGlobals.devFeatures > 0 then
				print("Fallback angle: "..math.floor( 0.5 + math.deg( angle )))
			end
		else
			angle = 0
			if AIVEGlobals.devFeatures > 0 then
				print("No angle found")
			end
		end
	end
	
	angle = math.min( math.max( angle, -vehicle.aiveChain.maxSteering  ), vehicle.aiveChain.maxSteering  )
	
	return angle, onTrack, bestX, bestZ
end

------------------------------------------------------------------------
-- setToolsAreTurnedOn
------------------------------------------------------------------------
function AutoSteeringEngine.setToolsAreTurnedOn( vehicle, isTurnedOn, immediate, objectFilter )
	if not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		return
	end
	
	if vehicle.aiveHas.combineVehicle then
		vehicle:setIsTurnedOn(isTurnedOn)
		vehicle:aiTurnOn()
	end
	
	AutoSteeringEngine.setToolsAreLowered( vehicle, isTurnedOn, immediate, objectFilter )
	
	for i=1,vehicle.aiveChain.toolCount do
		if objectFilter == nil or objectFilter == vehicle.aiveChain.tools[i].obj then
			local self = vehicle.aiveChain.tools[i].obj
			if vehicle.aiveChain.tools[i].isAITool then
				if vehicle.aiveChain.tools[i].isTurnOnVehicle then
					self:setIsTurnedOn( isTurnedOn )
				end
				if isTurnedOn then				
					self:aiTurnOn()
				else
					self:aiTurnOff()
				end
			elseif vehicle.aiveChain.tools[i].isTurnOnVehicle then
				if self.setIsTurnedOn ~= nil then
					self:setIsTurnedOn( isTurnedOn )
				end
				if self.setAIImplementsMoveDown ~= nil then
					self:setAIImplementsMoveDown( isTurnedOn )
				end
			end
		end
	end
end

------------------------------------------------------------------------
-- setToolIsLowered
------------------------------------------------------------------------
function AutoSteeringEngine.setToolIsLowered( vehicle, tool, isLowered )

	if tool.targetLowerState == nil then
		print("tool.targetLowerState == nil")
		AIVehicleExtension.printCallstack()
	elseif tool.targetLowerState ~= isLowered then
		print("tool.targetLowerState ~= isLowered")
		AIVehicleExtension.printCallstack()
	end
	
--tool.targetLowerState   = isLowered  
	tool.currentLowerState  = isLowered
	tool.waitUntilIsLowered = g_currentMission.time + vehicle.acDeltaTimeoutStart

	for _,implement in pairs(vehicle.attachedImplements) do
		if implement.object == tool.obj and ( implement.object.needsLowering or implement.object.aiNeedsLowering ) then
			vehicle.setJointMoveDown( vehicle, implement.jointDescIndex, isLowered, true )
		end
	end
	
	if isLowered and vehicle.aiveHas.combineVehicle and vehicle:getCanBeTurnedOn() and not vehicle:getIsTurnedOn() then
		vehicle:setIsTurnedOn( true )
		vehicle:aiTurnOn()
	end
		
	local self = tool.obj
	if isLowered then
		if tool.isTurnOnVehicle and self:getCanBeTurnedOn() and not self:getIsTurnedOn() then
			self:setIsTurnedOn( true )
			self:aiTurnOn()
		end
		self:aiLower()
	else
		self:aiRaise()
	end
end

------------------------------------------------------------------------
-- setToolsAreLowered
------------------------------------------------------------------------
function AutoSteeringEngine.setToolsAreLowered( vehicle, isLowered, immediate, objectFilter )
	if not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolParams ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		return
	end
	
	local doItNow = vehicle.aiveHas.combine
		
	for i=1,vehicle.aiveChain.toolCount do		
		if vehicle.aiveChain.tools[i].currentLowerState == nil then
			doItNow = true			
		end

		vehicle.aiveChain.tools[i].targetLowerState = isLowered		
	end	
	
	if isLowered and vehicle.aiveHas.combineVehicle and not vehicle:getIsTurnedOn() then
		vehicle:setIsTurnedOn( true )
	end
	
	if doItNow or immediate or objectFilter ~= nil then
		for i=1,table.getn( vehicle.aiveChain.toolParams ) do
			if immediate or vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i].obj == objectFilter then
				AutoSteeringEngine.ensureToolIsLowered( vehicle, isLowered, i )
			end
		end
	end
end

------------------------------------------------------------------------
-- raiseToolNoFruits
------------------------------------------------------------------------
function AutoSteeringEngine.raiseToolNoFruits( vehicle, objectFilter )
	if not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		return
	end
	
	for i=1,table.getn( vehicle.aiveChain.toolParams ) do
		if vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i].obj == objectFilter then
			vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i].targetLowerState = false
			AutoSteeringEngine.ensureToolIsLowered( vehicle, false, i )
			vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i].targetLowerState = true
		end
	end
end

------------------------------------------------------------------------
-- setToolsAreLowered
------------------------------------------------------------------------
function AutoSteeringEngine.setPloughTransport( vehicle, isTransport, excludePackomat )
	if not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		return
	end
	for i=1,vehicle.aiveChain.toolCount do
		if      vehicle.aiveChain.tools[i].ploughTransport
				and vehicle.aiveChain.tools[i].obj:getIsPloughRotationAllowed() then
			local self = vehicle.aiveChain.tools[i].obj
			local curAnimTime = self:getAnimationTime(self.rotationPart.turnAnimation)
			local tgtAnimTime = curAnimTime 
			if     isTransport then
				tgtAnimTime = 0.5
			elseif self.rotationMax then
				tgtAnimTime = 1
			else
				tgtAnimTime = -1
			end
			
			self:stopAnimation( self.rotationPart.turnAnimation )
			if curAnimTime ~= tgtAnimTime then
				if tgtAnimTime > curAnimTime then
					self:playAnimation( self.rotationPart.turnAnimation, 1, curAnimTime, true)
				else
					self:playAnimation( self.rotationPart.turnAnimation, -1, curAnimTime, true)
				end
				if 0 < tgtAnimTime and tgtAnimTime < 1 then
					self:setAnimationStopTime( self.rotationPart.turnAnimation, tgtAnimTime )
				end
			end
		end
	end	
end

------------------------------------------------------------------------
-- ensureToolsLowered
------------------------------------------------------------------------
function AutoSteeringEngine.ensureToolIsLowered( vehicle, isLowered, indexFilter )
	if not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 ) then
		return
	end
	
	for i=1,table.getn( vehicle.aiveChain.toolParams ) do
		local doit = false
		local tool = vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i]
		if indexFilter == nil or indexFilter <= 0 or i == indexFilter then
			if tool.targetLowerState == nil then
				doit = true
			elseif tool.targetLowerState == isLowered then
				if     ( tool.targetLowerState and not ( tool.currentLowerState ) ) 
						or ( not ( tool.targetLowerState ) and tool.currentLowerState ) then
					doit = true
				end
			end
		end
		
		if doit then
			AutoSteeringEngine.setToolIsLowered( vehicle, tool, isLowered )			
		end
	end
	
	if indexFilter == nil or indexFilter <= 0 then
		for _,implement in pairs(vehicle.attachedImplements) do
			if implement.object ~= nil then
				local found = false
				for i=1,table.getn( vehicle.aiveChain.toolParams ) do
					if implement.object == vehicle.aiveChain.tools[vehicle.aiveChain.toolParams[i].i].obj then	
						found = true
						break
					end
				end
				if      not found
						and ( implement.object.needsLowering or implement.object.aiNeedsLowering )
						then
					vehicle.setJointMoveDown( vehicle, implement.jointDescIndex, isLowered, true )
				end
			end
		end
	end
end

------------------------------------------------------------------------
-- ensureToolsLowered
------------------------------------------------------------------------
function AutoSteeringEngine.findComponentJointDistance( vehicle, tool, object )
	
	if     object.attacherJoint              ~= nil
			and object.attacherJoint.jointType    ~= nil
			and ( object.attacherJoint.jointType  == Vehicle.JOINTTYPE_TRAILERLOW
			   or object.attacherJoint.jointType  == Vehicle.JOINTTYPE_TRAILER ) then
		return 0
	end
	
	return -0.7
end

------------------------------------------------------------------------
-- greenDirectCut
------------------------------------------------------------------------
function AutoSteeringEngine.greenDirectCut( vehicle, resetShift )
	if     not ( vehicle.aiveChain ~= nil and vehicle.aiveChain.leftActive ~= nil and vehicle.aiveChain.toolCount ~= nil and vehicle.aiveChain.toolCount >= 1 )
			or ZZZ_greenDirectCut                                    == nil 
			or ZZZ_greenDirectCut.greenDirectCut                     == nil
			or ZZZ_greenDirectCut.greenDirectCut.shiftMinGrowthState == nil
			or ZZZ_greenDirectCut.greenDirectCut.forceGreenForage    == nil then
		return
	end
	
	local shiftDone  = false
	local shiftValue = -1
	
	if resetShift then
		shiftValue = 1
	end
	
	for i=1,vehicle.aiveChain.toolCount do
		local object = vehicle.aiveChain.tools[i].obj
		if object ~= nil and object.convertedFruits ~= nil then
			shiftDone = true
			ZZZ_greenDirectCut.greenDirectCut:shiftMinGrowthState(object,shiftValue)
			if g_currentMission.missionStats.difficulty == 3 then
				ZZZ_greenDirectCut.greenDirectCut:forceGreenForage(object,resetShift)
			end
		end
	end
	
	return shiftDone
end

--***************************************************************
-- getRelativeZTranslation
--***************************************************************
function AutoSteeringEngine.getRelativeZTranslation(root,node)
	local x,y,z = AutoSteeringEngine.getRelativeTranslation(root,node)
	return z
end

--***************************************************************
-- getWorldYRotation
--***************************************************************
function AutoSteeringEngine.getWorldYRotation(node)
	local x, _, z = localDirectionToWorld(node, 0, 0, 1)
	if math.abs(x) < 1e-3 and math.abs(z) < 1e-3 then
		return 0
	end
	return AutoSteeringEngine.normalizeAngle( math.atan2(z,x) + 1.5707963268 )
end

--***************************************************************
-- tableGetN
--***************************************************************
function AutoSteeringEngine.tableGetN( tab )
	if type( tab ) == "table" then
		return table.getn( tab )
	end
	return 0
end	

--***************************************************************
-- getTaJoints1
--***************************************************************
function AutoSteeringEngine.getTaJoints1( vehicle, refNode, zOffset )
	
	if     AutoSteeringEngine.tableGetN( vehicle.attacherJoints )     < 1
			or AutoSteeringEngine.tableGetN( vehicle.attachedImplements ) < 1 then
		return
	end
	
	local taJoints
	
	for _,implement in pairs( vehicle.attachedImplements ) do
		if      implement.object ~= nil 
				and implement.object.steeringAxleNode ~= nil 
				and ( AutoSteeringEngine.tableGetN( implement.object.wheels ) > 0
					 or AutoSteeringEngine.tableGetN( implement.object.attachedImplements ) > 0 ) 
				and AutoSteeringEngine.getRelativeZTranslation( refNode, implement.object.steeringAxleNode ) < zOffset then

			local taJoints2 = AutoSteeringEngine.getTaJoints2( vehicle, implement, refNode, zOffset )
			local iLast     = AutoSteeringEngine.tableGetN( taJoints2 )
			if iLast > 0 then
				if taJoints == nil then
					taJoints = {}
				end
				for i,joint in pairs( taJoints2 ) do
					table.insert( taJoints, joint )
				end
				break
			end
		end
	end
	
	return taJoints 
end

--***************************************************************
-- getComponentOfNode
--***************************************************************
function AutoSteeringEngine.getComponentOfNode( vehicle, node )

	if node == nil then
		return 0
  end
	
	for i,c in pairs(vehicle.components) do
		if c.node == node then
			return i
		end
	end
	
	local state, result = pcall( getParent, node )
	
	if state and result ~= nil then
		return AutoSteeringEngine.getComponentOfNode( vehicle, getParent( node ) )
	else
		return 0
	end
end
	
--***************************************************************
-- getTaJoints2
--***************************************************************
function AutoSteeringEngine.getTaJoints2( vehicle, implement, refNode, zOffset )

	if     type( implement )       ~= "table"
			or type( implement.object) ~= "table"
			or refNode                 == nil
			or AutoSteeringEngine.tableGetN( vehicle.attacherJoints ) < 1
			or implement.object.steeringAxleNode == nil then
		return 
	end
		
	local taJoints
	local trailer  = implement.object

	if      AutoSteeringEngine.tableGetN( trailer.attacherJoints )     > 0
			and AutoSteeringEngine.tableGetN( trailer.attachedImplements ) > 0 then
		taJoints = AutoSteeringEngine.getTaJoints1( trailer, trailer.steeringAxleNode, 0 )
	end
	
	if taJoints == nil then 
		taJoints = {}
	end
	
  local index = AutoSteeringEngine.tableGetN( taJoints ) + 1
	

	if      implement.jointRotLimit    ~= nil
			and implement.jointRotLimit[2] ~= nil
			and implement.jointRotLimit[2] >  math.rad( 0.1 ) then
		table.insert( taJoints, index,
									{ nodeVehicle  = vehicle.attacherJoints[implement.jointDescIndex].rootNode, --refNode, 
										nodeTrailer  = trailer.attacherJoint.rootNode, 
										targetFactor = 1 } )
	end
	
	if      AutoSteeringEngine.tableGetN( trailer.wheels )          > 0
			and AutoSteeringEngine.tableGetN( trailer.components )      > 1
			and AutoSteeringEngine.tableGetN( trailer.componentJoints ) > 0 then
		
		local na = AutoSteeringEngine.getComponentOfNode( trailer, trailer.attacherJoint.rootNode )
		
		if na > 0 then		
			local wcn = {}
			
			for _,wheel in pairs( trailer.wheels ) do
				local n = AutoSteeringEngine.getComponentOfNode( trailer, wheel.node )
				if n > 0 then
					wcn[n] = true
				end
			end			
			
			local nextN = { na }
			local allN  = {}
			
			while AutoSteeringEngine.tableGetN( nextN ) > 0 do				
				local thisN = {}
				for _,n in pairs( nextN ) do
					if not ( allN[n] ) then
						thisN[n] = true
						allN[n]  = true
					end
				end
				nextN = {}
				
				for _,cj in pairs( trailer.componentJoints ) do
					if thisN[cj.componentIndices[1]] and not ( allN[cj.componentIndices[2]] ) then
						table.insert( nextN, cj.componentIndices[2] )
						if cj.rotLimit ~= nil and cj.rotLimit[2] ~= nil and cj.rotLimit[2] > math.rad( 0.1 ) then
							table.insert( taJoints, index,
														{ nodeVehicle  = trailer.components[cj.componentIndices[1]].node,
															nodeTrailer  = trailer.components[cj.componentIndices[2]].node, 
															targetFactor = 1 } )
						end
					end
					if thisN[cj.componentIndices[2]] and not ( allN[cj.componentIndices[1]] ) then
						table.insert( nextN, cj.componentIndices[1] )
						if cj.rotLimit ~= nil and cj.rotLimit[2] ~= nil and cj.rotLimit[2] > math.rad( 0.1 ) then
							table.insert( taJoints, index,
														{ nodeVehicle  = trailer.components[cj.componentIndices[2]].node,
															nodeTrailer  = trailer.components[cj.componentIndices[1]].node, 
															targetFactor = 1 } )
						end
					end
				end
			end
		end
	end	

	return taJoints 
end




------------------------------------------------------------------------
-- Cultivator -> FrontPacker
------------------------------------------------------------------------
function AutoSteeringEngine.registerFrontPacker( cultivator )
	if not ( AIVEFrontPackerT[cultivator] ) then
		AIVEFrontPackerT[cultivator] = true
		AIVEFrontPackerC = AIVEFrontPackerC + 1
	end
end

function AutoSteeringEngine.unregisterFrontPacker( cultivator )
	if AIVEFrontPackerT[cultivator] then
		AIVEFrontPackerT[cultivator] = false
		AIVEFrontPackerC = math.max( 0, AIVEFrontPackerC - 1 )
	end
end

function AutoSteeringEngine.resetFrontPacker( vehicle )
	if vehicle == nil then
		AIVEFrontPackerT = {}
		AIVEFrontPackerC = 0
	elseif AIVEFrontPackerC > 0 and vehicle.attachedImplements ~= nil then
		for _, implement in pairs(vehicle.attachedImplements) do
			if implement.object ~= nil and AIVEFrontPackerT[implement.object] then
				AutoSteeringEngine.unregisterFrontPacker( implement.object )
				AutoSteeringEngine.resetFrontPacker( implement.object )
			end
		end
	end
end

function AutoSteeringEngine.hasFrontPacker( vehicle )
	if AIVEFrontPackerC <= 0 or vehicle == nil then 
		return false 
	end
	if AIVEFrontPackerT[vehicle] then
		return true
	end
	if vehicle.attachedImplements == nil then
		return false 
	end
	for _, implement in pairs(vehicle.attachedImplements) do
		if AutoSteeringEngine.hasFrontPacker( implement.object ) then
			return true
		end
	end
	return false
end

function AutoSteeringEngine:updateTickCultivator( superFunc, ... )
	if AIVEFrontPackerC <= 0 then
		return superFunc( self, ... )
	end
	
	local backup = CultivatorAreaEvent
	if AIVEFrontPackerT[self] then
		if FrontPackerAreaEvent == nil then
			print("Error in AutoSteeringEngine.updateTickCultivator : FrontPackerAreaEvent is nil!")
		else
			CultivatorAreaEvent = FrontPackerAreaEvent
		end
	end
	local state,result = pcall( superFunc, self, ... )
	CultivatorAreaEvent = backup
	if state then
		return result
	else
		print("Error in AutoSteeringEngine.updateTickCultivator : "..tostring(result))
	end
end

function AutoSteeringEngine:updateTickSowingMachine( superFunc, ... )
	if AIVEFrontPackerC <= 0 then
		return superFunc( self, ... )
	end
	
	local vehicle = self.getRootAttacherVehicle(self)
	local backup  = self.useDirectPlanting
	if AutoSteeringEngine.hasFrontPacker( vehicle ) then
		self.useDirectPlanting = true
	end
	local state,result = pcall( superFunc, self, ... )
	self.useDirectPlanting = backup 
	if state then
		return result
	else
		print("Error in AutoSteeringEngine.updateTickSowingMachine : "..tostring(result))
	end
end

Cultivator.updateTick    = Utils.overwrittenFunction( Cultivator.updateTick, AutoSteeringEngine.updateTickCultivator )
--SowingMachine.updateTick = Utils.overwrittenFunction( SowingMachine.updateTick, AutoSteeringEngine.updateTickSowingMachine )


function AutoSteeringEngine.degToString( d )
	if type(d) ~= "number" then
		return tostring(d)
	end
	return string.format("%6.2f°",d)
end
function AutoSteeringEngine.radToString( r )
	if r == nil then
		return "nil"
	end
	return AutoSteeringEngine.degToString( math.deg( r ))
end

