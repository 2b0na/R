library(survival)
library(survminer)
library(ggplot2)

data("cancer")
str(leukemia)

surv_obj <- Surv(time = leukemia$time, event = leukemia$status)

fit <- survfit(surv_obj ~ x, data = leukemia)

ggsurvplot(fit, 
           data = leukemia,
           pval = TRUE,
           risk.table = TRUE,
           legend.title = "Maintenance Therapy",
           legend.labs = c("Nonmaintained", "Maintained"),
           xlab = "Days", ylab = "Survival Probability",)