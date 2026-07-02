# Activity 5

Download the dataset [here](https://drive.google.com/file/d/1nE1XJTUuf3IWqnjlnz7fjdfRCxdC9582/view?usp=sharing):

1. Import the "public_transport_delays.csv" dataset.
2. Create a column called `is_late`. This is a logical column where the value is `TRUE` if `actual_arrival_delay_min` at least 5 minutes. Otherwise, the value is `FALSE`. To add new columns you can use `dataset$is_late <- newcolumn`
3. Find how many rows are marked late in `is_late`.
4. Which weather condition has the largest percentage of late trips? (based on `is_late`)
5. Which weather condition has the largest mean `actual_arrival_delay_min`?
6. Export the dataframe (with the additional `is_late` column) to a file called "public_transport_delays_extended.csv"
