

#Import Results for pipe-opex-factor = 1
df_1 <- read.table("D:\\Google drive\\ABM Project\\Data\\Model V10.1-test7 experiment-table.csv", sep = ",", fill = TRUE, header = TRUE)
df_1 <- df_1[!(df_1$step == 0) ,]
final_kpi_1 <- df_1[(df_1$step == 32),]


final_kpi_1$yearly.co2.emitted <- final_kpi_1$yearly.co2.emitted / 1000000
final_kpi_1$yearly.co2.stored <- final_kpi_1$yearly.co2.stored / 1000000
final_kpi_1$cumulative.co2.stored <- final_kpi_1$cumulative.co2.stored / 1000000
final_kpi_1$cumulative.co2.emitted <- final_kpi_1$cumulative.co2.emitted / 1000000
final_kpi_1$total.gov.subsidy.to.industry <- final_kpi_1$total.gov.subsidy.to.industry / 1000000
final_kpi_1$total.gov.subsidy.to.pora <- final_kpi_1$total.gov.subsidy.to.pora / 1000000
final_kpi_1$total.industry.cost.to.capture <- final_kpi_1$total.industry.cost.to.capture / 1000000

#Import Results for pipe-opex-factor = 0.5
df <- read.table("D:\\Google drive\\ABM Project\\Data\\Model V10.1-test8 experiment-table.csv", sep = ",", fill = TRUE, header = TRUE)
df <- df[!(df$step == 0) ,]
final_kpi <- df[(df$step == 32),]


final_kpi$yearly.co2.emitted <- final_kpi$yearly.co2.emitted / 1000000
final_kpi$yearly.co2.stored <- final_kpi$yearly.co2.stored / 1000000
final_kpi$cumulative.co2.stored <- final_kpi$cumulative.co2.stored / 1000000
final_kpi$cumulative.co2.emitted <- final_kpi$cumulative.co2.emitted / 1000000
final_kpi$total.gov.subsidy.to.industry <- final_kpi$total.gov.subsidy.to.industry / 1000000
final_kpi$total.gov.subsidy.to.pora <- final_kpi$total.gov.subsidy.to.pora / 1000000
final_kpi$total.industry.cost.to.capture <- final_kpi$total.industry.cost.to.capture / 1000000

time_series_1 <- df_1[ which ( df_1$gov.budget.factor == 1 & df_1$initial.electricity.price.decrease.factor == 50 & df_1$subsidy.share.pora == 50 ),]
time_series <- df[ which ( df$gov.budget.factor == 1 & df$initial.electricity.price.decrease.factor == 50 & df$subsidy.share.pora == 50 ),]

time_series_1$yearly.co2.emitted <- time_series_1$yearly.co2.emitted / 1000000
time_series_1$yearly.co2.stored <- time_series_1$yearly.co2.stored / 1000000
time_series_1$cumulative.co2.stored <- time_series_1$cumulative.co2.stored / 1000000
time_series_1$cumulative.co2.emitted <- time_series_1$cumulative.co2.emitted / 1000000
time_series_1$total.gov.subsidy.to.industry <- time_series_1$total.gov.subsidy.to.industry / 1000000
time_series_1$total.gov.subsidy.to.pora <- time_series_1$total.gov.subsidy.to.pora / 1000000
time_series_1$total.industry.cost.to.capture <- time_series_1$total.industry.cost.to.capture / 1000000

time_series$yearly.co2.emitted <- time_series$yearly.co2.emitted / 1000000
time_series$yearly.co2.stored <- time_series$yearly.co2.stored / 1000000
time_series$cumulative.co2.stored <- time_series$cumulative.co2.stored / 1000000
time_series$cumulative.co2.emitted <- time_series$cumulative.co2.emitted / 1000000
time_series$total.gov.subsidy.to.industry <- time_series$total.gov.subsidy.to.industry / 1000000
time_series$total.gov.subsidy.to.pora <- time_series$total.gov.subsidy.to.pora / 1000000
time_series$total.industry.cost.to.capture <- time_series$total.industry.cost.to.capture / 1000000
