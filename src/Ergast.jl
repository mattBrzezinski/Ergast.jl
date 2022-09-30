module Ergast

using Pkg.Artifacts

const ARTIFACT_TOML = joinpath(@__DIR__, "..", "..", "Artifacts.toml")

function build()
    ergast_hash = artifact_hash("ergast", ARTIFACT_TOML)

    if isnothing(ergast_hash) || !artifact_exists(ergast_hash)
        ergast_hash = create_artifact() do
            ergast_url = "http://ergast.com/downloads/f1db_csv.zip"
            download(ergast_url)
        end

        bind_artifact!(ARTIFACT_TOML, "ergast", ergast_hash)
    end

    return artifact_path(ergast_hash)
end

end