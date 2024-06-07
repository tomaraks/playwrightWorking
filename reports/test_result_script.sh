#!/usr/bin/bash

###################################################################################################
#     This is extracting the values for each test suite description.                              #
#     It uses awk to print the value between two quotes.                                          #
#     The columns printed is based on the following example string:                               #
#     <testng-results ignored="0" total="23" passed="22" failed="1" skipped="0">                  #
###################################################################################################

TEST_RESULTS_LOCATION="${1:-/home/runner/work/playwrightWorking/playwrightWorking/test-results}"
TEST_RESULTS_STRING=$(cat "${TEST_RESULTS_LOCATION}/results.xml" | grep "<testsuites")
cat <<EOF | curl --data-binary @- ${PUSHGATEWAY_URL}/metrics/job/github_actions
github_actions_total_tests{commit="${GITHUB_SHA}", actor="${GITHUB_ACTOR}", branch="${GITHUB_REF}"} $(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $6 }')
github_actions_failed_tests{commit="${GITHUB_SHA}", actor="${GITHUB_ACTOR}", branch="${GITHUB_REF}"} $(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $8 }')
github_actions_skipped_tests{commit="${GITHUB_SHA}", actor="${GITHUB_ACTOR}", branch="${GITHUB_REF}"} $(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $10 }')
github_actions_errors{commit="${GITHUB_SHA}", actor="${GITHUB_ACTOR}", branch="${GITHUB_REF}"} $(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $12 }')
github_actions_time{commit="${GITHUB_SHA}", actor="${GITHUB_ACTOR}", branch="${GITHUB_REF}"} $(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $14 }')
EOF