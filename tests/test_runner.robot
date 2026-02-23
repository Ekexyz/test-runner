*** Settings ***
Resource    ${CURDIR}/../resources/common.resource

*** Variables ***
${project_id}        101459    # this project id
${suite_id}          173896    # this test job id
${pat}               ${EMPTY}  # add as secret variable

*** Test Cases ***
Run Test Jobs
    [Documentation]   Read variable rows from Excel and fire up Test Jobs for each row.
    [Tags]            test runner

    ${data}=          Read Excel Data  file_path=${CURDIR}/../files/TestData.xlsx  sheet_name=Sheet1
    ${builds}=        Create List

    # we need to exlude the test runner when executing withing a single test job.
    ${exclude}=       Create Dictionary  key=--exclude  value=test runner  type=clp

    FOR  ${row}  IN  @{data}
        Append To List  ${row}  ${exclude}
        ${build}=  Start Test Run  project_id=${project_id}  suite_id=${suite_id}  input_parameters=@{row}
        Append To List  ${builds}  ${build}
    END

    Log  Started Test Jobs: ${builds}  console=True




