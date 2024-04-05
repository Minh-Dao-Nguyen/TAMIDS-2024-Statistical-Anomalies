data <- read_csv("SLR_econ.csv")

data$gdp_sqrt <- sqrt(data$gdp)
data$wages_sqrt <- sqrt(data$wages)

model <- lm(wages ~  adt + sla + ugos + ugosa + vgos + vgosa + year + establishments + employment, data = data)
summary(model)

model <- lm(wages_sqrt ~  adt + sla + ugos + ugosa + vgos + vgosa + year + establishments + employment, data = data)
summary(model)


model <- lm(wages_sqrt ~  sla + year + establishments + employment, data = data)
summary(model)



# Diagnostic plots
par(mfrow = c(2, 2)) 
plot(model, which = 1)
plot(model, which = 2)
plot(model, which = 3)
plot(model, which = 5)

