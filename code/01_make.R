library(diffloop)
library(dplyr)

# Import and collate... takes 2-3 minutes
loops <- loopsMake.mango("../data/mango_hichipper/", mergegap = 0)
loops <- addchr(loops)
loops <- mangoCorrection(loops)

# See loops object as a consistent data frame
ldf <- summary(loops)
head(ldf)

# Can subset loops directly
loops2 <- subsetLoops(loops, rowSums(loops@counts) >= 10)

# Do a basic correlation
cor(loops@counts, method = "spearman") %>% round(3)
cor(loops2@counts, method = "spearman") %>% round(3) # turns out the subsetting some really helps... gets to correlations > 0.8 on raw counts. 