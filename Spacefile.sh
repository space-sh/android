clone os

ANDROID_DEP_INSTALL ()
{
    SPACE_CMDDEP="OS_IS_INSTALLED PRINT"

    PRINT "Checking for OS dependencies." "info"

    OS_IS_INSTALLED "tar" "tar"

    if [ "$?" -eq 0 ]; then
        PRINT "Dependencies found." "success"
    else
        PRINT "Failed finding dependencies." "error"
        return 1
    fi
}

ANDROID_CAMERA_LS ()
{
    SPACE_SIGNATURE="[dir]"
    local dir="${1:-/storage/emulated/0/DCIM/Camera/}"
    shift $(( $# > 0 ? 1 : 0 ))

    ls "${dir}"
}

ANDROID_CAMERA_TARGZ ()
{
    SPACE_SIGNATURE="[dir]"
    SPACE_CMDDEP="PRINT"

    local dir="${1:-/storage/emulated/0/DCIM/Camera/}"
    shift $(( $# > 0 ? 1 : 0 ))

    if [ -t 1 ]; then
        PRINT "STDOUT is a terminal, you should redirect output to a file." "error"
        return 1
    fi

    echo $dir >&2
    cd "${dir}" && tar -cvz .
}
