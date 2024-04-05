data <- read_csv("SLR_coastel.csv")


# Aggregate the required columns
aggregated_data <- aggregate(cbind(adt, sla, ugos, ugosa, vgos, vgosa) ~ year, data, mean)

lm_model <- lm(sla ~ year, data = aggregated_data)
summary(lm_model)

# Diagnostic plots
par(mfrow=c(1,1))
# Plot sla over year
plot(aggregated_data$year, aggregated_data$sla, 
     xlab = "Year", ylab = "SLA", 
     main = "SLA over Year", 
     pch = 19, col = "blue") 

abline(lm_model, col = "red")

legend("topleft", legend = "Regression Line", col = "red", lty = 1, cex = 0.8)

# Diagnostic plots
par(mfrow=c(2,2))
plot(lm_model, which = 1)
plot(lm_model, which = 2)
plot(lm_model, which = 3)
plot(lm_model, which = 5)




par(mfrow=c(1,1))

# Generate data for the next 100 years
new_years <- seq(max(aggregated_data$year) + 1, max(aggregated_data$year) + 100, by = 1)

# Predict SLA values for the new years
predicted_sla <- predict(lm_model, newdata = data.frame(year = new_years), interval = "prediction")

# Plot the predicted SLA values
plot(aggregated_data$year, aggregated_data$sla, 
     xlab = "Year", ylab = "SLA", 
     main = "SLA Prediction for Next 100 Years", 
     pch = 19, col = "blue") 

# Add the predicted values to the plot
lines(new_years, predicted_sla[,1], col = "red", lty = 2) # Predicted values
lines(new_years, predicted_sla[,2], col = "green", lty = 3) # Upper bound of prediction interval
lines(new_years, predicted_sla[,3], col = "green", lty = 3) # Lower bound of prediction interval

legend("topleft", legend = c("Observed Data", "Predicted Values", "Prediction Interval"), col = c("blue", "red", "green"), lty = c(1, 2, 3), cex = 0.8)

