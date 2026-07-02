# Importing Packages

Packages are collections of libraries that contain helpful code that you can use for your own projects.
It can contain helper functions, new classes, and more.
Some of these packages come preloaded in R while some of them must be manually loaded.
For example the `class` package, which contains basic classification models do not come preloaded in R.
To load packages like these, you need to use the `library` function.

```r
> library(class)
```

To view all of the installed packages in your system you can use the following function:

```r
> installed.packages()
           Package      LibPath              Version   Priority     
base       "base"       "/usr/lib/R/library" "4.6.1"   "base"       
boot       "boot"       "/usr/lib/R/library" "1.3-32"  "recommended"
class      "class"      "/usr/lib/R/library" "7.3-23"  "recommended"
cluster    "cluster"    "/usr/lib/R/library" "2.1.8.2" "recommended"
codetools  "codetools"  "/usr/lib/R/library" "0.2-20"  "recommended"
compiler   "compiler"   "/usr/lib/R/library" "4.6.1"   "base"       
...
```

If you want to use external packages that are available in repositories like [CRAN](https://cran.r-project.org/web/packages/available_packages_by_date.html) you can use the following function:

```r
> install.packages("ggplot2")
```

You only need to install a package once, but you need to import packages anytime you need them.
To remove uninstall packages in your system you can use the following function:

```r
> remove.packages("ggplot2")
```

## Some helpful external packages for data science

- [dbi](https://dbi.r-dbi.org/) - connects R with your various database management systems
- [tidyverse](https://tidyverse.org/packages/) - includes a collection of packages for data science, including visualization (ggplot2), data manipulation (dplyr), data cleaning (tidyr) and more.
- [rmarkdown](https://rmarkdown.rstudio.com/index.html) - create notebooks that combine markdown with R code

# Importing data

To import actual datasets in R, you can use the function below.
This will store the contents the csv into a dataframe.

```r
> dataset <- read.csv("path_to_file.csv")
```

To export a dataframe into an external csv file you can use the following:

```r
write.csv(dataset, "backup.csv", row.names = FALSE)
```
