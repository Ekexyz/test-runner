*** Settings ***
Resource    ${CURDIR}/../resources/common.resource

*** Variables ***
${project_id}        101459
${suite_id}          173896
${pat}               ${EMPTY}  # add as secret variable

*** Test Cases ***
Run Test Jobs
    [Documentation]   Read variable rows from Excel and fire up Test Jobs for each row.
    [Tags]            test runner

    ${data}=          Read Excel Data  file_path=${CURDIR}/../files/TestData.xlsx  sheet_name=Sheet1
    ${builds}=        Create List

    FOR  ${row}  IN  @{data}
        ${build}=  Start Test Run  project_id=${project_id}  suite_id=${suite_id}  input_parameters=@{row}
        Append To List  ${builds}  ${build}
    END

    Log  Started Test Jobs: ${builds}  console=True




