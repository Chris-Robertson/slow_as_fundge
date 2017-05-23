require 'test_helper'

class HackerQuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hacker_quote = hacker_quotes(:one)
  end

  test "should get index" do
    get hacker_quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_hacker_quote_url
    assert_response :success
  end

  test "should create hacker_quote" do
    assert_difference('HackerQuote.count') do
      post hacker_quotes_url, params: { hacker_quote: { quote: @hacker_quote.quote } }
    end

    assert_redirected_to hacker_quote_url(HackerQuote.last)
  end

  test "should show hacker_quote" do
    get hacker_quote_url(@hacker_quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_hacker_quote_url(@hacker_quote)
    assert_response :success
  end

  test "should update hacker_quote" do
    patch hacker_quote_url(@hacker_quote), params: { hacker_quote: { quote: @hacker_quote.quote } }
    assert_redirected_to hacker_quote_url(@hacker_quote)
  end

  test "should destroy hacker_quote" do
    assert_difference('HackerQuote.count', -1) do
      delete hacker_quote_url(@hacker_quote)
    end

    assert_redirected_to hacker_quotes_url
  end
end
