library(readxl)
library(PerformanceAnalytics)
library(car)

nsc2 <- read_excel("C:/Users/이보나/Downloads/NSC2_G1E_0208_part.xlsx")

lm_nsc2 <- lm(G1E_FBS ~ HGHT+WGHT+BMI+G1E_BP_SYS+G1E_BP_DIA+G1E_HGB+G1E_TOT_CHOL, data=nsc2)
summary(lm_nsc2)

vif(lm_nsc2)

nsc2_visual <-data.frame(cbind(nsc2$G1E_FBS, nsc2$HGHT, nsc2$WGHT, nsc2$BMI, nsc2$G1E_BP_SYS, nsc2$G1E_BP_DIA, nsc2$G1E_HGB, nsc2$G1E_TOT_CHOL))
colnames(nsc2_visual)<- c("G1E_FBS", "HGHT", "WGHT", "BMI", "G1E_BP_SYS", "G1E_BP_DIA", "G1E_HGB", "G1E_TOT_CHOL")
chart.Correlation(data.frame(nsc2_visual))

