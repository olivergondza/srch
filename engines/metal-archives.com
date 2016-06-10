DESCRIPTION="Search Encyclopaedia Metallum: The Metal Archives"
function URL() {
    typeArg="band_name"
    case $1 in
        "-b"|"--band")
            typeArg="band_name"
            shift
        ;;
        "-g"|"--genre")
            typeArg="band_genre"
            shift
        ;;
        "-t"|"--themes")
            typeArg="band_themes"
            shift
        ;;
        "-a"|"--album")
            typeArg="album_title"
            shift
        ;;
        "-s"|"--song")
            typeArg="song_title"
            shift
        ;;
    esac

    query="$@"

    echo "http://www.metal-archives.com/search?searchString=${query}&type=${typeArg}"
}
