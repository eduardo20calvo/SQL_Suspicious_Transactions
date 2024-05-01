# SQL_Suspicious_Transactions

## Overview

The purpose of this analysis is to detect any fraudulent transcations in cardholders for a bank. The first part of the analysis will focus on analyzing series of transactions over the course of a year for two cardholders. Visuals will be used to observe any consumption patterns to determine any fraudulent transactions. The second part of the analysis will involve a specific cardholder who suspects someone has used her corporate credit card with authorization. Time series analysis will be used to determine any outliers in charges to determine if indeed someone used her card for expensive restaurants.

## Data Source

The data originates from a Postgres SQL database. Six different datasets were used for this analysis. They include, respectively, cardholder names, card IDs, merchant category IDs, merchant names and transactions. Each of these datasets are related and combined with the use of foreign keys. 

## Data Exploration

The Sqlalchemy library was used to establish a connections and query data from the database in Postgres SQL to the Jupyter Notebook. The Pandas library was then used to organize the imported data into DataFrames. Last but not least, Hvplot was used to create visualizations for observing patterns of fraudulent transactions.

## Data Analysis #1

From the list of 25 cardholders, two customers whose cardholder IDs are 2 and 18, were chosen as there was suspicion of fraudulent transactions. The cardholder names, card IDs, and transactions datasets were concatenated using INNER JOINS in SQL. The queried data was then imported into a DataFrame for each cardholder. The transactions were finally, visualized into the line plots below.

![bokeh_plot](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/5d98ec3e-9d14-41f3-8a05-dacda932643e)


![bokeh_plot (1)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/5bd419d1-b189-4912-8339-b2b81f733094)

## Results #1

Based on the visualizations above, cardholder #2 had varied transactions from $1 - $20. We can conclude that no fraudulent transactions occured. However, cardholder #18's plot displayed some unusual transactions as high as $1800. This might hint some fraudulent transactions for the cardholder as the majority of his transactions fell within the same range as cardholder #2.

## Data Analysis #2

The customer in question for this part of the analysis involves an employee who believes that someone may have used her corporate card to pay for expensive meals. The same datasets from the previous analysis were used for this part. The same process of joining and importing the datasets into a DataFrame were used as well. The slight difference was that the dataset was sliced into 6 months.

## Results #2

A box plot was generated for each month to visualize the spread of transactions. They can be seen below.

![bokeh_plot (2)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/d1a02b35-44df-4e86-b835-35c6abdf6dfc)

![bokeh_plot (3)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/1de9e444-19cf-404f-ba39-36e348642288)

![bokeh_plot (4)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/bd8877b9-795e-4374-ad0e-1fe04549ad56)

![bokeh_plot (5)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/2fa26bab-ddae-419d-912e-4e332c799529)

![bokeh_plot (6)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/ad1ea8fa-8d68-4715-947d-4f9f1356a3d5)

![bokeh_plot (7)](https://github.com/eduardo20calvo/SQL_Suspicious_Transactions/assets/104874384/7c888b23-7f74-4f0c-a375-03fc460a4684)

Based on our findings, there are clearly outliers in every single month except February. These outliers suggest that someone indeed used the cardholders credit card to pay for expensive meals for those monnths. As can be seen in the February plot, the spread of the transactions is tighter from $1 to $18. 

## Conclusion

Based on the results found in the first analysis, cardholder #18 may have been a victim of fraud. Charges as high as $1800 were discovered, in relationship to the rest of the small transactions. In comparison, cardholder #2 displayed consistent transactions ranging from $1 to $18 dollars.

In the second analysis, we can conclude that the cardholder did indeed have someone use her card without authorization. Outliers were found in the spread of transactions for all months except February. This may suggest that person used the cardholder's card to pay for expensive meals without authorization.

## Suggestions

For the first analysis, transactions from a wider date range can be collected in order to confirm if any patterns of fraud are consistent for both cardholders #2 and #18. For the second analysis, receipts from those high transactions should be obtained to confirm if indeed someone used the cardholder's credit card without authorization. There can be a possibility that the cardholder may have used the card for a special work occasion, thus explaining the expensive charges.



