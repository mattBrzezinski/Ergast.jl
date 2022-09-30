module Ergast

using Pkg.Artifacts
using CSV
using Dates
using DataFrames
using ZipFile

export load_dataset

include("types.jl")
include("load.jl")

end
