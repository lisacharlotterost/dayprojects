

# IMPORT STUFF
# ------------

from bs4 import BeautifulSoup
import urllib
import csv
import regex
import lxml



# FETCH ALL URLS
# --------------

# write an empty csv so that I have a file to later put
# all the fetched links in from which I want data
urllist_txt = open("urllist.txt", "w")

# open and read the URL from which I want to fetch links
a = urllib.urlopen('http://www.trendlist.org/trends/stars').read()
soup = BeautifulSoup(a,"lxml")

# find all links in the URL and write them in a dictionary
for awesome in soup.find_all('a'):
	urls = awesome.get('href')
	# if the link refers to a site with treds, write them in the prepared CSV
	if urls.startswith( 'http://www.trendlist.org/trends/' ):
		urllist_txt.write(urls + '\n')
urllist_txt.close()




# GO THROUGH ALL URLS AND GET THE DATA
# ------------------------------------

# write an empty csv for the data from the links
finaltable = csv.writer(open("trendlist_trends.csv", "w"))

# write the header of the csv
finaltable.writerow(["url", "year", "percentage"])

# go through every line of the link list
with open('urllist.txt') as input:
    for line in input:
		# read and open every link and for each link, find the "grafline" div
		r = urllib.urlopen(line).read()
		soup = BeautifulSoup(r,"lxml")
		graphs = soup.find_all('div', {'class':'grafline'})
		for yeah in graphs:
			# find the year
			year = yeah.find('div', {'class':'grafyear'}).getText()
			# find the complete attributes line of the class
			percentage_div = yeah.find('div',{'class':'grafbar'}).attrs
			# remove all the text of the attributes line, so that the percentage remains
		  	percentage_number = regex.sub('\D', '', str(percentage_div))
			# print in the terminal (to check, can be removed)
			print "year:",year
			print 'percentage:',percentage_number
			# write the CSV
			finaltable.writerow((line.encode('utf-8'),year.encode('utf-8'), percentage_number.encode('utf-8'))) # Write column headers as the first line
