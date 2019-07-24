# Julia Machine Learning Model Example to Production 

This repository contains code examples, text files, IJulia notebooks and other general materials related
to introducing how one can use Julia's ScikitLearn.jl module to produce a pipeline and cross-validated 
simple binary classifier model and then allow access of that model via a Web framework, 
Genie.jl. <br>


It is revealing how one might make a Machine Learning learning module available via a web interface all 
in Julia without reprogramming the learning model in another language like Java or C. <br>

The code and examples are purely for educational purposes and as a Proof of Concept (POC).<br>

Alrighty then, good luck and hope the material can be of use. <br>


## Getting Started

The code here was run in a Docker container generated from the **jupyter/datascience-notebook** docker image,
which provided a nice sandbox environment for running Julia version 1.1.0 code and Jupyter notebooks easily. <br>

You will need at least Julia version 1.1.0 to run this code and Jupyter notebook installed
to rund the notebook file. Of course, you can also strip out the code frome the notebook and
run via a *.jl* script as well. <br>

For your convenience, you can use the **.pdf** version of the notebook to access
via the Julia code without having to install Jupyter. <br>
 



### Prerequisites

You will only need access to a machines running at least Julia version 1.1.2, If you are using JuliaBox all packages and code will be setup for you. Checkout Installing section below<br>


### Installing

Please go [here](https://julialang.org/downloads) for information on downloading Julia code <br>

You may have to add the following Julia packages: Images, JLD, Statistics, ScikitLearn, and Genie <br>

Please go [here](https://JuliaBox.com) to log-on and use JuliaBox <br>

Please go [here](https://docs.docker.com/get-started/) to get Docker installed on your machine <br>

Please use (if you have Docker installed) **docker pull jupyter/datascience-notebook**. 
To pull the docker image to build the docker container. <br>

## Running the code

To test out the code as is. <br>

1. Run the ```julia_ml_2_production_model.ipynb``` notebook which will build and save 
your machine learning binary classifier model ```cancer_model_jld```

2. next from a command terminal prompt run ```$julia runtest.jl```.  This action will 
retrieve the classifier model, start the genie.jl webserver and allow you from a browser
or via `curl` commands to execute REST commands to the server.
		- for example `curl localhost:8000/sum/2/3?initial_value=10` at the command line
		will yield the value 15. This is a test to make sure all is working
		- `curl localhost:8000/predict` will actually run a test case of model prediction
		using predefined benign data set of 30 features. 

<br>

## Deployment

No deployment required either!

## Files and other code were built with and using:

* [Docker](https://docs.docker.com/get-started/) - Docker installation and documentation
* [Julia](https://julialang.org) - Julia, the high performance dynamic programming language
* **AND LOVE :-P**

## Contributing

No real contributions from you are required. Please use this as needed

## Versioning

We use [Git](http://semver.org/) for versioning.


## Authors

* **Lance Hester ** - *Initial work* - 


## License

N/A


## Acknowledgments

* Appreciate all the good folks in the following communities: Julia Computing, Docker, and Python 
for all of their hard work
* All of you for reviewing the contents of this Repo
