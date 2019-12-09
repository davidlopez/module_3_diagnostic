class PotterService
  def initialize(house)
    @house = house
  end

  def get_members_of_house
    get_json
  end

  private

    def connection
      Faraday.new("https://www.potterapi.com/v1/characters") do |faraday|
        faraday.params['key'] = ENV['POTTER_API_KEY']
        faraday.params['orderOfThePhoenix'] = true
        faraday.params['house'] = @house
        faraday.adapter Faraday.default_adapter
      end
    end

    def get_json
     response = connection.get
     JSON.parse(response.body, symbolize_names: true)
    end
end
