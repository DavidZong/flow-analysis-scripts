from graphsAndStats import processFolder

beadLocation = '../160824_beads/160824_beads-1.fcs'
folderLocation = '../160824_IPTG_repeat_export/'
processFolder(beadLocation,folderLocation,0.90,'160824_90percent')
processFolder(beadLocation,folderLocation,0.50,'160824_50percent')
processFolder(beadLocation,folderLocation,0.10,'160824_10percent')
print "done"