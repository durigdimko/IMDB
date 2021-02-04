Description: IMDB Sort and export

Scenario: Sign in into account
Given I am on a page with the URL 'https://www.imdb.com'
When I click on an element by the xpath '//a[contains(@class,"imdb-header__signin-text")]'
When I click on an element by the xpath '//span[contains(text(), "Sign in with IMDb")]'
When I enter '${userEmail}' in a field by the xpath '//input[@name="email"]'
When I enter '${userPassword}' in a field by the xpath '//input[@name="password"]'
When I click on an element by the xpath '//input[@id="signInSubmit"]'
Then an element by the xpath '//span[contains(text(), "durigdimko")]' exists

Scenario: Search for movie by search box
When I enter 'Tenet' in a field by the xpath '//input[@id="suggestion-search"]'
When I click on an element by the xpath '//button[@id="suggestion-search-button"]'
Then the number of elements found by the xpath '//a[contains(@href,"/title/tt6723592/")]' is equal to '2'

Scenario: Open page for one of the found products
When I click on an element by the xpath '//*[@id="main"]/div/div[2]/table/tbody/tr[1]/td[2]/a'
Then the page with the URL 'https://www.imdb.com/title/tt6723592/?ref_=fn_al_tt_1' is loaded

Scenario: Add movie to Watchlist
When I click on an element by the xpath '//button[@class="ipc-button uc-add-wl-button-icon--add watchlist--title-main-desktop-standalone ipc-button--core-base ipc-button--single-padding ipc-button--default-height"]'
Then an element by the xpath '//div[@data-is-watchlisted="true" and @title="Click to remove from watchlist"]' exists

Scenario: Navigate to watchlist
When I click on an element by the xpath '//a[contains(@href,"/list/watchlist?ref_=nv_usr_wl_all_0")]'

Scenario: Sort and export
When I select the value 'USER_RATING' in a slider by the xpath '//select[@id="lister-sort-by-options"]'
Then the value 'USER_RATING' is selected in a slider by the xpath '//select[@id="lister-sort-by-options"]'
When I click on an element by the xpath '//a[contains(@href,"/list/ls084811423/export")]'
