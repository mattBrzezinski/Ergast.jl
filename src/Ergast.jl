module Ergast

using CSV
using Dates
using DataFrames
using Pkg.Artifacts

export Circuits, Constructors, ConstructorResults, ConstructorStandings
export Drivers, DriverStandings, LapTimes, PitStops, Qualifying
export Races, Results, Seasons, SprintResults, Status

export available_datasets, get_dataset

include("types.jl")
include("load.jl")

function __init__()
    download_dataset()
end

end
