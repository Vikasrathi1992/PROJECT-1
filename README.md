# PROJECT-1
The Project is based on the analysis of credit card services which is a very important source of revenue for the bank.The bank wants to understand the demographics and other characteristics of its customers that accept a credit card offer and that do not accept a credit card.

The Purpose of the project is to build a model that will provide insight into why some bank customers accept credit card offers.

## Execution 

# Step 1
The raw data that was provided by the bank is checked using Structured Query Language (SQL) to check the data types, abnormilties in the data, Number of records, Null Values and how to handle them.
Once the data is examined it is transferred to Jupyter Lab and will be accessed further using Python as the primary language.

# Step 2
Once the data set has been loaded in the Jupyter notebook, it is again accessed for data types and other characteristics.
The data is seperated into two categories - Categorical and Numerical and based on the data types the raw data is fit in the created category.
The target variable is checked for imbalance bt using the #data.value.counts()
The categories are then checked for outliers as they no only impact the model , they are sensitive towards features engineering techniques as well.
The data is then refined to be used for modelling like dropping the columns that are not necessary for prediction by the model.
Both Categorical and Numerical Dataset is ploted to have a visiual inspection by using #distplot and #histplot.
The Categorial Data is dummified using #getdummies to be used in the model.
The Numerial Data is check for multicollinearity using the #heatmap.

# Step 3
A new table is created by adding cleaned Numerical Data and Dummified Categorical Data.
The independet and dependent vairbales are now created to be put for X-Y split tesitng

### First Model (Logistic Regression)
The train and test split results are fit in the model to get the result.
The accuracy of the model on test set is: 0.94 
The Kapa of your model is:  -0.001

### Second Model (SMOTE - Oversampling)
The target variable is oversampled to remove the imbalance and then fit in the model.
The accuracy of the logistic_regression model is: 0.83 
The kappa of the logistic regression model is: 0.66

### Third Model (resample - Undersampling)
The target variable is oversampled to remove the imbalance and then fit in the model.
The accuracy of the logistic_regression model is: 0.67 
The kappa of the logistic regression model is: 0.35 

### Fourth Model (Random Forest Classfier using SMOTE)
The train and test split results are fit in the model to get the result.
The accuracy of the logistic_regression model is: 0.93 
The kappa of the logistic regression model is: 0.86 

### Fifth Model (KNN)
The accuracy of the logistic_regression model is: 0.89 
The kappa of the logistic regression model is: 0.79 

## Conclusion
The Model with Random Forest gave the best results so it will be used in the business case to predict insight into why some bank customers accept credit card offers.

## Visualisation 
The data is loaded in Tableau to be analysed for the depedency of the columns , plotting different chart to understand and analyse the pattern.
Everything is then put in a dashboard that is to be presented for the Business case with all the appropriate details and information that can be used by user to understand the data. 
