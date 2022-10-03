"""
    download_dataset(; force=false)

Download Ergast dataset on __init__(), or if user manually calls the function passing force=true

# Keywords
- `force=false`: Force download and extract the dataset
"""
function download_dataset(; force=false)
    fname = joinpath(DOWNLOAD_CACHE[], "ergast.zip")
    url = "http://ergast.com/downloads/f1db_csv.zip"

    if !isfile(fname) || force
        download(url, fname)
    end

    # Check to see if we have unzipped the archive
    extract_files = readdir(DOWNLOAD_CACHE[])
    filter!(f -> !endswith(f, ".zip"), extract_files)

    if isempty(extract_files) || force
        run(Cmd(["unzip", fname, "-d", DOWNLOAD_CACHE[]]))
    end
end

"""
    get_dataset(ds::Dataset)

Retrieve a specific dataset

# Arguments
- `ds::Dataset`: Dataset you want to retrieve

# Returns
- `DataFrame`: Containing all the data
"""
function get_dataset(ds::Dataset)
    fn = filename(ds)
    return CSV.read(joinpath(DOWNLOAD_CACHE[], fn), DataFrame)
end
