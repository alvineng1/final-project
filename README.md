# final-project
# INFO 201 Final Project

_by:
[Bryce Fukuda](https://github.com/fukudab/), [Steven Hsieh](https://github.com/hsiehsc),  [Alvine Ngouonga](https://github.com/alvineng1/), [Macey Schallert](https://github.com/macerose/)_

## Project Description
### About this dataset
The dataset we will be working with is a [suicide rate overview from 1965-2016](https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016).

The information was collected by russellyates88, and sourced by the [World Bank](http://www.worldbank.org/). The dataset is hosted on [kaggle](https://www.kaggle.com).

The dataset seems to be targeted toward anyone with an interest in global and mental health. Mental health is gaining an increase in awareness and this data set can help provide numerical evidence to support research.

1. Which countries experience the highest rates of suicide?
2. How do economic and development indicators link to suicide rates?
3. What are the sex differences when it comes to suicide rates?
4. How has suicide rates increased or decreased per generation? If there is a trend, which countries does this trend exist for?
5. Which years were suicide rates most prevalent?

### Technical Description
The data set is a `.csv` file. We will be reading it in with the `read.csv` function in R. To wrangle the data, we will filter the data set to catergorize information by country, age, weatlh of country, sex, and generation. 

Some of the libraries that we plan on using are `leaflet` and `plotly` for visualization, `shiny` will be used to create the shiny webpage, `ggplot` will also be used to graph the data. 

In this report, we anticipate to have challenges in the data wrangling, creating widgets in shiny, and sorting through errors. 