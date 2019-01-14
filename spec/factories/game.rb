FactoryBot.define do
  factory :game do
    date { Date.new(2019, 1, 1) }
    association :home_team, factory: :team_east
    association :away_team, factory: :team_west
    season { 2018 }
  end
end
