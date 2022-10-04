require "application_system_test_case"

class ClientsTest < ApplicationSystemTestCase
  setup do
    @client = clients(:one)
  end

  test "visiting the index" do
    visit clients_url
    assert_selector "h1", text: "Clients"
  end

  test "should create client" do
    visit clients_url
    click_on "New client"

    fill_in "Lastname", with: @client.LastName
    fill_in "Name", with: @client.Name
    fill_in "Sex", with: @client.Sex
    fill_in "Birthdate", with: @client.birthDate
    fill_in "City", with: @client.city
    fill_in "Colony", with: @client.colony
    fill_in "Cp", with: @client.cp
    fill_in "Email", with: @client.email
    fill_in "Housenumber", with: @client.houseNumber
    fill_in "Phone", with: @client.phone
    fill_in "Puntos", with: @client.puntos
    fill_in "State", with: @client.state
    check "Status" if @client.status
    fill_in "Street", with: @client.street
    click_on "Create Client"

    assert_text "Client was successfully created"
    click_on "Back"
  end

  test "should update Client" do
    visit client_url(@client)
    click_on "Edit this client", match: :first

    fill_in "Lastname", with: @client.LastName
    fill_in "Name", with: @client.Name
    fill_in "Sex", with: @client.Sex
    fill_in "Birthdate", with: @client.birthDate
    fill_in "City", with: @client.city
    fill_in "Colony", with: @client.colony
    fill_in "Cp", with: @client.cp
    fill_in "Email", with: @client.email
    fill_in "Housenumber", with: @client.houseNumber
    fill_in "Phone", with: @client.phone
    fill_in "Puntos", with: @client.puntos
    fill_in "State", with: @client.state
    check "Status" if @client.status
    fill_in "Street", with: @client.street
    click_on "Update Client"

    assert_text "Client was successfully updated"
    click_on "Back"
  end

  test "should destroy Client" do
    visit client_url(@client)
    click_on "Destroy this client", match: :first

    assert_text "Client was successfully destroyed"
  end
end
