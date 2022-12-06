
function objeyukle()
    local txd = engineLoadTXD ('objeler/groucho.txd')
    engineImportTXD(txd,1866)
    local dff = engineLoadDFF('objeler/grouchos.dff',20)
    engineReplaceModel(dff,1866)
end
addEventHandler('onClientResourceStart',getResourceRootElement(getThisResource()),objeyukle)