# US Household Income — Data Cleaning & SQL Analysis

## Overview
This project explores household income data across the United States at the county/city level. It combines two raw datasets — geographic/location data and income statistics — into a cleaned, joined dataset, then uses SQL to answer business-style questions about income distribution, geography, and area type across the US.

The goal was to practice the full analyst workflow: taking messy, real-world data, cleaning and standardizing it, joining related tables, and writing exploratory queries to surface meaningful insights.

## Dataset
- **`ushouseholdincome`** — geographic data for ~32,500 US locations (state, county, city, place, type, land/water area, coordinates)
- **`ushouseholdincome_statistics`** — income statistics (mean, median, standard deviation) linked by location ID

Source files included:
- `data/USHouseholdIncome_Original.csv` / `data/USHouseholdIncome_Statistics_Original.csv` — raw, uncleaned data
- `data/UsHouseholdIncome_Edited.csv` / `data/USHouseholdIncome_Statistics_Edited.csv` — cleaned data, ready for analysis

## Tools Used
- **SQL (MySQL)** — data cleaning and exploratory data analysis

## Data Cleaning
Before analysis, the raw data needed several fixes:
- **Standardized inconsistent text values** — the `Primary` column mixed `Place` and `place`; these were unified into a single consistent value
- **Fixed state name typos** — entries like `alabama` (lowercase) and `georia` (misspelled "Georgia") were corrected and merged into the proper state names
- **Removed duplicate/invalid records** — the cleaned dataset has ~250 fewer rows than the original after removing duplicates and bad records

## Exploratory Analysis
The SQL script (`USHouseholdIncome_Analysis.sql`) answers questions including:
- Which states have the largest land area vs. the largest water area?
- What is the average mean and median household income by state?
- How does income vary by area type (City, Town, Census Tract, CDP, etc.)?
- Which cities have the highest and lowest average household income?

## Key Insights
- **Income inequality by state**: Washington D.C., Connecticut, New Jersey, Maryland, and Massachusetts have the highest average household incomes (~$85K–$91K mean), while Puerto Rico, Mississippi, Arkansas, West Virginia, and Alabama have the lowest — Puerto Rico stands out with an average mean income of roughly $28K, far below the rest of the dataset.
- **Land vs. water area**: Texas has by far the largest total land area of any state, while Michigan — thanks to its Great Lakes coastline — has the largest total water area, ahead of even much larger states.
- **Income by area type**: Census Tracts make up the vast majority of records (~90%), but Census Designated Places (CDPs) show a notably higher median income relative to their mean compared to other area types — suggesting more income inequality within those areas (a few high earners pulling the mean down relative to the median... or up, depending on direction — worth a closer look).
- **Data quality finding**: Several locations report a median income of exactly $300,000 — this is a known Census Bureau "top-coding" artifact, where reported values are capped at a maximum threshold rather than reflecting true values. This was identified during analysis and is worth noting as a limitation when interpreting city-level extremes.

## How to Use
1. Import `data/UsHouseholdIncome_Edited.csv` and `data/USHouseholdIncome_Statistics_Edited.csv` into a MySQL database as `ushouseholdincome` and `ushouseholdincome_statistics`
2. Run `USHouseholdIncome_Analysis.sql` to reproduce the cleaning steps and exploratory queries

## Related Projects
This dataset is also explored using Excel, Tableau, and Power BI in companion projects — see [links to those repos].
