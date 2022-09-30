const ARTIFACT_TOML = Ref(joinpath(@__DIR__, "..", "Artifacts.toml"))

function download_dataset()
    ergast_hash = artifact_hash("ergast", ARTIFACT_TOML[])
    local_filename = "ergast.zip"

    if isnothing(ergast_hash) || !artifact_exists(ergast_hash)
        ergast_hash = create_artifact() do artifact_dir
            ergast_url = "http://ergast.com/downloads/f1db_csv.zip"
            download(ergast_url, joinpath(artifact_dir, local_filename))
        end

        bind_artifact!(ARTIFACT_TOML[], "ergast", ergast_hash)
    end

    return joinpath(artifact_path(ergast_hash), local_filename)
end

function load_dataset()
    ds = download_dataset()
    zf = ZipFile.Reader(ds)

    return Dict(f.name => f for f in zf.files)
end
