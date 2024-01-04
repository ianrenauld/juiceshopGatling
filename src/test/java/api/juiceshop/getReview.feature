#---------------------------------------------------------------------------------------------------
@positive
Feature: Karate GET Example
#---------------------------------------------------------------------------------------------------

#---------------------------------------------------------------------------------------------------
Scenario: Get Product Reviews
#---------------------------------------------------------------------------------------------------

  * def productId = __gatling.product

  Given url `${baseUrl}/rest/products/${productId}/reviews`
  When method GET
  Then status 200
  And match response.status == "success"
  And match response.data == "#[1]"
  And match response.data[0].product == parseInt(productId, 10)
  And match response.data[0].liked == true
