# Ergast.jl

Julia package for getting historical Formula 1 data from [Ergast](http://ergast.com/mrd/).

## Examples

The package currently only supports downloading the Ergast ZIP archive. Julia will save this in `~/.julia/Artifacts` on initially loading the package.

To see the available datasets,

```julia
julia> using Ergast

julia> available_datasets()
14-element Vector{DataType}:
 Circuits
 Constructors
 ConstructorResults
 ConstructorStandings
 Drivers
 DriverStandings
 LapTimes
 PitStops
 Qualifying
 Races
 Results
 Seasons
 SprintResults
 Status
```

To get a specific dataset pass the appropriate struct to `get_dataset()`

```julia
using Ergast

julia> drivers = get_dataset(Drivers())
855×9 DataFrame
 Row │ driverId  driverRef          number   code     forename   surname     dob         nationality  url
     │ Int64     String31           String3  String3  String31   String31    Date        String31     String
─────┼──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1 │        1  hamilton           44       HAM      Lewis      Hamilton    1985-01-07  British      http://en.wikipedia.org/wiki/Lew…
   2 │        2  heidfeld           \\N      HEI      Nick       Heidfeld    1977-05-10  German       http://en.wikipedia.org/wiki/Nic…
   3 │        3  rosberg            6        ROS      Nico       Rosberg     1985-06-27  German       http://en.wikipedia.org/wiki/Nic…
   4 │        4  alonso             14       ALO      Fernando   Alonso      1981-07-29  Spanish      http://en.wikipedia.org/wiki/Fer…
   5 │        5  kovalainen         \\N      KOV      Heikki     Kovalainen  1981-10-19  Finnish      http://en.wikipedia.org/wiki/Hei…
```
