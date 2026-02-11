*** Settings ***
Library    ${CURDIR}/../libraries/ExcelHelper.py
Library    ${CURDIR}/../libraries/CRTApi.py  api_url=https://api.robotic.copado.com/pace/v4  access_token=${pat}
Library    Collections

*** Keywords ***
