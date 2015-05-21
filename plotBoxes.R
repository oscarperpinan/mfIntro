library(meteoForecast)
library(sp)
library(maptools)
library(maps)


pNAM <- as(mfExtent('nam'), 'SpatialPolygons')
proj4string(pNAM) <- "+proj=longlat +datum=WGS84"

pRAP <- as(mfExtent('rap'), 'SpatialPolygons')
proj4string(pRAP) <- "+proj=longlat +datum=WGS84"

pMG4 <- as(mfExtent('meteogalicia', 4), 'SpatialPolygons')
proj4string(pMG4) <- "+proj=longlat +datum=WGS84"

pMG12 <- as(mfExtent('meteogalicia', 12), 'SpatialPolygons')
proj4string(pMG12) <- "+proj=longlat +datum=WGS84"

pMG36 <- as(mfExtent('meteogalicia', 36), 'SpatialPolygons')
proj4string(pMG36) <- "+proj=longlat +datum=WGS84"

earth <- map(plot = FALSE, fill = TRUE)
IDs <- sapply(strsplit(earth$names, ":"), function(x) x[1])
earth <- map2SpatialLines(earth, IDs=IDs,
                             proj4string=CRS("+proj=longlat +datum=WGS84"))

pdf('/tmp/mapaServices.pdf')
plot(earth, lwd = .2, xlim = c(-150, 25), ylim = c(0, 60))
plot(pNAM, add = TRUE)
text(mfExtent('nam')@xmax + 3, mfExtent('nam')@ymin - 3,'NAM')
plot(pRAP, add = TRUE)
text(mfExtent('rap')@xmax + 3, mfExtent('rap')@ymin - 3, 'RAP')
plot(pMG4, add = TRUE)
text(mfExtent('meteogalicia', 4)@xmax + 3, mfExtent('meteogalicia', 4)@ymin - 3, 'MG4')
plot(pMG12, add = TRUE)
text(mfExtent('meteogalicia', 12)@xmax + 3, mfExtent('meteogalicia', 12)@ymin - 3, 'MG12')
plot(pMG36, add = TRUE)
text(mfExtent('meteogalicia', 36)@xmax + 3, mfExtent('meteogalicia', 36)@ymin - 3, 'MG36')
dev.off()
