module Ergast

using CSV
using Dates
using DataFrames
using Scratch

export Circuits, Constructors, ConstructorResults, ConstructorStandings
export Drivers, DriverStandings, LapTimes, PitStops, Qualifying
export Races, Results, Seasons, SprintResults, Status

export available_datasets, download_dataset, get_dataset

include("types.jl")
include("load.jl")

const DOWNLOAD_CACHE = Ref("")

function __init__()
    DOWNLOAD_CACHE[] = @get_scratch!("ergast")
    download_dataset()
end

end
