getwd()

library(XLConnect)
lstock <- readWorksheetFromFile("/Users/dgohil/Dropbox (NRT Kenya)/Social CoMMS/social_comms_pilot_2014/Data Cleaning/Combined Clean Files/pilot_clean_perceptions.xlsx", sheet=1)

# no of incursions
library(plyr)
levels(as.factor(lstock$Conservancy))
lstock$Conservancy <- revalue(lstock$Conservancy, c("Nakuprat Gotu"="nakuprat_gotu"))
list2env(split(lstock, lstock$Conservancy),env=.GlobalEnv)

r1 <- Melako[c("Does.Community.have.a.Grazing.Plan.",
            "Grazing.Plan.Helpful.",
            "Quality.of.Grazing.Lands.",
            "Have.there.been.Livestock.Incurrsions.during.the.WET.season.",
            "Have.there.been.Livestock.Incurrsions.during.the.DRY.season.",
            "Number.of.Livestock.incursions.in.WET.Season",
            "Number.of.Livestock.incursions.in.DRY.Season",
            "Total.Animals.in.incursion.during.WET.Season",
            "Total.Animals.in.incursion.during.DRY.Season",
            "Was.Permission.Granted...WET.Season",
            "Was.Permission.Granted...DRY.Season",
            "Conservancy", "HHSurveyID")]

colnames(r1) <- c("gp","help","quality","inc_wet","inc_dry","no_wet","no_dry","tot_wet","tot_dry",
                  "per_wet","per_dry", "ccy","id")

str(r1)
levels(as.factor(r1$per_wet))
r1$inc_wet <- factor(r1$inc_wet, levels=c(1,2,98),
                     labels=c("no","yes","dont_know"))
r1$inc_dry <- factor(r1$inc_dry, levels=c(1,2,98),
                     labels=c("no","yes","dont_know"))
r1$per_wet <- factor(r1$per_wet, levels=c(1,2,3,98),
                     labels=c("no","yes","sometimes","dont_know"))
r1$per_dry <- factor(r1$per_dry, levels=c(1,2,3,98),
                     labels=c("no","yes","sometimes","dont_know"))
r1$no_wet <- as.numeric(r1$no_wet)
r1$no_dry <- as.numeric(r1$no_dry)
r1$tot_wet <- as.numeric(r1$tot_wet)
r1$tot_dry <- as.numeric(r1$tot_dry)


summary(r1)


