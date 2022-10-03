const ND = Union{Nothing, Date}
const NI = Union{Nothing, Int}
const NS = Union{Nothing, String}
const NF = Union{Nothing, Float64}
const NT = Union{Nothing, Time}

abstract type Dataset end

struct Circuits <: Dataset
    circuitId::NI
    circuitRef::NS
    name::NS
    location::NS
    country::NS
    lat::NF
    lng::NF
    alt::NS
    url::NS

    function Circuits()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing,
        )
    end
end
filename(::Circuits) = "circuits.csv"

struct Constructors <: Dataset
    constructorId::NI
    constructorRef::NS
    name::NS
    nationality::NS
    url::NS

    function Constructors()
        return new(
            nothing, nothing, nothing, nothing, nothing,
        )
    end
end
filename(::Constructors) = "constructors.csv"

struct ConstructorResults <: Dataset
    constructorResultsId::NI
    raceId::NI
    constructorId::NI
    points::NF
    status::NS

    function ConstructorResults()
        return new(
            nothing, nothing, nothing, nothing, nothing,
        )
    end
end
filename(::ConstructorResults) = "constructor_results.csv"

struct ConstructorStandings <: Dataset
    constructorStandingsId::NI
    raceId::NI
    constructorId::NI
    points::NF
    position::NI
    positionText::NS
    wins::NI

    function ConstructorStandings()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing,
        )
    end
end
filename(::ConstructorStandings) = "constructor_standings.csv"

struct Drivers <: Dataset
    driverId::NI
    driverRef::NS
    number::NS
    code::NS
    forename::NS
    surname::NS
    dob::ND
    nationality::NS
    url::NS

    function Drivers()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing,
        )
    end
end
filename(::Drivers) = "drivers.csv"

struct DriverStandings <: Dataset
    driverStandingsId::NI
    raceId::NI
    driverId::NI
    points::NF
    position::NI
    positionText::NS
    wins::NI

    function DriverStandings()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing,
        )
    end
end
filename(::DriverStandings) = "driver_standings.csv"

struct LapTimes <: Dataset
    raceId::NI
    driverId::NI
    lap::NI
    position::NI
    time::NS
    milliseconds::NI

    function LapTimes()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing,
        )
    end
end
filename(::LapTimes) = "lap_times.csv"

struct PitStops <: Dataset
    raceId::NI
    driverId::NI
    stop::NI
    lap::NI
    time::NT
    duration::NS
    milliseconds::NI

    function PitStops()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing,
        )
    end
end
filename(::PitStops) = "pit_stops.csv"

struct Qualifying <: Dataset
    qualifyId::NI
    raceId::NI
    driverId::NI
    constructorId::NI
    number::NI
    position::NI
    q1::NS
    q2::NS
    q3::NS

    function Qualifying()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing,
        )
    end
end
filename(::Qualifying) = "qualifying.csv"

struct Races <: Dataset
    raceId::NI
    year::NI
    round::NI
    circuitId::NI
    name::NS
    date::ND
    time::NS
    url::NS
    fp1_date::NS
    fp1_time::NS
    fp2_date::NS
    fp2_time::NS
    fp3_date::NS
    fp3_time::NS
    quali_date::NS
    quali_time::NS
    sprint_date::NS
    sprint_time::NS

    function Races()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing,
        )
    end
end
filename(::Races) = "races.csv"

struct Results <: Dataset
    resultId::NI
    raceId::NI
    driverId::NI
    constructorId::NI
    number::NS
    grid::NI
    position::NS
    positionText::NS
    positionOrder::NI
    points::NF
    laps::NI
    time::NS
    milliseconds::NS
    fastestLap::NS
    rank::NS
    fastestLapTime::NS
    fastestLapSpeed::NS
    statusId::NI

    function Results()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing,
        )
    end
end
filename(::Results) = "results.csv"

struct Seasons <: Dataset
    year::Int
    url::String

    function Seasons()
        return new(
            nothing, nothing,
        )
    end
end
filename(::Seasons) = "seasons.csv"

struct SprintResults <: Dataset
    resultId::NI
    raceId::NI
    driverId::NI
    constructorId::NI
    number::NI
    grid::NI
    position::NS
    positionText::NS
    positionOrder::NI
    points::NI
    laps::NI
    time::NS
    milliseconds::NS
    fastestLap::NS
    fastestLapTime::NS
    statusId::NI

    function SprintResults()
        return new(
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing, nothing,
            nothing, nothing, nothing, nothing, nothing,
            nothing,
        )
    end
end
filename(::SprintResults) = "sprint_results.csv"

struct Status <: Dataset
    statusId::NI
    status::NS

    function Status()
        return new(
            nothing, nothing,
        )
    end
end
filename(::Status) = "status.csv"

"""
    available_datasets()

Get all the currently available datasets

# Returns
- `Array`: All available dataset objects
"""
available_datasets() = [
    Circuits,
    Constructors,
    ConstructorResults,
    ConstructorStandings,
    Drivers,
    DriverStandings,
    LapTimes,
    PitStops,
    Qualifying,
    Races,
    Results,
    Seasons,
    SprintResults,
    Status,
]
