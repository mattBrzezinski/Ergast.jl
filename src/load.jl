const ARTIFACT_TOML = Ref(joinpath(@__DIR__, "..", "Artifacts.toml"))

function download_dataset(; force=true)
    ergast_hash = artifact_hash("ergast", ARTIFACT_TOML[])
    local_filename = "ergast.zip"

    if isnothing(ergast_hash) || !artifact_exists(ergast_hash)
        ergast_hash = create_artifact() do artifact_dir
            ergast_url = "http://ergast.com/downloads/f1db_csv.zip"
            download(ergast_url, joinpath(artifact_dir, local_filename))
        end

        bind_artifact!(ARTIFACT_TOML[], "ergast", ergast_hash)
    end

    art_path = artifact_path(ergast_hash)

    # Check to see if we have unzipped the archive
    extract_files = readdir(artifact"ergast")
    filter!(f -> !endswith(f, ".zip"), extract_files)

    if isempty(extract_files) || force
        run(Cmd(["unzip", "-f", joinpath(art_path, local_filename), "-d", art_path]))
    end
end

function get_dataset(ds::Dataset)
    fn = filename(ds)
    return CSV.read(joinpath(artifact"ergast", fn), DataFrame)
end
