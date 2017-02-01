library(dplyr)
library(reshape2)

# Data Import
setwd("~/Desktop")

# Composite leading indicator (CLI)
# source: https://data.oecd.org/leadind/composite-leading-indicator-cli.htm
e = read.csv("DP_LIVE_01022017183601472.csv", stringsAsFactors = F)

# O R 
# Unemployment Rate
# source: https://data.oecd.org/unemp/unemployment-rate.htm
e = read.csv("DP_LIVE_01022017223442813.csv", stringsAsFactors = F)

# cleanup 
e$country = e$X...LOCATION
e$INDICATOR = NULL
e$SUBJECT = NULL
e$value = e$Value
e$Value = NULL
e$Flag.Codes = NULL
e$month = e$TIME
e$TIME = NULL
e$FREQUENCY = NULL
e$X...LOCATION = NULL
e$MEASURE = NULL

# long to wide
f = dcast(e, month ~ country)

# add index
f$id = seq.int(nrow(f))

# extract year
f$year = substring(f$month,1,4)

# get rid of NAs
f[is.na(f)] = 0

# write csv
write.csv(f, "oecd_unemployment_quarter_wide.csv")

# wide to long
g = melt(f, id.vars = c("id", "year", "month"))
write.csv(g, "oecd_unemployment_monthly_long.csv")

