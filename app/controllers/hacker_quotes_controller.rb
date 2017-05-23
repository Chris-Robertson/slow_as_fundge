class HackerQuotesController < ApplicationController
  before_action :set_hacker_quote, only: [:show, :edit, :update, :destroy]

  # GET /hacker_quotes
  # GET /hacker_quotes.json
  def index
    @hacker_quotes = HackerQuote.all
    @search_query = params[:search]

    @search_results = []

    start = Time.now
    # Get each character of the search query string, as well as its index
    @search_query.chars.each_with_index do |query_char, index|
      # Get each individual object in the database
      @hacker_quotes.each do |line|
        # For each line in the database, split it into each word
        word_match = ''
        line.quote.split.each do |word|
          # Set up an empty string to hold the matched word
          if query_char == word[index]
            word_match += word
          end
        end
        if word_match == @search_query
          @search_results << line.quote
          @search_results.uniq!
        end
      end
    end
    finish = Time.now

    @total_time = finish - start
  end

  # GET /hacker_quotes/1
  # GET /hacker_quotes/1.json
  def show
  end

  # GET /hacker_quotes/new
  def new
    @hacker_quote = HackerQuote.new
  end

  def search
  end

  # GET /hacker_quotes/1/edit
  def edit
  end

  # POST /hacker_quotes
  # POST /hacker_quotes.json
  def create
    @hacker_quote = HackerQuote.new(hacker_quote_params)

    respond_to do |format|
      if @hacker_quote.save
        format.html { redirect_to @hacker_quote, notice: 'Hacker quote was successfully created.' }
        format.json { render :show, status: :created, location: @hacker_quote }
      else
        format.html { render :new }
        format.json { render json: @hacker_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hacker_quotes/1
  # PATCH/PUT /hacker_quotes/1.json
  def update
    respond_to do |format|
      if @hacker_quote.update(hacker_quote_params)
        format.html { redirect_to @hacker_quote, notice: 'Hacker quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @hacker_quote }
      else
        format.html { render :edit }
        format.json { render json: @hacker_quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hacker_quotes/1
  # DELETE /hacker_quotes/1.json
  def destroy
    @hacker_quote.destroy
    respond_to do |format|
      format.html { redirect_to hacker_quotes_url, notice: 'Hacker quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hacker_quote
      @hacker_quote = HackerQuote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hacker_quote_params
      params.require(:hacker_quote).permit(:quote)
    end
end
