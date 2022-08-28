Feature: Metodo GET para listar usuarios cadastrados

  Background:
    * url 'https://serverest.dev'

  @smoke
  Scenario: Listar todos os usuarios cadastrados
    Given path '/usuarios'
    When method Get
    Then status 200

  Scenario: Listar usuario por nome
    Given path '/usuarios'
    And param nome = 'Steve Harris'
    When method Get
    Then status 200

  @smoke
  Scenario: Listar usuario por nome e email
    Given path '/usuarios'
    And params { nome: 'Steve Harris', email: 'steve@harris.com.br' }
    When method Get
    Then status 200

  Scenario: Listar usuario por nome e email e validar nome do usuario retornado
    Given path '/usuarios'
    And params { nome: 'Steve Harris', email: 'steve@harris.com.br' }
    When method Get
    Then status 200
    And match response.usuarios[0].nome == 'Steve Harris'

  Scenario: Listar usuarios e verificar se algum usuario tem Steve Harris
    Given path '/usuarios'
    When method Get
    Then status 200
    And match response.usuarios[*].nome contains 'Steve Harris'