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

Reference.create(
    key: 'Econ:ParentalLeave:2015',
    title: 'More hands to rock the cradle',
    summary: '“IN AMERICA there is nothing we wouldn’t do for moms—apart from one major thing,” said John Oliver, a British-born comedian, in his television show, “Last...',
    author: 'The Economist',
    url: 'http://www.economist.com/blogs/economist-explains/2014/07/economist-explains-15'
)

Fact.create(
    summary: 'In Sweden, after introducing equal parental leave, only 0.5% of men took up the offer in the first year.',
    references_string: 'Econ:PaternityLeave:2014',
    categories_string: 'Evidence/SocialNorms'
)

Fact.create(
    summary: 'Parental leave policies are more effective if they encourage responsibilities to be shared with an ‘equality bonus’ such as in Sweden',
    references_string: 'Econ:PaternityLeave:2014, Econ:ParentalLeave:2015',
    categories_string: 'EffectivePolicies/ParentalLeave'
)