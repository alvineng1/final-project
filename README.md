# final-project
## Final Project for INFO 201

_by: Steven Hsieh, Bryce Fukuda, Alvine Ngouonga, Macey Schallery_

### Project Description
What is the dataset you'll be working with?  Please include background on who collected the data, where you accessed it, and any additional information we should know about how this data came to be.
Who is your target audience?  Depending on the domain of your data, there may be a variety of audiences interested in using the dataset.  You should hone in on one of these audiences.
What does your audience want to learn from your data?  Please list out at least 3 specific questions that your project will answer for your audience.

The dataset we will be working with is a [suicide rate overview from 1965-2016.](https://www.kaggle.com/russellyates88/suicide-rates-overview-1985-to-2016).

The information was collected by russellyates88, and sourced by the [World Bank](http://www.worldbank.org/). The dataset is hosted on [kaggle](https://www.kaggle.com).

### Technical Description
The data set is a `.csv` file. We will be reading it in with the `read.csv` function in R. To wrangle the data, we will filter the data set to catergorize information by country, age, weatlh of country, sex, and generation. 

Some of the libraries that we plan on using are `leaflet` and `plotly` for visualization, `shiny` will be used to create the shiny webpage, `ggplot` will also be used to graph the data. 

In this report, we anticipate to have challenges in the data wrangling in regards to the age groups, because the data sets have 