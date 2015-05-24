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
    summary: 'In Sweden, after introducing equal parental leave, only 0.5% of men took up the offer in the first year',
    references_string: 'Econ:PaternityLeave:2014',
    categories_string: 'Evidence/SocialNorms'
)

Fact.create(
    summary: 'Parental leave policies are more effective if they encourage responsibilities to be shared with an ‘equality bonus’ such as in Sweden',
    references_string: 'Econ:PaternityLeave:2014, Econ:ParentalLeave:2015',
    categories_string: 'EffectivePolicies/ParentalLeave'
)

Fact.create(
    summary: 'Many countries fail to offer paid paternity leave',
    references_string: 'Econ:ParentalLeave:2015',
    categories_string: 'Evidence/DiscriminatoryPolicies'
)

Fact.create(
    summary: 'Paid maternity leave increases workforce participation',
    references_string: 'Econ:ParentalLeave:2015',
    categories_string: 'EffectivePolicies/ParentalLeave'
)

Reference.create(
    key: 'Independent:IndiaMaritalRape:2015',
    title: 'India refuses to criminalise marital rape because of ‘social issues and religious beliefs’ in country',
    summary: 'Human rights campaigners have condemned the Indian government&#039;s refusal to criminalise marital rape by claiming cultural and religious issues mean it cannot be applied to India.',
    author: 'The Independent',
    url: 'http://www.independent.co.uk/news/world/asia/india-refuses-to-criminalise-marital-rape-because-of-social-issues-and-religious-beliefs-in-country-10216124.html'
)

Fact.create(
    summary: 'A large number of countries fail to criminalize marital rape',
    references_string: 'Independent:IndiaMaritalRape:2015',
    categories_string: 'Evidence/DiscriminatoryPolicies'
)

Fact.create(
    summary: 'In many countries, social norms fail to recognize marital rape as a problem',
    references_string: 'Independent:IndiaMaritalRape:2015',
    categories_string: 'Evidence/SocialNorms'
)

Reference.create(
    key: 'LessWrong:EfficientCharity:2010',
    title: 'Efficient Charity',
    summary: 'The Overhead Ratio: Not a Good Metric',
    url: 'http://lesswrong.com/lw/37f/efficient_charity/'
)

Fact.create(
    summary: 'The overhead ratio is not a good metric for selecting charities',
    references_string: 'LessWrong:EfficientCharity:2010',
    categories_string: 'Impact/CharitableGiving'
)

Reference.create(
    key: 'GFW:TrustInWomen',
    title: 'Trust In Women: Give General Support',
    summary: 'Not all grants are created equal. At the Global Fund for Women, we believe that the way you grant can have as much of an impact as the grant itself.',
    url: 'http://www.globalfundforwomen.org/storage/documents/where-we-stand/gfw_gensupport.pdf'
)

Fact.create(
    summary: 'General support grants are essential for charitable organisations to work effectively',
    references_string: 'GFW:TrustInWomen',
    categories_string: 'Impact/CharitableGiving'
)

Reference.create(
    key: 'UNWomen:Progress:2015',
    title: 'Progress of the World’s Women 2015-2016',
    summary: 'Distils and confronts the most glaring gaps between the laws and policies that guarantee equal rights for women and girls, and the reality on the ground',
    url: 'http://progress.unwomen.org/en/2015/pdf/UNW_progressreport.pdf'
)

content = <<-END
  From UN Women Progress Report:

  > The translation of equality before the law into equal outcomes is not automatic. Even where gender-equal laws have been put into place, entrenched inequalities, discriminatory social norms, harmful customary practices, as well as dominant patterns of economic development can undermine their implementation and positive impact.

  Substantive laws such as the Convention on the Elimination of All Forms of Discrimination against Women (CEDAW) and the International Covenant on Economic, Social and Cultural Rights (ICESCR):

  > are legally binding commitments that require States to respect, protect and fulfil women’s rights.
END

Fact.create(
    summary: 'Substantive laws require states to overcome entrenched inequalities in order to protect and fulfil women’s rights',
    content: content,
    references_string: 'UNWomen:Progress:2015',
    categories_string: 'EffectivePolicies/InternationalLaw'
)

Reference.create(
    key: 'Guardian:HunterGathererTribes:2015',
    title: 'Early men and women were equal, say scientists',
    summary: 'Study shows that modern hunter-gatherer tribes operate on egalitarian basis, suggesting inequality was an aberration that came with the advent of agriculture',
    url: 'http://www.theguardian.com/science/2015/may/14/early-men-women-equal-scientists'
)

Fact.create(
    summary: 'Study shows that modern hunter-gatherer tribes operate on egalitarian basis, suggesting inequality was an aberration that came with the advent of agriculture',
    references_string: 'Guardian:HunterGathererTribes:2015',
    categories_string: 'Evidence/SocialNorms'
)

Reference.create(
    key: 'NPR:EmpowermentBasedSexEd:2015',
    title: 'Sex Ed Works Better When It Addresses Power In Relationships',
    summary: '‘Empowerment based’ sex ed programs that address the social and biological aspects of puberty and sex are more effective than traditional programs',
    url: 'http://www.npr.org/sections/health-shots/2015/05/17/407063066/sex-ed-works-better-when-it-addresses-power-in-relationships'
)

Fact.create(
    summary: 'A study of sex ed programs found that ‘empowerment based’ programs which address harmful gender norms were more effective at reducing pregnancies and STDs than traditional ones',
    references_string: 'NPR:EmpowermentBasedSexEd:2015',
    categories_string: 'EffectiveProgrammes/Education'
)
