#!/bin/bash

import matplotlib.pyplot as plt
import numpy as np
x = np.array([2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]) 
y1 = np.array([85.56, 93.78, 97.54, 99.62, 80.60, 100.00, 99.12, 102.56, 96.36, 92.29])#odi

y2 = np.array([42.7, 46.7, 54.7, 60.5, 54.1, 60.4, 76.2, 54.1, 62.9, 41.0])#test

y3 = np.array([117.3, 132.7, 131.8, 133.7, 157.1, 140.3, 152.6, 122.0, 147.9, 141.8])#t20i

y4 = np.array([127.5, 111.7, 138.7, 122.1, 130.8, 152.0, 122.2, 139.1, 141.5, 121.4])#ipl


plt.plot(x, y1, c='g', marker='o')
plt.plot(x, y2, c="r", marker='o')
plt.plot(x, y3, c="b", marker='o')
plt.plot(x, y4, c="hotpink", marker='o')
plt.title("Strike Rate in different years")
plt.xlabel("Year")
plt.ylabel("Strike Rate")
plt.legend(["ODI", "TEST", "T20I", "IPL"], loc ="upper left", ncol=2)
#plt.axis('square')
plt.show()

#----------------------------



y = np.array([22, 125, 90, 201])
mylabels = ["TEST", "ODI", "T20I", "IPL"]
mycolors = ["hotpink", "red","#4CAF50", "b"]
plt.title("Number of 6s in different forms of Cricket")

plt.pie(y, labels = mylabels, colors=mycolors,autopct='%1.1f%%')
plt.legend(loc="lower right")

plt.show()

#-----------------------
y = np.array([839	, 1139	, 285, 503	])
mylabels = ["TEST", "ODI", "T20I", "IPL"]
mycolors = ["hotpink", "red","#4CAF50", "b"]
plt.title("Number of 4s in different forms of Cricket")

plt.pie(y, labels = mylabels, colors=mycolors,autopct='%1.1f%%')
plt.legend(loc="lower right")

plt.show()

#-------------------------




x = np.array([ 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020]) 
y1 = [ 117, 183, 115, 139, 138, 154, 131, 160, 123, 89]#odi



y2 =[63, 116, 119, 169, 147,235, 243, 153, 254, 74]#test



y3 = [28, 78, 29, 77, 43,90, 82, 61, 94, 85]#t20i

y4 = [84, 73, 99, 73, 82,113, 64, 92,100, 90]#ipl
width=0.20

plt.title("Highest scores in different years")
plt.xlabel("Year")
plt.ylabel("Highest Score")
plt.bar(x-0.2, y1, width)
plt.bar(x, y2, width)
plt.bar(x+0.2, y3, width)
plt.bar(x+0.4, y4, width)
plt.legend(["ODI", "TEST","T20I","IPL"], loc ="upper left", ncol=2)

plt.show()

#---------------------------------



x = np.array(["TEST", "ODI", "T20I", "IPL"]) 
y = [ 91, 252, 89, 192]
plt.title("Total matches of different forms played")
plt.xlabel("Form of Match")
plt.ylabel("Total matches played")
plt.bar(x, y, color="darkblue")
plt.show()



#-------------------
import matplotlib.pyplot as plt
import numpy as np
x = np.array([230])#4
y = np.array([35])
plt.scatter(x, y,color="red",label="2011")
x = np.array([271])
y = np.array([26])
plt.scatter(x, y,color="blue",label="2012")
x = np.array([277])
y = np.array([45])
plt.scatter(x, y,color="hotpink",label="2013")
x = np.array([251])
y = np.array([49])
plt.scatter(x, y,color="green",label="2014")
x = np.array([144])
y = np.array([35])
plt.scatter(x, y,color="orange",label="2015")
x = np.array([350])
y = np.array([57])
plt.scatter(x, y,color="darkblue",label="2016")
x = np.array([289])
y = np.array([47])
plt.scatter(x, y,color="brown",label="2017")
x = np.array([327])
y = np.array([41])
plt.scatter(x, y,color="gray",label="2018")
x = np.array([286])
y = np.array([47])
plt.scatter(x, y,color="yellow",label="2019")
x = np.array([91])
y = np.array([26])
plt.scatter(x, y,color="black",label="2020")
plt.xlabel("4s")
plt.ylabel("6s")
plt.ylim([0,120])
plt.xlim([0,400])
plt.legend(loc="upper left", ncol=3,handlelength=0.1, handleheight=0.1)
plt.title("Number of 4s and 6s in different years")
plt.show()



#--------------------------







