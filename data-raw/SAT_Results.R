# data source: https://catalog.data.gov/dataset/sat-results-e88d7

library(readr)
library(dplyr)

nycsat <- read_csv("data-raw/SAT_Results.csv",
                       col_types = cols('DBN' = col_character(),
                                        'SCHOOL NAME' = col_character(),
                                        'Num of SAT Test Takers' = col_integer(),
                                        'SAT Critical Reading Avg. Score' = col_integer(),
                                        'SAT Math Avg. Score' = col_integer(),
                                        'SAT Writing Avg. Score' = col_integer()))

colnames(nycsat) <- c("DBN", "SchoolName", "NumberOfTakers", "AvgReadingScore", "AvgMathScore", "AvgWritingScore")

nycsat <- nycsat %>%
              na.omit() %>%
              mutate(AvgTotalScore = (AvgReadingScore + AvgMathScore + AvgWritingScore))

save(nycsat, file = "data/nycsat.rda")
