
data <- read.csv("/Users/minhdaonguyen/Desktop/TAMID/SLR_coastel.csv")
aggregated_data <- aggregate(adt ~ year, data = data, FUN = mean)
model <- lm(adt ~ year, data = aggregated_data)
summary(model)

# Diagnostic Tests
# Breusch-Pagan test for heteroskedasticity
bptest(model)

# White's test for heteroskedasticity
bptest(model, studentize = FALSE)

# Breusch-Godfrey test for serial correlation of residuals
bgtest(model)


install.packages("xtable")
library(xtable)
summary_output <- summary(model)
latex_output <- xtable(summary_output)
print(latex_output, include.rownames = FALSE)
