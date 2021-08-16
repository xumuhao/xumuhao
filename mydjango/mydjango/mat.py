import matlab
import matlab.engine
engine = matlab.engine.start_matlab()
PathName = "F:\jinan university\yan\互联网+\mydjango"
FileName = "cube.img"
signal = engine.Open3Dimg_v(PathName, FileName)