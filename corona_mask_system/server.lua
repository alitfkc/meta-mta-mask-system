skin_maske_konum_tablo={
 --  {skinid,x,y,z,rx,ry,rz},  
    {0,0,-0.14,-0.57,0,12,90},
    {2,0,-0.135,-0.58,0,12,90},
    {12,0,-0.135,-0.58,0,12,90},
}
function maske_takma (oyuncu)
    if not getElementData(oyuncu,"maske_durum") then 
        local oyuncu_skin=getElementModel(oyuncu)
        local a=false
        for k,v in ipairs(skin_maske_konum_tablo) do 
            local secim_skin=skin_maske_konum_tablo[k][1]
            if secim_skin==oyuncu_skin then
                local x, y, z = getElementPosition (oyuncu)
                local objPick = createObject (1866, x, y, z)
                local x=skin_maske_konum_tablo[k][2]
                local y=skin_maske_konum_tablo[k][3]
                local z=skin_maske_konum_tablo[k][4]
                local rx=skin_maske_konum_tablo[k][5]
                local ry=skin_maske_konum_tablo[k][6]
                local rz=skin_maske_konum_tablo[k][7]
                exports.bone_attach:attachElementToBone (objPick, oyuncu,1,x,y,z,rx,ry,rz)
                setElementData(oyuncu,"maske_durum",true) 
                setElementData(oyuncu,"maske_obje",objPick)
                a=true
                break
            end
        end
        if not a then 
            outputChatBox("Size uygun maskemiz yok maalesef.",oyuncu,25,125,55,false)
        end
    else
        removeElementData(oyuncu,"maske_durum")
        local obje=getElementData(oyuncu,"maske_obje")
        destroyElement(obje)
        removeElementData(oyuncu,"maske_obje")
    end
end
addCommandHandler ("maske", maske_takma)
function oyundancikma ()
    if  getElementData(source,"maske_durum") then 
        removeElementData(source,"maske_durum")
        local obje=getElementData(source,"maske_obje")
        destroyElement(obje)
        removeElementData(source,"maske_obje")
    end
end
addEventHandler ( "onPlayerQuit", root, oyundancikma )
function skindegisme(oldModel, newModel)
    if not getElementData(source,"maske_durum") then 
        return 
    end
    if ( getElementType(source) == "player" ) then 
        local oyuncu=source
        local maske=getElementData(oyuncu,"maske_obje",objPick)
        destroyElement(maske)
        removeElementData(source,"maske_obje")
        removeElementData(source,"maske_durum")
        local oyuncu_skin=getElementModel(oyuncu)
        local a=false
        for k,v in ipairs(skin_maske_konum_tablo) do 
            local secim_skin=skin_maske_konum_tablo[k][1]
            if secim_skin==oyuncu_skin then
                local x, y, z = getElementPosition (oyuncu)
                local objPick = createObject (1866, x, y, z)
                local x=skin_maske_konum_tablo[k][2]
                local y=skin_maske_konum_tablo[k][3]
                local z=skin_maske_konum_tablo[k][4]
                local rx=skin_maske_konum_tablo[k][5]
                local ry=skin_maske_konum_tablo[k][6]
                local rz=skin_maske_konum_tablo[k][7]
                exports.bone_attach:attachElementToBone (objPick, oyuncu,1,x,y,z,rx,ry,rz)
                setElementData(oyuncu,"maske_durum",true) 
                setElementData(oyuncu,"maske_obje",objPick)
                a=true
                break
            end
        end
        if not a then 
            outputChatBox("Size uygun maskemiz yok maalesef.",oyuncu,25,125,55,false)
        end
    end
end
addEventHandler("onElementModelChange", root, skindegisme)