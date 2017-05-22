simpleviz <- function() {
  viz <- ggplot2::ggplot(nycsat, aes(x = AvgReadingScore, y = AvgMathScore)) + geom_point()
  return(viz)
}
