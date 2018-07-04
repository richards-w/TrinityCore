SET @FOZRUK := 2611;
SET @FEEBOZ := 4063;
SET @ZNORT  := 2765;
SET @SLEEBY := 2764;
SET @GUIDFO := 14514;
SET @GUIDFE := 14517;
SET @GUIDZN := 14516;
SET @GUIDSL := 14515;
SET @PATH   := 145140;

-- Creature formation for Fozruk,Feeboz,Znort and Sleeby
DELETE FROM `creature_formations` WHERE `leaderGUID`=@GUIDFO;
INSERT INTO `creature_formations` (`leaderGUID`,`memberGUID`,`dist`,`angle`,`groupAI`) VALUES
(@GUIDFO,@GUIDFO,0,0,2),
(@GUIDFO,@GUIDFE,5,45,2),
(@GUIDFO,@GUIDZN,5,0,2),
(@GUIDFO,@GUIDSL,5,315,2);
UPDATE `creature` SET `MovementType`=2,`position_x`=-799.488159,`position_y`=-3187.840820,`position_z`=81.986244,`currentwaypoint`=1 WHERE `guid` IN (@GUIDFO,@GUIDFE,@GUIDZN,@GUIDSL);
UPDATE `creature_addon` SET `path_id`=@PATH WHERE `guid` IN (@GUIDFO,@GUIDFE,@GUIDZN,@GUIDSL);
UPDATE `creature_template` SET `speed_walk`=0.777776,`Health_mod`=1 WHERE `entry` IN (@FEEBOZ,@ZNORT,@SLEEBY);
UPDATE `creature` SET `curhealth`=3820 WHERE `id`=@FOZRUK;
UPDATE `creature_template` SET `Health_mod`=2.314 WHERE `entry`=@FOZRUK;

-- Adding missing SAI for Sleeby
DELETE FROM `smart_scripts` WHERE `entryorguid`=@SLEEBY AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES 
(@SLEEBY,0,0,0,4,0,100,1,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sleeby - On Aggro - Say Line 0"),
(@SLEEBY,0,1,0,2,0,100,1,0,15,0,0,25,1,0,0,0,0,0,0,0,0,0,0,0,0,0,"Sleeby - At 15% HP - Flee For Assist"),
(@SLEEBY,0,2,0,14,0,100,0,900,30,18000,21000,11,10577,0,0,0,0,0,9,0,0,30,0,0,0,0,"Sleeby - At 900 HP Deficit on friendly - Cast Heal"),
(@SLEEBY,0,3,0,2,0,100,1,0,30,22000,28000,11,10577,0,0,0,0,0,1,0,0,0,0,0,0,0,"Sleeby - At 30 % HP - Cast Heal");


-- Waypoint Data for Fozruk,Feeboz,Znort and Sleeby
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`orientation`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-832.334,-3205.470,79.68929,0,0,0,0,100,0),
(@PATH,2,-860.918,-3218.261,84.36646,0,0,0,0,100,0),
(@PATH,3,-888.679,-3243.162,84.09533,0,0,0,0,100,0),
(@PATH,4,-914.439,-3273.134,79.92033,0,0,0,0,100,0),
(@PATH,5,-934.979,-3286.743,75.78973,0,0,0,0,100,0),
(@PATH,6,-969.229,-3298.048,70.39626,0,0,0,0,100,0),
(@PATH,7,-999.526,-3300.098,59.43864,0,0,0,0,100,0),
(@PATH,8,-1024.019,-3302.781,52.57269,0,0,0,0,100,0),
(@PATH,9,-1042.511,-3304.218,53.96111,0,0,0,0,100,0),
(@PATH,10,-1071.519,-3303.006,53.72434,0,0,0,0,100,0),
(@PATH,11,-1094.373,-3294.411,51.28259,0,0,0,0,100,0),
(@PATH,12,-1116.248,-3283.376,48.46264,0,0,0,0,100,0),
(@PATH,13,-1134.604,-3275.851,45.93983,0,0,0,0,100,0),
(@PATH,14,-1138.166,-3253.598,37.34724,0,0,0,0,100,0),
(@PATH,15,-1149.548,-3219.161,32.92126,0,0,0,0,100,0),
(@PATH,16,-1154.650,-3191.667,39.82796,0,0,0,0,100,0),
(@PATH,17,-1152.233,-3172.707,44.92081,0,0,0,0,100,0),
(@PATH,18,-1155.257,-3148.514,43.87821,0,0,0,0,100,0),
(@PATH,19,-1156.285,-3118.220,46.07511,0,0,0,0,100,0),
(@PATH,20,-1158.257,-3089.038,42.32969,0,0,0,0,100,0),
(@PATH,21,-1166.920,-3051.637,39.44429,0,0,0,0,100,0),
(@PATH,22,-1173.630,-3018.499,41.95575,0,0,0,0,100,0),
(@PATH,23,-1177.635,-2989.661,47.36756,0,0,0,0,100,0),
(@PATH,24,-1184.160,-2956.073,51.06301,0,0,0,0,100,0),
(@PATH,25,-1199.907,-2932.837,47.81623,0,0,0,0,100,0),
(@PATH,26,-1214.661,-2909.040,42.48590,0,0,0,0,100,0),
(@PATH,27,-1227.096,-2890.791,43.51100,0,0,0,0,100,0),
(@PATH,28,-1238.985,-2873.565,44.54215,0,0,0,0,100,0),
(@PATH,29,-1250.406,-2857.378,45.41686,0,0,0,0,100,0),
(@PATH,30,-1247.514,-2836.024,46.47926,0,0,0,0,100,0),
(@PATH,31,-1248.644,-2794.010,51.19218,0,0,0,0,100,0),
(@PATH,32,-1255.582,-2758.492,49.47080,0,0,0,0,100,0),
(@PATH,33,-1267.213,-2729.370,48.34093,0,0,0,0,100,0),
(@PATH,34,-1284.019,-2714.972,48.51395,0,0,0,0,100,0),
(@PATH,35,-1301.577,-2701.519,54.30533,0,0,0,0,100,0),
(@PATH,36,-1318.129,-2685.284,56.57260,0,0,0,0,100,0),
(@PATH,37,-1337.341,-2665.010,66.17728,0,0,0,0,100,0),
(@PATH,38,-1351.957,-2651.640,73.03260,0,0,0,0,100,0),
(@PATH,39,-1368.981,-2639.345,71.88406,0,0,0,0,100,0),
(@PATH,40,-1386.248,-2625.411,70.91771,0,0,0,0,100,0),
(@PATH,41,-1404.074,-2608.620,71.74998,0,0,0,0,100,0),
(@PATH,42,-1414.762,-2591.953,70.57619,0,0,0,0,100,0),
(@PATH,43,-1421.564,-2568.585,71.20494,0,0,0,0,100,0),
(@PATH,44,-1424.290,-2551.299,72.80975,0,0,0,0,100,0),
(@PATH,45,-1425.382,-2525.746,72.76966,0,0,0,0,100,0),
(@PATH,46,-1427.621,-2500.162,66.61679,0,0,0,0,100,0),
(@PATH,47,-1428.913,-2478.010,60.97769,0,0,0,0,100,0),
(@PATH,48,-1430.675,-2450.066,58.70541,0,0,0,0,100,0),
(@PATH,49,-1432.065,-2430.234,60.31319,0,0,0,0,100,0),
(@PATH,50,-1434.051,-2407.011,61.26979,0,0,0,0,100,0),
(@PATH,51,-1441.378,-2382.458,62.31955,0,0,0,0,100,0),
(@PATH,52,-1455.994,-2351.987,61.89263,0,0,0,0,100,0),
(@PATH,53,-1476.102,-2327.670,59.28052,0,0,0,0,100,0),
(@PATH,54,-1488.910,-2303.793,51.65742,0,0,0,0,100,0),
(@PATH,55,-1480.213,-2280.157,49.29763,0,0,0,0,100,0),
(@PATH,56,-1481.886,-2261.885,42.77686,0,0,0,0,100,0),
(@PATH,57,-1488.766,-2238.346,29.72172,0,0,0,0,100,0),
(@PATH,58,-1478.716,-2221.377,24.46575,0,0,0,0,100,0),
(@PATH,59,-1470.289,-2202.226,21.37988,0,0,0,0,100,0),
(@PATH,60,-1463.888,-2183.480,19.25826,0,0,0,0,100,0),
(@PATH,61,-1462.309,-2166.158,19.51268,0,0,0,0,100,0),
(@PATH,62,-1462.641,-2139.281,17.96990,0,0,0,0,100,0),
(@PATH,63,-1461.741,-2117.135,18.41839,0,0,0,0,100,0),
(@PATH,64,-1462.720,-2096.159,20.99808,0,0,0,0,100,0),
(@PATH,65,-1466.697,-2073.191,21.76600,0,0,0,0,100,0),
(@PATH,66,-1469.742,-2051.216,22.28187,0,0,0,0,100,0),
(@PATH,67,-1470.707,-2034.948,23.92398,0,0,0,0,100,0),
(@PATH,68,-1467.493,-2011.868,27.70724,0,0,0,0,100,0),
(@PATH,69,-1461.612,-1991.796,32.13912,0,0,0,0,100,0),
(@PATH,70,-1453.868,-1976.242,41.14152,0,0,0,0,100,0),
(@PATH,71,-1440.519,-1963.263,44.36967,0,0,0,0,100,0),
(@PATH,72,-1427.875,-1962.643,45.06952,0,0,0,0,100,0),
(@PATH,73,-1403.536,-1960.480,48.94749,0,0,0,0,100,0),
(@PATH,74,-1384.386,-1955.417,53.90592,0,0,0,0,100,0),
(@PATH,75,-1369.677,-1945.936,57.96852,0,0,0,0,100,0),
(@PATH,76,-1350.607,-1921.860,58.38959,0,0,0,0,100,0),
(@PATH,77,-1340.818,-1894.505,59.48376,0,0,0,0,100,0),
(@PATH,78,-1331.473,-1868.108,61.54721,0,0,0,0,100,0),
(@PATH,79,-1324.620,-1843.425,63.16196,0,0,0,0,100,0),
(@PATH,80,-1314.403,-1825.211,64.58312,0,0,0,0,100,0),
(@PATH,81,-1298.009,-1805.438,66.00177,0,0,0,0,100,0),
(@PATH,82,-1277.380,-1794.447,66.98273,0,0,0,0,100,0),
(@PATH,83,-1262.522,-1781.463,66.29517,0,0,0,0,100,0),
(@PATH,84,-1257.610,-1764.678,61.17090,0,0,0,0,100,0),
(@PATH,85,-1254.762,-1740.416,57.42629,0,0,0,0,100,0),
(@PATH,86,-1257.197,-1714.841,55.34131,0,0,0,0,100,0),
(@PATH,87,-1261.216,-1690.681,58.78395,0,0,0,0,100,0),
(@PATH,88,-1270.503,-1675.867,58.18840,0,0,0,0,100,0),
(@PATH,89,-1286.642,-1660.740,56.26418,0,0,0,0,100,0),
(@PATH,90,-1300.361,-1645.053,56.51159,0,0,0,0,100,0),
(@PATH,91,-1308.540,-1627.062,54.06078,0,0,0,0,100,0),
(@PATH,92,-1311.492,-1607.599,54.04951,0,0,0,0,100,0),
(@PATH,93,-1304.892,-1587.725,55.84180,0,0,0,0,100,0),
(@PATH,94,-1294.446,-1572.347,57.09067,0,0,0,0,100,0),
(@PATH,95,-1276.314,-1559.621,56.87208,0,0,0,0,100,0),
(@PATH,96,-1258.598,-1553.953,55.82633,0,0,0,0,100,0),
(@PATH,97,-1247.020,-1555.563,54.08138,0,0,0,0,100,0),
(@PATH,98,-1223.989,-1559.108,53.75228,0,0,0,0,100,0),
(@PATH,99,-1204.170,-1566.040,57.69885,0,0,0,0,100,0),
(@PATH,100,-1181.217,-1574.416,57.90259,0,0,0,0,100,0),
(@PATH,101,-1171.802,-1584.777,56.51091,0,0,0,0,100,0),
(@PATH,102,-1153.563,-1592.682,51.61238,0,0,0,0,100,0),
(@PATH,103,-1135.418,-1600.805,44.96742,0,0,0,0,100,0),
(@PATH,104,-1118.637,-1609.030,43.56574,0,0,0,0,100,0),
(@PATH,105,-1099.768,-1620.569,44.50407,0,0,0,0,100,0),
(@PATH,106,-1085.969,-1629.265,42.54866,0,0,0,0,100,0),
(@PATH,107,-1062.281,-1644.193,38.64921,0,0,0,0,100,0),
(@PATH,108,-1042.500,-1656.657,34.32768,0,0,0,0,100,0),
(@PATH,109,-1023.845,-1668.413,35.51415,0,0,0,0,100,0),
(@PATH,110,-1010.461,-1679.575,37.13435,0,0,0,0,100,0),
(@PATH,111,-994.238,-1696.314,37.03594,0,0,0,0,100,0),
(@PATH,112,-981.290,-1709.695,39.25463,0,0,0,0,100,0),
(@PATH,113,-965.091,-1726.436,45.73298,0,0,0,0,100,0),
(@PATH,114,-948.947,-1743.251,50.52712,0,0,0,0,100,0),
(@PATH,115,-942.321,-1755.448,50.78074,0,0,0,0,100,0),
(@PATH,116,-931.257,-1775.990,49.88054,0,0,0,0,100,0),
(@PATH,117,-923.319,-1791.586,48.12437,0,0,0,0,100,0),
(@PATH,118,-914.847,-1808.245,49.04429,0,0,0,0,100,0),
(@PATH,119,-916.232,-1825.690,52.98432,0,0,0,0,100,0),
(@PATH,120,-917.954,-1844.256,60.75032,0,0,0,0,100,0),
(@PATH,121,-926.844,-1853.560,64.75401,0,0,0,0,100,0),
(@PATH,122,-939.206,-1860.130,66.13270,0,0,0,0,100,0),
(@PATH,123,-953.152,-1868.587,66.25734,0,0,0,0,100,0),
(@PATH,124,-958.630,-1878.914,66.38094,0,0,0,0,100,0),
(@PATH,125,-970.897,-1898.712,65.08327,0,0,0,0,100,0),
(@PATH,126,-987.406,-1916.735,65.40691,0,0,0,0,100,0),
(@PATH,127,-1010.646,-1934.486,63.39084,0,0,0,0,100,0),
(@PATH,128,-1031.820,-1949.485,62.46684,0,0,0,0,100,0),
(@PATH,129,-1035.493,-1975.890,62.90833,0,0,0,0,100,0),
(@PATH,130,-1036.420,-1995.748,64.75522,0,0,0,0,100,0),
(@PATH,131,-1038.648,-2015.430,67.03606,0,0,0,0,100,0),
(@PATH,132,-1040.250,-2036.301,66.30344,0,0,0,0,100,0),
(@PATH,133,-1043.269,-2057.063,61.47777,0,0,0,0,100,0),
(@PATH,134,-1044.613,-2074.511,55.09937,0,0,0,0,100,0),
(@PATH,135,-1044.425,-2088.510,52.09245,0,0,0,0,100,0),
(@PATH,136,-1044.654,-2108.304,53.02930,0,0,0,0,100,0),
(@PATH,137,-1045.710,-2125.842,57.34435,0,0,0,0,100,0),
(@PATH,138,-1046.985,-2143.296,60.29477,0,0,0,0,100,0),
(@PATH,139,-1053.525,-2160.677,61.58408,0,0,0,0,100,0),
(@PATH,140,-1062.262,-2175.840,62.20592,0,0,0,0,100,0),
(@PATH,141,-1076.352,-2186.121,61.72998,0,0,0,0,100,0),
(@PATH,142,-1094.847,-2193.411,60.91643,0,0,0,0,100,0),
(@PATH,143,-1106.986,-2197.716,60.42783,0,0,0,0,100,0),
(@PATH,144,-1120.031,-2202.598,60.33088,0,0,0,0,100,0),
(@PATH,145,-1134.107,-2208.307,60.04767,0,0,0,0,100,0),
(@PATH,146,-1147.799,-2215.043,59.17715,0,0,0,0,100,0),
(@PATH,147,-1160.361,-2221.223,56.04159,0,0,0,0,100,0),
(@PATH,148,-1171.896,-2226.954,52.36503,0,0,0,0,100,0),
(@PATH,149,-1189.245,-2236.516,50.85875,0,0,0,0,100,0),
(@PATH,150,-1207.634,-2239.848,53.60689,0,0,0,0,100,0),
(@PATH,151,-1229.502,-2243.614,54.47043,0,0,0,0,100,0),
(@PATH,152,-1244.472,-2246.192,55.41187,0,0,0,0,100,0),
(@PATH,153,-1260.545,-2248.960,56.65786,0,0,0,0,100,0),
(@PATH,154,-1288.028,-2258.480,63.48441,0,0,0,0,100,0),
(@PATH,155,-1312.666,-2265.471,63.83049,0,0,0,0,100,0),
(@PATH,156,-1329.861,-2267.820,60.97282,0,0,0,0,100,0),
(@PATH,157,-1340.939,-2282.781,60.76001,0,0,0,0,100,0),
(@PATH,158,-1346.826,-2306.510,63.29128,0,0,0,0,100,0),
(@PATH,159,-1356.514,-2330.379,62.09324,0,0,0,0,100,0),
(@PATH,160,-1364.833,-2350.875,63.27309,0,0,0,0,100,0),
(@PATH,161,-1376.378,-2370.984,64.32507,0,0,0,0,100,0),
(@PATH,162,-1390.003,-2386.963,64.44643,0,0,0,0,100,0),
(@PATH,163,-1407.306,-2405.951,61.78886,0,0,0,0,100,0),
(@PATH,164,-1420.555,-2420.490,60.09317,0,0,0,0,100,0),
(@PATH,165,-1425.015,-2436.246,60.09718,0,0,0,0,100,0),
(@PATH,166,-1429.392,-2451.957,58.94998,0,0,0,0,100,0),
(@PATH,167,-1434.995,-2478.175,61.36834,0,0,0,0,100,0),
(@PATH,168,-1440.614,-2499.642,65.68507,0,0,0,0,100,0),
(@PATH,169,-1444.769,-2517.792,67.88286,0,0,0,0,100,0),
(@PATH,170,-1445.699,-2534.073,69.19215,0,0,0,0,100,0),
(@PATH,171,-1441.826,-2548.728,71.55446,0,0,0,0,100,0),
(@PATH,172,-1434.360,-2565.785,69.52008,0,0,0,0,100,0),
(@PATH,173,-1424.968,-2590.842,66.91249,0,0,0,0,100,0),
(@PATH,174,-1425.667,-2614.124,63.25773,0,0,0,0,100,0),
(@PATH,175,-1431.743,-2624.111,59.10629,0,0,0,0,100,0),
(@PATH,176,-1442.614,-2636.355,53.52480,0,0,0,0,100,0),
(@PATH,177,-1455.655,-2648.024,49.13583,0,0,0,0,100,0),
(@PATH,178,-1466.469,-2658.470,45.53018,0,0,0,0,100,0),
(@PATH,179,-1465.657,-2675.952,41.90980,0,0,0,0,100,0),
(@PATH,180,-1460.709,-2696.355,37.18211,0,0,0,0,100,0),
(@PATH,181,-1452.888,-2710.664,35.19919,0,0,0,0,100,0),
(@PATH,182,-1439.530,-2733.909,36.79025,0,0,0,0,100,0),
(@PATH,183,-1426.573,-2754.702,36.58022,0,0,0,0,100,0),
(@PATH,184,-1414.252,-2774.490,40.43624,0,0,0,0,100,0),
(@PATH,185,-1409.163,-2793.708,40.13807,0,0,0,0,100,0),
(@PATH,186,-1403.955,-2814.052,38.17089,0,0,0,0,100,0),
(@PATH,187,-1400.756,-2834.877,37.28344,0,0,0,0,100,0),
(@PATH,188,-1392.980,-2846.435,36.52287,0,0,0,0,100,0),
(@PATH,189,-1382.798,-2860.667,34.91384,0,0,0,0,100,0),
(@PATH,190,-1374.264,-2877.216,32.65070,0,0,0,0,100,0),
(@PATH,191,-1366.549,-2891.665,32.42652,0,0,0,0,100,0),
(@PATH,192,-1354.478,-2905.827,39.13261,0,0,0,0,100,0),
(@PATH,193,-1337.495,-2913.607,41.92314,0,0,0,0,100,0),
(@PATH,194,-1322.413,-2942.040,38.85258,0,0,0,0,100,0),
(@PATH,195,-1311.788,-2949.179,37.97545,0,0,0,0,100,0),
(@PATH,196,-1293.354,-2959.238,36.04282,0,0,0,0,100,0),
(@PATH,197,-1286.243,-2968.497,35.39156,0,0,0,0,100,0),
(@PATH,198,-1278.272,-2985.291,35.52282,0,0,0,0,100,0),
(@PATH,199,-1278.453,-3001.669,36.35407,0,0,0,0,100,0),
(@PATH,200,-1276.645,-3021.391,36.00177,0,0,0,0,100,0),
(@PATH,201,-1277.911,-3042.342,35.95967,0,0,0,0,100,0),
(@PATH,202,-1283.244,-3057.739,35.20432,0,0,0,0,100,0),
(@PATH,203,-1285.871,-3073.835,34.69639,0,0,0,0,100,0),
(@PATH,204,-1285.933,-3087.835,34.16180,0,0,0,0,100,0),
(@PATH,205,-1287.669,-3106.376,33.67950,0,0,0,0,100,0),
(@PATH,206,-1291.360,-3123.482,34.17837,0,0,0,0,100,0),
(@PATH,207,-1294.929,-3139.397,35.25090,0,0,0,0,100,0),
(@PATH,208,-1299.368,-3164.641,35.11166,0,0,0,0,100,0),
(@PATH,209,-1290.961,-3179.933,35.79531,0,0,0,0,100,0),
(@PATH,210,-1278.226,-3195.107,35.04691,0,0,0,0,100,0),
(@PATH,211,-1265.487,-3211.802,34.85434,0,0,0,0,100,0),
(@PATH,212,-1254.874,-3225.805,34.67227,0,0,0,0,100,0),
(@PATH,213,-1242.016,-3239.177,34.42041,0,0,0,0,100,0),
(@PATH,214,-1226.995,-3250.289,32.20225,0,0,0,0,100,0),
(@PATH,215,-1209.005,-3258.555,29.59883,0,0,0,0,100,0),
(@PATH,216,-1190.414,-3265.396,32.87492,0,0,0,0,100,0),
(@PATH,217,-1166.793,-3271.900,39.47464,0,0,0,0,100,0),
(@PATH,218,-1142.090,-3278.944,45.54786,0,0,0,0,100,0),
(@PATH,219,-1119.980,-3286.243,48.92627,0,0,0,0,100,0),
(@PATH,220,-1095.748,-3294.774,51.35248,0,0,0,0,100,0),
(@PATH,221,-1074.817,-3302.142,53.40496,0,0,0,0,100,0),
(@PATH,222,-1055.146,-3305.007,54.27245,0,0,0,0,100,0),
(@PATH,223,-1035.344,-3304.849,53.27559,0,0,0,0,100,0),
(@PATH,224,-1014.499,-3304.045,54.20192,0,0,0,0,100,0),
(@PATH,225,-990.851,-3298.044,63.28812,0,0,0,0,100,0),
(@PATH,226,-970.008,-3295.534,70.09853,0,0,0,0,100,0),
(@PATH,227,-944.635,-3291.997,74.38611,0,0,0,0,100,0),
(@PATH,228,-932.371,-3285.322,76.28872,0,0,0,0,100,0),
(@PATH,229,-913.366,-3271.833,80.13741,0,0,0,0,100,0),
(@PATH,230,-897.063,-3255.075,83.12675,0,0,0,0,100,0),
(@PATH,231,-881.291,-3241.244,84.59821,0,0,0,0,100,0),
(@PATH,232,-867.330,-3227.198,84.76893,0,0,0,0,100,0),
(@PATH,233,-850.828,-3216.250,83.22803,0,0,0,0,100,0),
(@PATH,234,-833.957,-3205.938,79.70540,0,0,0,0,100,0),
(@PATH,235,-816.334,-3196.889,81.54343,3.60,60000,0,0,100,0);

-- Updating creature loot for Fozruk
DELETE FROM `creature_loot_template` WHERE `entry`=@FOZRUK;
INSERT INTO `creature_loot_template` VALUES 
(@FOZRUK,4469,-100,1,0,1,1),
(@FOZRUK,7192,30,1,0,1,2),
(@FOZRUK,8150,20,1,0,1,1),
(@FOZRUK,4552,12,1,0,1,1),
(@FOZRUK,4554,4,1,0,1,1),
(@FOZRUK,8157,1,1,0,1,1),
(@FOZRUK,4637,1,1,0,1,1),
(@FOZRUK,4045,0.4,1,0,1,1),
(@FOZRUK,4002,0.3,1,0,1,1),
(@FOZRUK,7909,0.2,1,0,1,1),
(@FOZRUK,4024,0.2,1,0,1,1),
(@FOZRUK,4004,0.2,1,0,1,1),
(@FOZRUK,3963,0.2,1,0,1,1),
(@FOZRUK,3989,0.2,1,0,1,1),
(@FOZRUK,4026,0.2,1,0,1,1),
(@FOZRUK,8750,0.2,1,0,1,1),
(@FOZRUK,4025,0.2,1,0,1,1),
(@FOZRUK,4018,0.2,1,0,1,1),
(@FOZRUK,3962,0.2,1,0,1,1),
(@FOZRUK,3938,0.2,1,0,1,1),
(@FOZRUK,4022,0.2,1,0,1,1),
(@FOZRUK,4023,0.2,1,0,1,1),
(@FOZRUK,4020,0.2,1,0,1,1),
(@FOZRUK,3965,0.1,1,0,1,1),
(@FOZRUK,3939,0.1,1,0,1,1),
(@FOZRUK,4019,0.1,1,0,1,1),
(@FOZRUK,4007,0.1,1,0,1,1),
(@FOZRUK,3986,0.1,1,0,1,1),
(@FOZRUK,4017,0.1,1,0,1,1),
(@FOZRUK,3942,0.1,1,0,1,1),
(@FOZRUK,3966,0.1,1,0,1,1),
(@FOZRUK,4021,0.1,1,0,1,1),
(@FOZRUK,3937,0.1,1,0,1,1),
(@FOZRUK,3941,0.1,1,0,1,1),
(@FOZRUK,3943,0.1,1,0,1,1),
(@FOZRUK,8137,0.1,1,0,1,1),
(@FOZRUK,9285,0.1,1,0,1,1),
(@FOZRUK,8194,0.1,1,0,1,1),
(@FOZRUK,15251,0.1,1,0,1,1),
(@FOZRUK,4061,0.1,1,0,1,1),
(@FOZRUK,4736,0.1,1,0,1,1),
(@FOZRUK,4000,0.1,1,0,1,1),
(@FOZRUK,3964,0.1,1,0,1,1),
(@FOZRUK,9290,0.1,1,0,1,1),
(@FOZRUK,866,0.1,1,0,1,1),
(@FOZRUK,8386,0.1,1,0,1,1),
(@FOZRUK,3936,0.1,1,0,1,1),
(@FOZRUK,4001,0.1,1,0,1,1),
(@FOZRUK,4005,0.1,1,0,1,1),
(@FOZRUK,3961,0.1,1,0,1,1),
(@FOZRUK,3967,0.1,1,0,1,1),
(@FOZRUK,3968,0.1,1,0,1,1),
(@FOZRUK,6424,0.1,1,0,1,1),
(@FOZRUK,9968,0.1,1,0,1,1),
(@FOZRUK,1625,0.1,1,0,1,1),
(@FOZRUK,6431,0.1,1,0,1,1),
(@FOZRUK,12042,0.1,1,0,1,1),
(@FOZRUK,1640,0.1,1,0,1,1),
(@FOZRUK,7555,0.1,1,0,1,1),
(@FOZRUK,9883,0.1,1,0,1,1),
(@FOZRUK,4087,0.1,1,0,1,1),
(@FOZRUK,3914,0.1,1,0,1,1),
(@FOZRUK,8749,0.1,1,0,1,1),
(@FOZRUK,4003,0.1,1,0,1,1),
(@FOZRUK,4006,0.1,1,0,1,1),
(@FOZRUK,13138,0.1,1,0,1,1),
(@FOZRUK,8196,0.1,1,0,1,1),
(@FOZRUK,5215,0.1,1,0,1,1),
(@FOZRUK,9292,0.1,1,0,1,1),
(@FOZRUK,4058,0.1,1,0,1,1),
(@FOZRUK,7524,0.1,1,0,1,1),
(@FOZRUK,8120,0.1,1,0,1,1),
(@FOZRUK,9893,0.1,1,0,1,1),
(@FOZRUK,4738,0.1,1,0,1,1),
(@FOZRUK,11987,0.1,1,0,1,1),
(@FOZRUK,9897,0.1,1,0,1,1),
(@FOZRUK,8163,0.1,1,0,1,1),
(@FOZRUK,4047,0.1,1,0,1,1),
(@FOZRUK,7481,0.1,1,0,1,1),
(@FOZRUK,7485,0.1,1,0,1,1),
(@FOZRUK,7332,0.1,1,0,1,1),
(@FOZRUK,7471,0.1,1,0,1,1),
(@FOZRUK,7470,0.1,1,0,1,1),
(@FOZRUK,9909,0.1,1,0,1,1),
(@FOZRUK,8751,0.1,1,0,1,1),
(@FOZRUK,867,0.1,1,0,1,1),
(@FOZRUK,13058,0.1,1,0,1,1),
(@FOZRUK,13034,0.1,1,0,1,1),
(@FOZRUK,7112,0.1,1,0,1,1),
(@FOZRUK,6415,0.1,1,0,1,1),
(@FOZRUK,6425,0.1,1,0,1,1),
(@FOZRUK,9927,0.1,1,0,1,1),
(@FOZRUK,9928,0.1,1,0,1,1),
(@FOZRUK,9930,0.1,1,0,1,1),
(@FOZRUK,9931,0.1,1,0,1,1),
(@FOZRUK,7486,0.1,1,0,1,1),
(@FOZRUK,7488,0.1,1,0,1,1),
(@FOZRUK,7487,0.1,1,0,1,1),
(@FOZRUK,7491,0.1,1,0,1,1),
(@FOZRUK,7494,0.1,1,0,1,1),
(@FOZRUK,6411,0.1,1,0,1,1),
(@FOZRUK,4068,0.1,1,0,1,1),
(@FOZRUK,3864,0.1,1,0,1,1),
(@FOZRUK,15287,0.1,1,0,1,1),
(@FOZRUK,21947,0.05,1,0,1,1),
(@FOZRUK,9966,0.05,1,0,1,1),
(@FOZRUK,9973,0.05,1,0,1,1),
(@FOZRUK,9972,0.05,1,0,1,1),
(@FOZRUK,9970,0.05,1,0,1,1),
(@FOZRUK,12011,0.05,1,0,1,1),
(@FOZRUK,11204,0.05,1,0,1,1),
(@FOZRUK,11225,0.05,1,0,1,1),
(@FOZRUK,11208,0.05,1,0,1,1),
(@FOZRUK,7522,0.05,1,0,1,1),
(@FOZRUK,9887,0.05,1,0,1,1),
(@FOZRUK,9894,0.05,1,0,1,1),
(@FOZRUK,@FEEBOZ,0.05,1,0,1,1),
(@FOZRUK,4062,0.05,1,0,1,1),
(@FOZRUK,9903,0.05,1,0,1,1),
(@FOZRUK,9904,0.05,1,0,1,1),
(@FOZRUK,11998,0.05,1,0,1,1),
(@FOZRUK,4070,0.05,1,0,1,1),
(@FOZRUK,8162,0.05,1,0,1,1),
(@FOZRUK,12031,0.05,1,0,1,1),
(@FOZRUK,4735,0.05,1,0,1,1),
(@FOZRUK,6429,0.05,1,0,1,1),
(@FOZRUK,4300,0.05,1,0,1,1),
(@FOZRUK,10302,0.05,1,0,1,1),
(@FOZRUK,10300,0.05,1,0,1,1),
(@FOZRUK,3873,0.05,1,0,1,1),
(@FOZRUK,8029,0.05,1,0,1,1),
(@FOZRUK,7479,0.05,1,0,1,1),
(@FOZRUK,7482,0.05,1,0,1,1),
(@FOZRUK,15244,0.05,1,0,1,1),
(@FOZRUK,9298,0.05,1,0,1,1),
(@FOZRUK,7475,0.05,1,0,1,1),
(@FOZRUK,7473,0.05,1,0,1,1),
(@FOZRUK,9907,0.05,1,0,1,1),
(@FOZRUK,9908,0.05,1,0,1,1),
(@FOZRUK,9906,0.05,1,0,1,1),
(@FOZRUK,3187,0.05,1,0,1,1),
(@FOZRUK,10604,0.05,1,0,1,1),
(@FOZRUK,9881,0.05,1,0,1,1),
(@FOZRUK,9882,0.05,1,0,1,1),
(@FOZRUK,1613,0.05,1,0,1,1),
(@FOZRUK,7910,0.05,1,0,1,1),
(@FOZRUK,12023,0.05,1,0,1,1),
(@FOZRUK,5216,0.05,1,0,1,1),
(@FOZRUK,9959,0.05,1,0,1,1),
(@FOZRUK,8385,0.05,1,0,1,1);

-- Updating Creature loot for Feeboz
DELETE FROM `creature_loot_template` WHERE `entry`=@FEEBOZ;
INSERT INTO `creature_loot_template` VALUES 
(@FEEBOZ,4306,51,1,0,1,3),
(@FEEBOZ,4539,13,1,0,1,1),
(@FEEBOZ,4338,9,1,0,1,1),
(@FEEBOZ,1708,4,1,0,1,1),
(@FEEBOZ,1710,3,1,0,1,1),
(@FEEBOZ,3827,1.2,1,0,1,1),
(@FEEBOZ,3805,0.5,1,0,1,1),
(@FEEBOZ,8748,0.5,1,0,1,1),
(@FEEBOZ,3795,0.5,1,0,1,1),
(@FEEBOZ,3797,0.5,1,0,1,1),
(@FEEBOZ,3782,0.5,1,0,1,1),
(@FEEBOZ,7492,0.5,1,0,1,1),
(@FEEBOZ,3785,0.5,1,0,1,1),
(@FEEBOZ,3780,0.5,1,0,1,1),
(@FEEBOZ,3817,0.5,1,0,1,1),
(@FEEBOZ,9891,0.5,1,0,1,1),
(@FEEBOZ,3803,0.5,1,0,1,1),
(@FEEBOZ,3784,0.5,1,0,1,1),
(@FEEBOZ,3787,0.5,1,0,1,1),
(@FEEBOZ,4636,0.5,1,0,1,1),
(@FEEBOZ,3811,0.5,1,0,1,1),
(@FEEBOZ,3807,0.5,1,0,1,1),
(@FEEBOZ,3779,0.5,1,0,1,1),
(@FEEBOZ,3778,0.5,1,0,1,1),
(@FEEBOZ,2289,0.5,1,0,1,1),
(@FEEBOZ,3781,0.5,1,0,1,1),
(@FEEBOZ,3801,0.5,1,0,1,1),
(@FEEBOZ,3783,0.5,1,0,1,1),
(@FEEBOZ,15233,0.5,1,0,1,1),
(@FEEBOZ,3786,0.5,1,0,1,1),
(@FEEBOZ,6432,0.5,1,0,1,1),
(@FEEBOZ,864,0.5,1,0,1,1),
(@FEEBOZ,3809,0.5,1,0,1,1),
(@FEEBOZ,3802,0.5,1,0,1,1),
(@FEEBOZ,3796,0.5,1,0,1,1),
(@FEEBOZ,3816,0.5,1,0,1,1),
(@FEEBOZ,4041,0.5,1,0,1,1),
(@FEEBOZ,3864,0.5,1,0,1,1),
(@FEEBOZ,6419,0.5,1,0,1,1),
(@FEEBOZ,15322,0.5,1,0,1,1),
(@FEEBOZ,15260,0.5,1,0,1,1),
(@FEEBOZ,1465,0.5,1,0,1,1),
(@FEEBOZ,4421,0.5,1,0,1,1),
(@FEEBOZ,4424,0.5,1,0,1,1),
(@FEEBOZ,3813,0.5,1,0,1,1),
(@FEEBOZ,3804,0.5,1,0,1,1),
(@FEEBOZ,3806,0.5,1,0,1,1),
(@FEEBOZ,3792,0.5,1,0,1,1),
(@FEEBOZ,3793,0.5,1,0,1,1),
(@FEEBOZ,3798,0.5,1,0,1,1),
(@FEEBOZ,7909,0.5,1,0,1,1),
(@FEEBOZ,4727,0.5,1,0,1,1),
(@FEEBOZ,6420,0.5,1,0,1,1),
(@FEEBOZ,6422,0.5,1,0,1,1),
(@FEEBOZ,7480,0.5,1,0,1,1),
(@FEEBOZ,9873,0.5,1,0,1,1),
(@FEEBOZ,3808,0.5,1,0,1,1),
(@FEEBOZ,3810,0.5,1,0,1,1),
(@FEEBOZ,3812,0.5,1,0,1,1),
(@FEEBOZ,3814,0.5,1,0,1,1),
(@FEEBOZ,8747,0.5,1,0,1,1),
(@FEEBOZ,3794,0.5,1,0,1,1),
(@FEEBOZ,8006,0.5,1,0,1,1),
(@FEEBOZ,4043,0.5,1,0,1,1),
(@FEEBOZ,4078,0.5,1,0,1,1),
(@FEEBOZ,9890,0.5,1,0,1,1),
(@FEEBOZ,12022,0.5,1,0,1,1),
(@FEEBOZ,1529,0.5,1,0,1,1),
(@FEEBOZ,9895,0.5,1,0,1,1),
(@FEEBOZ,9896,0.5,1,0,1,1),
(@FEEBOZ,9898,0.5,1,0,1,1),
(@FEEBOZ,7454,0.5,1,0,1,1),
(@FEEBOZ,15214,0.5,1,0,1,1),
(@FEEBOZ,3874,0.5,1,0,1,1),
(@FEEBOZ,7485,0.5,1,0,1,1),
(@FEEBOZ,15261,0.5,1,0,1,1),
(@FEEBOZ,9879,0.5,1,0,1,1),
(@FEEBOZ,9876,0.5,1,0,1,1),
(@FEEBOZ,7435,0.5,1,0,1,1),
(@FEEBOZ,7431,0.5,1,0,1,1),
(@FEEBOZ,1725,0.5,1,0,1,1),
(@FEEBOZ,8746,0.5,1,0,1,1),
(@FEEBOZ,9434,0.5,1,0,1,1),
(@FEEBOZ,13129,0.5,1,0,1,1),
(@FEEBOZ,9854,0.5,1,0,1,1),
(@FEEBOZ,6416,0.5,1,0,1,1),
(@FEEBOZ,4042,0.5,1,0,1,1),
(@FEEBOZ,7610,0.5,1,0,1,1),
(@FEEBOZ,7493,0.5,1,0,1,1),
(@FEEBOZ,6411,0.5,1,0,1,1),
(@FEEBOZ,6412,0.5,1,0,1,1),
(@FEEBOZ,15918,0.5,1,0,1,1),
(@FEEBOZ,1625,0.5,1,0,1,1),
(@FEEBOZ,12040,0.5,1,0,1,1),
(@FEEBOZ,6421,0.5,1,0,1,1),
(@FEEBOZ,4067,0.5,1,0,1,1),
(@FEEBOZ,4731,0.5,1,0,1,1),
(@FEEBOZ,15234,0.5,1,0,1,1),
(@FEEBOZ,21525,0.5,1,0,1,1),
(@FEEBOZ,9886,0.5,1,0,1,1),
(@FEEBOZ,9889,0.5,1,0,1,1),
(@FEEBOZ,9893,0.5,1,0,1,1),
(@FEEBOZ,4738,0.5,1,0,1,1),
(@FEEBOZ,9897,0.5,1,0,1,1),
(@FEEBOZ,9900,0.5,1,0,1,1),
(@FEEBOZ,12030,0.5,1,0,1,1),
(@FEEBOZ,7455,0.5,1,0,1,1),
(@FEEBOZ,7459,0.5,1,0,1,1),
(@FEEBOZ,1207,0.5,1,0,1,1),
(@FEEBOZ,4300,0.5,1,0,1,1),
(@FEEBOZ,4614,0.5,1,0,1,1),
(@FEEBOZ,3868,0.5,1,0,1,1),
(@FEEBOZ,3867,0.5,1,0,1,1),
(@FEEBOZ,9293,0.5,1,0,1,1),
(@FEEBOZ,7474,0.5,1,0,1,1),
(@FEEBOZ,7476,0.5,1,0,1,1),
(@FEEBOZ,7445,0.5,1,0,1,1),
(@FEEBOZ,7440,0.5,1,0,1,1),
(@FEEBOZ,9881,0.5,1,0,1,1),
(@FEEBOZ,9875,0.5,1,0,1,1),
(@FEEBOZ,11986,0.5,1,0,1,1),
(@FEEBOZ,3800,0.5,1,0,1,1);

-- Updating missing pickpocket loot temp for Feeboz
UPDATE `creature_template` SET `pickpocketloot`=@FEEBOZ WHERE `entry`=@FEEBOZ;
DELETE FROM `pickpocketing_loot_template` WHERE `entry`=@FEEBOZ;
INSERT INTO `pickpocketing_loot_template` VALUES 
(@FEEBOZ,5429,18,1,0,1,1),
(@FEEBOZ,3771,13,1,0,1,1),
(@FEEBOZ,16883,11,1,0,1,1),
(@FEEBOZ,3864,2,1,0,1,1);

-- Updating creature loot for Znort
DELETE FROM `creature_loot_template` WHERE `entry`=@ZNORT;
INSERT INTO `creature_loot_template` VALUES 
(@ZNORT,4306,51,1,0,1,3),
(@ZNORT,4539,13,1,0,1,1),
(@ZNORT,4338,9,1,0,1,1),
(@ZNORT,1708,4,1,0,1,1),
(@ZNORT,1710,3,1,0,1,1),
(@ZNORT,3827,1.2,1,0,1,1),
(@ZNORT,3805,0.5,1,0,1,1),
(@ZNORT,8748,0.5,1,0,1,1),
(@ZNORT,3795,0.5,1,0,1,1),
(@ZNORT,3797,0.5,1,0,1,1),
(@ZNORT,3782,0.5,1,0,1,1),
(@ZNORT,7492,0.5,1,0,1,1),
(@ZNORT,3785,0.5,1,0,1,1),
(@ZNORT,3780,0.5,1,0,1,1),
(@ZNORT,3817,0.5,1,0,1,1),
(@ZNORT,9891,0.5,1,0,1,1),
(@ZNORT,3803,0.5,1,0,1,1),
(@ZNORT,3784,0.5,1,0,1,1),
(@ZNORT,3787,0.5,1,0,1,1),
(@ZNORT,4636,0.5,1,0,1,1),
(@ZNORT,3811,0.5,1,0,1,1),
(@ZNORT,3807,0.5,1,0,1,1),
(@ZNORT,3779,0.5,1,0,1,1),
(@ZNORT,3778,0.5,1,0,1,1),
(@ZNORT,2289,0.5,1,0,1,1),
(@ZNORT,3781,0.5,1,0,1,1),
(@ZNORT,3801,0.5,1,0,1,1),
(@ZNORT,3783,0.5,1,0,1,1),
(@ZNORT,15233,0.5,1,0,1,1),
(@ZNORT,3786,0.5,1,0,1,1),
(@ZNORT,6432,0.5,1,0,1,1),
(@ZNORT,864,0.5,1,0,1,1),
(@ZNORT,3809,0.5,1,0,1,1),
(@ZNORT,3802,0.5,1,0,1,1),
(@ZNORT,3796,0.5,1,0,1,1),
(@ZNORT,3816,0.5,1,0,1,1),
(@ZNORT,4041,0.5,1,0,1,1),
(@ZNORT,3864,0.5,1,0,1,1),
(@ZNORT,6419,0.5,1,0,1,1),
(@ZNORT,15322,0.5,1,0,1,1),
(@ZNORT,15260,0.5,1,0,1,1),
(@ZNORT,1465,0.5,1,0,1,1),
(@ZNORT,4421,0.5,1,0,1,1),
(@ZNORT,4424,0.5,1,0,1,1),
(@ZNORT,3813,0.5,1,0,1,1),
(@ZNORT,3804,0.5,1,0,1,1),
(@ZNORT,3806,0.5,1,0,1,1),
(@ZNORT,3792,0.5,1,0,1,1),
(@ZNORT,3793,0.5,1,0,1,1),
(@ZNORT,3798,0.5,1,0,1,1),
(@ZNORT,7909,0.5,1,0,1,1),
(@ZNORT,4727,0.5,1,0,1,1),
(@ZNORT,6420,0.5,1,0,1,1),
(@ZNORT,6422,0.5,1,0,1,1),
(@ZNORT,7480,0.5,1,0,1,1),
(@ZNORT,9873,0.5,1,0,1,1),
(@ZNORT,3808,0.5,1,0,1,1),
(@ZNORT,3810,0.5,1,0,1,1),
(@ZNORT,3812,0.5,1,0,1,1),
(@ZNORT,3814,0.5,1,0,1,1),
(@ZNORT,8747,0.5,1,0,1,1),
(@ZNORT,3794,0.5,1,0,1,1),
(@ZNORT,8006,0.5,1,0,1,1),
(@ZNORT,4043,0.5,1,0,1,1),
(@ZNORT,4078,0.5,1,0,1,1),
(@ZNORT,9890,0.5,1,0,1,1),
(@ZNORT,12022,0.5,1,0,1,1),
(@ZNORT,1529,0.5,1,0,1,1),
(@ZNORT,9895,0.5,1,0,1,1),
(@ZNORT,9896,0.5,1,0,1,1),
(@ZNORT,9898,0.5,1,0,1,1),
(@ZNORT,7454,0.5,1,0,1,1),
(@ZNORT,15214,0.5,1,0,1,1),
(@ZNORT,3874,0.5,1,0,1,1),
(@ZNORT,7485,0.5,1,0,1,1),
(@ZNORT,15261,0.5,1,0,1,1),
(@ZNORT,9879,0.5,1,0,1,1),
(@ZNORT,9876,0.5,1,0,1,1),
(@ZNORT,7435,0.5,1,0,1,1),
(@ZNORT,7431,0.5,1,0,1,1),
(@ZNORT,1725,0.5,1,0,1,1),
(@ZNORT,8746,0.5,1,0,1,1),
(@ZNORT,9434,0.5,1,0,1,1),
(@ZNORT,13129,0.5,1,0,1,1),
(@ZNORT,9854,0.5,1,0,1,1),
(@ZNORT,6416,0.5,1,0,1,1),
(@ZNORT,4042,0.5,1,0,1,1),
(@ZNORT,7610,0.5,1,0,1,1),
(@ZNORT,7493,0.5,1,0,1,1),
(@ZNORT,6411,0.5,1,0,1,1),
(@ZNORT,6412,0.5,1,0,1,1),
(@ZNORT,15918,0.5,1,0,1,1),
(@ZNORT,1625,0.5,1,0,1,1),
(@ZNORT,12040,0.5,1,0,1,1),
(@ZNORT,6421,0.5,1,0,1,1),
(@ZNORT,4067,0.5,1,0,1,1),
(@ZNORT,4731,0.5,1,0,1,1),
(@ZNORT,15234,0.5,1,0,1,1),
(@ZNORT,21525,0.5,1,0,1,1),
(@ZNORT,9886,0.5,1,0,1,1),
(@ZNORT,9889,0.5,1,0,1,1),
(@ZNORT,9893,0.5,1,0,1,1),
(@ZNORT,4738,0.5,1,0,1,1),
(@ZNORT,9897,0.5,1,0,1,1),
(@ZNORT,9900,0.5,1,0,1,1),
(@ZNORT,12030,0.5,1,0,1,1),
(@ZNORT,7455,0.5,1,0,1,1),
(@ZNORT,7459,0.5,1,0,1,1),
(@ZNORT,1207,0.5,1,0,1,1),
(@ZNORT,4300,0.5,1,0,1,1),
(@ZNORT,4614,0.5,1,0,1,1),
(@ZNORT,3868,0.5,1,0,1,1),
(@ZNORT,3867,0.5,1,0,1,1),
(@ZNORT,9293,0.5,1,0,1,1),
(@ZNORT,7474,0.5,1,0,1,1),
(@ZNORT,7476,0.5,1,0,1,1),
(@ZNORT,7445,0.5,1,0,1,1),
(@ZNORT,7440,0.5,1,0,1,1),
(@ZNORT,9881,0.5,1,0,1,1),
(@ZNORT,9875,0.5,1,0,1,1),
(@ZNORT,11986,0.5,1,0,1,1),
(@ZNORT,3800,0.5,1,0,1,1);

-- Adding missing pickpocket loot template for Znort
UPDATE `creature_template` SET `pickpocketloot`=@ZNORT WHERE `entry`=@ZNORT;
DELETE FROM `pickpocketing_loot_template` WHERE `entry`=@ZNORT;
INSERT INTO `pickpocketing_loot_template` VALUES 
(@ZNORT,3771,17,1,0,1,1),
(@ZNORT,16883,17,1,0,1,1),
(@ZNORT,5429,16,1,0,1,1),
(@ZNORT,1710,16,1,0,1,1);

-- Updating creature loot for Sleeby
DELETE FROM `creature_loot_template` WHERE `entry`=@SLEEBY;
INSERT INTO `creature_loot_template` VALUES 
(@SLEEBY,4306,51,1,0,1,3),
(@SLEEBY,4539,13,1,0,1,1),
(@SLEEBY,4338,9,1,0,1,1),
(@SLEEBY,1708,4,1,0,1,1),
(@SLEEBY,1710,3,1,0,1,1),
(@SLEEBY,3827,1.2,1,0,1,1),
(@SLEEBY,3805,0.5,1,0,1,1),
(@SLEEBY,8748,0.5,1,0,1,1),
(@SLEEBY,3795,0.5,1,0,1,1),
(@SLEEBY,3797,0.5,1,0,1,1),
(@SLEEBY,3782,0.5,1,0,1,1),
(@SLEEBY,7492,0.5,1,0,1,1),
(@SLEEBY,3785,0.5,1,0,1,1),
(@SLEEBY,3780,0.5,1,0,1,1),
(@SLEEBY,3817,0.5,1,0,1,1),
(@SLEEBY,9891,0.5,1,0,1,1),
(@SLEEBY,3803,0.5,1,0,1,1),
(@SLEEBY,3784,0.5,1,0,1,1),
(@SLEEBY,3787,0.5,1,0,1,1),
(@SLEEBY,4636,0.5,1,0,1,1),
(@SLEEBY,3811,0.5,1,0,1,1),
(@SLEEBY,3807,0.5,1,0,1,1),
(@SLEEBY,3779,0.5,1,0,1,1),
(@SLEEBY,3778,0.5,1,0,1,1),
(@SLEEBY,2289,0.5,1,0,1,1),
(@SLEEBY,3781,0.5,1,0,1,1),
(@SLEEBY,3801,0.5,1,0,1,1),
(@SLEEBY,3783,0.5,1,0,1,1),
(@SLEEBY,15233,0.5,1,0,1,1),
(@SLEEBY,3786,0.5,1,0,1,1),
(@SLEEBY,6432,0.5,1,0,1,1),
(@SLEEBY,864,0.5,1,0,1,1),
(@SLEEBY,3809,0.5,1,0,1,1),
(@SLEEBY,3802,0.5,1,0,1,1),
(@SLEEBY,3796,0.5,1,0,1,1),
(@SLEEBY,3816,0.5,1,0,1,1),
(@SLEEBY,4041,0.5,1,0,1,1),
(@SLEEBY,3864,0.5,1,0,1,1),
(@SLEEBY,6419,0.5,1,0,1,1),
(@SLEEBY,15322,0.5,1,0,1,1),
(@SLEEBY,15260,0.5,1,0,1,1),
(@SLEEBY,1465,0.5,1,0,1,1),
(@SLEEBY,4421,0.5,1,0,1,1),
(@SLEEBY,4424,0.5,1,0,1,1),
(@SLEEBY,3813,0.5,1,0,1,1),
(@SLEEBY,3804,0.5,1,0,1,1),
(@SLEEBY,3806,0.5,1,0,1,1),
(@SLEEBY,3792,0.5,1,0,1,1),
(@SLEEBY,3793,0.5,1,0,1,1),
(@SLEEBY,3798,0.5,1,0,1,1),
(@SLEEBY,7909,0.5,1,0,1,1),
(@SLEEBY,4727,0.5,1,0,1,1),
(@SLEEBY,6420,0.5,1,0,1,1),
(@SLEEBY,6422,0.5,1,0,1,1),
(@SLEEBY,7480,0.5,1,0,1,1),
(@SLEEBY,9873,0.5,1,0,1,1),
(@SLEEBY,3808,0.5,1,0,1,1),
(@SLEEBY,3810,0.5,1,0,1,1),
(@SLEEBY,3812,0.5,1,0,1,1),
(@SLEEBY,3814,0.5,1,0,1,1),
(@SLEEBY,8747,0.5,1,0,1,1),
(@SLEEBY,3794,0.5,1,0,1,1),
(@SLEEBY,8006,0.5,1,0,1,1),
(@SLEEBY,4043,0.5,1,0,1,1),
(@SLEEBY,4078,0.5,1,0,1,1),
(@SLEEBY,9890,0.5,1,0,1,1),
(@SLEEBY,12022,0.5,1,0,1,1),
(@SLEEBY,1529,0.5,1,0,1,1),
(@SLEEBY,9895,0.5,1,0,1,1),
(@SLEEBY,9896,0.5,1,0,1,1),
(@SLEEBY,9898,0.5,1,0,1,1),
(@SLEEBY,7454,0.5,1,0,1,1),
(@SLEEBY,15214,0.5,1,0,1,1),
(@SLEEBY,3874,0.5,1,0,1,1),
(@SLEEBY,7485,0.5,1,0,1,1),
(@SLEEBY,15261,0.5,1,0,1,1),
(@SLEEBY,9879,0.5,1,0,1,1),
(@SLEEBY,9876,0.5,1,0,1,1),
(@SLEEBY,7435,0.5,1,0,1,1),
(@SLEEBY,7431,0.5,1,0,1,1),
(@SLEEBY,1725,0.5,1,0,1,1),
(@SLEEBY,8746,0.5,1,0,1,1),
(@SLEEBY,9434,0.5,1,0,1,1),
(@SLEEBY,13129,0.5,1,0,1,1),
(@SLEEBY,9854,0.5,1,0,1,1),
(@SLEEBY,6416,0.5,1,0,1,1),
(@SLEEBY,4042,0.5,1,0,1,1),
(@SLEEBY,7610,0.5,1,0,1,1),
(@SLEEBY,7493,0.5,1,0,1,1),
(@SLEEBY,6411,0.5,1,0,1,1),
(@SLEEBY,6412,0.5,1,0,1,1),
(@SLEEBY,15918,0.5,1,0,1,1),
(@SLEEBY,1625,0.5,1,0,1,1),
(@SLEEBY,12040,0.5,1,0,1,1),
(@SLEEBY,6421,0.5,1,0,1,1),
(@SLEEBY,4067,0.5,1,0,1,1),
(@SLEEBY,4731,0.5,1,0,1,1),
(@SLEEBY,15234,0.5,1,0,1,1),
(@SLEEBY,21525,0.5,1,0,1,1),
(@SLEEBY,9886,0.5,1,0,1,1),
(@SLEEBY,9889,0.5,1,0,1,1),
(@SLEEBY,9893,0.5,1,0,1,1),
(@SLEEBY,4738,0.5,1,0,1,1),
(@SLEEBY,9897,0.5,1,0,1,1),
(@SLEEBY,9900,0.5,1,0,1,1),
(@SLEEBY,12030,0.5,1,0,1,1),
(@SLEEBY,7455,0.5,1,0,1,1),
(@SLEEBY,7459,0.5,1,0,1,1),
(@SLEEBY,1207,0.5,1,0,1,1),
(@SLEEBY,4300,0.5,1,0,1,1),
(@SLEEBY,4614,0.5,1,0,1,1),
(@SLEEBY,3868,0.5,1,0,1,1),
(@SLEEBY,3867,0.5,1,0,1,1),
(@SLEEBY,9293,0.5,1,0,1,1),
(@SLEEBY,7474,0.5,1,0,1,1),
(@SLEEBY,7476,0.5,1,0,1,1),
(@SLEEBY,7445,0.5,1,0,1,1),
(@SLEEBY,7440,0.5,1,0,1,1),
(@SLEEBY,9881,0.5,1,0,1,1),
(@SLEEBY,9875,0.5,1,0,1,1),
(@SLEEBY,11986,0.5,1,0,1,1),
(@SLEEBY,3800,0.5,1,0,1,1);

-- Updating missing pickpocket loot for Sleeby
UPDATE `creature_template` SET `pickpocketloot`=@SLEEBY WHERE `entry`=@SLEEBY;
DELETE FROM `pickpocketing_loot_template` WHERE `entry`=@SLEEBY;
INSERT INTO `pickpocketing_loot_template` VALUES 
(@SLEEBY,16883,53,1,0,1,1),
(@SLEEBY,5429,10,1,0,1,1),
(@SLEEBY,3771,6,1,0,1,1),
(@SLEEBY,1710,5,1,0,1,1);
