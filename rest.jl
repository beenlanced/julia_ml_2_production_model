using Genie
import Genie.Router: route
import Genie.Router: @params
import Genie.Renderer: json

import Base.convert


using Images
using JLD
using PyCall
using PyCallJLD
using PyPlot
using Statistics

using ScikitLearn 
using ScikitLearn.CrossValidation: cross_val_score
using ScikitLearn.GridSearch: GridSearchCV
using ScikitLearn.Pipelines: Pipeline, FeatureUnion, make_pipeline



@sk_import datasets: load_breast_cancer
@sk_import decomposition: PCA
@sk_import ensemble: RandomForestClassifier
@sk_import feature_selection: SelectPercentile
@sk_import metrics: f1_score
@sk_import metrics: make_scorer
@sk_import preprocessing: PolynomialFeatures
@sk_import preprocessing: MinMaxScaler




function makePrediction()
    benign =[16.02    
              23.24    
             102.7     
             797.8     
               0.08206 
               0.06669 
               0.03299 
               0.03323 
               0.1528  
               0.05697 
               0.3795  
               1.187   
               2.466   
              40.51    
               0.004029
                0.009269
                0.01101 
                0.007591
                0.0146  
                0.003042
               19.19    
               33.88    
              123.8     
             1150.0     
                0.1181  
                0.1551  
                0.1459  
                0.09975 
                0.2948  
                0.08452]
    
    model = JLD.load("cancer_model.jld", "model") 
    return predict(model,[benign])[1]
    
end


Genie.config.run_as_server = true




route("/hello") do
   "Hello There \n"
    
end

route("/sum/:x::Int/:y::Int") do
         @params(:x) + @params(:y) + parse(Int, get(@params, :initial_value, "0"))
end

convert(::Type{Int}, s::SubString{String}) = parse(Int, s)



route("/predict") do
         makePrediction()== 0 ? "The prediction was benign(good) \n" : "The prediction was malignant(bad)\n"      
end

Genie.startup()

