*** Settings ***
Documentation           Test suite for CRT starter.
Library                 QWeb
Suite Setup             Open Browser    about:blank    chrome
Suite Teardown          Close All Browsers

*** Variables ***
${shirt name}  ${EMPTY}
${price}       ${EMPTY}

*** Test Cases ***
Shop for products   # - ${shirt name}
    [Documentation]     Select a product, verify details on the page,
    ...                 add the product to the cart and continue shopping.
    GoTo                https://qentinelqi.github.io/shop/
    ClickText           ${shirt name}
    VerifyText          Slim Fit, 5oz 100% Cotton T-Shirt.
    ClickText           Add to cart
    VerifyText          Cart summary
    VerifyText          ${shirt name}
    VerifyText          ${price}
    ClickText           Continue shopping
