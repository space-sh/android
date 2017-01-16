#
# Copyright 2016 Blockie AB
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

clone os


# Disable warning about indirectly checking status code
# shellcheck disable=SC2181

#=============
# ANDROID_DEP_INSTALL
#
# Check for module dependencies
#
# Returns:
# non-zero on failure
#
#=============
ANDROID_DEP_INSTALL ()
{
    SPACE_DEP="OS_IS_INSTALLED PRINT"    # shellcheck disable=SC2034

    PRINT "Checking for module dependencies." "info"

    OS_IS_INSTALLED "tar" "tar"

    if [ "$?" -eq 0 ]; then
        PRINT "Dependencies found." "ok"
    else
        PRINT "Failed finding dependencies." "error"
        return 1
    fi
}

#=============
# ANDROID_CAMERA_LS
#
# List Android camera directory
#
# Parameters:
#   $1: directory path. Defaults to /storage/emulated/0/DCIM/Camera/
#
#=============
ANDROID_CAMERA_LS ()
{
    SPACE_SIGNATURE="[dir]"     # shellcheck disable=SC2034
    local dir="${1:-/storage/emulated/0/DCIM/Camera/}"
    shift $(( $# > 0 ? 1 : 0 ))

    ls "${dir}"
}

#=============
# ANDROID_CAMERA_TARGZ
#
# Generate a compressed tar file
# containing Android camera files
#
# Parameters:
#   $1: directory path. Defaults to /storage/emulated/0/DCIM/Camera/
#
#=============
ANDROID_CAMERA_TARGZ ()
{
    SPACE_SIGNATURE="[dir]"     # shellcheck disable=SC2034
    SPACE_DEP="PRINT"           # shellcheck disable=SC2034

    local dir="${1:-/storage/emulated/0/DCIM/Camera/}"
    shift $(( $# > 0 ? 1 : 0 ))

    if [ -t 1 ]; then
        PRINT "STDOUT is a terminal, you should redirect output to a file." "error"
        return 1
    fi

    echo "$dir" >&2
    cd "${dir}" && tar -cvz .
}

