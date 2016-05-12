--Duby: Lets allow the clients to recieve the vote system and make a lovely vote box for it.
Votemap = {}
Votemap.Maps = {}


function Votemap:ToggleMenu( bl )

	if ( !bl ) then
		if ( Votemap.Menu ) then
			Votemap.Menu:SetVisible( false )
			Votemap.Menu = nil
		end
		
		return
	end

	local w, h = ScrW(), ScrH()
	
	Votemap.Menu = vgui.Create("DFrame")
	Votemap.Menu:SetTitle("")
	Votemap.Menu:SetSize(600, 400)
--	Votemap.Menu:SetPos(w * 0.41, h * 0.42)
	Votemap.Menu:SetPos(w * 0.33, h * 0.42)
	Votemap.Menu:MakePopup()
	Votemap.Menu:SetKeyBoardInputEnabled()
	Votemap.Menu:SetBackgroundBlur( true ) 
	Votemap.Menu:ShowCloseButton(false)
	Votemap.Menu:SetDraggable(false)
	--Votemap.Menu.Paint = function()
	--	surface.SetDrawColor(0,0,0,0)	
	--end
			
	
	--Votemap.Menu.Label = vgui.Create("DLabel",Votemap.Menu)
	--Votemap.Menu.Label:SetText( "Map Vote" )
	--Votemap.Menu.Label:SetFont( "ZSHUDFont2" )
	--Votemap.Menu.Label:SetTextColor(COLOR_DARKRED)
--	Votemap.Menu.Label:SetPos( w * 0.01, h * 0.01)
	--Votemap.Menu.Label:SizeToContents()
	
	--Votemap.Menu.Label2 = vgui.Create("DLabel")
	--Votemap.Menu.Label2:SetText( "Quickly.. A horde is aproaching...." )
	--Votemap.Menu.Label2:SetFont( "ZSHUDFont" )
	--Votemap.Menu.Label2:SetTextColor(COLOR_DARKRED)
	--Votemap.Menu.Label2:SetPos( w * 0.4, h * 0.32 )
	--Votemap.Menu.Label2:SizeToContents()]]--	



	Votemap.Menu.ListView = vgui.Create("DListView", Votemap.Menu)
	Votemap.Menu.ListView:SetSize( 200, 250 )
--	Votemap.Menu.ListView:SetSize( 500, 200 )
	Votemap.Menu.ListView:SetPos( 200, 30 )
	Votemap.Menu.ListView:AddColumn( "" )
	Votemap.Menu.ListView:AddColumn( "" )
	Votemap.Menu.ListView:SetMultiSelect( false )
	--Votemap.Menu.ListView.Paint = function()
	--	surface.SetDrawColor(255,1,1,100)	
	--end


	for k,v in pairs(Votemap.Maps) do
		Votemap.Menu.ListView:AddLine(k, v)
	end

	Votemap.Menu.ListView:SortByColumn( 1 )
	Votemap.Menu.ListView:SetSortable( false )


	Votemap.Menu.VoteButton = vgui.Create("DButton", Votemap.Menu)
	Votemap.Menu.VoteButton:SetText("Vote")
	Votemap.Menu.VoteButton:SetSize( 200, 30 )
	Votemap.Menu.VoteButton:SetPos( 200, 300 )
	Votemap.Menu.VoteButton.DoClick = function( pnl )
		
		local selected = Votemap.Menu.ListView:GetSelectedLine()
		
		if ( !selected ) then
			chat.AddText( Color(255, 0,0), "Invalid line selected !" )
			return
		end

		local line = Votemap.Menu.ListView:GetLine(selected)

		if ( !line ) then
			chat.AddText( Color(255, 0,0), "Invalid line selected !" )
			return
		end

		local map = line:GetValue(1)

		if ( !map ) then
			chat.AddText( Color(255, 0,0), "Invalid selected map !" )
			return
		end

		net.Start("Votemap.Vote")
		net.WriteString( map )
		net.SendToServer()

	end

end

usermessage.Hook( "Votemap.Votes", function( um )
	
	local map = um:ReadString()
	local votes = um:ReadFloat()
	local ply = um:ReadEntity()

	Votemap.Maps[map] = votes

	if ( !Votemap.Menu or !Votemap.Menu.ListView ) then
		return
	end
	
	local maplist = Votemap.Menu.ListView:GetLines()
	
	for i=1, #maplist do
		local name = Votemap.Menu.ListView:GetLine(i)
		
		if ( name:GetColumnText(1) == map ) then
			name:SetColumnText(2, tostring(votes))
		end

	end

	--if ( !ply.VotedOnce ) then
	--	chat.AddText( Color(0,128,128), "[Votemap] ", Color(128, 128,128), ply:Nick() .. " Voted for: ", Color( 255, 0, 0 ), map, Color( 128, 128, 128 ), " with ", Color( 255, 0, 0 ), tostring(votes), Color( 128, 128, 128 ), " votes." ) 
	--	ply.VotedOnce = true
	--end

end)

net.Receive( "Votemap.Maps", function( l )
	
	local json = net.ReadString()
	local tbl = util.JSONToTable( json )

	Votemap.Maps = tbl
	Votemap:ToggleMenu(true)
	MsgN("[Votemap] Started Voting !")

end)