#!/usr/bin/bash

###################################################################################################
#     This is extracting the values for each test suite description.                              #
#     It uses awk to print the value between two quotes.                                          #
#     The columns printed is based on the following example string:                               #
#     <testng-results ignored="0" total="23" passed="22" failed="1" skipped="0">                  #
###################################################################################################

TEST_RESULTS_LOCATION="${1:-/home/runner/work/playwrightWorking/playwrightWorking/test-results}"
TEST_RESULTS_STRING=$(cat "${TEST_RESULTS_LOCATION}/results.xml" | grep "<testsuites")
echo "TOTAL_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $6 }')"
echo "FAILED_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $8 }')"
echo "SKIPPED_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $10 }')"
echo "ERRORS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $12 }')"
echo "TIME=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $14 }')"