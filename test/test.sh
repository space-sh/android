#
# Copyright 2016-2017 Blockie AB
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

_TEST_ANDROID_CAMERA_LS_WORKS()
{
    SPACE_DEP="ANDROID_CAMERA_LS PRINT"

    ANDROID_CAMERA_LS "$1" > /dev/null 2>&1
    if [ "$?" -eq 0 ]; then
        PRINT "OK" "ok"
    else
        PRINT "Failed" "error"
    fi
    exit "$?"
}

_TEST_ANDROID_CAMERA_LS_FAILS()
{
    SPACE_DEP="ANDROID_CAMERA_LS PRINT"
    ANDROID_CAMERA_LS "$1" > /dev/null 2>&1
    if [ "$?" -ne 0 ]; then
        PRINT "OK: expected failure" "ok"
        exit 0
    else
        PRINT "Failed" "error"
        exit 1
    fi
}

_TEST_ANDROID_CAMERA_TARGZ_WORKS()
{
    SPACE_DEP="ANDROID_CAMERA_TARGZ PRINT"
    ANDROID_CAMERA_TARGZ "$1" > ./test_file.tar.gz > /dev/null 2>&1
    if [ "$?" -eq 0 ]; then
        PRINT "OK" "ok"
        exit 0
    else
        PRINT "Failed" "error"
        exit 1
    fi
}

_TEST_TARGZ_FILE_EXISTS()
{
    SPACE_DEP="PRINT"

    local _expected_file_name="$1"
    local _extract_exit_code=
    if [ -f "$_expected_file_name" ]; then
        PRINT "removing"
        rm "./$_expected_file_name"
        PRINT "OK" "ok"
        exit 0
    else
        PRINT "Expected to find file $_expected_file_name " "error"
        exit 1
    fi
}

_TEST_ANDROID_CAMERA_TARGZ_TERMINAL_STDOUT()
{
    SPACE_DEP="ANDROID_CAMERA_TARGZ PRINT"
    ANDROID_CAMERA_TARGZ "$1" > /dev/null 2>&1
    if [ "$?" -ne 0 ]; then
        PRINT "OK: STDOUT is terminal failure" "ok"
        exit 0
    else
        PRINT "Failed" "error"
        exit 1
    fi
}

_TEST_TARGZ_FILE_DOES_NOT_EXIST()
{
    SPACE_DEP="PRINT"

    local _expected_file_name="$1"
    local _extract_exit_code=
    if [ ! -f "$_expected_file_name" ]; then
        PRINT "OK" "ok"
        exit 0
    else
        PRINT "Did not expect to find file $_expected_file_name " "error"
        exit 1
    fi
}
