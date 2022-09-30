abstract type Dataset end

struct Circuits <: Dataset
    circuitId::Int
    circuitRef::String
    name::String
    location::String
    country::String
    lat::Float64
    lng::Float64
    alt::String
    url::String
end
filename(::Circuits) = "circuits.csv"

struct Constructors <: Dataset
    constructorId::Int
    constructorRef::String
    name::String
    nationality::String
    url::String
end
filename(::Constructors) = "constructors.csv"

struct ConstructorResults <: Dataset
    constructoResultsId::Int
    raceId::Int
    constructorId::Int
    points::Float64
    status::String
end
filename(::ConstructorResults) = "constructor_results.csv"

struct ConstructorStandings <: Dataset
    constructorStandingsId::Int
    raceId::Int
    constructorId::Int
    points::Float64
    position::Int
    positionText::String
    wins::Int
end
filename(::ConstructorStandings) = "constructor_standings.csv"

struct Drivers <: Dataset
    driverId::Int
    driverRef::String
    number::String
    code::String
    forename::String
    surname::String
    dob::Date
    nationality::String
    url::String
end
filename(::Drivers) = "drivers.csv"

struct DriverStandings <: Dataset
    driverStandingsId::Int
    raceId::Int
    driverId::Int
    points::Float64
    position::Int
    positionText::String
    wins::Int
end
filename(::DriverStandings) = "driver_standings.csv"

struct LapTimes <: Dataset
    raceId::Int
    driverId::Int
    lap::Int
    position::Int
    time::String
    milliseconds::Int
end
filename(::LapTimes) = "lap_times.csv"

struct PitStops <: Dataset
    raceId::Int
    driverId::Int
    stop::Int
    lap::Int
    time::Time
    duration::String
    milliseconds::Int
end
filename(::PitStops) = "pit_stops.csv"

struct Qualifying <: Dataset
    qualifyId::Int
    raceId::Int
    driverId::Int
    constructorId::Int
    number::Int
    position::Int
    q1::String
    q2::String
    q3::String
end
filename(::Qualifying) = "qualifying.csv"

struct Races <: Dataset
    raceId::Int
    year::Int
    round::Int
    circuitId::Int
    name::String
    date::Date
    time::String
    url::String
    fp1_date::String
    fp1_time::String
    fp2_date::String
    fp2_time::String
    fp3_date::String
    fp3_time::String
    quali_date::String
    quali_time::String
    sprint_date::String
    sprint_time::String
end
filename(::Races) = "races.csv"

struct Results <: Dataset
    resultId::Int
    raceId::Int
    driverId::Int
    constructorId::Int
    number::String
    grid::Int
    position::String
    positionText::String
    positionOrder::Int
    points::Float64
    laps::Int
    time::String
    milliseconds::String
    fastestLap::String
    rank::String
    fastestLapTime::String
    fastestLapSpeed::String
    statusId::Int
end
filename(::Results) = "results.csv"

struct Seasons <: Dataset
    year::Int
    url::String
end
filename(::Seasons) = "seasons.csv"

struct SprintResults <: Dataset
    resultId::Int
    raceId::Int
    driverId::Int
    constructorId::Int
    number::Int
    grid::Int
    position::String
    positionText::String
    positionOrder::Int
    points::Int
    laps::Int
    time::String
    milliseconds::String
    fastestLap::String
    fastestLapTime::String
    statusId::Int
end
filename(::SprintResults) = "sprint_results.csv"

struct Status <: Dataset
    statusId::Int
    status::String
end
filename(::Status) = "status.csv"
