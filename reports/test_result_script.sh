#!/usr/bin/bash

###################################################################################################
#     This is extracting the values for each test suite description.                              #
#     It uses awk to print the value between two quotes.                                          #
#     The columns printed is based on the following example string:                               #
#     <testng-results ignored="0" total="23" passed="22" failed="1" skipped="0">                  #
###################################################################################################

TEST_RESULTS_LOCATION="${1:-/Users/akshaytomar/Documents/personal/playwrightWorking/test-results}"
TEST_RESULTS_STATUS=$(cat "${TEST_RESULTS_LOCATION}/.last-run.json" | grep "status")
TEST_RESULTS_STRING=$(cat "${TEST_RESULTS_LOCATION}/.last-run.json" | grep "failedTests")
echo "STATUS=$(echo ${TEST_RESULTS_STATUS} | awk '{ print $0 }')"
echo "STRING=$(echo ${TEST_RESULTS_STRING} | awk '{ print $0 }')"
# echo "IGNORED_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $2 }')"
# echo "TOTAL_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $4 }')"
# echo "PASSED_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $6 }')"
# echo "FAILED_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $8 }')"
# echo "SKIPPED_TESTS=$(echo ${TEST_RESULTS_STRING} | awk -F'"' '{ print $10 }')"