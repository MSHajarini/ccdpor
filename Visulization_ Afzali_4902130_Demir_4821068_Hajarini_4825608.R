#ggplot efforts
setwd("D:\\Google drive\\ABM Project\\Data")

install.packages("tidyverse")
install.packages("quantreg")
install.packages("gridExtra")
install.packages("ggpubr")
library(ggpubr)
library(ggplot2)
library(cowplot)
########################################################################
##ggplots
########################################################################
#oil-demand-factor = 1
#KPIs vs. government budget
dt1_gbye <- ggplot(final_kpi_1, aes(gov.budget.factor, yearly.co2.emitted))
dt1_gbye <- dt1_gbye + labs(x = "Government budget factor", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 1")

dt1_gbce <- ggplot(final_kpi_1, aes(gov.budget.factor, cumulative.co2.emitted))
dt1_gbce <- dt1_gbce + labs(x = "Government budget factor", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 1")

dt1_gbys <- ggplot(final_kpi_1, aes(gov.budget.factor, yearly.co2.stored))
dt1_gbys <- dt1_gbys + labs(x = "Government budget factor", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 1")

dt1_gbcs <- ggplot(final_kpi_1, aes(gov.budget.factor, cumulative.co2.stored))
dt1_gbcs <- dt1_gbcs + labs(x = "Government budget factor", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 1")

dt1_gbfyj <- ggplot(final_kpi_1, aes(gov.budget.factor, first.year.joining))
dt1_gbfyj <- dt1_gbfyj + labs(x = "Government budget factor", y = "First year joining (yr) ", title = "Oil demand factor = 1")

dt1_gbdp <- ggplot(final_kpi_1, aes(gov.budget.factor, duration.of.plan))
dt1_gbdp <- dt1_gbdp + labs(x = "Government budget factor", y = "Duration of plan (yr) ", title = "Oil demand factor = 1")

dt1_gbfp <- ggplot(final_kpi_1, aes(gov.budget.factor, fixed.infrastructures))
dt1_gbfp <- dt1_gbfp + labs(x = "Government budget factor", y = "Number of fixed infrastructures ", title = "Oil demand factor = 1")

dt1_gbep <- ggplot(final_kpi_1, aes(gov.budget.factor, extensible.infrastructures))
dt1_gbep <- dt1_gbep + labs(x = "Government budget factor", y = "Number of extensible infrastructures ", title = "Oil demand factor = 1")

dt1_gbnc <- ggplot(final_kpi_1, aes(gov.budget.factor, number.of.companies.joined))
dt1_gbnc <- dt1_gbnc + labs(x = "Government budget factor", y = "Number of companies joined ", title = "Oil demand factor = 1")

#KPIs vs. Subsidy share
dt1_ssye <- ggplot(final_kpi_1, aes(subsidy.share.pora, yearly.co2.emitted))
dt1_ssye <- dt1_ssye + labs(x = "PORA subsidy share (%)", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 1")


dt1_ssce <- ggplot(final_kpi_1, aes(subsidy.share.pora, cumulative.co2.emitted))
dt1_ssce <- dt1_ssce + labs(x = "PORA subsidy share (%)", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 1")

dt1_ssys <- ggplot(final_kpi_1, aes(subsidy.share.pora, yearly.co2.stored))
dt1_ssys <- dt1_ssys + labs(x = "PORA subsidy share (%)", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 1")

dt1_sscs <- ggplot(final_kpi_1, aes(subsidy.share.pora, cumulative.co2.stored))
dt1_sscs <- dt1_sscs + labs(x = "PORA subsidy share (%)", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 1")

dt1_ssfyj <- ggplot(final_kpi_1, aes(subsidy.share.pora, first.year.joining))
dt1_ssfyj <- dt1_ssfyj + labs(x = "PORA subsidy share (%)", y = "First year joining (yr) ", title = "Oil demand factor = 1")

dt1_ssdp <- ggplot(final_kpi_1, aes(subsidy.share.pora, duration.of.plan))
dt1_ssdp <- dt1_ssdp + labs(x = "PORA subsidy share (%)", y = "Duration of plan (yr) ", title = "Oil demand factor = 1")

dt1_ssfp <- ggplot(final_kpi_1, aes(subsidy.share.pora, fixed.infrastructures))
dt1_ssfp <- dt1_ssfp + labs(x = "PORA subsidy share (%)", y = "Number of fixed infrastructures ", title = "Oil demand factor = 1")

dt1_ssep <- ggplot(final_kpi_1, aes(subsidy.share.pora, extensible.infrastructures))
dt1_ssep <- dt1_ssep + labs(x = "PORA subsidy share (%)", y = "Number of extensible infrastructures ", title = "Oil demand factor = 1")

dt1_ssnc <- ggplot(final_kpi_1, aes(subsidy.share.pora, number.of.companies.joined))
dt1_ssnc <- dt1_ssnc + labs(x = "PORA subsidy share (%)", y = "Number of companies joined ", title = "Oil demand factor = 1")

#KPIs vs. initial electricity price decrease factor 
dt1_epye <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, yearly.co2.emitted))
dt1_epye <- dt1_epye + labs(x = "Electricity price decrease factor", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 1")

dt1_epce <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, cumulative.co2.emitted))
dt1_epce <- dt1_epce + labs(x = "Electricity price decrease factor", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 1")

dt1_epys <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, yearly.co2.stored))
dt1_epys <- dt1_epys + labs(x = "Electricity price decrease factor", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 1")

dt1_epcs <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, cumulative.co2.stored))
dt1_epcs <- dt1_epcs + labs(x = "Electricity price decrease factor", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 1")

dt1_epfyj <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, first.year.joining))
dt1_epfyj <- dt1_epfyj + labs(x = "Electricity price decrease factor", y = "First year joining (yr) ", title = "Oil demand factor = 1")

dt1_epdp <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, duration.of.plan))
dt1_epdp <- dt1_epdp + labs(x = "Electricity price decrease factor", y = "Duration of plan (yr) ", title = "Oil demand factor = 1")

dt1_epsi <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, total.gov.subsidy.to.industry))
dt1_epsi <- dt1_epsi + labs(x = "Electricity price decrease factor", y = "Total government subsidy to industry (M EUR)", title = "Oil demand factor = 1")

dt1_epsp <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, total.gov.subsidy.to.pora))
dt1_epsp <- dt1_epsp + labs(x = "Electricity price decrease factor", y = "Total government subsidy to PORA (M EUR)", title = "Oil demand factor = 1")

dt1_epci <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, total.industry.cost.to.capture))
dt1_epci <- dt1_epci + labs(x = "Electricity price decrease factor", y = "Total industry cost to capture CO2 (M EUR)", title = "Oil demand factor = 1")

dt1_epfp <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, fixed.infrastructures))
dt1_epfp <- dt1_epfp + labs(x = "Electricity price decrease factor", y = "Number of fixed infrastructures ", title = "Oil demand factor = 1")

dt1_epep <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, extensible.infrastructures))
dt1_epep <- dt1_epep + labs(x = "Electricity price decrease factor", y = "Number of extensible infrastructures ", title = "Oil demand factor = 1")

dt1_epnc <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, number.of.companies.joined))
dt1_epnc <- dt1_epnc + labs(x = "Electricity price decrease factor", y = "Number of companies joined ", title = "Oil demand factor = 1")

#KPIs vs. initial Pipe opex factor 
dt1_poye <- ggplot(final_kpi_1, aes(pipe.opex.factor, yearly.co2.emitted))
dt1_poye <- dt1_poye + labs(x = "Pipe opex factor", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 1")

dt1_poce <- ggplot(final_kpi_1, aes(pipe.opex.factor, cumulative.co2.emitted))
dt1_poce <- dt1_poce + labs(x = "Pipe opex factor", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 1")

dt1_poys <- ggplot(final_kpi_1, aes(pipe.opex.factor, yearly.co2.stored))
dt1_poys <- dt1_poys + labs(x = "Pipe opex factor", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 1")

dt1_pocs <- ggplot(final_kpi_1, aes(pipe.opex.factor, cumulative.co2.stored))
dt1_pocs <- dt1_pocs + labs(x = "Pipe opex factor", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 1")

dt1_pofyj <- ggplot(final_kpi_1, aes(pipe.opex.factor, first.year.joining))
dt1_pofyj <- dt1_pofyj + labs(x = "Pipe opex factor", y = "First year joining (yr) ", title = "Oil demand factor = 1")

dt1_podp <- ggplot(final_kpi_1, aes(pipe.opex.factor, duration.of.plan))
dt1_podp <- dt1_podp + labs(x = "Pipe opex factor", y = "Duration of plan (yr) ", title = "Oil demand factor = 1")

dt1_posi <- ggplot(final_kpi_1, aes(pipe.opex.factor, total.gov.subsidy.to.industry))
dt1_posi <- dt1_posi + labs(x = "Pipe opex factor", y = "Total government subsidy to industry (M EUR)", title = "Oil demand factor = 1")

dt1_posp <- ggplot(final_kpi_1, aes(pipe.opex.factor, total.gov.subsidy.to.pora))
dt1_posp <- dt1_posp + labs(x = "Pipe opex factor", y = "Total government subsidy to PORA (M EUR)", title = "Oil demand factor = 1")

dt1_poci <- ggplot(final_kpi_1, aes(pipe.opex.factor, total.industry.cost.to.capture))
dt1_poci <- dt1_poci + labs(x = "Pipe opex factor", y = "Total industry cost to capture CO2 (M EUR)", title = "Oil demand factor = 1")

dt1_pofp <- ggplot(final_kpi_1, aes(pipe.opex.factor, fixed.infrastructures))
dt1_pofp <- dt1_pofp + labs(x = "Pipe opex factor", y = "Number of fixed infrastructures ", title = "Oil demand factor = 1")

dt1_poep <- ggplot(final_kpi_1, aes(pipe.opex.factor, extensible.infrastructures))
dt1_poep <- dt1_poep + labs(x = "Pipe opex factor", y = "Number of extensible infrastructures ", title = "Oil demand factor = 1")

dt1_ponc <- ggplot(final_kpi_1, aes(pipe.opex.factor, number.of.companies.joined))
dt1_ponc <- dt1_ponc + labs(x = "Pipe opex factor", y = "Number of companies joined ", title = "Oil demand factor = 1")
###########################################################################################
#oil-demand-factor = 0.2
#KPIs vs. government budget 
dt_gbye <- ggplot(final_kpi, aes(gov.budget.factor, yearly.co2.emitted))
dt_gbye <- dt_gbye + labs(x = "Government budget factor", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_gbce <- ggplot(final_kpi, aes(gov.budget.factor, cumulative.co2.emitted))
dt_gbce <- dt_gbce + labs(x = "Government budget factor", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 0.2")

dt_gbys <- ggplot(final_kpi, aes(gov.budget.factor, yearly.co2.stored))
dt_gbys <- dt_gbys + labs(x = "Government budget factor", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_gbcs <- ggplot(final_kpi, aes(gov.budget.factor, cumulative.co2.stored))
dt_gbcs <- dt_gbcs + labs(x = "Government budget factor", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 0.2")

dt_gbfyj <- ggplot(final_kpi, aes(gov.budget.factor, first.year.joining))
dt_gbfyj <- dt_gbfyj + labs(x = "Government budget factor", y = "First year joining (yr) ", title = "Oil demand factor = 0.2")

dt_gbdp <- ggplot(final_kpi, aes(gov.budget.factor, duration.of.plan))
dt_gbdp <- dt_gbdp + labs(x = "Government budget factor", y = "Duration of plan (yr) ", title = "Oil demand factor = 0.2")

dt_gbfp <- ggplot(final_kpi, aes(gov.budget.factor, fixed.infrastructures))
dt_gbfp <- dt_gbfp + labs(x = "Government budget factor", y = "Number of fixed infrastructures ", title = "Oil demand factor = 0.2")

dt_gbep <- ggplot(final_kpi, aes(gov.budget.factor, extensible.infrastructures))
dt_gbep <- dt_gbep + labs(x = "Government budget factor", y = "Number of extensible infrastructures ", title = "Oil demand factor = 0.2")

dt_gbnc <- ggplot(final_kpi, aes(gov.budget.factor, number.of.companies.joined))
dt_gbnc <- dt1_gbnc + labs(x = "Government budget factor", y = "Number of companies joined ", title = "Oil demand factor = 1")

#KPIs vs. Subsidy share
dt_ssye <- ggplot(final_kpi, aes(subsidy.share.pora, yearly.co2.emitted))
dt_ssye <- dt_ssye + labs(x = "PORA subsidy share (%)", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 0.2")


dt_ssce <- ggplot(final_kpi, aes(subsidy.share.pora, cumulative.co2.emitted))
dt_ssce <- dt_ssce + labs(x = "PORA subsidy share (%)", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 0.2")

dt_ssys <- ggplot(final_kpi, aes(subsidy.share.pora, yearly.co2.stored))
dt_ssys <- dt_ssys + labs(x = "PORA subsidy share (%)", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_sscs <- ggplot(final_kpi, aes(subsidy.share.pora, cumulative.co2.stored))
dt_sscs <- dt_sscs + labs(x = "PORA subsidy share (%)", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 0.2")

dt_ssfyj <- ggplot(final_kpi, aes(subsidy.share.pora, first.year.joining))
dt_ssfyj <- dt_ssfyj + labs(x = "PORA subsidy share (%)", y = "First year joining (yr) ", title = "Oil demand factor = 0.2")

dt_ssdp <- ggplot(final_kpi, aes(subsidy.share.pora, duration.of.plan))
dt_ssdp <- dt_ssdp + labs(x = "PORA subsidy share (%)", y = "Duration of plan (yr) ", title = "Oil demand factor = 0.2")

dt_ssfp <- ggplot(final_kpi, aes(subsidy.share.pora, fixed.infrastructures))
dt_ssfp <- dt_ssfp + labs(x = "PORA subsidy share (%)", y = "Number of fixed infrastructures ", title = "Oil demand factor = 0.2")

dt_ssep <- ggplot(final_kpi, aes(subsidy.share.pora, extensible.infrastructures))
dt_ssep <- dt_ssep + labs(x = "PORA subsidy share (%)", y = "Number of extensible infrastructures ", title = "Oil demand factor = 0.2")

dt_ssnc <- ggplot(final_kpi, aes(subsidy.share.pora, number.of.companies.joined))
dt_ssnc <- dt_ssnc + labs(x = "PORA subsidy share (%)", y = "Number of companies joined ", title = "Oil demand factor = 1")

#KPIs vs. initial electricity price decrease factor 
dt_epye <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, yearly.co2.emitted))
dt_epye <- dt_epye + labs(x = "Electricity price decrease factor", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_epce <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, cumulative.co2.emitted))
dt_epce <- dt_epce + labs(x = "Electricity price decrease factor", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 0.2")

dt_epys <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, yearly.co2.stored))
dt_epys <- dt_epys + labs(x = "Electricity price decrease factor", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_epcs <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, cumulative.co2.stored))
dt_epcs <- dt_epcs + labs(x = "Electricity price decrease factor", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 0.2")

dt_epfyj <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, first.year.joining))
dt_epfyj <- dt_epfyj + labs(x = "Electricity price decrease factor", y = "First year joining (yr) ", title = "Oil demand factor = 0.2")

dt_epdp <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, duration.of.plan))
dt_epdp <- dt_epdp + labs(x = "Electricity price decrease factor", y = "Duration of plan (yr) ", title = "Oil demand factor = 0.2")

dt_epsi <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, total.gov.subsidy.to.industry))
dt_epsi <- dt_epsi + labs(x = "Electricity price decrease factor", y = "Total government subsidy to industry (M EUR)", title = "Oil demand factor = 0.2")

dt_epsp <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, total.gov.subsidy.to.pora))
dt_epsp <- dt_epsp + labs(x = "Electricity price decrease factor", y = "Total government subsidy to PORA (M EUR)", title = "Oil demand factor = 0.2")

dt_epci <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, total.industry.cost.to.capture))
dt_epci <- dt_epci + labs(x = "Electricity price decrease factor", y = "Total industry cost to capture CO2 (M EUR)", title = "Oil demand factor = 0.2")

dt_epfp <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, fixed.infrastructures))
dt_epfp <- dt_epfp + labs(x = "Electricity price decrease factor", y = "Number of fixed infrastructures ", title = "Oil demand factor = 0.2")

dt_epep <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, extensible.infrastructures))
dt_epep <- dt_epep + labs(x = "Electricity price decrease factor", y = "Number of extensible infrastructures ", title = "Oil demand factor = 0.2")

dt_epnc <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, number.of.companies.joined))
dt_epnc <- dt_epnc + labs(x = "Electricity price decrease factor", y = "Number of companies joined ", title = "Oil demand factor = 1")

#KPIs vs. pipe opex factor 
dt_poye <- ggplot(final_kpi, aes(pipe.opex.factor, yearly.co2.emitted))
dt_poye <- dt_poye + labs(x = "Pipe opex factor", y = "Yearly CO2 emission (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_poce <- ggplot(final_kpi, aes(pipe.opex.factor, cumulative.co2.emitted))
dt_poce <- dt_poce + labs(x = "Pipe opex factor", y = "Cumulative CO2 emission (M ton) ", title = "Oil demand factor = 0.2")

dt_poys <- ggplot(final_kpi, aes(pipe.opex.factor, yearly.co2.stored))
dt_poys <- dt_poys + labs(x = "Pipe opex factor", y = "Yearly CO2 storage (M ton/yr) ", title = "Oil demand factor = 0.2")

dt_pocs <- ggplot(final_kpi, aes(pipe.opex.factor, cumulative.co2.stored))
dt_pocs <- dt_pocs + labs(x = "Pipe opex factor", y = "cumulative CO2 storage (M ton) ", title = "Oil demand factor = 0.2")

dt_pofyj <- ggplot(final_kpi, aes(pipe.opex.factor, first.year.joining))
dt_pofyj <- dt_pofyj + labs(x = "Pipe opex factor", y = "First year joining (yr) ", title = "Oil demand factor = 0.2")

dt_podp <- ggplot(final_kpi, aes(pipe.opex.factor, duration.of.plan))
dt_podp <- dt_podp + labs(x = "Pipe opex factor", y = "Duration of plan (yr) ", title = "Oil demand factor = 0.2")

dt_posi <- ggplot(final_kpi, aes(pipe.opex.factor, total.gov.subsidy.to.industry))
dt_posi <- dt_posi + labs(x = "Pipe opex factor", y = "Total government subsidy to industry (M EUR)", title = "Oil demand factor = 0.2")

dt_posp <- ggplot(final_kpi, aes(pipe.opex.factor, total.gov.subsidy.to.pora))
dt_posp <- dt_posp + labs(x = "Pipe opex factor", y = "Total government subsidy to PORA (M EUR)", title = "Oil demand factor = 0.2")

dt_poci <- ggplot(final_kpi, aes(pipe.opex.factor, total.industry.cost.to.capture))
dt_poci <- dt_poci + labs(x = "Pipe opex factor", y = "Total industry cost to capture CO2 (M EUR)", title = "Oil demand factor = 0.2")

dt_pofp <- ggplot(final_kpi, aes(pipe.opex.factor, fixed.infrastructures))
dt_pofp <- dt_pofp + labs(x = "Pipe opex factor", y = "Number of fixed infrastructures ", title = "Oil demand factor = 0.2")

dt_poep <- ggplot(final_kpi, aes(pipe.opex.factor, extensible.infrastructures))
dt_poep <- dt_poep + labs(x = "Pipe opex factor", y = "Number of extensible infrastructures ", title = "Oil demand factor = 0.2")

dt1_ponc <- ggplot(final_kpi_1, aes(pipe.opex.factor, number.of.companies.joined))
dt1_ponc <- dt1_ponc + labs(x = "Pipe opex factor", y = "Number of companies joined ", title = "Oil demand factor = 1")

#Input vs. number of company
dt1_gbnc <- ggplot(final_kpi_1, aes(gov.budget.factor, number.of.companies.joined))
dt1_gbnc <- dt1_gbnc + labs(x = "government budget factor", y = "Number of company joined ", title = "Oil demand factor = 1")

dt1_ssnc <- ggplot(final_kpi_1, aes(subsidy.share.pora, number.of.companies.joined))
dt1_ssnc <- dt1_ssnc + labs(x = "subsidy share pora", y = "Number of company joined ", title = "Oil demand factor = 1")

dt1_epnc <- ggplot(final_kpi_1, aes(initial.electricity.price.decrease.factor, number.of.companies.joined))
dt1_epnc <- dt1_epnc + labs(x = "electricity price decrease factor", y = "Number of company joined ", title = "Oil demand factor = 1")

dt1_ponc <- ggplot(final_kpi_1, aes(pipe.opex.factor, number.of.companies.joined))
dt1_ponc <- dt1_ponc + labs(x = "pipe opex factor", y = "Number of company joined ", title = "Oil demand factor = 1")


dt_gbnc <- ggplot(final_kpi, aes(gov.budget.factor, number.of.companies.joined))
dt_gbnc <- dt_gbnc + labs(x = "government budget factor", y = "Number of company joined ", title = "Oil demand factor = 0.2")

dt_ssnc <- ggplot(final_kpi, aes(subsidy.share.pora, number.of.companies.joined))
dt_ssnc <- dt_ssnc + labs(x = "subsidy share pora", y = "Number of company joined ", title = "Oil demand factor = 0.2")

dt_epnc <- ggplot(final_kpi, aes(initial.electricity.price.decrease.factor, number.of.companies.joined))
dt_epnc <- dt_epnc + labs(x = "electricity price decrease factor", y = "Number of company joined ", title = "Oil demand factor = 0.2")

dt_ponc <- ggplot(final_kpi, aes(pipe.opex.factor, number.of.companies.joined))
dt_ponc <- dt_ponc + labs(x = "pipe opex factor", y = "Number of company joined ", title = "Oil demand factor = 0.2")

dt_ncpo <- ggplot(final_kpi, aes(number.of.companies.joined, pipe.opex.factor))
dt_ncpo <- dt_ncop + labs(x = "Number of company", y = "Pipe opex factor ", title = "Oil demand factor = 0.2")

dt1_ncpo <- ggplot(final_kpi_1, aes(number.of.companies.joined, pipe.opex.factor))
dt1_ncpo <- dt_ncop + labs(x = "Number of company", y = "Pipe opex factor ", title = "Oil demand factor = 1")


########################################################################################
#Correlation among outputs 
########################################################################################
dto1_csnc <- ggplot(final_kpi_1,aes(number.of.companies.joined,cumulative.co2.stored)) + labs(x="Number of companies joined", y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 1")
dto_csnc <- ggplot(final_kpi,aes(number.of.companies.joined,cumulative.co2.stored)) + labs(x="Number of companies joined", y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 0.2")

dto1_ceye<- ggplot(final_kpi_1,aes(yearly.co2.emitted,cumulative.co2.emitted)) + labs(x="Yearly CO2 emission (M ton/yr)", y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 1")
dto_ceye<- ggplot(final_kpi,aes(yearly.co2.emitted,cumulative.co2.emitted)) + labs(x="Yearly CO2 emission (M ton/yr)", y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 0.2")

dto1_cssi <- ggplot(final_kpi_1,aes(total.gov.subsidy.to.industry,cumulative.co2.stored)) + labs(x="Total government subsidy to industry (M EUR)", y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 1")
dto_cssi <- ggplot(final_kpi,aes(total.gov.subsidy.to.industry,cumulative.co2.stored)) + labs(x="Total government subsidy to industry (M EUR)", y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 0.2")


dto1_ceci <- ggplot(final_kpi_1,aes(total.industry.cost.to.capture,cumulative.co2.emitted)) + labs(x="Total industry cost to capture CO2 (M EUR)", y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 1")
dto_ceci <- ggplot(final_kpi,aes(total.industry.cost.to.capture,cumulative.co2.emitted)) + labs(x="Total industry cost to capture CO2 (M EUR)", y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 0.2")

dto1_csfyj <- ggplot(final_kpi_1,aes(first.year.joining,cumulative.co2.stored)) + labs(x="First year joining (yr)", y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 1")
dto_csfyj <- ggplot(final_kpi,aes(first.year.joining,cumulative.co2.stored)) + labs(x="First year joining (yr)", y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 0.2")

dto1_ceye <- ggplot(final_kpi_1,aes(yearly.co2.emitted,cumulative.co2.emitted)) + labs(x="Yearly CO2 emission (M ton/yr)", y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 1")
dto_ceye <- ggplot(final_kpi,aes(yearly.co2.emitted,cumulative.co2.emitted)) + labs(x="Yearly CO2 emission (M ton/yr)", y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 0.2")

########################################################################################
#Visualizations
########################################################################################

DT1 <- dt1_epce + geom_point(aes(col=gov.budget.factor))
DT2 <- dt_epce + geom_point(aes(col=gov.budget.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-CumulativeEmission-scatter.png",width=15,height=8)     

DT1 <- dt1_epce + geom_boxplot(aes(group=initial.electricity.price.decrease.factor))
DT2 <- dt_epce + geom_boxplot(aes(group=initial.electricity.price.decrease.factor,col=gov.budget.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-CumulativeEmission-boxplot.png",width=15,height=8)

DT1 <- dt1_epci + geom_point(aes(col=pipe.opex.factor))
DT2 <- dt_epci + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-CostToIndustry-scatter1.png",width=15,height=8)     


#some of them grouped, maybe as a result of other correlations
DT1 <- dt1_epci + geom_boxplot(aes(group=initial.electricity.price.decrease.factor))
DT2 <- dt_epci + geom_boxplot(aes(group=initial.electricity.price.decrease.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-CostToIndustry-boxplot.png",width=15,height=8)   

DT1 <- dt1_epcs + geom_point(aes(col=gov.budget.factor))
DT2 <- dt_epcs + geom_point(aes(col=gov.budget.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-CumulativeStored-scatter2.png",width=15,height=8)     

DT1 <- dt1_epcs + geom_boxplot(aes(group=initial.electricity.price.decrease.factor))
DT2 <- dt_epcs + geom_boxplot(aes(group=initial.electricity.price.decrease.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-CumulativeStored-boxplot.png",width=15,height=8)

DT1 <- dt1_epdp + geom_point(aes(col=gov.budget.factor))
DT2 <- dt_epdp + geom_point(aes(col=gov.budget.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectrictyPrice-DurationOfPlan-scatter.png",width=15,height=8)     

duration_of_plan <- ggplot(final_kpi,aes(duration.of.plan))+labs(x="Duration of Plan (yr)",y="CumulativeProbability",title="Oil demand factor = 1")
duration_of_plan <- duration_of_plan + stat_ecdf(geom="step") + ggpubr::grids(linetype="dashed")
duration_of_plan_1 <- ggplot(final_kpi_1,aes(duration.of.plan)) + labs(x="Duration of Plan (yr)",y="Cumulative Probability", title="Oil demand factor = 1")
duration_of_plan_1 <- duration_of_plan_1 + stat_ecdf(geom="step") +  ggpubr::grids(linetype="dashed")
plot_grid(duration_of_plan_1,duration_of_plan,align="v")
ggsave("DurationOfPlan-cumulativedensity.png",width=15,height=8)     

DT1 <- dt1_epep + geom_point(aes(col=pipe.opex.factor,size=gov.budget.factor))
DT2 <- dt_epep + geom_point(aes(col=pipe.opex.factor,size=gov.budget.factor))
DT3 <- dt1_epfp + geom_point(aes(col=pipe.opex.factor,size=gov.budget.factor))
DT4 <- dt_epfp + geom_point(aes(col=pipe.opex.factor,size=gov.budget.factor))
plot_grid(DT1,DT2,DT3,DT4,align="hv",ncol=2,nrow=2)
ggsave("ElectricityPriceFixedAndExtensibles.png",width=15,height=8) 

DT1 <- dt1_epep + geom_point(aes(col=pipe.opex.factor,size=subsidy.share.pora))
DT2 <- dt_epep + geom_point(aes(col=pipe.opex.factor,size=subsidy.share.pora))
DT3 <- dt1_epfp + geom_point(aes(col=pipe.opex.factor,size=subsidy.share.pora))
DT4 <- dt_epfp + geom_point(aes(col=pipe.opex.factor,size=subsidy.share.pora))
plot_grid(DT1,DT2,DT3,DT4,align="hv",ncol=2,nrow=2)
ggsave("ElectricityPriceFixedAndExtensibles1.png",width=15,height=8) 

DT1 <- dt1_epfyj + geom_point(aes(col = pipe.opex.factor))
DT2 <- dt_epfyj + geom_point(aes(col = pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectricityPrice-FirstYear-Joined.png", width=15,height=8)

DT1 <- dt1_epsi + geom_point(aes(col=cumulative.co2.emitted))
DT2 <- dt_epsi + geom_point(aes(col=cumulative.co2.emitted))
plot_grid(DT1,DT2,align="v")
ggsave("ElectricityPrice-SubsidyToIndustry.png", width=15,height=8)


DT1 <- dt1_epsp + geom_point(aes(col=cumulative.co2.emitted))
DT2 <- dt_epsp + geom_point(aes(col=cumulative.co2.emitted))
plot_grid(DT1,DT2,align="v")
ggsave("ElectricityPrice-SubsidyToPORA.png", width=15,height=8)


#Kiana
DT1 <- dt1_epye + geom_point(aes(col=pipe.opex.factor))
DT2 <- dt_epye + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectricityPrice-YearlyEmission.png", width=15,height=8)

DT1 <- dt1_epys + geom_point(aes(col=pipe.opex.factor))
DT2 <- dt_epys + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("ElectricityPrice-YearlyStorage.png", width=15,height=8)

DT1 <- dt1_gbce + geom_point(aes(col=initial.electricity.price.decrease.factor))
DT2 <- dt_gbce + geom_point(aes(col=initial.electricity.price.decrease.factor))
plot_grid(DT1,DT2,align="v")
ggsave("GovernmentBudget-CumulativeEmission.png", width=19,height=8)

DT1 <- dt1_gbce + geom_boxplot(aes(group=gov.budget.factor))
DT2 <- dt_gbce + geom_boxplot(aes(group=gov.budget.factor))
plot_grid(DT1,DT2,align="v")
ggsave("GovernmentBudget-CumulativeEmission-boxplot.png", width=19,height=8)

DT1 <- dt1_gbcs + geom_point(aes(col=initial.electricity.price.decrease.factor))
DT2 <- dt_gbcs + geom_point(aes(col=initial.electricity.price.decrease.factor))
plot_grid(DT1,DT2,align="v")
ggsave("GovernmentBudget-CumulativeStorage-scatter.png", width=19,height=8)

DT1 <- dt1_gbfyj + geom_point(aes(col=pipe.opex.factor,size=initial.electricity.price.decrease.factor)) 
DT2 <- dt_gbfyj + geom_point(aes(col=pipe.opex.factor,size=initial.electricity.price.decrease.factor)) 
plot_grid(DT1,DT2,align="v")
ggsave("GovernmentBudget-FirstYearJoining-scatter.png", width=19,height=8)


DT1 <- dt1_gbye + geom_point(aes(col=pipe.opex.factor))
DT2 <- dt_gbye + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("GovernmentBudget-YearlyEmission-scatter.png", width=16,height=8)


DT1 <- dt1_gbys + geom_point(aes(col=pipe.opex.factor))
DT2 <- dt_gbys + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("GovernmentBudget-YearlyStorage-scatter.png", width=16,height=8)


DT1 <- dt1_poce + geom_point(aes(col=subsidy.share.pora))
DT2 <- dt_poce + geom_point(aes(col=subsidy.share.pora))
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpexFactor-CumulativeEmission-scatter1.png", width=16,height=8)

DT1 <- dt1_poce + geom_point(aes(col=number.of.companies.joined))
DT2 <- dt_poce + geom_point(aes(col=number.of.companies.joined))
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpexFactor-CumulativeEmission-scatter.png", width=16,height=8)

DT1 <- dt1_poci + geom_point(aes(col=number.of.companies.joined))
DT2 <- dt_poci + geom_point(aes(col=number.of.companies.joined))
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpexFactor-CostToIndustry-scatter.png", width=16,height=8)

DT1 <- dt1_pocs + geom_point(aes(col=number.of.companies.joined))
DT2 <- dt_pocs + geom_point(aes(col=number.of.companies.joined))
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpexFactor-CumulativeStorage-scatter.png", width=16,height=8)


DT1 <- dt1_pofyj + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_pofyj + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearJoining-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_pofyj + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_pofyj + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearJoining-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_pofyj + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_pofyj + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearJoining-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_pofyj + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_pofyj + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearJoining-Share-scatter.png",width=15,height=8)     



#dt_posi

DT1 <- dt1_posi + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posi + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyIndustry-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_posi + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posi + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyIndustry-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_posi + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posi + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyIndustry-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_posi + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posi + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyIndustry-Share-scatter.png",width=15,height=8) 


#dt_posp

DT1 <- dt1_posp + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posp + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyPora-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_posp + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posp + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyPora-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_posp + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posp + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyPora-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_posp + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_posp + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-SubsidyPora-Share-scatter.png",width=15,height=8) 


#dt_poye

DT1 <- dt1_poye + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poye + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyEmit-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_poye + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poye + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyEmit-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_poye + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poye + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyEmit-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_poye + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poye + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyEmit-Share-scatter.png",width=15,height=8)


#dt_poys
DT1 <- dt1_poys + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poys + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyStore-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_poys + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poys + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyStore-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_poys + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poys + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyStore-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_poys + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_poys + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-YearlyStore-Share-scatter.png",width=15,height=8)


#dt_ssce
DT1 <- dt1_ssce + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssce + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeEmit-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ssce + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssce + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeEmit-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_ssce + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssce + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeEmit-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_ssce + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssce + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeEmit-PipeOpex-scatter.png",width=15,height=8)

#dt1_sscsdt_sscs
DT1 <- dt1_sscs + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_sscs + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeStored-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_sscs + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_sscs + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeStored-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_sscs + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_sscs + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeStored-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_sscs + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_sscs + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-CumulativeStored-PipeOpex-scatter.png",width=15,height=8)



#dt1_ssfyj dt_ssfyj
DT1 <- dt1_ssfyj + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssfyj + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-FirstYearJoin-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ssfyj + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssfyj + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-FirstYearJoin-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_ssfyj + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssfyj + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-FirstYearJoin-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_ssfyj + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssfyj + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-FirstYearJoin-PipeOpex-scatter.png",width=15,height=8)

#dt1_ssys
#dt1_ssys
DT1 <- dt1_ssys + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssys + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-YearlyStored-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ssys + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssfys + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-YearlyStored-GovBud-scatter.png",width=15,height=8)     

DT1 <- dt1_ssys + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssys + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-YearlyStored-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_ssys + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssys + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-YearlyStored-PipeOpex-scatter.png",width=15,height=8)

#
DT1 <- dt1_gbnc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_gbnc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_gbnc + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-PipeOpex-scatter.png",width=15,height=8)  

DT1 <- dt1_gbnc + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_gbnc + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-scatter.png",width=15,height=8)


DT1 <- dt1_ssnc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ssnc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_ssnc + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-PipeOpex-scatter.png",width=15,height=8)  

DT1 <- dt1_ssnc + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-ElecPrice-scatter.png",width=15,height=8)     



DT1 <- dt1_epnc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_epnc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_epnc + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-PipeOpex-scatter.png",width=15,height=8)  

DT1 <- dt1_epnc + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-scatter.png",width=15,height=8)


DT1 <- dt1_ponc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ponc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_ponc + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_ponc + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-scatter.png",width=15,height=8)

DT1 <- dt1_ncpo + geom_boxplot(aes(group=number.of.companies.joined )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ncpo + geom_boxplot(aes(group=number.of.companies.joined)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-Boxplot.png",width=15,height=8)  

DT1 <- dt1_ponc + geom_boxplot(aes(group=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_boxplot(aes(group=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-Boxplot2.png",width=15,height=8)

#Extra on Company Number
DT1 <- dt1_gbnc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_gbnc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_gbnc + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-PipeOpex-scatter.png",width=15,height=8)  

DT1 <- dt1_gbnc + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_gbnc + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_gbnc + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("GovBudget-NumberCompany-scatter.png",width=15,height=8)


DT1 <- dt1_ssnc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ssnc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_ssnc + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-PipeOpex-scatter.png",width=15,height=8)  

DT1 <- dt1_ssnc + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ssnc + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("SubsidyShare-NumberCompany-ElecPrice-scatter.png",width=15,height=8)     



DT1 <- dt1_epnc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_epnc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_epnc + geom_point(aes(col=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-PipeOpex-scatter.png",width=15,height=8)  

DT1 <- dt1_epnc + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_epnc + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("ElecPrice-NumberCompany-scatter.png",width=15,height=8)


DT1 <- dt1_ponc + geom_point(aes(col=yearly.co2.emitted )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=yearly.co2.emitted)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-YCO2Emit-scatter.png",width=15,height=8)  

DT1 <- dt1_ponc + geom_point(aes(col=gov.budget.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=gov.budget.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-GovBud-scatter.png",width=15,height=8)    

DT1 <- dt1_ponc + geom_point(aes(col=initial.electricity.price.decrease.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=initial.electricity.price.decrease.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-ElecPrice-scatter.png",width=15,height=8)     

DT1 <- dt1_ponc + geom_point(aes(col=subsidy.share.pora )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_point(aes(col=subsidy.share.pora)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-scatter.png",width=15,height=8)

DT1 <- dt1_ncpo + geom_boxplot(aes(group=number.of.companies.joined )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ncpo + geom_boxplot(aes(group=number.of.companies.joined)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-Boxplot.png",width=15,height=8)  

DT1 <- dt1_ponc + geom_boxplot(aes(group=pipe.opex.factor )) + ggpubr::grids(linetype="dashed")
DT2 <- dt_ponc + geom_boxplot(aes(group=pipe.opex.factor)) + ggpubr::grids(linetype="dashed")
plot_grid(DT1,DT2,align="v")
ggsave("PipeOpex-NumberCompany-Boxplot2.png",width=15,height=8)

#Correlation between outputs 
DT1 <- dto1_ceci + geom_point(aes(col=total.gov.subsidy.to.industry))
DT2 <- dto_ceci + geom_point(aes(col=total.gov.subsidy.to.industry))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeEmission-CostIndustry-scatter6.png", width=16,height=8)

DT1 <- dto1_ceye + geom_point(aes(col=pipe.opex.factor))
DT2 <- dto_ceye + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeEmission-YearlyEmission-scatter.png", width=16,height=8)

DT1 <- dto1_csfyj+ geom_point(aes(col=subsidy.share.pora))
DT2 <- dto_csfyj + geom_point(aes(col=subsidy.share.pora))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeStorage-FirstYearJoining-scatter.png", width=16,height=8)

DT1 <- dto1_csnc + geom_point(aes(col=pipe.opex.factor))
DT2 <- dto_csnc + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeStorage-NumberOfCompanies-scatter.png", width=16,height=8)

DT1 <- dto1_csnc + geom_boxplot(aes(group=number.of.companies.joined))
DT2 <- dto_csnc + geom_boxplot(aes(group=number.of.companies.joined))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeStorage-NumberOfCompanies-boxplot.png", width=16,height=8)

DT1 <- dto1_cssi + geom_point(aes(col=pipe.opex.factor))
DT2 <- dto_cssi + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeStorage-TotalSubsidyToIndustry-scatter.png", width=16,height=8)

DT1 <- dto1_ceye + geom_point(aes(col=pipe.opex.factor))
DT2 <- dto_ceye + geom_point(aes(col=pipe.opex.factor))
plot_grid(DT1,DT2,align="v")
ggsave("CumulativeEmission-YearlyEmission-scatter.png", width=16,height=8)


#timeseries
dtt1 <- ggplot(time_series_1,aes(step,cumulative.co2.stored))+geom_smooth(method="auto")
dtt1 <- dtt1 + geom_point() + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 1")
dtt2 <- ggplot(time_series,aes(step,cumulative.co2.stored))+geom_smooth(method="auto")
dtt2 <- dtt2 + geom_point() + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Cumulative CO2 storage (M ton)",title="Oil demand factor = 0.2")

dtt1 <- dtt1 + facet_grid(cols=vars(time_series_1$pipe.opex.factor))
dtt2 <- dtt2 + facet_grid(cols=vars(time_series$pipe.opex.factor))
plot_grid(dtt1,dtt2,align="v")
ggsave("CumulativeStored-3.png",width=16,height=8)


dtt1 <- ggplot(time_series_1,aes(step,cumulative.co2.emitted))+geom_smooth(method="auto")
dtt1 <- dtt1 + geom_point() + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 1")
dtt2 <- ggplot(time_series,aes(step,cumulative.co2.emitted))+geom_smooth(method="auto")
dtt2 <- dtt2 + geom_point() + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Cumulative CO2 emission (M ton)",title="Oil demand factor = 0.2")

dtt1 <- dtt1 + facet_grid(cols=vars(time_series_1$pipe.opex.factor))
dtt2 <- dtt2 + facet_grid(cols=vars(time_series$pipe.opex.factor))
plot_grid(dtt1,dtt2,align="v")
ggsave("CumulativeEmitted-1.png",width=16,height=8)

dtt1 <- ggplot(time_series_1,aes(step,yearly.co2.stored))+geom_smooth(method="auto")
dtt1 <- dtt1 + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Yearly CO2 storage (M ton/yr)",title="Oil demand factor = 1")
dtt2 <- ggplot(time_series,aes(step,yearly.co2.stored))+geom_smooth(method="auto")
dtt2 <- dtt2 + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Yearly CO2 storage (M ton/yr)",title="Oil demand factor = 0.2")

dtt1 <- dtt1 + facet_grid(cols=vars(time_series_1$pipe.opex.factor))
dtt2 <- dtt2 + facet_grid(cols=vars(time_series$pipe.opex.factor))
plot_grid(dtt1,dtt2,align="v")
ggsave("YearlyStored.png",width=16,height=8)


dtt1 <- ggplot(time_series_1,aes(step,yearly.co2.emitted))+geom_smooth(method="auto")
dtt1 <- dtt1  + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Yearly CO2 emission (M ton/yr)",title="Oil demand factor = 1")
dtt2 <- ggplot(time_series,aes(step,yearly.co2.emitted))+geom_smooth(method="auto")
dtt2 <- dtt2  + ggpubr::grids(linetype="dashed")+labs(x="Time (yr)",y="Yearly CO2 emission (M ton/yr)",title="Oil demand factor = 0.2")

dtt1 <- dtt1 + facet_grid(cols=vars(time_series_1$pipe.opex.factor))
dtt2 <- dtt2 + facet_grid(cols=vars(time_series$pipe.opex.factor))
plot_grid(dtt1,dtt2,align="v")
ggsave("YearlyEmitted.png",width=16,height=8)
