from graphsAndStats import processFolder

beadLocation = '../AND3/170125_beads/170125_beads-1.fcs'
folderLocation = '../AND3/170125_ara_rib_tre10_AND_r1/'
processFolder(beadLocation,folderLocation,0.50,'170125_ara_rib_tre10_AND_r1')
folderLocation = '../AND3/170125_ara_rib_tre00_AND_r1/'
processFolder(beadLocation,folderLocation,0.50,'170125_ara_rib_tre00_AND_r1')
folderLocation = '../AND3/170125_ara_rib_tre01_AND_r1/'
processFolder(beadLocation,folderLocation,0.50,'170125_ara_rib_tre01_AND_r1')

beadLocation = '../AND3/170201_beads/170201_beads-1.fcs'
folderLocation = '../AND3/170201_ara_rib_tre10_AND_r2/'
processFolder(beadLocation,folderLocation,0.50,'170201_ara_rib_tre10_AND_r2')
folderLocation = '../AND3/170201_ara_rib_tre00_AND_r2/'
processFolder(beadLocation,folderLocation,0.50,'170201_ara_rib_tre00_AND_r2')
folderLocation = '../AND3/170201_ara_rib_tre01_AND_r2/'
processFolder(beadLocation,folderLocation,0.50,'170201_ara_rib_tre01_AND_r2')

beadLocation = '../AND3/170202_beads/170202_beads-1.fcs'
folderLocation = '../AND3/170202_ara_rib_tre10_AND_r3/'
processFolder(beadLocation,folderLocation,0.50,'170202_ara_rib_tre10_AND_r3')
folderLocation = '../AND3/170202_ara_rib_tre00_AND_r3/'
processFolder(beadLocation,folderLocation,0.50,'170202_ara_rib_tre00_AND_r3')
folderLocation = '../AND3/170202_ara_rib_tre01_AND_r3/'
processFolder(beadLocation,folderLocation,0.50,'170202_ara_rib_tre01_AND_r3')
print "done"