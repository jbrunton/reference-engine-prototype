# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Reference.create(
    key: 'Econ:PaternityLeave:2014',
    title: 'Why Swedish men take so much paternity leave',
    summary: 'ALONG with its Nordic neighbours, Sweden features near the top of most gender-equality rankings. The World Economic Forum rates it as having one of the narrowest...',
    author: 'The Economist',
    url: 'http://www.economist.com/blogs/economist-explains/2014/07/economist-explains-15'
)

Fact.create(
    summary: 'In Sweden, after introducing equal parental leave, only 0.4% of men took up the offer in the first year.',
    references: 'Econ:PaternityLeave:2014',
    categories: 'Evidence/SocialNorms'
)