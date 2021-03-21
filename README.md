# REST API + MATLAB + PCA analysis of a Siemens cloud based heating node
The aim of the thesis was to investigate the possibility of using the PCA method to analyze
data collected from real building automation objects with multiple inputs and multiple outputs
(MIMO). To collect the data, a computational cloud was used, which was communicated
using the REST API interface.

The examined object was the plant of a heat node. Several different studies were carried out
using PCA - cases related only to temperature data, based on the covariance matrix and data,
with different units and dimensions (temperature and pressure) were analyzed based on the
correlation matrix. The difference in the results obtained for the values ​​collected during the
summer day (high outside temperature) and winter temperature (low outside temperature) as
well as their impact on the installation and the correlation between individual variables were
also analyzed. The results showed that PCA on temperature data correctly recognizes the
relationship between variables, especially in the case of data collected during a low outside
temperature. For a day with a high outside temperature, the correlation between the variables
was not so visible, and the interpretation of the results is associated with a large knowledge of
the operation of sanitary plants. 

The results for temperature and pressure tests simultaneously
showed that in the case of pressure, when the frequency of changes during the day is small, it
is very difficult to indicate its correlation with other variables. Principal component analysis
showed at the same time that using it on the basis of the correlation matrix, it is possible to
analyze data with different units and dimensions, which in the case of more frequently
changing data (eg sun exposure, wind force) will be able to show the correct relations
between them.

The study also examined the use of PCA to detect failures in the installation. The results
showed that the principal components analysis is able to correctly indicate the unusual values
​​received from the sensors, which can be used to notify the user remotely.

Note: API requests could be wrapped in a function

