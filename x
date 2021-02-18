geom_segment(aes(y=0,
x = 'Date',
yend = Value,
xend = 'Time'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0) +
coord_flip()
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = TIME, y = Value, label = Value ))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = 'Date',
yend = Value,
xend = 'Time'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0) +
coord_flip()
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = TIME, y = Location, label = Location ))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = 'Date',
yend = Value,
xend = 'Time'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0) +
coord_flip()
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = 'Date',
yend = Value,
xend = 'Time'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0) +
coord_flip()
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = 'Date',
yend = Value,
xend = 'Time'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = 'Time',
yend = Value,
xend = 'Date'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "red", size = 5) +
geom_segment(aes(y=0,
x = 'Time',
yend = Value,
xend = 'Date'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = 'Time',
yend = Value,
xend = 'Date'),
color = "red")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = Value,
xend = 'Date'),
color = "red")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = Y,
xend = 'Y'),
color = "red")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = FREQUENCY,
xend = 'INDICATOR'),
color = "red")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = Value,
xend = 'Flag.Codes'),
color = "red")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = Value,
xend = 'Flag.Codes'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 1) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 10) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 10) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "black", size = 5)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(-100.0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(0, 100.0)
new_employment<- employment %>%
select(Location, TIME, Value) %>%
arrange(desc(TIME))
View(new_employment)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate 2019-2020") +
ylim(0, 100.0)
View(new_unemployment)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(0, 100.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(25, 90.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(40, 90.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(40.0, 80.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(45.0, 80.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "green", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(45.0, 80.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "red", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(45.0, 80.0)
library(ggplot2)
theme_set(theme_bw())
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(45.0, 80.0)
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
source("chart1.R")
# modified table for graphing
mod_table <- unemployment %>%
filter(o..Labor.Force.Status == "Unemployed") %>%
group_by(Race) %>%
summarize(num_unemployed = sum(Sample.Size, na.rm = T) /
total_sample_size * 100)
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
source("chart1.R")
knitr::opts_chunk$set(echo = TRUE)
library(knitr)
source("chart1.R")
knitr::opts_chunk$set(echo = FALSE, message = FALSE)
library(knitr)
library(tidyverse)
source("chart1.R")
knitr::opts_chunk$set(echo = FALSE, message = FALSE)
library(knitr)
library(tidyverse)
source("chart1.R")
knitr::opts_chunk$set(echo = FALSE, message = FALSE)
library(knitr)
library(tidyverse)
source("chart1.R")
library(lintr)
library(styler)
library(tidyverse)
library(ggplot2)
unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-
unemployment/main/Georgetown-by-race.csv")
total_sample_size <- sum(unemployment$Sample.Size)
# modified table for graphing
mod_table <- unemployment %>%
filter(o..Labor.Force.Status == "Unemployed") %>%
group_by(Race) %>%
summarize(num_unemployed = sum(Sample.Size, na.rm = T) /
total_sample_size * 100)
# graph comparing unemployment percentages by race
unemployment_by_race <- ggplot(data = mod_table) +
geom_col(mapping = aes(x = Race, y = num_unemployed, color = Race,
fill = Race), show.legend = F) +
labs(x = "Race",
y = "Percent Unemployed",
title = "Comparing Unemployment Percentages by Race in 2020") +
scale_fill_manual(values = c("#ff9f1c", "#2ec4b6", "#E65F5C", "#f88dad")) +
scale_color_manual(values = c("#ff9f1c", "#2ec4b6", "#E65F5C", "#f88dad"))
unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-
unemployment/main/Georgetown-by-race.csv")
total_sample_size <- sum(unemployment$Sample.Size)
unemployment <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-
unemployment/main/Georgetown-by-race.csv")
unemployment %>%
filter(o..Labor.Force.Status == "Unemployed") %>%
unemployment %>%
filter(o..Labor.Force.Status == "Unemployed")
unemployment_1 <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
total_sample_size <- sum(unemployment_1$Sample.Size)
mod_table <- unemployment_1 %>%
filter(o..Labor.Force.Status == "Unemployed")
View(unemployment_1)
unemployment_1 %>%
filter(X..Labor.Force.Status == "Unemployed")
mod_table <- unemployment_1 %>%
filter(X...Labor.Force.Status == "Unemployed")
Georgetown <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
View(Georgetown)
rm(Georgetown)
library(lintr)
library(tidyverse)
library(styler)
library(dplyr)
library(tidyr)
library(readr)
employment<- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/OECD_Data_EA-19_and_G-7.csv")
View(employment)
# Rename locations column in unemployment data frame
names(employment)[names(employment) == "X...LOCATION"] <- "Location"
# Filter dataset by location, time, and value
new_employment<- employment %>%
select(Location, TIME, Value) %>%
arrange(desc(TIME)) # Orders data from least recent to most recent
# Lollipop graph that shows how much fluctuation each country goes through from 2019-2021
library(ggplot2)
theme_set(theme_bw())
employment_range <- ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(45.0, 80.0)
ggplot(data = new_employment, aes(x = Location, y = Value, label = Value))+
geom_point(stat = 'identity', fill = "black", size = 5) +
geom_segment(aes(y=0,
x = '0',
yend = 0,
xend = '0'),
color = "black")+
geom_text(color = "white", size = 2)+
labs(title = "EA-19 and G-7 Employment Rate Nov 2019 to Jan 2021 ") +
ylim(45.0, 80.0)
view(incarceration_trends)
incarceration_trends <- read_csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
view(incarceration_trends)
Georgetown_by_race <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
View(Georgetown_by_race)
names(Georgetown_by_race)[names(Georgetown_by_race) == "X...Labor.Force.Status"] <- "Labor.Force.Status"
View(Georgetown_by_race)
write.table(Georgetown_by_race, file = "Georgetown-by-race.csv",
sep = ".", row.names = R)
write.table(Georgetown_by_race, file = "Georgetown-by-race.csv",
sep = ".", row.names = F)
View(Georgetown_by_race)
new_race<-read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
View(new_race)
Georgetown_by_race <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
View(Georgetown_by_race)
View(Georgetown_by_race)
Georgetown_by_race <- Georgetown_by_race %>% transmite(Labor.Force.Status = Labor.Force.Status)
Georgetown_by_race <- Georgetown_by_race %>% transmute(Labor.Force.Status = Labor.Force.Status)
rm(Georgetown_by_race)
library(readr)
Georgetown_by_race1 <- read_csv("~/Downloads/Georgetown-by-race1.csv")
View(Georgetown_by_race1)
Georgetown_by_race<- Georgetown_by_race1
View(Georgetown_by_race)
Georgetown_by_race <- Georgetown_by_race1
x<- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Georgetown-by-race.csv")
View(x)
new_x <- names(x)[names(x) == "X...Labor.Force.Status"] <- "Labor.Force.Status"
View(new_x)
names(x)[names(x) == "X...Labor.Force.Status"] <- "Labor.Force.Status"
View(x)
save.csv(x)
Georgetown_by_race <- x
rm(Georgetown_by_race1)
View(Georgetown_by_race)
save(Georgetown_by_race)\
save(Georgetown_by_race)
x<-Georgetown_by_race
View(x)
View(x)
write.csv(x, 'new_x')
write.csv(x, "new_x")
View(new_x)
View(x)
View('new_x')
rm('new_x')
rm("new_x")
rm(new_x)
library(readr)
Race_Georgetown <- read_csv("~/Downloads/Race-Georgetown.csv")
View(Race_Georgetown)
View(y)
y <- read.csv("https://raw.githubusercontent.com/info201a-w21/covid-unemployment/main/Race-Georgetown.csv")
View(y)
save(x)
write_csv(x, 'x.csv')
View(x.csv)
read.csv(x.csv)
rm(y)
write.csv(x, 'x.csv')
View(x.csv)
View(x)
savehistory(file = "x")
