class HouseFacade
  def initialize(house)
    @house = house
    @service = PotterService.new(@house)
  end

  def members
    @service.get_members_of_house.map do |member_data|
      Member.new(member_data)
    end
  end
end
