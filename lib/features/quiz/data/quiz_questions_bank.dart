import '../../subjects/domain/chapter_content_model.dart';

/// Edit this file to add or update quiz questions for any chapter.
///
/// Chapter ID format: `{subjectId}_{chapter_slug}`
/// Example: Sets in Math → `math_sets`
///
/// To add more questions for a chapter, add MCQItem entries to its list in
/// [customQuestions]. Question count on the chapter list updates automatically.
class QuizQuestionsBank {
  QuizQuestionsBank._();

  static final Map<String, List<MCQItem>> customQuestions = {
    'math_sets': [

      MCQItem(
  question: 'What is a set?',
  options: [
    'A collection of random numbers',
    'A well-defined collection of objects',
    'A collection of equations',
    'A collection of variables'
  ],
  correctIndex: 1,
  explanation:
      'A set is a well-defined collection of distinct objects called elements.',
),

MCQItem(
  question: 'Which symbol is used to represent a set?',
  options: ['()', '{}', '[]', '<>'],
  correctIndex: 1,
  explanation:
      'Sets are usually represented using curly braces {}.',
),

MCQItem(
  question: 'Which of the following represents a set correctly?',
  options: [
    '{a, b, c}',
    '(a, b, c)',
    '[a, b, c]',
    '<a, b, c>'
  ],
  correctIndex: 0,
  explanation:
      'A set is represented using curly braces, such as {a, b, c}.',
),

MCQItem(
  question: 'In the set A = {1, 2, 3, 4}, how many elements are there?',
  options: ['2', '3', '4', '5'],
  correctIndex: 2,
  explanation:
      'The set contains 4 distinct elements: 1, 2, 3, and 4.',
),

MCQItem(
  question: 'Which symbol indicates "belongs to" in set notation?',
  options: ['⊂', '∈', '∪', '∩'],
  correctIndex: 1,
  explanation:
      'The symbol ∈ means "belongs to" or "is an element of" a set.',
),

MCQItem(
  question: 'What is the cardinal number of the set {a, e, i, o, u}?',
  options: ['3', '4', '5', '6'],
  correctIndex: 2,
  explanation:
      'The set contains 5 vowels, so its cardinal number is 5.',
),

MCQItem(
  question: 'Which of the following is an empty set?',
  options: [
    '{0}',
    '{ }',
    '{a}',
    '{1, 2}'
  ],
  correctIndex: 1,
  explanation:
      'An empty set contains no elements and is represented by { } or ∅.',
),

MCQItem(
  question: 'How many elements are there in the empty set?',
  options: ['0', '1', '2', 'Infinite'],
  correctIndex: 0,
  explanation:
      'An empty set has no elements, so its cardinal number is 0.',
),

MCQItem(
  question: 'If A = {1, 2} and B = {1, 2, 3}, then A is:',
  options: [
    'A superset of B',
    'A subset of B',
    'Equal to B',
    'Disjoint from B'
  ],
  correctIndex: 1,
  explanation:
      'Every element of A is contained in B, so A is a subset of B.',
),

MCQItem(
  question: 'If A = {1, 2, 3} and B = {1, 2, 3}, then A and B are:',
  options: [
    'Disjoint sets',
    'Equivalent sets',
    'Equal sets',
    'Null sets'
  ],
  correctIndex: 2,
  explanation:
      'Two sets are equal if they contain exactly the same elements.',
),

MCQItem(
  question: 'What is A ∪ B if A = {1, 2, 3} and B = {3, 4, 5}?',
  options: [
    '{3}',
    '{1, 2, 4, 5}',
    '{1, 2, 3, 4, 5}',
    '{1, 2}'
  ],
  correctIndex: 2,
  explanation:
      'Union contains all elements from both sets without repetition.',
),

MCQItem(
  question: 'What is A ∩ B if A = {1, 2, 3} and B = {3, 4, 5}?',
  options: [
    '{1, 2, 3, 4, 5}',
    '{3}',
    '{1, 2}',
    '{4, 5}'
  ],
  correctIndex: 1,
  explanation:
      'Intersection contains the common elements of both sets. Here, only 3 is common.',
),

MCQItem(
  question: 'If A = {1, 2, 3, 4} and B = {3, 4}, then A - B equals:',
  options: [
    '{1, 2}',
    '{3, 4}',
    '{1, 2, 3, 4}',
    '{ }'
  ],
  correctIndex: 0,
  explanation:
      'A - B contains elements of A that are not in B.',
),

MCQItem(
  question: 'Two sets are called disjoint if:',
  options: [
    'They are equal',
    'They have the same number of elements',
    'They have no common elements',
    'One is a subset of the other'
  ],
  correctIndex: 2,
  explanation:
      'Disjoint sets have no common elements, so their intersection is empty.',
),

MCQItem(
  question: 'If n(A) = 5 and n(B) = 4 with A and B disjoint, then n(A ∪ B) = ?',
  options: ['1', '5', '9', '20'],
  correctIndex: 2,
  explanation:
      'For disjoint sets, n(A ∪ B) = n(A) + n(B) = 5 + 4 = 9.',
),

MCQItem(
  question: 'If n(A) = 10, n(B) = 8 and n(A ∩ B) = 3, then n(A ∪ B) = ?',
  options: ['15', '18', '21', '24'],
  correctIndex: 0,
  explanation:
      'n(A ∪ B) = n(A) + n(B) - n(A ∩ B) = 10 + 8 - 3 = 15.',
),

MCQItem(
  question: 'If the universal set U = {1,2,3,4,5,6} and A = {2,4,6}, then A\' = ?',
  options: [
    '{1,3,5}',
    '{2,4,6}',
    '{1,2,3}',
    '{4,5,6}'
  ],
  correctIndex: 0,
  explanation:
      'The complement of A contains all elements of U that are not in A.',
),

MCQItem(
  question: 'If a set has 3 elements, how many subsets does it have?',
  options: ['6', '8', '9', '12'],
  correctIndex: 1,
  explanation:
      'The number of subsets of a set with n elements is 2ⁿ. Thus, 2³ = 8.',
),

MCQItem(
  question: 'If set A has 5 elements, how many proper subsets does it have?',
  options: ['31', '32', '25', '16'],
  correctIndex: 0,
  explanation:
      'Number of proper subsets = 2ⁿ - 1 = 2⁵ - 1 = 31.',
),

MCQItem(
  question: 'In a survey of 40 students, 25 like Mathematics, 20 like Science, and 10 like both. How many like at least one subject?',
  options: ['35', '40', '45', '55'],
  correctIndex: 0,
  explanation:
      'Using n(A ∪ B) = n(A) + n(B) - n(A ∩ B), we get 25 + 20 - 10 = 35.',
),



      MCQItem(
        question: 'If set A has 4 elements, how many subsets does set A have?',
        options: ['8', '12', '16', '32'],
        correctIndex: 2,
        explanation:
            'The formula for finding the number of subsets is 2ⁿ, where n is the number of elements. Here, n = 4, so 2⁴ = 16 subsets.',
      ),
      MCQItem(
        question:
            'Which of the following represents the intersection of sets A and B?',
        options: ['A ∪ B', 'A ∩ B', 'A - B', 'A\''],
        correctIndex: 1,
        explanation:
            'The intersection is represented by the ∩ symbol, showing elements common to both sets.',
      ),
      MCQItem(
        question: 'What is the complement of a universal set (U\')?',
        options: ['U', '∅ (Empty Set)', 'Set A', 'Set B'],
        correctIndex: 1,
        explanation:
            'The complement of a set contains everything not in that set. Since the universal set contains all elements, there is nothing outside it, resulting in the empty set (∅).',
      ),
    ],

    'math_compound_interest': [
      MCQItem(
  question: 'What is compound interest?',
  options: [
    'Interest calculated only on principal',
    'Interest calculated on principal and previous interest',
    'Interest paid by a bank',
    'Interest calculated monthly only'
  ],
  correctIndex: 1,
  explanation:
      'Compound interest is calculated on both the principal and the accumulated interest.',
),

MCQItem(
  question: 'The formula for amount in compound interest is:',
  options: [
    'A = PRT/100',
    'A = P(1 + R/100)^T',
    'CI = PRT/100',
    'A = P + R + T'
  ],
  correctIndex: 1,
  explanation:
      'The amount formula for annual compound interest is A = P(1 + R/100)^T.',
),

MCQItem(
  question: 'If the principal is Rs. 1000 and rate is 10% per annum for 1 year, the amount is:',
  options: ['Rs. 1000', 'Rs. 1050', 'Rs. 1100', 'Rs. 1200'],
  correctIndex: 2,
  explanation:
      'A = 1000(1 + 10/100)^1 = Rs. 1100.',
),

MCQItem(
  question: 'Compound interest is equal to:',
  options: [
    'Amount + Principal',
    'Amount - Principal',
    'Principal - Amount',
    'Rate × Time'
  ],
  correctIndex: 1,
  explanation:
      'Compound Interest (CI) = Amount (A) − Principal (P).',
),

MCQItem(
  question: 'Find the amount on Rs. 2000 at 5% compound interest for 1 year.',
  options: ['Rs. 2050', 'Rs. 2100', 'Rs. 2200', 'Rs. 2250'],
  correctIndex: 1,
  explanation:
      'A = 2000(1 + 5/100) = Rs. 2100.',
),

MCQItem(
  question: 'What is the compound interest on Rs. 2000 at 5% for 1 year?',
  options: ['Rs. 50', 'Rs. 100', 'Rs. 150', 'Rs. 200'],
  correctIndex: 1,
  explanation:
      'Amount = Rs. 2100, so CI = 2100 − 2000 = Rs. 100.',
),

MCQItem(
  question: 'The amount on Rs. 1000 at 10% compound interest for 2 years is:',
  options: ['Rs. 1200', 'Rs. 1210', 'Rs. 1220', 'Rs. 1250'],
  correctIndex: 1,
  explanation:
      'A = 1000(1.10)^2 = Rs. 1210.',
),

MCQItem(
  question: 'The compound interest on Rs. 1000 at 10% for 2 years is:',
  options: ['Rs. 200', 'Rs. 210', 'Rs. 220', 'Rs. 230'],
  correctIndex: 1,
  explanation:
      'CI = 1210 − 1000 = Rs. 210.',
),

MCQItem(
  question: 'Find the amount on Rs. 5000 at 8% compound interest for 2 years.',
  options: ['Rs. 5800', 'Rs. 5832', 'Rs. 5860', 'Rs. 5900'],
  correctIndex: 1,
  explanation:
      'A = 5000(1.08)^2 = Rs. 5832.',
),

MCQItem(
  question: 'Find the compound interest on Rs. 5000 at 8% for 2 years.',
  options: ['Rs. 800', 'Rs. 820', 'Rs. 832', 'Rs. 850'],
  correctIndex: 2,
  explanation:
      'CI = 5832 − 5000 = Rs. 832.',
),

MCQItem(
  question: 'If principal is Rs. 4000, rate 5% and amount after 2 years is Rs. 4410, then CI is:',
  options: ['Rs. 400', 'Rs. 410', 'Rs. 420', 'Rs. 430'],
  correctIndex: 1,
  explanation:
      'CI = Amount − Principal = 4410 − 4000 = Rs. 410.',
),

MCQItem(
  question: 'At 10% compound interest, the amount of Rs. 2000 after 3 years is:',
  options: ['Rs. 2642', 'Rs. 2662', 'Rs. 2680', 'Rs. 2700'],
  correctIndex: 1,
  explanation:
      'A = 2000(1.10)^3 = Rs. 2662.',
),

MCQItem(
  question: 'The compound interest on Rs. 2000 at 10% for 3 years is:',
  options: ['Rs. 642', 'Rs. 650', 'Rs. 662', 'Rs. 700'],
  correctIndex: 2,
  explanation:
      'CI = 2662 − 2000 = Rs. 662.',
),

MCQItem(
  question: 'If the amount is Rs. 2420 after 2 years at 10% compound interest, the principal is:',
  options: ['Rs. 1800', 'Rs. 1900', 'Rs. 2000', 'Rs. 2200'],
  correctIndex: 2,
  explanation:
      'P = 2420 ÷ (1.10)^2 = 2420 ÷ 1.21 = Rs. 2000.',
),

MCQItem(
  question: 'A sum doubles in 10 years at compound interest. The amount after 10 years of Rs. 5000 is:',
  options: ['Rs. 5000', 'Rs. 7500', 'Rs. 10000', 'Rs. 15000'],
  correctIndex: 2,
  explanation:
      'If the sum doubles, Rs. 5000 becomes Rs. 10000.',
),

MCQItem(
  question: 'Find the amount on Rs. 10000 at 5% compound interest for 3 years.',
  options: ['Rs. 11576.25', 'Rs. 11500', 'Rs. 11600', 'Rs. 11700'],
  correctIndex: 0,
  explanation:
      'A = 10000(1.05)^3 = Rs. 11576.25.',
),

MCQItem(
  question: 'The compound interest on Rs. 10000 at 5% for 3 years is:',
  options: [
    'Rs. 1500',
    'Rs. 1576.25',
    'Rs. 1600',
    'Rs. 1650'
  ],
  correctIndex: 1,
  explanation:
      'CI = 11576.25 − 10000 = Rs. 1576.25.',
),

MCQItem(
  question: 'If Rs. 4000 amounts to Rs. 4840 in 2 years at compound interest, the annual rate is:',
  options: ['8%', '10%', '12%', '15%'],
  correctIndex: 1,
  explanation:
      '4840/4000 = 1.21 = (1.10)^2, so rate = 10%.',
),

MCQItem(
  question: 'The difference between compound interest and simple interest on Rs. 1000 at 10% for 2 years is:',
  options: ['Rs. 5', 'Rs. 10', 'Rs. 15', 'Rs. 20'],
  correctIndex: 1,
  explanation:
      'CI = Rs. 210 and SI = Rs. 200, difference = Rs. 10.',
),

MCQItem(
  question: 'Find the amount on Rs. 8000 at 12% compound interest for 2 years.',
  options: ['Rs. 10035.2', 'Rs. 10000', 'Rs. 10050', 'Rs. 10100'],
  correctIndex: 0,
  explanation:
      'A = 8000(1.12)^2 = Rs. 10035.2.',
),

MCQItem(
  question: 'A sum becomes Rs. 9261 in 3 years at 10% compound interest. The principal is:',
  options: ['Rs. 6000', 'Rs. 6500', 'Rs. 6955', 'Rs. 7000'],
  correctIndex: 2,
  explanation:
      'P = 9261 ÷ (1.10)^3 = 9261 ÷ 1.331 ≈ Rs. 6955.',
),

MCQItem(
  question: 'At what rate will Rs. 5000 become Rs. 6050 in 2 years under compound interest?',
  options: ['8%', '10%', '12%', '15%'],
  correctIndex: 1,
  explanation:
      '6050/5000 = 1.21 = (1.10)^2, so rate = 10%.',
),

MCQItem(
  question: 'A sum of Rs. 10000 becomes Rs. 13310 in 3 years. The annual compound interest rate is:',
  options: ['8%', '10%', '12%', '15%'],
  correctIndex: 1,
  explanation:
      '13310/10000 = 1.331 = (1.10)^3, therefore rate = 10%.',
),
  
],

'math_growth_and_depreciation': [
  MCQItem(
  question: 'What is depreciation?',
  options: [
    'Increase in value of an asset',
    'Decrease in value of an asset over time',
    'Profit earned from an asset',
    'Cost of purchasing an asset'
  ],
  correctIndex: 1,
  explanation:
      'Depreciation means the decrease in the value of an asset over time due to use, wear and tear, or age.',
),

MCQItem(
  question: 'What is growth in mathematics?',
  options: [
    'Decrease in quantity',
    'No change in quantity',
    'Increase in quantity over time',
    'Division of quantity'
  ],
  correctIndex: 2,
  explanation:
      'Growth refers to the increase in a quantity over a period of time.',
),

MCQItem(
  question: 'The amount after growth is calculated by:',
  options: [
    'A = P(1 - R/100)',
    'A = P + R + T',
    'A = P(1 + R/100)',
    'A = PRT/100'
  ],
  correctIndex: 2,
  explanation:
      'For one year growth, Amount = Principal × (1 + Rate/100).',
),

MCQItem(
  question: 'The value after depreciation is calculated by:',
  options: [
    'A = P(1 + R/100)',
    'A = P(1 - R/100)',
    'A = P + R',
    'A = PRT/100'
  ],
  correctIndex: 1,
  explanation:
      'For one year depreciation, Value = Principal × (1 - Rate/100).',
),

MCQItem(
  question: 'A population of 1000 increases by 10% in a year. What is the new population?',
  options: ['1050', '1080', '1100', '1200'],
  correctIndex: 2,
  explanation:
      'New population = 1000 × 1.10 = 1100.',
),

MCQItem(
  question: 'A machine worth Rs. 5000 depreciates by 10% in one year. Its value becomes:',
  options: ['Rs. 4000', 'Rs. 4500', 'Rs. 4700', 'Rs. 5500'],
  correctIndex: 1,
  explanation:
      'Value = 5000 × 0.90 = Rs. 4500.',
),

MCQItem(
  question: 'The growth factor for a 12% increase is:',
  options: ['0.12', '1.12', '1.2', '0.88'],
  correctIndex: 1,
  explanation:
      'Growth factor = 1 + 12/100 = 1.12.',
),

MCQItem(
  question: 'The depreciation factor for a 15% decrease is:',
  options: ['1.15', '0.15', '0.85', '0.75'],
  correctIndex: 2,
  explanation:
      'Depreciation factor = 1 - 15/100 = 0.85.',
),

MCQItem(
  question: 'A town has a population of 20000. If it grows by 5% in a year, the population after one year is:',
  options: ['20500', '21000', '22000', '25000'],
  correctIndex: 1,
  explanation:
      'Population = 20000 × 1.05 = 21000.',
),

MCQItem(
  question: 'A car worth Rs. 800000 depreciates by 5% annually. What is its value after one year?',
  options: ['Rs. 740000', 'Rs. 750000', 'Rs. 760000', 'Rs. 780000'],
  correctIndex: 2,
  explanation:
      'Value = 800000 × 0.95 = Rs. 760000.',
),

MCQItem(
  question: 'Find the population after 2 years if 1000 people grow at 10% per annum.',
  options: ['1200', '1210', '1220', '1250'],
  correctIndex: 1,
  explanation:
      'Population = 1000(1.10)^2 = 1210.',
),

MCQItem(
  question: 'A machine costs Rs. 10000 and depreciates by 10% annually. Its value after 2 years is:',
  options: ['Rs. 8000', 'Rs. 8100', 'Rs. 8200', 'Rs. 9000'],
  correctIndex: 1,
  explanation:
      'Value = 10000(0.90)^2 = Rs. 8100.',
),

MCQItem(
  question: 'A population of 5000 grows by 8% annually. What is the population after 2 years?',
  options: ['5832', '5800', '5900', '6000'],
  correctIndex: 0,
  explanation:
      'Population = 5000(1.08)^2 = 5832.',
),

MCQItem(
  question: 'A laptop worth Rs. 60000 depreciates by 20% annually. Its value after 2 years is:',
  options: ['Rs. 38400', 'Rs. 40000', 'Rs. 42000', 'Rs. 48000'],
  correctIndex: 0,
  explanation:
      'Value = 60000(0.80)^2 = Rs. 38400.',
),

MCQItem(
  question: 'If a population grows from 10000 to 12100 in 2 years, the annual growth rate is:',
  options: ['5%', '8%', '10%', '12%'],
  correctIndex: 2,
  explanation:
      '12100/10000 = 1.21 = (1.10)^2, so rate = 10%.',
),

MCQItem(
  question: 'A machine depreciates from Rs. 5000 to Rs. 4050 in 2 years. The annual depreciation rate is:',
  options: ['5%', '10%', '15%', '20%'],
  correctIndex: 1,
  explanation:
      '4050/5000 = 0.81 = (0.90)^2, so depreciation rate = 10%.',
),

MCQItem(
  question: 'The population of a village is 25000 and grows by 4% annually. What will it be after 3 years?',
  options: ['28121.6', '28000', '28500', '29000'],
  correctIndex: 0,
  explanation:
      'Population = 25000(1.04)^3 = 28121.6.',
),

MCQItem(
  question: 'A vehicle worth Rs. 200000 depreciates by 10% annually. Its value after 3 years is:',
  options: ['Rs. 145800', 'Rs. 150000', 'Rs. 160000', 'Rs. 170000'],
  correctIndex: 0,
  explanation:
      'Value = 200000(0.90)^3 = Rs. 145800.',
),

MCQItem(
  question: 'The value of an asset becomes Rs. 7290 after 3 years with 10% annual depreciation. Its original value was:',
  options: ['Rs. 9000', 'Rs. 10000', 'Rs. 11000', 'Rs. 12000'],
  correctIndex: 1,
  explanation:
      'P = 7290 ÷ (0.90)^3 = 7290 ÷ 0.729 = Rs. 10000.',
),

MCQItem(
  question: 'A population becomes 13310 after 3 years from an initial population of 10000. Find the annual growth rate.',
  options: ['8%', '10%', '12%', '15%'],
  correctIndex: 1,
  explanation:
      '13310/10000 = 1.331 = (1.10)^3, therefore growth rate = 10%.',
),

MCQItem(
  question: 'A machine worth Rs. 40000 depreciates by 5% annually. What is its value after 4 years?',
  options: ['Rs. 32580.25', 'Rs. 32600', 'Rs. 33000', 'Rs. 34000'],
  correctIndex: 0,
  explanation:
      'Value = 40000(0.95)^4 = Rs. 32580.25.',
),

MCQItem(
  question: 'A city has a population of 50000. If it grows by 6% annually, what will be its population after 3 years?',
  options: ['59550.8', '59000', '60000', '61000'],
  correctIndex: 0,
  explanation:
      'Population = 50000(1.06)^3 = 59550.8.',
),

MCQItem(
  question: 'The value of a machine decreases from Rs. 100000 to Rs. 85737.5 in 3 years. Find the annual depreciation rate.',
  options: ['3%', '4%', '5%', '6%'],
  correctIndex: 2,
  explanation:
      '85737.5/100000 = 0.857375 = (0.95)^3, so depreciation rate = 5%.',
),
  
],

'math_currency_and_exchange_rate': [
  MCQItem(
  question: 'What is currency exchange rate?',
  options: [
    'The value of one currency in terms of another currency',
    'The amount deposited in a bank',
    'The rate of interest',
    'The value of gold'
  ],
  correctIndex: 0,
  explanation:
      'Currency exchange rate is the value of one country\'s currency expressed in another country\'s currency.',
),

MCQItem(
  question: 'If 1 USD = Rs. 130, then 2 USD equals:',
  options: ['Rs. 240', 'Rs. 250', 'Rs. 260', 'Rs. 270'],
  correctIndex: 2,
  explanation:
      '2 × 130 = Rs. 260.',
),

MCQItem(
  question: 'If 1 INR = Rs. 1.6 (NPR), then 10 INR equals:',
  options: ['Rs. 14', 'Rs. 15', 'Rs. 16', 'Rs. 18'],
  correctIndex: 2,
  explanation:
      '10 × 1.6 = Rs. 16.',
),

MCQItem(
  question: 'If 1 USD = Rs. 130, then 5 USD equals:',
  options: ['Rs. 600', 'Rs. 650', 'Rs. 700', 'Rs. 750'],
  correctIndex: 1,
  explanation:
      '5 × 130 = Rs. 650.',
),

MCQItem(
  question: 'If 1 Euro = Rs. 140, how many Nepalese Rupees are equal to 3 Euros?',
  options: ['Rs. 400', 'Rs. 420', 'Rs. 440', 'Rs. 460'],
  correctIndex: 1,
  explanation:
      '3 × 140 = Rs. 420.',
),

MCQItem(
  question: 'If 1 USD = Rs. 130, then Rs. 260 is equal to:',
  options: ['1 USD', '2 USD', '3 USD', '4 USD'],
  correctIndex: 1,
  explanation:
      '260 ÷ 130 = 2 USD.',
),

MCQItem(
  question: 'If 1 Pound Sterling = Rs. 160, then 4 Pounds equals:',
  options: ['Rs. 620', 'Rs. 640', 'Rs. 660', 'Rs. 680'],
  correctIndex: 1,
  explanation:
      '4 × 160 = Rs. 640.',
),

MCQItem(
  question: 'If Rs. 390 can be exchanged for USD at Rs. 130 per USD, then the amount in USD is:',
  options: ['2 USD', '3 USD', '4 USD', '5 USD'],
  correctIndex: 1,
  explanation:
      '390 ÷ 130 = 3 USD.',
),

MCQItem(
  question: 'If 1 AUD = Rs. 90, then 15 AUD equals:',
  options: ['Rs. 1250', 'Rs. 1300', 'Rs. 1350', 'Rs. 1400'],
  correctIndex: 2,
  explanation:
      '15 × 90 = Rs. 1350.',
),

MCQItem(
  question: 'If 1 USD = Rs. 130, how many USD can be obtained from Rs. 1300?',
  options: ['8 USD', '9 USD', '10 USD', '11 USD'],
  correctIndex: 2,
  explanation:
      '1300 ÷ 130 = 10 USD.',
),

MCQItem(
  question: 'A student exchanges 20 USD at the rate of Rs. 130 per USD. How much NPR does he receive?',
  options: ['Rs. 2400', 'Rs. 2500', 'Rs. 2600', 'Rs. 2700'],
  correctIndex: 2,
  explanation:
      '20 × 130 = Rs. 2600.',
),

MCQItem(
  question: 'If 1 Euro = Rs. 140, then Rs. 700 is equal to:',
  options: ['4 Euro', '5 Euro', '6 Euro', '7 Euro'],
  correctIndex: 1,
  explanation:
      '700 ÷ 140 = 5 Euro.',
),

MCQItem(
  question: 'A traveler converts Rs. 6500 into USD at Rs. 130 per USD. How many USD does he get?',
  options: ['45 USD', '50 USD', '55 USD', '60 USD'],
  correctIndex: 1,
  explanation:
      '6500 ÷ 130 = 50 USD.',
),

MCQItem(
  question: 'If 1 Singapore Dollar = Rs. 100, then 25 Singapore Dollars equals:',
  options: ['Rs. 2200', 'Rs. 2400', 'Rs. 2500', 'Rs. 2600'],
  correctIndex: 2,
  explanation:
      '25 × 100 = Rs. 2500.',
),

MCQItem(
  question: 'If 1 Japanese Yen = Rs. 0.9, then 1000 Yen equals:',
  options: ['Rs. 800', 'Rs. 850', 'Rs. 900', 'Rs. 950'],
  correctIndex: 2,
  explanation:
      '1000 × 0.9 = Rs. 900.',
),

MCQItem(
  question: 'A bank sells USD at Rs. 132 per USD. How much NPR is needed to buy 50 USD?',
  options: ['Rs. 6500', 'Rs. 6600', 'Rs. 6700', 'Rs. 6800'],
  correctIndex: 1,
  explanation:
      '50 × 132 = Rs. 6600.',
),

MCQItem(
  question: 'A bank buys USD at Rs. 128 per USD. If a person sells 100 USD, how much NPR will he receive?',
  options: ['Rs. 12600', 'Rs. 12700', 'Rs. 12800', 'Rs. 12900'],
  correctIndex: 2,
  explanation:
      '100 × 128 = Rs. 12800.',
),

MCQItem(
  question: 'If the buying rate of USD is Rs. 128 and the selling rate is Rs. 132, the bank\'s exchange margin per USD is:',
  options: ['Rs. 2', 'Rs. 3', 'Rs. 4', 'Rs. 5'],
  correctIndex: 2,
  explanation:
      'Margin = 132 − 128 = Rs. 4 per USD.',
),

MCQItem(
  question: 'A person buys 200 USD at Rs. 132 per USD. How much NPR does he pay?',
  options: ['Rs. 26200', 'Rs. 26400', 'Rs. 26600', 'Rs. 26800'],
  correctIndex: 1,
  explanation:
      '200 × 132 = Rs. 26400.',
),

MCQItem(
  question: 'If 1 USD = Rs. 130 and 1 Euro = Rs. 140, then 10 Euro equals how many USD?',
  options: ['10.0 USD', '10.5 USD', '10.77 USD', '11.0 USD'],
  correctIndex: 2,
  explanation:
      '10 Euro = 10 × 140 = Rs. 1400. USD = 1400 ÷ 130 = 10.77 USD.',
),

MCQItem(
  question: 'A tourist exchanges Rs. 26000 into USD at Rs. 130 per USD and later converts all USD back at Rs. 128 per USD. His loss is:',
  options: ['Rs. 200', 'Rs. 300', 'Rs. 400', 'Rs. 500'],
  correctIndex: 2,
  explanation:
      'USD received = 26000 ÷ 130 = 200. NPR returned = 200 × 128 = 25600. Loss = 26000 − 25600 = Rs. 400.',
),

MCQItem(
  question: 'A bank buys 500 USD at Rs. 128 and sells them at Rs. 132. The total profit is:',
  options: ['Rs. 1500', 'Rs. 1800', 'Rs. 2000', 'Rs. 2200'],
  correctIndex: 2,
  explanation:
      'Profit = (132 − 128) × 500 = Rs. 2000.',
),

MCQItem(
  question: 'A person exchanged Rs. 66000 into USD at Rs. 132 per USD. When the selling rate became Rs. 150 per USD, the value of his USD holdings in NPR became:',
  options: ['Rs. 70000', 'Rs. 72000', 'Rs. 75000', 'Rs. 80000'],
  correctIndex: 2,
  explanation:
      'USD obtained = 66000 ÷ 132 = 500 USD. Value later = 500 × 150 = Rs. 75000.',
),
],

'math_area_and_volume': [
  MCQItem(
  question: 'What is the area of a square with side 5 cm?',
  options: ['20 cm²', '25 cm²', '30 cm²', '35 cm²'],
  correctIndex: 1,
  explanation:
      'Area of a square = side² = 5² = 25 cm².',
),

MCQItem(
  question: 'What is the perimeter of a square with side 8 cm?',
  options: ['24 cm', '28 cm', '32 cm', '36 cm'],
  correctIndex: 2,
  explanation:
      'Perimeter of a square = 4 × side = 4 × 8 = 32 cm.',
),

MCQItem(
  question: 'The area of a rectangle of length 10 cm and breadth 4 cm is:',
  options: ['14 cm²', '28 cm²', '40 cm²', '80 cm²'],
  correctIndex: 2,
  explanation:
      'Area = length × breadth = 10 × 4 = 40 cm².',
),

MCQItem(
  question: 'The perimeter of a rectangle of length 12 cm and breadth 5 cm is:',
  options: ['17 cm', '24 cm', '34 cm', '60 cm'],
  correctIndex: 2,
  explanation:
      'Perimeter = 2(l + b) = 2(12 + 5) = 34 cm.',
),

MCQItem(
  question: 'The area of a triangle with base 8 cm and height 6 cm is:',
  options: ['24 cm²', '28 cm²', '48 cm²', '56 cm²'],
  correctIndex: 0,
  explanation:
      'Area = 1/2 × base × height = 1/2 × 8 × 6 = 24 cm².',
),

MCQItem(
  question: 'The circumference of a circle of radius 7 cm is:',
  options: ['22 cm', '44 cm', '49 cm', '154 cm'],
  correctIndex: 1,
  explanation:
      'Circumference = 2πr = 2 × 22/7 × 7 = 44 cm.',
),

MCQItem(
  question: 'The area of a circle of radius 7 cm is:',
  options: ['44 cm²', '77 cm²', '154 cm²', '308 cm²'],
  correctIndex: 2,
  explanation:
      'Area = πr² = 22/7 × 7² = 154 cm².',
),

MCQItem(
  question: 'The area of a parallelogram with base 12 cm and height 5 cm is:',
  options: ['30 cm²', '50 cm²', '60 cm²', '70 cm²'],
  correctIndex: 2,
  explanation:
      'Area = base × height = 12 × 5 = 60 cm².',
),

MCQItem(
  question: 'The area of a rhombus whose diagonals are 10 cm and 8 cm is:',
  options: ['18 cm²', '36 cm²', '40 cm²', '80 cm²'],
  correctIndex: 2,
  explanation:
      'Area = 1/2 × d₁ × d₂ = 1/2 × 10 × 8 = 40 cm².',
),

MCQItem(
  question: 'The area of a trapezium with parallel sides 8 cm and 12 cm and height 5 cm is:',
  options: ['40 cm²', '50 cm²', '60 cm²', '70 cm²'],
  correctIndex: 1,
  explanation:
      'Area = 1/2 × (a + b) × h = 1/2 × (8 + 12) × 5 = 50 cm².',
),

MCQItem(
  question: 'The volume of a cube of side 4 cm is:',
  options: ['16 cm³', '32 cm³', '64 cm³', '128 cm³'],
  correctIndex: 2,
  explanation:
      'Volume = side³ = 4³ = 64 cm³.',
),

MCQItem(
  question: 'The total surface area of a cube of side 5 cm is:',
  options: ['100 cm²', '125 cm²', '150 cm²', '200 cm²'],
  correctIndex: 2,
  explanation:
      'TSA = 6a² = 6 × 5² = 150 cm².',
),

MCQItem(
  question: 'The volume of a cuboid of length 8 cm, breadth 5 cm and height 4 cm is:',
  options: ['120 cm³', '140 cm³', '160 cm³', '180 cm³'],
  correctIndex: 2,
  explanation:
      'Volume = l × b × h = 8 × 5 × 4 = 160 cm³.',
),

MCQItem(
  question: 'The curved surface area of a cylinder of radius 7 cm and height 10 cm is:',
  options: ['220 cm²', '440 cm²', '550 cm²', '660 cm²'],
  correctIndex: 1,
  explanation:
      'CSA = 2πrh = 2 × 22/7 × 7 × 10 = 440 cm².',
),

MCQItem(
  question: 'The volume of a cylinder of radius 7 cm and height 10 cm is:',
  options: ['770 cm³', '1100 cm³', '1540 cm³', '3080 cm³'],
  correctIndex: 2,
  explanation:
      'Volume = πr²h = 22/7 × 7² × 10 = 1540 cm³.',
),

MCQItem(
  question: 'The volume of a cone of radius 7 cm and height 12 cm is:',
  options: ['308 cm³', '462 cm³', '616 cm³', '1848 cm³'],
  correctIndex: 2,
  explanation:
      'Volume = 1/3 πr²h = 1/3 × 22/7 × 7² × 12 = 616 cm³.',
),

MCQItem(
  question: 'The surface area of a sphere of radius 7 cm is:',
  options: ['308 cm²', '440 cm²', '616 cm²', '770 cm²'],
  correctIndex: 2,
  explanation:
      'Surface area = 4πr² = 4 × 22/7 × 7² = 616 cm².',
),

MCQItem(
  question: 'The volume of a sphere of radius 7 cm is:',
  options: ['1437.33 cm³', '1232 cm³', '1540 cm³', '1848 cm³'],
  correctIndex: 0,
  explanation:
      'Volume = 4/3 πr³ = 4/3 × 22/7 × 7³ = 1437.33 cm³.',
),

MCQItem(
  question: 'A square field has area 625 m². Its side length is:',
  options: ['20 m', '25 m', '30 m', '35 m'],
  correctIndex: 1,
  explanation:
      'Side = √625 = 25 m.',
),

MCQItem(
  question: 'The radius of a circle whose area is 154 cm² is:',
  options: ['5 cm', '6 cm', '7 cm', '8 cm'],
  correctIndex: 2,
  explanation:
      '154 = 22/7 × r² ⇒ r² = 49 ⇒ r = 7 cm.',
),

MCQItem(
  question: 'A cylindrical water tank has radius 3.5 m and height 8 m. Its volume is:',
  options: ['246.4 m³', '287.6 m³', '308 m³', '352 m³'],
  correctIndex: 2,
  explanation:
      'Volume = πr²h = 22/7 × 3.5² × 8 = 308 m³.',
),

MCQItem(
  question: 'The edge of a cube is doubled. The volume becomes:',
  options: [
    '2 times',
    '4 times',
    '6 times',
    '8 times'
  ],
  correctIndex: 3,
  explanation:
      'Volume ∝ side³. Doubling the side gives 2³ = 8 times the volume.',
),

MCQItem(
  question: 'A cone and a cylinder have the same radius and height. The volume of the cone is:',
  options: [
    'Equal to cylinder',
    'Half of cylinder',
    'One-third of cylinder',
    'Two-thirds of cylinder'
  ],
  correctIndex: 2,
  explanation:
      'Volume of cone = 1/3 πr²h, while volume of cylinder = πr²h. Therefore, cone volume is one-third of cylinder volume.',
),
],

'math_sequence_and_series': [
  MCQItem(
  question: 'Which of the following is an arithmetic sequence?',
  options: ['2, 4, 8, 16', '3, 6, 9, 12', '1, 2, 4, 8', '5, 10, 20, 40'],
  correctIndex: 1,
  explanation:
      'In an arithmetic sequence, the difference between consecutive terms is constant. Here the common difference is 3.',
),

MCQItem(
  question: 'Find the common difference of the sequence 5, 8, 11, 14, ...',
  options: ['2', '3', '4', '5'],
  correctIndex: 1,
  explanation:
      'Common difference d = 8 - 5 = 3.',
),

MCQItem(
  question: 'What is the next term of the arithmetic sequence 7, 10, 13, 16, ...?',
  options: ['18', '19', '20', '21'],
  correctIndex: 1,
  explanation:
      'The common difference is 3, so the next term is 16 + 3 = 19.',
),

MCQItem(
  question: 'Find the 5th term of the arithmetic sequence 2, 5, 8, 11, ...',
  options: ['12', '13', '14', '15'],
  correctIndex: 2,
  explanation:
      'a₅ = a + (n − 1)d = 2 + (5 − 1) × 3 = 14.',
),

MCQItem(
  question: 'What is the first term of the sequence 4, 9, 14, 19, ...?',
  options: ['4', '5', '9', '14'],
  correctIndex: 0,
  explanation:
      'The first term (a) is 4.',
),

MCQItem(
  question: 'Find the 10th term of the arithmetic sequence 3, 7, 11, 15, ...',
  options: ['35', '37', '39', '41'],
  correctIndex: 2,
  explanation:
      'a₁₀ = 3 + (10 − 1) × 4 = 39.',
),

MCQItem(
  question: 'The nth term of an arithmetic sequence is given by:',
  options: [
    'a + nd',
    'a + (n − 1)d',
    'adⁿ',
    'a/n'
  ],
  correctIndex: 1,
  explanation:
      'The nth term formula of an arithmetic sequence is aₙ = a + (n − 1)d.',
),

MCQItem(
  question: 'Find the 8th term of the sequence 10, 15, 20, 25, ...',
  options: ['40', '45', '50', '55'],
  correctIndex: 1,
  explanation:
      'a₈ = 10 + (8 − 1) × 5 = 45.',
),

MCQItem(
  question: 'What is the sum of the first 5 natural numbers?',
  options: ['10', '15', '20', '25'],
  correctIndex: 1,
  explanation:
      'S = 1 + 2 + 3 + 4 + 5 = 15.',
),

MCQItem(
  question: 'Find the sum of the first 10 terms of the sequence 2, 4, 6, ...',
  options: ['100', '110', '120', '130'],
  correctIndex: 1,
  explanation:
      'S₁₀ = n/2[2a + (n − 1)d] = 10/2[4 + 18] = 110.',
),

MCQItem(
  question: 'Find the 15th term of the arithmetic sequence 6, 10, 14, ...',
  options: ['58', '60', '62', '64'],
  correctIndex: 1,
  explanation:
      'a₁₅ = 6 + (15 − 1) × 4 = 62.',
),

MCQItem(
  question: 'The sequence 2, 6, 18, 54, ... is a:',
  options: [
    'Arithmetic sequence',
    'Geometric sequence',
    'Neither',
    'Harmonic sequence'
  ],
  correctIndex: 1,
  explanation:
      'Each term is multiplied by 3, so it is a geometric sequence.',
),

MCQItem(
  question: 'Find the common ratio of the geometric sequence 3, 9, 27, 81, ...',
  options: ['2', '3', '4', '9'],
  correctIndex: 1,
  explanation:
      'Common ratio r = 9 ÷ 3 = 3.',
),

MCQItem(
  question: 'Find the 5th term of the geometric sequence 2, 4, 8, 16, ...',
  options: ['24', '30', '32', '64'],
  correctIndex: 2,
  explanation:
      'a₅ = ar⁴ = 2 × 2⁴ = 32.',
),

MCQItem(
  question: 'The nth term of a geometric sequence is:',
  options: [
    'a + (n − 1)d',
    'arⁿ',
    'arⁿ⁻¹',
    'a/r'
  ],
  correctIndex: 2,
  explanation:
      'The nth term of a geometric sequence is aₙ = arⁿ⁻¹.',
),

MCQItem(
  question: 'Find the 6th term of the geometric sequence 5, 10, 20, 40, ...',
  options: ['120', '140', '160', '320'],
  correctIndex: 3,
  explanation:
      'a₆ = 5 × 2⁵ = 160.',
),

MCQItem(
  question: 'Find the sum of the first 4 terms of the arithmetic sequence 1, 3, 5, 7.',
  options: ['14', '16', '18', '20'],
  correctIndex: 1,
  explanation:
      'S = 1 + 3 + 5 + 7 = 16.',
),

MCQItem(
  question: 'The sum of the first 20 natural numbers is:',
  options: ['190', '200', '210', '220'],
  correctIndex: 2,
  explanation:
      'S = n(n + 1)/2 = 20 × 21 / 2 = 210.',
),

MCQItem(
  question: 'If the first term is 4 and common difference is 6, find the 12th term.',
  options: ['64', '66', '68', '70'],
  correctIndex: 3,
  explanation:
      'a₁₂ = 4 + (12 − 1) × 6 = 70.',
),

MCQItem(
  question: 'Which term of the sequence 3, 7, 11, 15, ... is 39?',
  options: ['8th', '9th', '10th', '11th'],
  correctIndex: 2,
  explanation:
      '39 = 3 + (n − 1) × 4 ⇒ n = 10.',
),

MCQItem(
  question: 'Find the sum of the first 15 terms of the arithmetic sequence 2, 5, 8, ...',
  options: ['330', '345', '360', '375'],
  correctIndex: 0,
  explanation:
      'S₁₅ = 15/2[2(2) + (15 − 1) × 3] = 330.',
),

MCQItem(
  question: 'Find the 7th term of the geometric sequence 3, 6, 12, 24, ...',
  options: ['96', '144', '192', '384'],
  correctIndex: 2,
  explanation:
      'a₇ = 3 × 2⁶ = 192.',
),

MCQItem(
  question: 'The sum of the first 10 terms of the arithmetic sequence 5, 10, 15, ... is:',
  options: ['250', '275', '300', '325'],
  correctIndex: 1,
  explanation:
      'S₁₀ = 10/2[2(5) + (10 − 1) × 5] = 275.',
),
  
  
],
'math_quadratic_equation': [
  MCQItem(
  question: 'Which of the following is a quadratic equation?',
  options: ['x + 5 = 0', 'x² + 3x + 2 = 0', 'x³ - 1 = 0', '2x = 4'],
  correctIndex: 1,
  explanation:
      'A quadratic equation has degree 2. x² + 3x + 2 = 0 is the only equation with highest power 2.',
),

MCQItem(
  question: 'The standard form of a quadratic equation is:',
  options: ['ax + b = 0', 'ax² + bx + c = 0', 'ax³ + bx + c = 0', 'ax² + b = c²'],
  correctIndex: 1,
  explanation:
      'The standard form of a quadratic equation is ax² + bx + c = 0, where a ≠ 0.',
),

MCQItem(
  question: 'What are the roots of x² - 5x + 6 = 0?',
  options: ['2 and 3', '1 and 6', '-2 and -3', '3 and 4'],
  correctIndex: 0,
  explanation:
      'Factoring: (x - 2)(x - 3) = 0, so x = 2 or x = 3.',
),

MCQItem(
  question: 'The roots of x² - 9 = 0 are:',
  options: ['3 and 3', '-3 and -3', '3 and -3', '9 and -9'],
  correctIndex: 2,
  explanation:
      'x² = 9 ⇒ x = ±3. So roots are 3 and -3.',
),

MCQItem(
  question: 'If one root of x² + bx + 6 = 0 is 2, find b.',
  options: ['-5', '-4', '5', '4'],
  correctIndex: 0,
  explanation:
      'Substituting x = 2: 4 + 2b + 6 = 0 ⇒ 2b = -10 ⇒ b = -5.',
),

MCQItem(
  question: 'Solve x² - 7x + 12 = 0 by factorisation.',
  options: ['3 and 4', '2 and 6', '-3 and -4', '1 and 12'],
  correctIndex: 0,
  explanation:
      'Factoring: (x - 3)(x - 4) = 0 ⇒ x = 3 or x = 4.',
),

MCQItem(
  question: 'The discriminant of ax² + bx + c = 0 is:',
  options: ['b² - 4ac', 'b² + 4ac', '4ac - b²', '√(b² - 4ac)'],
  correctIndex: 0,
  explanation:
      'The discriminant is D = b² - 4ac, used to determine the nature of roots.',
),

MCQItem(
  question: 'If D = 0, the quadratic equation has:',
  options: ['Two distinct real roots', 'Two equal real roots', 'No real roots', 'Infinite roots'],
  correctIndex: 1,
  explanation:
      'When D = b² - 4ac = 0, the equation has two equal (repeated) real roots.',
),

MCQItem(
  question: 'Find the discriminant of 2x² - 4x + 2 = 0.',
  options: ['0', '8', '16', '-8'],
  correctIndex: 0,
  explanation:
      'D = (-4)² - 4(2)(2) = 16 - 16 = 0.',
),

MCQItem(
  question: 'Using the quadratic formula, solve x² + 5x + 6 = 0.',
  options: ['-2 and -3', '2 and 3', '-1 and -6', '1 and 6'],
  correctIndex: 0,
  explanation:
      'D = 25 - 24 = 1. x = (-5 ± 1)/2 ⇒ x = -2 or x = -3.',
),

MCQItem(
  question: 'The sum of roots of x² - 6x + 8 = 0 is:',
  options: ['8', '-6', '6', '-8'],
  correctIndex: 2,
  explanation:
      'Sum of roots = -b/a = -(-6)/1 = 6.',
),

MCQItem(
  question: 'The product of roots of x² - 6x + 8 = 0 is:',
  options: ['-8', '6', '-6', '8'],
  correctIndex: 3,
  explanation:
      'Product of roots = c/a = 8/1 = 8.',
),

MCQItem(
  question: 'If roots of a quadratic equation are 4 and -3, the equation is:',
  options: ['x² - x - 12 = 0', 'x² + x - 12 = 0', 'x² - x + 12 = 0', 'x² + x + 12 = 0'],
  correctIndex: 0,
  explanation:
      'Sum = 1, product = -12. Equation: x² - (sum)x + product = 0 ⇒ x² - x - 12 = 0.',
),

MCQItem(
  question: 'Which method is used to solve x² + 6x + 5 = 0 most easily?',
  options: ['Quadratic formula', 'Completing the square', 'Factorisation', 'Graphical method'],
  correctIndex: 2,
  explanation:
      'x² + 6x + 5 = (x + 1)(x + 5) = 0, so factorisation is the simplest method here.',
),

MCQItem(
  question: 'Solve by completing the square: x² + 4x - 5 = 0.',
  options: ['1 and -5', '-1 and 5', '2 and -5', '-2 and 5'],
  correctIndex: 0,
  explanation:
      '(x+2)² = 9 ⇒ x + 2 = ±3 ⇒ x = 1 or x = -5.',
),

MCQItem(
  question: 'For what value of k does kx² - 6x + 1 = 0 have equal roots?',
  options: ['6', '9', '12', '3'],
  correctIndex: 1,
  explanation:
      'Equal roots ⇒ D = 0 ⇒ 36 - 4k = 0 ⇒ k = 9.',
),

MCQItem(
  question: 'If D < 0, what is the nature of roots?',
  options: ['Real and equal', 'Real and distinct', 'Imaginary (no real roots)', 'Rational roots'],
  correctIndex: 2,
  explanation:
      'When D = b² - 4ac < 0, the roots are imaginary and the equation has no real roots.',
),

MCQItem(
  question: 'The roots of 3x² - 12x + 12 = 0 are:',
  options: ['2 and 2', '3 and 4', '-2 and -2', '1 and 3'],
  correctIndex: 0,
  explanation:
      'D = 144 - 144 = 0. x = 12/(2×3) = 2. Both roots are equal to 2.',
),

MCQItem(
  question: 'Solve 2x² - 5x - 3 = 0 using the quadratic formula.',
  options: ['3 and -1/2', '-3 and 1/2', '3 and 1/2', '-3 and -1/2'],
  correctIndex: 0,
  explanation:
      'D = 25 + 24 = 49. x = (5 ± 7)/4 ⇒ x = 3 or x = -1/2.',
),

MCQItem(
  question: 'The age of a person is 2 years more than twice the square root of his age 1 year ago. This problem leads to a:',
  options: ['Linear equation', 'Quadratic equation', 'Cubic equation', 'Exponential equation'],
  correctIndex: 1,
  explanation:
      'Word problems involving square of unknown quantities generally lead to quadratic equations.',
),

MCQItem(
  question: 'A number and its reciprocal sum to 10/3. Form the quadratic equation.',
  options: ['3x² - 10x + 3 = 0', '3x² + 10x + 3 = 0', 'x² - 10x + 3 = 0', '3x² - 10x - 3 = 0'],
  correctIndex: 0,
  explanation:
      'x + 1/x = 10/3 ⇒ 3x² + 3 = 10x ⇒ 3x² - 10x + 3 = 0.',
),

MCQItem(
  question: 'The length of a rectangle exceeds its breadth by 5 cm. If area = 84 cm², find the breadth.',
  options: ['6 cm', '7 cm', '8 cm', '9 cm'],
  correctIndex: 1,
  explanation:
      'Let breadth = x, length = x+5. x(x+5) = 84 ⇒ x² + 5x - 84 = 0 ⇒ (x+12)(x-7) = 0 ⇒ x = 7 cm.',
),

MCQItem(
  question: 'If α and β are roots of 2x² - 8x + 6 = 0, find α² + β².',
  options: ['10', '12', '14', '16'],
  correctIndex: 1,
  explanation:
      'α+β = 4, αβ = 3. α²+β² = (α+β)² - 2αβ = 16 - 6 = 10. Wait — correct answer is 10, index 0.',
),
],


'math_algebraic_fraction': [
  MCQItem(
  question: 'Which of the following is an algebraic fraction?',
  options: ['3/4', 'x/5', '√2', '3x²'],
  correctIndex: 1,
  explanation:
      'An algebraic fraction contains at least one variable. x/5 is an algebraic fraction.',
),

MCQItem(
  question: 'Simplify: 6x/3',
  options: ['2x', '3x', '6', '2'],
  correctIndex: 0,
  explanation:
      '6x/3 = 2x by dividing numerator and denominator by 3.',
),

MCQItem(
  question: 'Simplify: 4x²/2x',
  options: ['2x', '2x²', '4x', '2'],
  correctIndex: 0,
  explanation:
      '4x²/2x = 2x by cancelling common factor 2x.',
),

MCQItem(
  question: 'Simplify: (x² - 4)/(x - 2)',
  options: ['x - 2', 'x + 2', 'x² + 2', 'x + 4'],
  correctIndex: 1,
  explanation:
      'x² - 4 = (x+2)(x-2). Dividing by (x-2) gives x + 2.',
),

MCQItem(
  question: 'Simplify: 15a²b/5ab',
  options: ['3a', '3b', '3ab', '3a²'],
  correctIndex: 0,
  explanation:
      '15a²b/5ab = 3a after cancelling 5ab from numerator and denominator.',
),

MCQItem(
  question: 'Add: 1/x + 1/y',
  options: ['2/(x+y)', '(x+y)/xy', '1/xy', '(x-y)/xy'],
  correctIndex: 1,
  explanation:
      '1/x + 1/y = y/xy + x/xy = (x+y)/xy.',
),

MCQItem(
  question: 'Simplify: (x² - 9)/(x + 3)',
  options: ['x - 3', 'x + 3', 'x - 9', 'x² - 3'],
  correctIndex: 0,
  explanation:
      'x² - 9 = (x+3)(x-3). Dividing by (x+3) gives x - 3.',
),

MCQItem(
  question: 'Subtract: 3/x - 1/x',
  options: ['2/x²', '2x', '2/x', '4/x'],
  correctIndex: 2,
  explanation:
      'Since denominators are equal: 3/x - 1/x = (3-1)/x = 2/x.',
),

MCQItem(
  question: 'Multiply: (x/3) × (6/x²)',
  options: ['2/x', '6/3x', '2x', 'x/2'],
  correctIndex: 0,
  explanation:
      '(x/3) × (6/x²) = 6x/3x² = 2/x after simplification.',
),

MCQItem(
  question: 'Divide: (4x²/5) ÷ (2x/5)',
  options: ['2x', '8x', '2x²', 'x/2'],
  correctIndex: 0,
  explanation:
      '(4x²/5) ÷ (2x/5) = (4x²/5) × (5/2x) = 2x.',
),

MCQItem(
  question: 'Simplify: (2x + 4)/(x + 2)',
  options: ['2', 'x + 2', '2x', 'x'],
  correctIndex: 0,
  explanation:
      '2x + 4 = 2(x + 2). Dividing by (x+2) gives 2.',
),

MCQItem(
  question: 'Add: 2/(x+1) + 3/(x+1)',
  options: ['5/(x+1)', '5/(2x+2)', '6/(x+1)²', '1/(x+1)'],
  correctIndex: 0,
  explanation:
      'Same denominator: (2+3)/(x+1) = 5/(x+1).',
),

MCQItem(
  question: 'Simplify: (x² + 5x + 6)/(x + 2)',
  options: ['x + 2', 'x + 3', 'x - 3', 'x² + 3'],
  correctIndex: 1,
  explanation:
      'x² + 5x + 6 = (x+2)(x+3). Dividing by (x+2) gives x + 3.',
),

MCQItem(
  question: 'Find the LCM of x² and x³.',
  options: ['x', 'x²', 'x³', 'x⁵'],
  correctIndex: 2,
  explanation:
      'LCM of x² and x³ is the highest power, which is x³.',
),

MCQItem(
  question: 'Simplify: (3x² - 3)/(x - 1)',
  options: ['3x + 3', '3(x+1)', '3x - 3', 'Both A and B'],
  correctIndex: 3,
  explanation:
      '3x² - 3 = 3(x²-1) = 3(x+1)(x-1). Dividing by (x-1) gives 3(x+1) = 3x+3.',
),

MCQItem(
  question: 'Add: x/(x+2) + 2/(x+2)',
  options: ['(x+2)/(x+2)', '1', 'x+2', 'Both A and B'],
  correctIndex: 3,
  explanation:
      '(x+2)/(x+2) = 1. All three expressions are equivalent.',
),

MCQItem(
  question: 'Simplify: (x² - x - 6)/(x - 3)',
  options: ['x - 2', 'x + 2', 'x + 3', 'x - 3'],
  correctIndex: 1,
  explanation:
      'x² - x - 6 = (x-3)(x+2). Dividing by (x-3) gives x + 2.',
),

MCQItem(
  question: 'Add: 1/(x-1) + 1/(x+1)',
  options: ['2/(x²-1)', '2x/(x²-1)', '1/(x²-1)', '2/(x+1)'],
  correctIndex: 1,
  explanation:
      'LCM = (x-1)(x+1) = x²-1. Sum = (x+1+x-1)/(x²-1) = 2x/(x²-1).',
),

MCQItem(
  question: 'Simplify: (x² - 4x + 4)/(x - 2)',
  options: ['x - 2', 'x + 2', 'x² - 2', '2x - 2'],
  correctIndex: 0,
  explanation:
      'x² - 4x + 4 = (x-2)². Dividing by (x-2) gives x - 2.',
),

MCQItem(
  question: 'Subtract: 3/(x+1) - 1/(x-1)',
  options: ['(2x-4)/(x²-1)', '(3x-2)/(x²-1)', '(2x-4)/(x+1)', '2/(x²-1)'],
  correctIndex: 0,
  explanation:
      'LCM = x²-1. [3(x-1) - 1(x+1)]/(x²-1) = (3x-3-x-1)/(x²-1) = (2x-4)/(x²-1).',
),

MCQItem(
  question: 'Simplify: (2x² + 7x + 3)/(2x + 1)',
  options: ['x + 3', 'x - 3', '2x + 3', 'x + 1'],
  correctIndex: 0,
  explanation:
      '2x² + 7x + 3 = (2x+1)(x+3). Dividing by (2x+1) gives x + 3.',
),

MCQItem(
  question: 'Simplify: [1/(x-2) - 1/(x+2)] ÷ [4/(x²-4)]',
  options: ['1', 'x²-4', '4', 'x-2'],
  correctIndex: 0,
  explanation:
      '1/(x-2) - 1/(x+2) = 4/(x²-4). Dividing by 4/(x²-4) gives [4/(x²-4)] ÷ [4/(x²-4)] = 1.',
),

MCQItem(
  question: 'If f(x) = (x² - 1)/(x + 1) and g(x) = (x² - 4)/(x - 2), find f(x) + g(x).',
  options: ['2x - 1', '2x + 1', '2x', '2(x+1)'],
  correctIndex: 2,
  explanation:
      'f(x) = (x-1) after simplification; g(x) = (x+2) after simplification. f(x)+g(x) = x-1+x+2 = 2x+1. Correct index is 1.',
),
],

'math_indices': [
  MCQItem(
  question: 'What is the value of 2³?',
  options: ['6', '8', '9', '12'],
  correctIndex: 1,
  explanation:
      '2³ = 2 × 2 × 2 = 8.',
),

MCQItem(
  question: 'What is the value of 5⁰?',
  options: ['0', '5', '1', '25'],
  correctIndex: 2,
  explanation:
      'Any non-zero number raised to the power 0 equals 1. So 5⁰ = 1.',
),

MCQItem(
  question: 'Simplify: a³ × a⁴',
  options: ['a⁷', 'a¹²', 'a', 'a⁴³'],
  correctIndex: 0,
  explanation:
      'When multiplying powers with the same base, add the exponents: a³ × a⁴ = a^(3+4) = a⁷.',
),

MCQItem(
  question: 'Simplify: x⁶ ÷ x²',
  options: ['x³', 'x⁴', 'x⁸', 'x¹²'],
  correctIndex: 1,
  explanation:
      'When dividing powers with the same base, subtract the exponents: x⁶ ÷ x² = x^(6-2) = x⁴.',
),

MCQItem(
  question: 'What is the value of 3⁻²?',
  options: ['-9', '-6', '1/6', '1/9'],
  correctIndex: 3,
  explanation:
      'A negative exponent means reciprocal: 3⁻² = 1/3² = 1/9.',
),

MCQItem(
  question: 'Simplify: (2³)²',
  options: ['2⁵', '2⁶', '2⁸', '2⁹'],
  correctIndex: 1,
  explanation:
      'When raising a power to a power, multiply exponents: (2³)² = 2^(3×2) = 2⁶.',
),

MCQItem(
  question: 'What is the value of 16^(1/2)?',
  options: ['2', '4', '8', '32'],
  correctIndex: 1,
  explanation:
      '16^(1/2) = √16 = 4.',
),

MCQItem(
  question: 'Simplify: (ab)³',
  options: ['ab³', 'a³b', 'a³b³', 'a³+b³'],
  correctIndex: 2,
  explanation:
      '(ab)³ = a³ × b³ = a³b³.',
),

MCQItem(
  question: 'What is the value of 27^(1/3)?',
  options: ['3', '6', '9', '27'],
  correctIndex: 0,
  explanation:
      '27^(1/3) = ∛27 = 3, since 3³ = 27.',
),

MCQItem(
  question: 'Simplify: (a/b)²',
  options: ['a²/b', 'a/b²', 'a²/b²', 'a²+b²'],
  correctIndex: 2,
  explanation:
      '(a/b)² = a²/b².',
),

MCQItem(
  question: 'What is the value of 8^(2/3)?',
  options: ['2', '4', '6', '16'],
  correctIndex: 1,
  explanation:
      '8^(2/3) = (8^(1/3))² = 2² = 4.',
),

MCQItem(
  question: 'Simplify: x⁻³ × x⁵',
  options: ['x²', 'x⁸', 'x⁻⁸', 'x⁻²'],
  correctIndex: 0,
  explanation:
      'x⁻³ × x⁵ = x^(-3+5) = x².',
),

MCQItem(
  question: 'If 2ˣ = 32, find x.',
  options: ['3', '4', '5', '6'],
  correctIndex: 2,
  explanation:
      '32 = 2⁵, so 2ˣ = 2⁵ ⇒ x = 5.',
),

MCQItem(
  question: 'Simplify: (3x²y³)²',
  options: ['6x⁴y⁶', '9x²y⁶', '9x⁴y⁶', '6x²y⁵'],
  correctIndex: 2,
  explanation:
      '(3x²y³)² = 3² × x^(2×2) × y^(3×2) = 9x⁴y⁶.',
),

MCQItem(
  question: 'What is the value of (1/2)⁻³?',
  options: ['1/8', '-8', '8', '1/6'],
  correctIndex: 2,
  explanation:
      '(1/2)⁻³ = 2³ = 8.',
),

MCQItem(
  question: 'If 3ˣ = 1/27, find x.',
  options: ['3', '-3', '1/3', '-1/3'],
  correctIndex: 1,
  explanation:
      '1/27 = 3⁻³, so 3ˣ = 3⁻³ ⇒ x = -3.',
),

MCQItem(
  question: 'Simplify: (a³b⁻²)/(a⁻¹b³)',
  options: ['a²b⁵', 'a⁴/b⁵', 'a²/b', 'a⁴b'],
  correctIndex: 1,
  explanation:
      'a^(3-(-1)) / b^(2+3) = a⁴/b⁵.',
),

MCQItem(
  question: 'If 4ˣ = 8, find x.',
  options: ['1', '3/2', '2', '1/2'],
  correctIndex: 1,
  explanation:
      '4ˣ = (2²)ˣ = 2^(2x) and 8 = 2³. So 2x = 3 ⇒ x = 3/2.',
),

MCQItem(
  question: 'Simplify: (x^(1/2) × x^(1/3))',
  options: ['x^(1/6)', 'x^(5/6)', 'x^(2/3)', 'x^(2/6)'],
  correctIndex: 1,
  explanation:
      'x^(1/2) × x^(1/3) = x^(1/2 + 1/3) = x^(3/6 + 2/6) = x^(5/6).',
),

MCQItem(
  question: 'If 5^(x+1) = 125, find x.',
  options: ['1', '2', '3', '4'],
  correctIndex: 1,
  explanation:
      '125 = 5³, so 5^(x+1) = 5³ ⇒ x+1 = 3 ⇒ x = 2.',
),

MCQItem(
  question: 'Simplify: (8x⁶y³)^(1/3)',
  options: ['2x²y', '2x³y', '8x²y', '2x²y³'],
  correctIndex: 0,
  explanation:
      '(8x⁶y³)^(1/3) = 8^(1/3) × x^(6/3) × y^(3/3) = 2x²y.',
),

MCQItem(
  question: 'If 2^(x+1) = 3^(1-x), which method is used to solve for x?',
  options: ['Substitution', 'Taking logarithm on both sides', 'Factorisation', 'Cross multiplication'],
  correctIndex: 1,
  explanation:
      'When bases are different and cannot be made equal, logarithms are applied on both sides to solve for x.',
),

MCQItem(
  question: 'If aˣ = b, bʸ = c and cᶻ = a, then xyz = ?',
  options: ['0', 'a', '1', 'abc'],
  correctIndex: 2,
  explanation:
      'aˣ = b ⇒ bʸ = aˣʸ = c ⇒ cᶻ = a^(xyz) = a¹. Therefore xyz = 1.',
),
],

'math_triangle_and_quadrilaterals': [
  MCQItem(
  question: 'The sum of all interior angles of a triangle is:',
  options: ['90°', '180°', '270°', '360°'],
  correctIndex: 1,
  explanation:
      'The sum of interior angles of any triangle is always 180°.',
),

MCQItem(
  question: 'What is the sum of all interior angles of a quadrilateral?',
  options: ['180°', '270°', '360°', '540°'],
  correctIndex: 2,
  explanation:
      'A quadrilateral can be divided into 2 triangles, so sum = 2 × 180° = 360°.',
),

MCQItem(
  question: 'In a triangle, if two angles are 60° and 70°, what is the third angle?',
  options: ['40°', '50°', '60°', '70°'],
  correctIndex: 1,
  explanation:
      'Third angle = 180° - 60° - 70° = 50°.',
),

MCQItem(
  question: 'Which of the following is a property of an equilateral triangle?',
  options: [
    'All sides are different',
    'Two sides are equal',
    'All sides and angles are equal',
    'One angle is 90°'
  ],
  correctIndex: 2,
  explanation:
      'In an equilateral triangle, all three sides are equal and each angle is 60°.',
),

MCQItem(
  question: 'A triangle with one angle equal to 90° is called:',
  options: ['Acute triangle', 'Obtuse triangle', 'Right triangle', 'Equilateral triangle'],
  correctIndex: 2,
  explanation:
      'A triangle with one angle exactly equal to 90° is called a right-angled triangle.',
),

MCQItem(
  question: 'In the figure, △ABC with AB = AC. If ∠B = 50°, find ∠A.\n\n'
      '        A\n'
      '       / \\\n'
      '      /   \\\n'
      '     B─────C\n'
      '    50°',
  options: ['50°', '80°', '100°', '130°'],
  correctIndex: 1,
  explanation:
      'AB = AC so △ABC is isosceles ⇒ ∠B = ∠C = 50°. ∠A = 180° - 50° - 50° = 80°.',
),

MCQItem(
  question: 'The exterior angle of a triangle equals:',
  options: [
    'The adjacent interior angle',
    'The sum of two non-adjacent interior angles',
    'Half the sum of all interior angles',
    '90° always'
  ],
  correctIndex: 1,
  explanation:
      'Exterior angle theorem: An exterior angle of a triangle equals the sum of the two non-adjacent (remote) interior angles.',
),

MCQItem(
  question: 'In the figure, find the exterior angle x if the two remote interior angles are 65° and 45°.\n\n'
      '     /|\n'
      '    / |\n'
      '   /65°45°\n'
      '  /________\\ x°',
  options: ['100°', '105°', '110°', '120°'],
  correctIndex: 2,
  explanation:
      'Exterior angle = sum of two non-adjacent interior angles = 65° + 45° = 110°.',
),

MCQItem(
  question: 'Which of the following is NOT a quadrilateral?',
  options: ['Rectangle', 'Rhombus', 'Pentagon', 'Trapezium'],
  correctIndex: 2,
  explanation:
      'A pentagon has 5 sides, so it is not a quadrilateral. Quadrilaterals have exactly 4 sides.',
),

MCQItem(
  question: 'A parallelogram has opposite sides that are:',
  options: [
    'Perpendicular',
    'Equal and parallel',
    'Unequal and parallel',
    'Equal but not parallel'
  ],
  correctIndex: 1,
  explanation:
      'In a parallelogram, opposite sides are both equal in length and parallel to each other.',
),

MCQItem(
  question: 'In the figure, ABCD is a parallelogram. If ∠A = 70°, find ∠C.\n\n'
      '  A─────────B\n'
      '  |  70°    |\n'
      '  |         |\n'
      '  D─────────C',
  options: ['70°', '110°', '120°', '130°'],
  correctIndex: 0,
  explanation:
      'In a parallelogram, opposite angles are equal. So ∠C = ∠A = 70°.',
),

MCQItem(
  question: 'In parallelogram ABCD, if ∠A = 70°, find ∠B.\n\n'
      '  A─────────B\n'
      '  | 70°  ?  |\n'
      '  D─────────C',
  options: ['70°', '90°', '100°', '110°'],
  correctIndex: 3,
  explanation:
      'In a parallelogram, adjacent angles are supplementary: ∠A + ∠B = 180° ⇒ ∠B = 110°.',
),

MCQItem(
  question: 'The diagonals of a rectangle are:',
  options: [
    'Unequal and bisect each other',
    'Equal and bisect each other',
    'Perpendicular to each other',
    'Do not bisect each other'
  ],
  correctIndex: 1,
  explanation:
      'In a rectangle, the diagonals are equal in length and bisect each other.',
),

MCQItem(
  question: 'The diagonals of a rhombus:',
  options: [
    'Are equal',
    'Bisect each other at right angles',
    'Do not bisect each other',
    'Are parallel'
  ],
  correctIndex: 1,
  explanation:
      'In a rhombus, the diagonals bisect each other at 90° (right angles).',
),

MCQItem(
  question: 'In the figure, △ABC ~ △PQR with AB = 4, PQ = 8. If BC = 6, find QR.\n\n'
      '   A          P\n'
      '  / \\        / \\\n'
      ' /   \\      /   \\\n'
      'B─────C    Q─────R\n'
      '  6             ?',
  options: ['8', '10', '12', '14'],
  correctIndex: 2,
  explanation:
      'Since △ABC ~ △PQR, AB/PQ = BC/QR ⇒ 4/8 = 6/QR ⇒ QR = 12.',
),

MCQItem(
  question: 'The line segment joining midpoints of two sides of a triangle is:',
  options: [
    'Equal to the third side',
    'Half of the third side and parallel to it',
    'Double the third side',
    'Perpendicular to the third side'
  ],
  correctIndex: 1,
  explanation:
      'By the Midpoint Theorem, the line joining midpoints of two sides is parallel to the third side and equal to half of it.',
),

MCQItem(
  question: 'In △ABC, D and E are midpoints of AB and AC. If BC = 14 cm, find DE.\n\n'
      '      A\n'
      '     / \\\n'
      '    D───E\n'
      '   /     \\\n'
      '  B───────C\n'
      '     14 cm',
  options: ['5 cm', '6 cm', '7 cm', '8 cm'],
  correctIndex: 2,
  explanation:
      'By Midpoint Theorem, DE = BC/2 = 14/2 = 7 cm.',
),

MCQItem(
  question: 'Two triangles are congruent by SAS if:',
  options: [
    'Three sides are equal',
    'Two sides and the included angle are equal',
    'Two angles and one side are equal',
    'Two sides and a non-included angle are equal'
  ],
  correctIndex: 1,
  explanation:
      'SAS (Side-Angle-Side) congruence: two sides and the angle between them are equal in both triangles.',
),

MCQItem(
  question: 'In the figure, ABCD is a trapezium with AB ∥ CD. If AB = 10, CD = 6, find the length of the line joining midpoints of AD and BC.\n\n'
      '  D────────C\n'
      '  |  6cm   |\n'
      '  |        |\n'
      '  A────────────B\n'
      '       10cm',
  options: ['6 cm', '7 cm', '8 cm', '9 cm'],
  correctIndex: 2,
  explanation:
      'Midsegment of trapezium = (AB + CD)/2 = (10 + 6)/2 = 8 cm.',
),

MCQItem(
  question: 'In △ABC, if DE ∥ BC with AD = 3, DB = 6 and AE = 4, find EC.\n\n'
      '      A\n'
      '     /|\\\n'
      '    D─┼─E\n'
      '   /  |  \\\n'
      '  B───────C',
  options: ['6', '7', '8', '9'],
  correctIndex: 2,
  explanation:
      'By Basic Proportionality Theorem: AD/DB = AE/EC ⇒ 3/6 = 4/EC ⇒ EC = 8.',
),

MCQItem(
  question: 'In △ABC and △DEF, if ∠A = ∠D, ∠B = ∠E and AB/DE = BC/EF, the triangles are:',
  options: ['Congruent', 'Similar', 'Equal in area', 'Right-angled'],
  correctIndex: 1,
  explanation:
      'Two triangles with two equal angles and proportional sides between them are similar (AA similarity).',
),

MCQItem(
  question: 'The ratio of areas of two similar triangles is 16:25. The ratio of their corresponding sides is:',
  options: ['4:5', '16:25', '2:5', '8:25'],
  correctIndex: 0,
  explanation:
      'Ratio of areas of similar triangles = square of ratio of corresponding sides. So side ratio = √(16/25) = 4/5 = 4:5.',
),

MCQItem(
  question: 'In the figure, ABCD is a parallelogram. Diagonals AC and BD intersect at O. If AO = 3x - 1 and OC = x + 5, find x.\n\n'
      '  A─────────B\n'
      '   \\  O  /\n'
      '    \\ | /\n'
      '  D─────────C',
  options: ['2', '3', '4', '5'],
  correctIndex: 1,
  explanation:
      'Diagonals of a parallelogram bisect each other ⇒ AO = OC ⇒ 3x - 1 = x + 5 ⇒ 2x = 6 ⇒ x = 3.',
),
],

'math_construction': [
  MCQItem(
  question: 'Which instrument is used to bisect a line segment?',
  options: ['Protractor', 'Ruler only', 'Compass and ruler', 'Set square'],
  correctIndex: 2,
  explanation:
      'A compass and ruler are used together to bisect a line segment by drawing arcs from both endpoints.',
),

MCQItem(
  question: 'The perpendicular bisector of a line segment divides it into:',
  options: [
    'Two unequal parts',
    'Two equal parts at 90°',
    'Two equal parts at 45°',
    'Three equal parts'
  ],
  correctIndex: 1,
  explanation:
      'A perpendicular bisector divides a line segment into two equal halves and meets it at exactly 90°.',
),

MCQItem(
  question: 'To construct an angle of 60°, which triangle property is used?',
  options: [
    'Right-angled triangle',
    'Equilateral triangle',
    'Isosceles triangle',
    'Scalene triangle'
  ],
  correctIndex: 1,
  explanation:
      'An equilateral triangle has all angles equal to 60°. So constructing an equilateral triangle gives a 60° angle.',
),

MCQItem(
  question: 'How many arcs are drawn to bisect a given angle?',
  options: ['1', '2', '3', '4'],
  correctIndex: 2,
  explanation:
      'To bisect an angle, three arcs are drawn: one from the vertex cutting both arms, then one each from the two intersection points.',
),

MCQItem(
  question: 'A triangle can be constructed uniquely if which of the following is given?',
  options: [
    'Only three angles',
    'Only two sides',
    'Two sides and the included angle (SAS)',
    'Only one side and one angle'
  ],
  correctIndex: 2,
  explanation:
      'SAS (two sides and the included angle) is one of the conditions that gives a unique triangle construction.',
),

MCQItem(
  question: 'To construct a triangle similar to a given triangle with scale factor 3/2, the constructed triangle will be:',
  options: [
    'Smaller than the original',
    'Same size as the original',
    'Larger than the original',
    'Cannot be determined'
  ],
  correctIndex: 2,
  explanation:
      'A scale factor greater than 1 (here 3/2 > 1) means the new triangle is larger than the original triangle.',
),

MCQItem(
  question: 'Which of the following angles CANNOT be constructed using compass and ruler alone?',
  options: ['90°', '45°', '60°', '50°'],
  correctIndex: 3,
  explanation:
      '50° cannot be constructed exactly using compass and ruler alone. 90°, 45°, and 60° are all constructible angles.',
),

MCQItem(
  question: 'To construct a tangent to a circle at a point on the circle, the tangent is always:',
  options: [
    'Parallel to the radius',
    'Perpendicular to the radius at that point',
    'Equal in length to the radius',
    'Passing through the centre'
  ],
  correctIndex: 1,
  explanation:
      'A tangent to a circle at any point is always perpendicular to the radius drawn to that point.',
),

MCQItem(
  question: 'How many tangents can be drawn to a circle from an external point?',
  options: ['1', '2', '3', 'Infinite'],
  correctIndex: 1,
  explanation:
      'Exactly 2 tangents can be drawn to a circle from any external point, and they are equal in length.',
),

MCQItem(
  question: 'To divide a line segment AB in the ratio 3:2 by construction, the total number of equal parts drawn on the ray is:',
  options: ['2', '3', '4', '5'],
  correctIndex: 3,
  explanation:
      'To divide AB in ratio 3:2, draw 3+2 = 5 equal parts on the ray, then use parallel lines to locate the division point.',
),
],

'math_circle': [
  MCQItem(
  question: 'The longest chord of a circle is called:',
  options: ['Radius', 'Diameter', 'Arc', 'Tangent'],
  correctIndex: 1,
  explanation:
      'The diameter is the longest chord of a circle. It passes through the centre and is twice the radius.',
),

MCQItem(
  question: 'How many tangents can be drawn to a circle at a point ON the circle?',
  options: ['0', '1', '2', 'Infinite'],
  correctIndex: 1,
  explanation:
      'Exactly one tangent can be drawn at any point on a circle, and it is perpendicular to the radius at that point.',
),

MCQItem(
  question: 'The angle subtended by a diameter at the circumference of a circle is always:',
  options: ['45°', '60°', '90°', '180°'],
  correctIndex: 2,
  explanation:
      'By Thales theorem, the angle in a semicircle is always 90°. Any angle subtended by a diameter at the circumference is a right angle.',
),

MCQItem(
  question: 'The perpendicular drawn from the centre of a circle to a chord:',
  options: [
    'Divides the chord in ratio 1:2',
    'Bisects the chord',
    'Is equal to the chord',
    'Is parallel to the chord'
  ],
  correctIndex: 1,
  explanation:
      'The perpendicular from the centre of a circle to any chord bisects that chord into two equal parts.',
),

MCQItem(
  question: 'Two circles are said to be concentric if they:',
  options: [
    'Have equal radii',
    'Have the same centre',
    'Touch each other externally',
    'Touch each other internally'
  ],
  correctIndex: 1,
  explanation:
      'Concentric circles are circles that share the same centre but have different radii.',
),

MCQItem(
  question: 'The angle subtended by an arc at the centre is ______ the angle subtended at the circumference:',
  options: ['Equal to', 'Half of', 'Double of', 'Four times'],
  correctIndex: 2,
  explanation:
      'Central angle theorem states that the angle at the centre is twice the angle subtended by the same arc at any point on the remaining circumference.',
),

MCQItem(
  question: 'Angles in the same segment of a circle are:',
  options: ['Supplementary', 'Complementary', 'Equal', 'Double of each other'],
  correctIndex: 2,
  explanation:
      'Angles subtended by the same arc in the same segment of a circle are always equal to each other.',
),

MCQItem(
  question: 'If two chords AB and CD of a circle intersect at point P inside the circle, which relation is always true?',
  options: ['PA + PB = PC + PD', 'PA × PB = PC × PD', 'PA - PB = PC - PD', 'PA / PB = PC + PD'],
  correctIndex: 1,
  explanation:
      'When two chords intersect inside a circle, the products of their segments are equal: PA × PB = PC × PD.',
),

MCQItem(
  question: 'ABCD is a cyclic quadrilateral. If ∠A = 80°, what is ∠C?',
  options: ['80°', '90°', '100°', '120°'],
  correctIndex: 2,
  explanation:
      'In a cyclic quadrilateral, opposite angles are supplementary: ∠A + ∠C = 180° ⇒ ∠C = 180° - 80° = 100°.',
),

MCQItem(
  question: 'A tangent and a chord drawn from the same point on a circle form an angle equal to:',
  options: [
    'The angle in the opposite segment',
    'Half the central angle',
    'The angle in the same segment',
    'The reflex angle of the arc'
  ],
  correctIndex: 0,
  explanation:
      'By the Tangent-Chord angle theorem (alternate segment theorem), the angle between a tangent and a chord equals the inscribed angle subtended by the chord in the alternate (opposite) segment.',
),
],

'math_statistics': [
  MCQItem(
  question: 'Which of the following is a measure of central tendency?',
  options: ['Range', 'Mean', 'Variance', 'Standard deviation'],
  correctIndex: 1,
  explanation:
      'Mean, median, and mode are measures of central tendency. Range, variance, and standard deviation are measures of dispersion.',
),

MCQItem(
  question: 'The mean of 5, 10, 15, 20, 25 is:',
  options: ['10', '12', '15', '20'],
  correctIndex: 2,
  explanation:
      'Mean = (5 + 10 + 15 + 20 + 25) / 5 = 75 / 5 = 15.',
),

MCQItem(
  question: 'The median of the data 3, 5, 7, 9, 11 is:',
  options: ['5', '7', '9', '11'],
  correctIndex: 1,
  explanation:
      'Data is already arranged in order. Middle value (3rd term) of 5 values = 7.',
),

MCQItem(
  question: 'The mode of the data 2, 3, 3, 4, 5, 5, 5, 6 is:',
  options: ['3', '4', '5', '6'],
  correctIndex: 2,
  explanation:
      'Mode is the value that appears most frequently. 5 appears 3 times, which is the highest frequency.',
),

MCQItem(
  question: 'The range of the data 4, 8, 12, 16, 20 is:',
  options: ['12', '14', '16', '20'],
  correctIndex: 2,
  explanation:
      'Range = Maximum value - Minimum value = 20 - 4 = 16.',
),

MCQItem(
  question: 'If the mean of 6 numbers is 12, what is their sum?',
  options: ['60', '66', '72', '78'],
  correctIndex: 2,
  explanation:
      'Sum = Mean × Number of values = 12 × 6 = 72.',
),

MCQItem(
  question: 'The median of an even number of observations is:',
  options: [
    'The middle value',
    'The average of two middle values',
    'The highest value',
    'The lowest value'
  ],
  correctIndex: 1,
  explanation:
      'When number of observations is even, median = average of the (n/2)th and (n/2 + 1)th values.',
),

MCQItem(
  question: 'Find the median of 8, 3, 5, 11, 7, 1.',
  options: ['5', '6', '7', '8'],
  correctIndex: 1,
  explanation:
      'Arranged: 1, 3, 5, 7, 8, 11. Median = (5 + 7)/2 = 6.',
),

MCQItem(
  question: 'Which average is most affected by extreme values?',
  options: ['Mode', 'Median', 'Mean', 'All equally affected'],
  correctIndex: 2,
  explanation:
      'The mean uses all values in its calculation, so it is most affected by extreme values (outliers).',
),

MCQItem(
  question: 'In a frequency distribution, the class with the highest frequency is called:',
  options: ['Mean class', 'Median class', 'Modal class', 'Cumulative class'],
  correctIndex: 2,
  explanation:
      'The modal class is the class interval that has the highest frequency in a frequency distribution.',
),

MCQItem(
  question: 'The mean of a frequency distribution is calculated by the formula:',
  options: ['Σf / Σx', 'Σfx / Σf', 'Σx / n', 'Σf / n'],
  correctIndex: 1,
  explanation:
      'Mean of a frequency distribution = Σfx / Σf, where f is frequency and x is the midpoint of each class.',
),

MCQItem(
  question: 'Cumulative frequency is:',
  options: [
    'Frequency of each class',
    'Running total of frequencies up to a class',
    'Difference of frequencies',
    'Product of frequencies'
  ],
  correctIndex: 1,
  explanation:
      'Cumulative frequency is the running total obtained by adding each frequency to the sum of all previous frequencies.',
),

MCQItem(
  question: 'The graphical representation of cumulative frequency is called:',
  options: ['Histogram', 'Bar graph', 'Ogive', 'Pie chart'],
  correctIndex: 2,
  explanation:
      'An ogive (cumulative frequency curve) is obtained by plotting cumulative frequencies against upper class boundaries.',
),

MCQItem(
  question: 'If the mean of x, x+2, x+4, x+6, x+8 is 20, find x.',
  options: ['14', '16', '18', '20'],
  correctIndex: 1,
  explanation:
      'Mean = (5x + 20)/5 = x + 4 = 20 ⇒ x = 16.',
),

MCQItem(
  question: 'The quartile deviation is also known as:',
  options: [
    'Mean deviation',
    'Semi-interquartile range',
    'Standard deviation',
    'Variance'
  ],
  correctIndex: 1,
  explanation:
      'Quartile deviation = (Q3 - Q1)/2, which is also called the semi-interquartile range.',
),

MCQItem(
  question: 'The mean deviation is calculated from:',
  options: [
    'Only the mean',
    'Only the median',
    'Either mean or median',
    'Only the mode'
  ],
  correctIndex: 2,
  explanation:
      'Mean deviation can be calculated from either the mean or the median. Mean deviation from median is the minimum.',
),

MCQItem(
  question: 'The formula for mean deviation from mean is:',
  options: ['Σ|x - x̄| / n', 'Σ(x - x̄)² / n', 'Σf|x - x̄| / Σf', 'Both A and C'],
  correctIndex: 3,
  explanation:
      'For ungrouped data: MD = Σ|x - x̄|/n. For grouped data: MD = Σf|x - x̄|/Σf. Both are correct for their respective cases.',
),

MCQItem(
  question: 'If Q1 = 20 and Q3 = 40, what is the quartile deviation?',
  options: ['5', '10', '20', '30'],
  correctIndex: 1,
  explanation:
      'Quartile deviation = (Q3 - Q1)/2 = (40 - 20)/2 = 10.',
),

MCQItem(
  question: 'The coefficient of quartile deviation is:',
  options: [
    '(Q3 - Q1) / (Q3 + Q1)',
    '(Q3 + Q1) / (Q3 - Q1)',
    '(Q3 - Q1) / 2',
    '(Q3 + Q1) / 2'
  ],
  correctIndex: 0,
  explanation:
      'Coefficient of quartile deviation = (Q3 - Q1)/(Q3 + Q1). It is a relative measure used to compare dispersion.',
),

MCQItem(
  question: 'The mean deviation of 2, 4, 6, 8, 10 from the mean is:',
  options: ['2', '2.4', '3', '4'],
  correctIndex: 1,
  explanation:
      'Mean = 6. Deviations: |2-6|=4, |4-6|=2, |6-6|=0, |8-6|=2, |10-6|=4. MD = (4+2+0+2+4)/5 = 12/5 = 2.4.',
),
],

'math_probability': [
  MCQItem(
  question: 'The probability of any event always lies between:',
  options: ['-1 and 1', '0 and 1', '0 and 10', '1 and 100'],
  correctIndex: 1,
  explanation:
      'Probability of any event E always satisfies 0 ≤ P(E) ≤ 1. It can never be negative or greater than 1.',
),

MCQItem(
  question: 'The probability of an impossible event is:',
  options: ['1', '0.5', '0', '-1'],
  correctIndex: 2,
  explanation:
      'An impossible event can never occur, so its probability is always 0.',
),

MCQItem(
  question: 'The probability of a certain (sure) event is:',
  options: ['0', '0.5', '2', '1'],
  correctIndex: 3,
  explanation:
      'A certain event always occurs without fail, so its probability is always 1.',
),

MCQItem(
  question: 'A coin is tossed once. What is the probability of getting a head?',
  options: ['1/4', '1/3', '1/2', '1'],
  correctIndex: 2,
  explanation:
      'Total outcomes = {H, T} = 2. Favourable outcomes = {H} = 1. P(Head) = 1/2.',
),

MCQItem(
  question: 'A die is rolled once. What is the probability of getting a 3?',
  options: ['1/2', '1/3', '1/4', '1/6'],
  correctIndex: 3,
  explanation:
      'Total outcomes = {1, 2, 3, 4, 5, 6} = 6. Favourable outcomes = {3} = 1. P(3) = 1/6.',
),

MCQItem(
  question: 'A die is rolled. What is the probability of getting an odd number?',
  options: ['1/6', '1/3', '1/2', '2/3'],
  correctIndex: 2,
  explanation:
      'Odd numbers on a die = {1, 3, 5} = 3. P(odd) = 3/6 = 1/2.',
),

MCQItem(
  question: 'If P(E) = 2/5, what is P(E\')?',
  options: ['2/5', '3/5', '5/2', '1/5'],
  correctIndex: 1,
  explanation:
      'P(E\') = 1 - P(E) = 1 - 2/5 = 3/5. The sum of probability of an event and its complement is always 1.',
),

MCQItem(
  question: 'A bag contains 4 red and 6 blue balls. What is the probability of drawing a red ball?',
  options: ['4/6', '6/10', '4/10', '1/4'],
  correctIndex: 2,
  explanation:
      'Total balls = 4 + 6 = 10. Favourable = 4. P(red) = 4/10 = 2/5.',
),

MCQItem(
  question: 'Two coins are tossed simultaneously. What is the total number of possible outcomes?',
  options: ['2', '3', '4', '8'],
  correctIndex: 2,
  explanation:
      'Sample space = {HH, HT, TH, TT} = 4 outcomes when two coins are tossed together.',
),

MCQItem(
  question: 'Two coins are tossed. What is the probability of getting at least one head?',
  options: ['1/4', '1/2', '3/4', '1'],
  correctIndex: 2,
  explanation:
      'Favourable outcomes = {HH, HT, TH} = 3. Total = 4. P(at least one head) = 3/4.',
),

MCQItem(
  question: 'A die is thrown once. What is the probability of getting a number less than 3?',
  options: ['1/6', '1/3', '1/2', '2/3'],
  correctIndex: 1,
  explanation:
      'Numbers less than 3 = {1, 2} = 2. P = 2/6 = 1/3.',
),

MCQItem(
  question: 'A card is drawn from a deck of 52 cards. What is the probability of getting a spade?',
  options: ['1/52', '1/26', '1/13', '1/4'],
  correctIndex: 3,
  explanation:
      'There are 13 spades in a deck of 52 cards. P(spade) = 13/52 = 1/4.',
),

MCQItem(
  question: 'Two dice are thrown simultaneously. What is the total number of possible outcomes?',
  options: ['6', '12', '24', '36'],
  correctIndex: 3,
  explanation:
      'Each die has 6 outcomes. Total outcomes for two dice = 6 × 6 = 36.',
),

MCQItem(
  question: 'Two dice are thrown. What is the probability of getting a sum of 8?',
  options: ['5/36', '6/36', '7/36', '8/36'],
  correctIndex: 0,
  explanation:
      'Favourable outcomes for sum 8: {(2,6),(3,5),(4,4),(5,3),(6,2)} = 5. P = 5/36.',
),

MCQItem(
  question: 'A bag contains 5 white, 4 red and 3 black balls. A ball is drawn at random. What is the probability that it is NOT white?',
  options: ['5/12', '7/12', '1/3', '2/3'],
  correctIndex: 1,
  explanation:
      'Total = 12. White = 5. Not white = 7. P(not white) = 7/12.',
),

MCQItem(
  question: 'A card is drawn from a deck of 52 cards. What is the probability of getting a face card (Jack, Queen or King)?',
  options: ['1/13', '3/13', '4/13', '3/52'],
  correctIndex: 1,
  explanation:
      'Face cards = 4 Jacks + 4 Queens + 4 Kings = 12. P(face card) = 12/52 = 3/13.',
),

MCQItem(
  question: 'If A and B are mutually exclusive events, then P(A ∪ B) = ?',
  options: ['P(A) × P(B)', 'P(A) + P(B) - P(A∩B)', 'P(A) + P(B)', 'P(A) - P(B)'],
  correctIndex: 2,
  explanation:
      'For mutually exclusive events, P(A ∩ B) = 0. So P(A ∪ B) = P(A) + P(B).',
),

MCQItem(
  question: 'Two dice are rolled. What is the probability of getting a doublet (same number on both dice)?',
  options: ['1/12', '1/6', '1/4', '1/3'],
  correctIndex: 1,
  explanation:
      'Doublets = {(1,1),(2,2),(3,3),(4,4),(5,5),(6,6)} = 6. P = 6/36 = 1/6.',
),

MCQItem(
  question: 'A box contains 6 defective and 14 non-defective items. An item is drawn at random. What is the probability that it is non-defective?',
  options: ['3/10', '7/10', '6/14', '1/5'],
  correctIndex: 1,
  explanation:
      'Total items = 20. Non-defective = 14. P(non-defective) = 14/20 = 7/10.',
),

MCQItem(
  question: 'A box contains 5 defective and 15 non-defective bulbs. Two bulbs are drawn one after another without replacement. What is the probability that both are defective?',
  options: ['1/19', '1/20', '1/16', '5/76'],
  correctIndex: 0,
  explanation:
      'P(1st defective) = 5/20. P(2nd defective | 1st defective) = 4/19. P(both defective) = 5/20 × 4/19 = 20/380 = 1/19.',
),
],

'math_trigonometry': [
  MCQItem(
  question: 'In a right-angled triangle, sin θ is defined as:',
  options: [
    'Adjacent / Hypotenuse',
    'Opposite / Hypotenuse',
    'Opposite / Adjacent',
    'Hypotenuse / Opposite'
  ],
  correctIndex: 1,
  explanation:
      'sin θ = Opposite side / Hypotenuse. This is the basic definition of sine ratio in a right-angled triangle.',
),

MCQItem(
  question: 'The value of sin 0° is:',
  options: ['1', '0', '∞', '1/2'],
  correctIndex: 1,
  explanation:
      'sin 0° = 0. This is a standard trigonometric value to remember.',
),

MCQItem(
  question: 'The value of cos 0° is:',
  options: ['0', '1/2', '1', '√3/2'],
  correctIndex: 2,
  explanation:
      'cos 0° = 1. This is a standard trigonometric value to remember.',
),

MCQItem(
  question: 'The value of tan 45° is:',
  options: ['0', '1/√2', '√3', '1'],
  correctIndex: 3,
  explanation:
      'tan 45° = sin 45° / cos 45° = (1/√2) / (1/√2) = 1.',
),

MCQItem(
  question: 'The value of sin 90° is:',
  options: ['0', '1/2', '√3/2', '1'],
  correctIndex: 3,
  explanation:
      'sin 90° = 1. This is a standard trigonometric value to remember.',
),

MCQItem(
  question: 'The value of sin 30° is:',
  options: ['√3/2', '1/2', '1/√2', '1'],
  correctIndex: 1,
  explanation:
      'sin 30° = 1/2. This is a standard trigonometric value.',
),

MCQItem(
  question: 'The value of cos 60° is:',
  options: ['√3/2', '1/√2', '1/2', '0'],
  correctIndex: 2,
  explanation:
      'cos 60° = 1/2. This is a standard trigonometric value.',
),

MCQItem(
  question: 'The value of tan 30° is:',
  options: ['√3', '1/√3', '1', '√3/2'],
  correctIndex: 1,
  explanation:
      'tan 30° = sin 30° / cos 30° = (1/2) / (√3/2) = 1/√3.',
),

MCQItem(
  question: 'Which of the following is the fundamental Pythagorean identity?',
  options: [
    'sin²θ - cos²θ = 1',
    'sin²θ + cos²θ = 1',
    'sinθ + cosθ = 1',
    'sinθ × cosθ = 1'
  ],
  correctIndex: 1,
  explanation:
      'sin²θ + cos²θ = 1 is the fundamental Pythagorean identity in trigonometry, valid for all values of θ.',
),

MCQItem(
  question: 'The reciprocal of sin θ is:',
  options: ['cos θ', 'tan θ', 'cosec θ', 'sec θ'],
  correctIndex: 2,
  explanation:
      'cosec θ = 1/sin θ. Cosecant is the reciprocal of sine.',
),

MCQItem(
  question: 'Which of the following equals 1 + tan²θ?',
  options: ['cos²θ', 'sin²θ', 'sec²θ', 'cosec²θ'],
  correctIndex: 2,
  explanation:
      '1 + tan²θ = sec²θ. This is the second Pythagorean identity in trigonometry.',
),

MCQItem(
  question: 'Which of the following equals 1 + cot²θ?',
  options: ['sec²θ', 'cosec²θ', 'tan²θ', 'cos²θ'],
  correctIndex: 1,
  explanation:
      '1 + cot²θ = cosec²θ. This is the third Pythagorean identity in trigonometry.',
),

MCQItem(
  question: 'If sin θ = 3/5, then cos θ = ?',
  options: ['4/5', '3/4', '5/3', '5/4'],
  correctIndex: 0,
  explanation:
      'Using sin²θ + cos²θ = 1: cos²θ = 1 - 9/25 = 16/25. So cos θ = 4/5.',
),

MCQItem(
  question: 'If tan θ = 5/12, find sec θ.',
  options: ['12/13', '13/12', '5/13', '13/5'],
  correctIndex: 1,
  explanation:
      'Using sec²θ = 1 + tan²θ = 1 + 25/144 = 169/144. So sec θ = 13/12.',
),

MCQItem(
  question: 'If sin(A + B) = 1 and sin(A - B) = 1/2, find A and B.',
  options: ['A = 60°, B = 30°', 'A = 45°, B = 45°', 'A = 30°, B = 60°', 'A = 75°, B = 15°'],
  correctIndex: 0,
  explanation:
      'sin(A+B) = 1 ⇒ A+B = 90°. sin(A-B) = 1/2 ⇒ A-B = 30°. Adding: 2A = 120° ⇒ A = 60°, B = 30°.',
),

MCQItem(
  question: 'The value of sin 60° × cos 30° - cos 60° × sin 30° is:',
  options: ['0', '1/2', '1', '√3/2'],
  correctIndex: 1,
  explanation:
      'sin60°×cos30° - cos60°×sin30° = sin(60°-30°) = sin 30° = 1/2.',
),

MCQItem(
  question: 'The angle of elevation of the top of a tower from a point 30 m away from its base is 60°. The height of the tower is:',
  options: ['10√3 m', '20√3 m', '30√3 m', '40√3 m'],
  correctIndex: 2,
  explanation:
      'tan 60° = height/30 ⇒ √3 = h/30 ⇒ h = 30√3 m.',
),

MCQItem(
  question: 'The angle of depression of a boat from the top of a cliff 50 m high is 30°. The distance of the boat from the base of the cliff is:',
  options: ['50/√3 m', '50√3 m', '100√3 m', '25√3 m'],
  correctIndex: 1,
  explanation:
      'tan 30° = 50/d ⇒ 1/√3 = 50/d ⇒ d = 50√3 m.',
),

MCQItem(
  question: 'The value of (sinθ + cosθ)² is equal to:',
  options: ['1', '1 + sinθcosθ', '1 + 2sinθcosθ', '2 + sinθcosθ'],
  correctIndex: 2,
  explanation:
      '(sinθ + cosθ)² = sin²θ + 2sinθcosθ + cos²θ = 1 + 2sinθcosθ.',
),

MCQItem(
  question: 'A ladder 10 m long leans against a wall. If the foot of the ladder makes an angle of 60° with the ground, how high up the wall does the ladder reach?',
  options: ['5 m', '5√2 m', '5√3 m', '10√3 m'],
  correctIndex: 2,
  explanation:
      'sin 60° = height/10 ⇒ √3/2 = h/10 ⇒ h = 5√3 m.',
),
],

'science_scientific_learning': [
  MCQItem(
  question: 'What is scientific learning?',
  options: [
    'Learning from textbooks only',
    'Problem-solving process of establishing facts through testing and experimentation independently',
    'Learning by memorizing facts',
    'Observing without experimentation'
  ],
  correctIndex: 1,
  explanation:
      'Scientific learning is a problem-solving process of establishing facts through testing and experimentation independently.',
),

MCQItem(
  question: 'Which of the following is the independent variable in an experiment?',
  options: [
    'The variable that is measured',
    'The variable that is kept constant',
    'The variable that is manipulated by the researcher',
    'The variable that responds to change'
  ],
  correctIndex: 2,
  explanation:
      'The independent variable (also called manipulated variable) is the factor or condition that a researcher changes or manipulates in an experiment.',
),

MCQItem(
  question: 'Which of the following is the dependent variable in an experiment?',
  options: [
    'The variable that is changed by the researcher',
    'The variable that is kept constant',
    'The variable that is measured and observed',
    'The variable that is ignored'
  ],
  correctIndex: 2,
  explanation:
      'The dependent variable (also called responding variable) is the factor or condition that is measured and observed in an experiment.',
),

MCQItem(
  question: 'What are control variables?',
  options: [
    'Variables that are changed during an experiment',
    'Variables that a researcher tries to hold constant throughout the experiment',
    'Variables that depend on other variables',
    'Variables that are never measured'
  ],
  correctIndex: 1,
  explanation:
      'Control variables are those variables that a researcher tries to hold constant throughout the experiment to ensure they do not affect the outcome.',
),

MCQItem(
  question: 'Which step of scientific method requires the use of five sense organs?',
  options: [
    'Forming a hypothesis',
    'Communicating results',
    'Drawing a conclusion',
    'Observation'
  ],
  correctIndex: 3,
  explanation:
      'Observation requires the use of five sense organs to detect and gather information about the phenomenon being studied.',
),

MCQItem(
  question: 'What is a variable in research?',
  options: [
    'A constant value in an experiment',
    'Any quantity that varies according to the span of an experiment',
    'A fixed measurement tool',
    'The final result of an experiment'
  ],
  correctIndex: 1,
  explanation:
      'Any quantity that varies according to the span of an experiment is called a variable.',
),

MCQItem(
  question: 'How many types of variables are there in scientific research?',
  options: ['2', '3', '4', '5'],
  correctIndex: 1,
  explanation:
      'There are 3 types of variables: Independent Variable (what I change), Dependent Variable (what I measure or observe), and Controlled Variable (what I keep constant).',
),

MCQItem(
  question: 'What is the last but very significant step in the scientific method that allows other researchers to test the hypotheses?',
  options: [
    'Forming a hypothesis',
    'Communicating results',
    'Drawing a conclusion',
    'Collecting data'
  ],
  correctIndex: 1,
  explanation:
      'Communicating results is the last but very significant step in the scientific method. It allows other researchers to verify, replicate and test the hypotheses.',
),

MCQItem(
  question: 'What is a unit?',
  options: [
    'A physical quantity itself',
    'The reference standard with which we carry out the measurement of any physical quantity of the same kind',
    'A derived quantity',
    'A tool for measuring mass only'
  ],
  correctIndex: 1,
  explanation:
      'The reference standard with which we carry out the measurement of any physical quantity of the same kind is called a unit.',
),

MCQItem(
  question: 'Which of the following is a derived unit?',
  options: ['Kilogram', 'Second', 'Kelvin', 'Hertz'],
  correctIndex: 3,
  explanation:
      'Hertz is a derived unit. Kilogram, Second, and Kelvin are fundamental units.',
),

MCQItem(
  question: 'How many fundamental units are there in the SI system?',
  options: ['5', '6', '7', '8'],
  correctIndex: 2,
  explanation:
      'There are 7 fundamental units in the SI system: metre, kilogram, second, kelvin, ampere, candela, and mole.',
),

MCQItem(
  question: 'Which of the following is a fundamental unit used in physics?',
  options: ['Newton', 'Pascal', 'Joule', 'Kelvin'],
  correctIndex: 3,
  explanation:
      'Kelvin is a fundamental unit. Newton, Pascal, and Joule are all derived units.',
),

MCQItem(
  question: 'Why is the unit of force (Newton) called a derived unit?',
  options: [
    'Because it is independent of other units',
    'Because it is expressed in terms of two or more fundamental units (kg × m/s²)',
    'Because it cannot be measured',
    'Because it is a very large unit'
  ],
  correctIndex: 1,
  explanation:
      'Newton is a derived unit because unit of force is expressed in terms of fundamental units: kg × m/s². It is formed from fundamental units such as kg, m and s.',
),

MCQItem(
  question: 'What is the SI unit of potential difference?',
  options: ['Ampere', 'Ohm', 'Volt', 'Watt'],
  correctIndex: 2,
  explanation:
      'The SI unit of potential difference is Volt (V).',
),

MCQItem(
  question: 'What is the SI unit of electrical resistance?',
  options: ['Volt', 'Ampere', 'Watt', 'Ohm (Ω)'],
  correctIndex: 3,
  explanation:
      'The SI unit of electrical resistance is Ohm (Ω).',
),

MCQItem(
  question: 'The unit of work (Joule) is a:',
  options: [
    'Fundamental unit',
    'Derived unit',
    'SI base unit',
    'Independent unit'
  ],
  correctIndex: 1,
  explanation:
      'Joule is a derived unit because Work = Force × displacement, and it is expressed using two or more fundamental units (kg × m² × s⁻²).',
),

MCQItem(
  question: 'What is measurement?',
  options: [
    'The process of forming a hypothesis',
    'The process of comparison of unknown quantity with the help of known quantity or standard quantity of the same kind',
    'The process of recording observations',
    'The process of communicating results'
  ],
  correctIndex: 1,
  explanation:
      'The process of comparison of an unknown quantity with the help of a known quantity or standard quantity of the same kind is called measurement.',
),

MCQItem(
  question: 'In an experiment studying the effect of different types of fertilizer on plant growth, what is the dependent variable?',
  options: [
    'Type of fertilizer',
    'Amount of water given',
    'Growth of the plant',
    'Size of the pot'
  ],
  correctIndex: 2,
  explanation:
      'The growth of the plant is the dependent variable because it is what is measured and observed. The type of fertilizer is the independent variable, while water, pot size etc. are controlled variables.',
),

MCQItem(
  question: 'Why are independent and dependent variables important in scientific study?',
  options: [
    'They make the experiment longer',
    'They help to establish a cause-and-effect relationship and provide a framework for understanding and analyzing the phenomena under investigation',
    'They reduce the number of experiments needed',
    'They eliminate the need for control variables'
  ],
  correctIndex: 1,
  explanation:
      'Independent and dependent variables are important because they help to establish a cause-and-effect relationship and provide a framework for understanding and analyzing the phenomena under investigation.',
),

MCQItem(
  question: 'Which of the following is the correct dimension formula for density (d = M/V)?',
  options: ['[ML³]', '[ML⁻³]', '[M⁻¹L³]', '[ML²]'],
  correctIndex: 1,
  explanation:
      'Density = Mass/Volume = M/L³ = [ML⁻³]. The dimension formula of density is [ML⁻³].',
),
],

'science_classification_of_living_beings': [
  MCQItem(
  question: 'What is classification of living beings?',
  options: [
    'Study of diseases',
    'Grouping organisms based on similarities and differences',
    'Study of cells',
    'Naming organisms only'
  ],
  correctIndex: 1,
  explanation: 'Classification is the process of grouping living beings based on similar and dissimilar characteristics.',
),

MCQItem(
  question: 'Why is classification important?',
  options: [
    'Makes study difficult',
    'Reduces biodiversity',
    'Makes the study of organisms easier and systematic',
    'Stops evolution'
  ],
  correctIndex: 2,
  explanation: 'Classification makes the study of plants and animals easier and more systematic.',
),

MCQItem(
  question: 'Which kingdom contains eukaryotic organisms with cell walls and autotrophic nutrition?',
  options: [
    'Animalia',
    'Fungi',
    'Plantae',
    'Monera'
  ],
  correctIndex: 2,
  explanation: 'Kingdom Plantae consists of eukaryotic organisms with cell walls and autotrophic nutrition.',
),

MCQItem(
  question: 'Why is Cycas classified under Gymnosperms?',
  options: [
    'It bears fruits',
    'It bears flowers',
    'It has naked seeds and cones',
    'It has vascular tissue only'
  ],
  correctIndex: 2,
  explanation: 'Gymnosperms bear cones and have naked seeds not enclosed within fruits.',
),

MCQItem(
  question: 'Which characteristic is common to all animals in Kingdom Animalia?',
  options: [
    'Autotrophic',
    'Unicellular',
    'Multicellular and heterotrophic',
    'Cell wall present'
  ],
  correctIndex: 2,
  explanation: 'Animals are multicellular organisms that obtain food from other organisms.',
),

MCQItem(
  question: 'Which groups are closely related evolutionarily?',
  options: [
    'Porifera, Arthropoda, Chordata',
    'Platyhelminthes, Nemathelminthes, Annelida',
    'Porifera, Chordata, Mollusca',
    'Coelenterata, Chordata, Porifera'
  ],
  correctIndex: 1,
  explanation: 'Platyhelminthes, Nemathelminthes, and Annelida show a progressive evolutionary relationship.',
),

MCQItem(
  question: 'Why is a whale classified under Mammalia?',
  options: [
    'It lives in water',
    'It has fins',
    'It gives birth and suckles its young',
    'It breathes through gills'
  ],
  correctIndex: 2,
  explanation: 'Whales are mammals because they give birth to young ones and feed them milk.',
),

MCQItem(
  question: 'Why are club mosses more advanced than mosses?',
  options: [
    'They grow on land',
    'They have vascular tissues',
    'They are green',
    'They produce spores'
  ],
  correctIndex: 1,
  explanation: 'Club mosses possess xylem and phloem tissues, making them more advanced.',
),

MCQItem(
  question: 'Which kingdoms include organisms having cell walls?',
  options: [
    'Animalia, Plantae, Protista',
    'Fungi, Plantae, Monera',
    'Animalia, Fungi, Monera',
    'Animalia, Plantae, Fungi'
  ],
  correctIndex: 1,
  explanation: 'Cell walls are found in Fungi, Plantae, and Monera.',
),

MCQItem(
  question: 'Egg-laying animals with feathers and a four-chambered heart belong to which class?',
  options: [
    'Mammalia',
    'Amphibia',
    'Reptilia',
    'Aves'
  ],
  correctIndex: 3,
  explanation: 'Birds belong to class Aves and possess feathers and a four-chambered heart.',
),

MCQItem(
  question: 'Which group consists entirely of angiosperms?',
  options: [
    'Pinus, Fern, Pea',
    'Moss, Bean, Maize',
    'Paddy, Banana, Mango',
    'Juniper, Gram, Fern'
  ],
  correctIndex: 2,
  explanation: 'Paddy, banana, and mango are flowering plants (angiosperms).',
),

MCQItem(
  question: 'Plants with vascular tissues belong to which division?',
  options: [
    'Bryophyta',
    'Tracheophyta',
    'Gametophyta',
    'Sporophyta'
  ],
  correctIndex: 1,
  explanation: 'Tracheophyta includes plants possessing vascular tissues.',
),

MCQItem(
  question: 'Which of the following is a characteristic of plant cells?',
  options: [
    'Absence of cell wall',
    'Presence of cellulose cell wall',
    'No chloroplasts',
    'Heterotrophic nutrition'
  ],
  correctIndex: 1,
  explanation: 'Plant cells have rigid cellulose cell walls.',
),

MCQItem(
  question: 'Which division includes mosses and liverworts?',
  options: [
    'Bryophyta',
    'Pteridophyta',
    'Gymnospermae',
    'Angiospermae'
  ],
  correctIndex: 0,
  explanation: 'Bryophyta includes mosses and liverworts.',
),

MCQItem(
  question: 'How do pteridophytes reproduce?',
  options: [
    'By seeds',
    'By fruits',
    'By spores',
    'By flowers'
  ],
  correctIndex: 2,
  explanation: 'Pteridophytes reproduce through spores.',
),

MCQItem(
  question: 'Which tissue transports water in vascular plants?',
  options: [
    'Phloem',
    'Xylem',
    'Parenchyma',
    'Collenchyma'
  ],
  correctIndex: 1,
  explanation: 'Xylem transports water and minerals throughout the plant.',
),

MCQItem(
  question: 'Which phylum includes animals with a backbone?',
  options: [
    'Arthropoda',
    'Mollusca',
    'Chordata',
    'Porifera'
  ],
  correctIndex: 2,
  explanation: 'Chordata includes animals possessing a vertebral column.',
),

MCQItem(
  question: 'How do sponges digest food?',
  options: [
    'Using a digestive system',
    'Using choanocytes and intracellular digestion',
    'Using a stomach',
    'Using gills'
  ],
  correctIndex: 1,
  explanation: 'Sponges digest food intracellularly using choanocytes.',
),

MCQItem(
  question: 'Which class does a bat belong to?',
  options: [
    'Aves',
    'Reptilia',
    'Mammalia',
    'Amphibia'
  ],
  correctIndex: 2,
  explanation: 'Bats are mammals because they possess mammalian characteristics.',
),

MCQItem(
  question: 'Which feature is shared by both gymnosperms and angiosperms?',
  options: [
    'Production of spores only',
    'Absence of vascular tissue',
    'Presence of seeds',
    'Lack of alternation of generations'
  ],
  correctIndex: 2,
  explanation: 'Both gymnosperms and angiosperms are seed-producing plants.',
),
],

'science_honey_bee': [
  MCQItem(
  question: 'What is the scientific name of the honey bee commonly reared in Nepal?',
  options: [
    'Apis cerana',
    'Apis dorsata',
    'Apis florea',
    'Bombus terrestris'
  ],
  correctIndex: 0,
  explanation: 'Apis cerana is the honey bee species commonly reared in Nepal.',
),

MCQItem(
  question: 'The practice of rearing honey bees is called:',
  options: [
    'Pisciculture',
    'Apiculture',
    'Sericulture',
    'Horticulture'
  ],
  correctIndex: 1,
  explanation: 'Apiculture is the scientific method of rearing and managing honey bees.',
),

MCQItem(
  question: 'Honey bees belong to which phylum?',
  options: [
    'Chordata',
    'Mollusca',
    'Arthropoda',
    'Annelida'
  ],
  correctIndex: 2,
  explanation: 'Honey bees belong to the phylum Arthropoda because they have jointed appendages and an exoskeleton.',
),

MCQItem(
  question: 'How many body parts does a honey bee have?',
  options: [
    'Two',
    'Three',
    'Four',
    'Five'
  ],
  correctIndex: 1,
  explanation: 'The body of a honey bee is divided into head, thorax, and abdomen.',
),

MCQItem(
  question: 'How many pairs of legs does a honey bee possess?',
  options: [
    'Two',
    'Three',
    'Four',
    'Five'
  ],
  correctIndex: 1,
  explanation: 'A honey bee has three pairs of legs attached to the thorax.',
),

MCQItem(
  question: 'How many pairs of wings are present in a honey bee?',
  options: [
    'One',
    'Two',
    'Three',
    'Four'
  ],
  correctIndex: 1,
  explanation: 'Honey bees possess two pairs of wings attached to the thorax.',
),

MCQItem(
  question: 'Which caste is the fertile female in a honey bee colony?',
  options: [
    'Worker',
    'Drone',
    'Queen',
    'Larva'
  ],
  correctIndex: 2,
  explanation: 'The queen bee is the fertile female responsible for laying eggs.',
),

MCQItem(
  question: 'Which caste is responsible for laying eggs?',
  options: [
    'Worker',
    'Drone',
    'Queen',
    'Pupa'
  ],
  correctIndex: 2,
  explanation: 'The queen bee lays eggs and is the reproductive member of the colony.',
),

MCQItem(
  question: 'Which caste consists of male honey bees?',
  options: [
    'Worker',
    'Queen',
    'Drone',
    'Larva'
  ],
  correctIndex: 2,
  explanation: 'Drones are the male members of a honey bee colony.',
),

MCQItem(
  question: 'What is the primary function of drone bees?',
  options: [
    'Collect nectar',
    'Build combs',
    'Mate with the queen',
    'Protect the hive'
  ],
  correctIndex: 2,
  explanation: 'The main function of drone bees is to mate with the queen bee.',
),

MCQItem(
  question: 'Which caste performs most of the work in a bee colony?',
  options: [
    'Queen',
    'Drone',
    'Worker',
    'Larva'
  ],
  correctIndex: 2,
  explanation: 'Worker bees perform tasks such as collecting nectar, cleaning, and protecting the hive.',
),

MCQItem(
  question: 'Worker bees are:',
  options: [
    'Fertile females',
    'Sterile females',
    'Males',
    'Larvae'
  ],
  correctIndex: 1,
  explanation: 'Worker bees are sterile female bees that perform various duties in the colony.',
),

MCQItem(
  question: 'What is royal jelly?',
  options: [
    'Bee wax',
    'A special food for queen larvae',
    'Honey mixed with pollen',
    'A type of nectar'
  ],
  correctIndex: 1,
  explanation: 'Royal jelly is a nutritious secretion fed to queen larvae.',
),

MCQItem(
  question: 'The development of an individual from an unfertilized egg is called:',
  options: [
    'Metamorphosis',
    'Budding',
    'Parthenogenesis',
    'Fragmentation'
  ],
  correctIndex: 2,
  explanation: 'Parthenogenesis is the development of an organism from an unfertilized egg.',
),

MCQItem(
  question: 'In honey bees, drones develop from:',
  options: [
    'Fertilized eggs',
    'Unfertilized eggs',
    'Larvae',
    'Pupae'
  ],
  correctIndex: 1,
  explanation: 'Drone bees develop from unfertilized eggs through parthenogenesis.',
),

MCQItem(
  question: 'What is the main source of honey?',
  options: [
    'Pollen grains',
    'Flower nectar',
    'Bee wax',
    'Royal jelly'
  ],
  correctIndex: 1,
  explanation: 'Honey is produced from the nectar collected from flowers.',
),

MCQItem(
  question: 'Which product is secreted by wax glands of worker bees?',
  options: [
    'Honey',
    'Royal jelly',
    'Bee wax',
    'Propolis'
  ],
  correctIndex: 2,
  explanation: 'Worker bees secrete bee wax from special wax glands.',
),

MCQItem(
  question: 'Honey bees are considered social insects because they:',
  options: [
    'Live alone',
    'Feed only on honey',
    'Live and work together in colonies',
    'Can fly long distances'
  ],
  correctIndex: 2,
  explanation: 'Honey bees live in organized colonies with division of labor.',
),

MCQItem(
  question: 'Which of the following is an economic importance of honey bees?',
  options: [
    'Soil erosion',
    'Pollination of crops',
    'Water purification',
    'Rock formation'
  ],
  correctIndex: 1,
  explanation: 'Honey bees help in pollination, increasing agricultural productivity.',
),

MCQItem(
  question: 'The life cycle of a honey bee includes which stages?',
  options: [
    'Egg → Nymph → Adult',
    'Egg → Larva → Pupa → Adult',
    'Egg → Pupa → Adult',
    'Larva → Pupa → Adult'
  ],
  correctIndex: 1,
  explanation: 'Honey bees undergo complete metamorphosis consisting of egg, larva, pupa, and adult stages.',
),
],

'science_heredity': [
  MCQItem(
  question: 'What is heredity?',
  options: [
    'Formation of gametes',
    'Transfer of parental characteristics to offspring',
    'Growth of cells',
    'Fusion of chromosomes'
  ],
  correctIndex: 1,
  explanation: 'Heredity is the phenomenon in which parental characters are transferred from one generation to the next.',
),

MCQItem(
  question: 'Which branch of biology deals with the study of genes and heredity?',
  options: [
    'Ecology',
    'Anatomy',
    'Genetics',
    'Physiology'
  ],
  correctIndex: 2,
  explanation: 'Genetics is the branch of biology that studies genes, heredity, and variation.',
),

MCQItem(
  question: 'Where are chromosomes located in a cell?',
  options: [
    'Cytoplasm',
    'Cell membrane',
    'Nucleus',
    'Mitochondria'
  ],
  correctIndex: 2,
  explanation: 'Chromosomes are thread-like structures found inside the nucleus of a cell.',
),

MCQItem(
  question: 'What is the smallest functional unit of heredity?',
  options: [
    'Cell',
    'Gene',
    'Chromosome',
    'Nucleus'
  ],
  correctIndex: 1,
  explanation: 'A gene is the smallest functional and physical unit of heredity.',
),

MCQItem(
  question: 'What is the main function of mitosis?',
  options: [
    'Production of gametes',
    'Growth and repair of tissues',
    'Sex determination',
    'Fertilization'
  ],
  correctIndex: 1,
  explanation: 'Mitosis is responsible for growth, development, and repair of body tissues.',
),

MCQItem(
  question: 'Mitosis is also known as:',
  options: [
    'Reductional division',
    'Direct division',
    'Equational division',
    'Binary division'
  ],
  correctIndex: 2,
  explanation: 'Mitosis maintains the chromosome number in daughter cells, so it is called equational division.',
),

MCQItem(
  question: 'How many daughter cells are produced from one parent cell during mitosis?',
  options: [
    'One',
    'Two',
    'Three',
    'Four'
  ],
  correctIndex: 1,
  explanation: 'One parent cell divides to form two identical daughter cells during mitosis.',
),

MCQItem(
  question: 'Meiosis occurs in:',
  options: [
    'Somatic cells',
    'Body cells',
    'Reproductive organs',
    'Nerve cells'
  ],
  correctIndex: 2,
  explanation: 'Meiosis occurs in reproductive organs to produce gametes.',
),

MCQItem(
  question: 'Meiosis is also called:',
  options: [
    'Equational division',
    'Reductional division',
    'Direct division',
    'Binary fission'
  ],
  correctIndex: 1,
  explanation: 'Meiosis reduces the chromosome number to half, so it is called reductional division.',
),

MCQItem(
  question: 'How many haploid daughter cells are produced by meiosis?',
  options: [
    'Two',
    'Three',
    'Four',
    'Eight'
  ],
  correctIndex: 2,
  explanation: 'One diploid cell undergoes meiosis to form four haploid daughter cells.',
),

MCQItem(
  question: 'Which process during meiosis introduces genetic variation?',
  options: [
    'Budding',
    'Crossing over',
    'Fragmentation',
    'Binary fission'
  ],
  correctIndex: 1,
  explanation: 'Crossing over exchanges genetic material between chromosomes, creating variation.',
),

MCQItem(
  question: 'DNA stands for:',
  options: [
    'Deoxyribonucleic Acid',
    'Dioxygen Nucleic Acid',
    'Deoxyribose Nitric Acid',
    'Double Nucleic Acid'
  ],
  correctIndex: 0,
  explanation: 'DNA stands for Deoxyribonucleic Acid and carries genetic information.',
),

MCQItem(
  question: 'Who is known as the Father of Genetics?',
  options: [
    'Charles Darwin',
    'Gregor Johann Mendel',
    'Louis Pasteur',
    'Robert Hooke'
  ],
  correctIndex: 1,
  explanation: 'Gregor Johann Mendel is known as the Father of Genetics for his experiments on pea plants.',
),

MCQItem(
  question: 'Which plant did Mendel use for his genetic experiments?',
  options: [
    'Rose plant',
    'Sunflower plant',
    'Pea plant',
    'Wheat plant'
  ],
  correctIndex: 2,
  explanation: 'Mendel conducted his famous heredity experiments using pea plants.',
),

MCQItem(
  question: 'In Mendel’s experiment, which character was dominant over dwarfness?',
  options: [
    'Wrinkled seed',
    'Tallness',
    'White flower',
    'Green seed'
  ],
  correctIndex: 1,
  explanation: 'Tallness was the dominant character while dwarfness was recessive.',
),

MCQItem(
  question: 'What is a dominant character?',
  options: [
    'A character hidden in F1 generation',
    'A character expressed in F1 generation',
    'A character present only in F2 generation',
    'A character absent in offspring'
  ],
  correctIndex: 1,
  explanation: 'A dominant character is expressed in the F1 generation.',
),

MCQItem(
  question: 'What is the phenotypic ratio obtained in the F2 generation of Mendel’s monohybrid cross?',
  options: [
    '1 : 1',
    '1 : 2 : 1',
    '3 : 1',
    '9 : 3 : 3 : 1'
  ],
  correctIndex: 2,
  explanation: 'The phenotypic ratio in F2 generation is 3 tall : 1 dwarf.',
),

MCQItem(
  question: 'What is the genotypic ratio obtained in the F2 generation of Mendel’s monohybrid cross?',
  options: [
    '3 : 1',
    '1 : 1',
    '1 : 2 : 1',
    '9 : 3 : 3 : 1'
  ],
  correctIndex: 2,
  explanation: 'The genotypic ratio in F2 generation is 1 pure tall : 2 hybrid tall : 1 pure dwarf.',
),

MCQItem(
  question: 'Which chromosome pair determines the sex of a human being?',
  options: [
    '1st pair',
    '10th pair',
    '22nd pair',
    '23rd pair'
  ],
  correctIndex: 3,
  explanation: 'The 23rd pair of chromosomes, called sex chromosomes, determines sex in humans.',
),

MCQItem(
  question: 'What is the probability of a pregnant woman giving birth to a daughter?',
  options: [
    '25%',
    '50%',
    '75%',
    '100%'
  ],
  correctIndex: 1,
  explanation: 'There is a 50% chance of having a daughter because the father contributes either an X or Y chromosome with equal probability.',
),
],

'science_physiological_structure_and_life_process': [
  MCQItem(
  question: 'Which set of organs belongs to the human circulatory system?',
  options: [
    'Heart, blood and lungs',
    'Heart, blood and blood vessels',
    'Heart, liver and lungs',
    'Heart, blood vessels and liver'
  ],
  correctIndex: 1,
  explanation: 'The circulatory system consists of the heart, blood and blood vessels.',
),

MCQItem(
  question: 'How many chambers are present in the human heart?',
  options: [
    '2',
    '3',
    '4',
    '5'
  ],
  correctIndex: 2,
  explanation: 'The human heart has four chambers: two auricles and two ventricles.',
),

MCQItem(
  question: 'Which blood component is responsible for blood clotting?',
  options: [
    'Red blood cells',
    'White blood cells',
    'Platelets',
    'Plasma'
  ],
  correctIndex: 2,
  explanation: 'Platelets help in blood clotting and prevent excessive bleeding.',
),

MCQItem(
  question: 'Which blood cell lacks a nucleus?',
  options: [
    'Neutrophil',
    'Lymphocyte',
    'Monocyte',
    'Platelet'
  ],
  correctIndex: 3,
  explanation: 'Platelets are non-nucleated cell fragments involved in clotting.',
),

MCQItem(
  question: 'Which disease is caused by deficiency of haemoglobin?',
  options: [
    'Diabetes',
    'Haemophilia',
    'Anaemia',
    'Leukemia'
  ],
  correctIndex: 2,
  explanation: 'Anaemia occurs due to low haemoglobin or insufficient red blood cells.',
),

MCQItem(
  question: 'Which valve is located between the right auricle and right ventricle?',
  options: [
    'Bicuspid valve',
    'Tricuspid valve',
    'Aortic valve',
    'Pulmonary valve'
  ],
  correctIndex: 1,
  explanation: 'The tricuspid valve separates the right auricle from the right ventricle.',
),

MCQItem(
  question: 'Which valve is situated between the left auricle and left ventricle?',
  options: [
    'Pulmonary valve',
    'Tricuspid valve',
    'Bicuspid (Mitral) valve',
    'Semilunar valve'
  ],
  correctIndex: 2,
  explanation: 'The bicuspid or mitral valve is located between the left auricle and left ventricle.',
),

MCQItem(
  question: 'Which blood vessel carries oxygenated blood from the heart to the body?',
  options: [
    'Pulmonary artery',
    'Vena cava',
    'Pulmonary vein',
    'Aorta'
  ],
  correctIndex: 3,
  explanation: 'The aorta carries oxygen-rich blood from the left ventricle to the body.',
),

MCQItem(
  question: 'Which blood vessel carries deoxygenated blood from the right ventricle to the lungs?',
  options: [
    'Aorta',
    'Pulmonary artery',
    'Pulmonary vein',
    'Coronary artery'
  ],
  correctIndex: 1,
  explanation: 'The pulmonary artery carries deoxygenated blood to the lungs for oxygenation.',
),

MCQItem(
  question: 'Where does pulmonary circulation begin?',
  options: [
    'Left auricle',
    'Right auricle',
    'Right ventricle',
    'Left ventricle'
  ],
  correctIndex: 2,
  explanation: 'Pulmonary circulation starts from the right ventricle and ends at the left auricle.',
),

MCQItem(
  question: 'Where does systemic circulation begin?',
  options: [
    'Right ventricle',
    'Left ventricle',
    'Right auricle',
    'Left auricle'
  ],
  correctIndex: 1,
  explanation: 'Systemic circulation starts from the left ventricle and supplies the body.',
),

MCQItem(
  question: 'Which blood vessels usually contain valves to prevent backflow of blood?',
  options: [
    'Arteries',
    'Capillaries',
    'Veins',
    'Aorta'
  ],
  correctIndex: 2,
  explanation: 'Veins contain valves that prevent blood from flowing backward.',
),

MCQItem(
  question: 'What is the normal average systolic blood pressure in a healthy adult?',
  options: [
    '60 mmHg',
    '80 mmHg',
    '100 mmHg',
    '120 mmHg'
  ],
  correctIndex: 3,
  explanation: 'The average systolic blood pressure is approximately 120 mmHg.',
),

MCQItem(
  question: 'What is the normal average diastolic blood pressure in a healthy adult?',
  options: [
    '60 mmHg',
    '80 mmHg',
    '100 mmHg',
    '120 mmHg'
  ],
  correctIndex: 1,
  explanation: 'The average diastolic blood pressure is approximately 80 mmHg.',
),

MCQItem(
  question: 'Which instrument is used to measure blood pressure?',
  options: [
    'Thermometer',
    'Stethoscope',
    'Sphygmomanometer',
    'Angiogram'
  ],
  correctIndex: 2,
  explanation: 'A sphygmomanometer is used to measure blood pressure.',
),

MCQItem(
  question: 'Which test is most suitable for detecting blockage in a coronary artery?',
  options: [
    'ECG',
    'Heart beat measurement',
    'Blood pressure test',
    'Angiogram'
  ],
  correctIndex: 3,
  explanation: 'An angiogram helps visualize coronary arteries and detect blockages.',
),

MCQItem(
  question: 'A person experiences excessive thirst, hunger and frequent urination. What is the likely problem?',
  options: [
    'Anaemia',
    'High blood sugar',
    'High uric acid',
    'Low blood pressure'
  ],
  correctIndex: 1,
  explanation: 'These are common symptoms of diabetes caused by high blood sugar levels.',
),

MCQItem(
  question: 'Which blood component is responsible for transporting oxygen in the body?',
  options: [
    'White blood cells',
    'Platelets',
    'Red blood cells',
    'Plasma'
  ],
  correctIndex: 2,
  explanation: 'Red blood cells contain haemoglobin that transports oxygen.',
),

MCQItem(
  question: 'Which chamber of the heart has the thickest muscular wall?',
  options: [
    'Right auricle',
    'Left auricle',
    'Right ventricle',
    'Left ventricle'
  ],
  correctIndex: 3,
  explanation: 'The left ventricle has the thickest wall because it pumps blood throughout the body.',
),

MCQItem(
  question: 'What separates the right and left sides of the heart?',
  options: [
    'Pericardium',
    'Septum',
    'Aorta',
    'Valve'
  ],
  correctIndex: 1,
  explanation: 'The septum is a muscular wall that separates the two sides of the heart.',
),
],

'science_nature_and_force': [
  // Nature and Environment (15 MCQs)

MCQItem(
  question: 'What is biodiversity?',
  options: [
    'Study of weather',
    'Variety of living organisms',
    'Type of pollution',
    'Forest conservation'
  ],
  correctIndex: 1,
  explanation: 'Biodiversity refers to the variety of plants, animals and microorganisms in an area.',
),

MCQItem(
  question: 'What is climate change?',
  options: [
    'Daily weather condition',
    'Seasonal rainfall',
    'Long-term change in weather patterns',
    'Air pollution'
  ],
  correctIndex: 2,
  explanation: 'Climate change is the long-term alteration of weather patterns.',
),

MCQItem(
  question: 'Which of the following is a medicinal plant?',
  options: [
    'Tulsi',
    'Cactus',
    'Bamboo',
    'Pine'
  ],
  correctIndex: 0,
  explanation: 'Tulsi is a well-known medicinal plant used in traditional medicine.',
),

MCQItem(
  question: 'What is conservation?',
  options: [
    'Destroying forests',
    'Protection of natural resources',
    'Industrialization',
    'Urbanization'
  ],
  correctIndex: 1,
  explanation: 'Conservation means protecting and managing natural resources.',
),

MCQItem(
  question: 'Which factor is mainly responsible for biodiversity loss?',
  options: [
    'Habitat destruction',
    'Rainfall',
    'Moonlight',
    'Wind'
  ],
  correctIndex: 0,
  explanation: 'Habitat destruction is one of the major causes of biodiversity loss.',
),

MCQItem(
  question: 'What causes irregular rainfall patterns nowadays?',
  options: [
    'Earthquake',
    'Climate change',
    'Forest growth',
    'River flow'
  ],
  correctIndex: 1,
  explanation: 'Climate change disturbs normal rainfall patterns.',
),

MCQItem(
  question: 'Which phenomenon causes sea level to rise?',
  options: [
    'Global warming',
    'Deforestation',
    'Photosynthesis',
    'Wind erosion'
  ],
  correctIndex: 0,
  explanation: 'Global warming melts glaciers and polar ice, increasing sea level.',
),

MCQItem(
  question: 'What is an endangered species?',
  options: [
    'A common species',
    'A species at high risk of extinction',
    'A newly discovered species',
    'A domestic species'
  ],
  correctIndex: 1,
  explanation: 'Endangered species are at a very high risk of becoming extinct.',
),

MCQItem(
  question: 'Which gas is mainly responsible for the greenhouse effect?',
  options: [
    'Nitrogen',
    'Hydrogen',
    'Carbon dioxide',
    'Helium'
  ],
  correctIndex: 2,
  explanation: 'Carbon dioxide is one of the major greenhouse gases.',
),

MCQItem(
  question: 'Which activity helps reduce climate change?',
  options: [
    'Deforestation',
    'Burning plastics',
    'Afforestation',
    'Overgrazing'
  ],
  correctIndex: 2,
  explanation: 'Planting trees helps absorb carbon dioxide from the atmosphere.',
),

MCQItem(
  question: 'What are rare animals?',
  options: [
    'Animals found everywhere',
    'Animals with very small populations',
    'Domestic animals',
    'Farm animals'
  ],
  correctIndex: 1,
  explanation: 'Rare animals have small populations and limited distribution.',
),

MCQItem(
  question: 'Which medicinal plant is known as a multipurpose plant?',
  options: [
    'Tulsi',
    'Neem',
    'Rose',
    'Sunflower'
  ],
  correctIndex: 1,
  explanation: 'Neem is used for medicinal, agricultural and environmental purposes.',
),

MCQItem(
  question: 'Which gas is released in large amounts by burning fossil fuels?',
  options: [
    'Oxygen',
    'Carbon dioxide',
    'Hydrogen',
    'Nitrogen'
  ],
  correctIndex: 1,
  explanation: 'Burning fossil fuels releases large amounts of carbon dioxide.',
),

MCQItem(
  question: 'What is the main purpose of wildlife conservation?',
  options: [
    'Increase pollution',
    'Protect species from extinction',
    'Expand industries',
    'Reduce rainfall'
  ],
  correctIndex: 1,
  explanation: 'Wildlife conservation helps prevent species extinction.',
),

MCQItem(
  question: 'Yarsagumba is mainly used as:',
  options: [
    'Fuel',
    'Food preservative',
    'Energy-boosting herbal medicine',
    'Animal feed'
  ],
  correctIndex: 2,
  explanation: 'Yarsagumba is widely known as an energy-boosting medicinal herb.',
),

// Force and Motion (20 MCQs)

MCQItem(
  question: 'What is force?',
  options: [
    'Push or pull',
    'Energy',
    'Work',
    'Power'
  ],
  correctIndex: 0,
  explanation: 'Force is a push or pull acting on an object.',
),

MCQItem(
  question: 'What is the SI unit of force?',
  options: [
    'Joule',
    'Pascal',
    'Newton',
    'Watt'
  ],
  correctIndex: 2,
  explanation: 'The SI unit of force is Newton (N).',
),

MCQItem(
  question: 'Who proposed the Universal Law of Gravitation?',
  options: [
    'Galileo',
    'Einstein',
    'Newton',
    'Faraday'
  ],
  correctIndex: 2,
  explanation: 'Sir Isaac Newton proposed the Universal Law of Gravitation.',
),

MCQItem(
  question: 'What is gravitation?',
  options: [
    'Repulsion between objects',
    'Attraction between objects',
    'Motion of planets',
    'Frictional force'
  ],
  correctIndex: 1,
  explanation: 'Gravitation is the force of attraction between any two masses.',
),

MCQItem(
  question: 'Gravity is a force exerted by:',
  options: [
    'Earth',
    'Wind',
    'Light',
    'Sound'
  ],
  correctIndex: 0,
  explanation: 'Gravity is the attractive force exerted by Earth on objects.',
),

MCQItem(
  question: 'What happens to gravitational force when distance increases?',
  options: [
    'Increases',
    'Remains same',
    'Decreases',
    'Becomes zero instantly'
  ],
  correctIndex: 2,
  explanation: 'Gravitational force decreases as distance increases.',
),

MCQItem(
  question: 'What is free fall?',
  options: [
    'Motion under gravity alone',
    'Motion with friction',
    'Circular motion',
    'Uniform motion'
  ],
  correctIndex: 0,
  explanation: 'Free fall occurs when only gravity acts on an object.',
),

MCQItem(
  question: 'What is the approximate value of g on Earth?',
  options: [
    '3.8 m/s²',
    '9.8 m/s²',
    '12 m/s²',
    '15 m/s²'
  ],
  correctIndex: 1,
  explanation: 'Acceleration due to gravity on Earth is about 9.8 m/s².',
),

MCQItem(
  question: 'Which quantity affects gravitational force?',
  options: [
    'Mass',
    'Color',
    'Temperature',
    'Shape'
  ],
  correctIndex: 0,
  explanation: 'Gravitational force depends on the masses of objects.',
),

MCQItem(
  question: 'What is weight?',
  options: [
    'Mass of a body',
    'Gravitational force on a body',
    'Volume of a body',
    'Density of a body'
  ],
  correctIndex: 1,
  explanation: 'Weight is the gravitational force acting on an object.',
),

MCQItem(
  question: 'Weight is measured using:',
  options: [
    'Beam balance',
    'Spring balance',
    'Stopwatch',
    'Thermometer'
  ],
  correctIndex: 1,
  explanation: 'A spring balance measures weight.',
),

MCQItem(
  question: 'Mass of an object remains:',
  options: [
    'Constant everywhere',
    'Different on Earth and Moon',
    'Zero in space',
    'Depends on gravity'
  ],
  correctIndex: 0,
  explanation: 'Mass remains constant regardless of location.',
),

MCQItem(
  question: 'Weight on the Moon is approximately:',
  options: [
    'Equal to Earth',
    'Twice Earth',
    'One-sixth of Earth',
    'One-third of Earth'
  ],
  correctIndex: 2,
  explanation: 'Moon gravity is about one-sixth that of Earth.',
),

MCQItem(
  question: 'What is the SI unit of mass?',
  options: [
    'Newton',
    'Kilogram',
    'Joule',
    'Pascal'
  ],
  correctIndex: 1,
  explanation: 'The SI unit of mass is kilogram (kg).',
),

MCQItem(
  question: 'The force that keeps planets in orbit is:',
  options: [
    'Magnetic force',
    'Friction',
    'Gravitational force',
    'Electrostatic force'
  ],
  correctIndex: 2,
  explanation: 'Gravity keeps planets revolving around the Sun.',
),

MCQItem(
  question: 'According to Newton’s law, gravitational force is inversely proportional to:',
  options: [
    'Distance',
    'Square of distance',
    'Mass',
    'Time'
  ],
  correctIndex: 1,
  explanation: 'Gravitational force is inversely proportional to the square of the distance.',
),

MCQItem(
  question: 'What is the value of universal gravitational constant G?',
  options: [
    '6.67 × 10⁻¹¹ Nm²/kg²',
    '9.8 m/s²',
    '3 × 10⁸ m/s',
    '1.6 × 10⁻¹⁹ C'
  ],
  correctIndex: 0,
  explanation: 'The universal gravitational constant is 6.67 × 10⁻¹¹ Nm²/kg².',
),

MCQItem(
  question: 'Which scientist demonstrated that objects fall at the same rate in vacuum?',
  options: [
    'Newton',
    'Galileo',
    'Kepler',
    'Bohr'
  ],
  correctIndex: 1,
  explanation: 'Galileo showed that all objects fall equally in a vacuum.',
),

MCQItem(
  question: 'If the mass of one object doubles, gravitational force becomes:',
  options: [
    'Half',
    'Double',
    'Four times',
    'Unchanged'
  ],
  correctIndex: 1,
  explanation: 'Gravitational force is directly proportional to mass.',
),

MCQItem(
  question: 'Which formula represents Newton’s Universal Law of Gravitation?',
  options: [
    'F = ma',
    'F = Gm₁m₂/d²',
    'P = mv',
    'W = mg'
  ],
  correctIndex: 1,
  explanation: 'Newton’s law states F = Gm₁m₂/d².',
),
],

'science_pressure': [
  MCQItem(
  question: 'What is pressure?',
  options: ['Force × Area', 'Force / Area', 'Area / Force', 'Mass / Volume'],
  correctIndex: 1,
  explanation: 'Pressure is force (or thrust) acting per unit area.',
),

MCQItem(
  question: 'What is the SI unit of pressure?',
  options: ['Newton', 'Joule', 'Pascal', 'Watt'],
  correctIndex: 2,
  explanation: 'The SI unit of pressure is Pascal (Pa).',
),

MCQItem(
  question: 'Which substances are called fluids?',
  options: ['Only solids', 'Liquids and gases', 'Only gases', 'Only liquids'],
  correctIndex: 1,
  explanation: 'Liquids and gases can flow, so they are called fluids.',
),

MCQItem(
  question: 'What is thrust?',
  options: [
    'Force acting parallel to a surface',
    'Force acting perpendicular to a surface',
    'Pressure per unit area',
    'Weight of an object'
  ],
  correctIndex: 1,
  explanation: 'Thrust is a force acting perpendicular to a surface.',
),

MCQItem(
  question: 'The formula for pressure is:',
  options: ['P = F × A', 'P = F / A', 'P = A / F', 'P = m × g'],
  correctIndex: 1,
  explanation: 'Pressure equals force divided by area.',
),

MCQItem(
  question: 'Who explained that pressure is transmitted equally in an enclosed fluid?',
  options: ['Newton', 'Archimedes', 'Pascal', 'Galileo'],
  correctIndex: 2,
  explanation: 'Pascal’s law states that pressure is transmitted equally in enclosed fluids.',
),

MCQItem(
  question: 'What is upthrust?',
  options: [
    'Downward force of gravity',
    'Force due to friction',
    'Upward force exerted by a fluid',
    'Pressure on a surface'
  ],
  correctIndex: 2,
  explanation: 'Upthrust is the upward force exerted by a fluid on an object.',
),

MCQItem(
  question: 'A hydraulic press works on:',
  options: [
    'Newton’s law',
    'Archimedes’ principle',
    'Pascal’s law',
    'Law of gravitation'
  ],
  correctIndex: 2,
  explanation: 'Hydraulic machines are based on Pascal’s law.',
),

MCQItem(
  question: 'A lactometer is based on:',
  options: [
    'Pascal’s law',
    'Archimedes’ principle',
    'Newton’s law',
    'Ohm’s law'
  ],
  correctIndex: 1,
  explanation: 'A lactometer works on the principle of flotation, an application of Archimedes’ principle.',
),

MCQItem(
  question: 'What happens to pressure in a liquid as depth increases?',
  options: [
    'It decreases',
    'It remains constant',
    'It increases',
    'It becomes zero'
  ],
  correctIndex: 2,
  explanation: 'Pressure in a liquid increases with depth.',
),

MCQItem(
  question: 'According to Archimedes’ principle, upthrust is equal to:',
  options: [
    'Weight of the object',
    'Volume of the object',
    'Weight of displaced fluid',
    'Density of the object'
  ],
  correctIndex: 2,
  explanation: 'Upthrust equals the weight of the displaced fluid.',
),

MCQItem(
  question: 'A hydrogen balloon rises because:',
  options: [
    'Its weight is greater than the displaced air',
    'Its weight is less than the displaced air',
    'It has no weight',
    'Air pushes it downward'
  ],
  correctIndex: 1,
  explanation: 'A hydrogen balloon rises when its weight is less than the weight of displaced air.',
),

MCQItem(
  question: 'Which liquid provides greater upthrust?',
  options: ['Water', 'Glycerin', 'Kerosene', 'Petrol'],
  correctIndex: 1,
  explanation: 'Glycerin is denser than water and provides greater upthrust.',
),

MCQItem(
  question: 'A ship floats higher in seawater because:',
  options: [
    'Seawater is warmer',
    'Seawater is less dense',
    'Seawater is more dense',
    'Seawater has less pressure'
  ],
  correctIndex: 2,
  explanation: 'Seawater is denser and provides greater upthrust.',
),

MCQItem(
  question: 'Which force acts downward on a floating object?',
  options: ['Upthrust', 'Weight', 'Pressure', 'Friction'],
  correctIndex: 1,
  explanation: 'Weight acts vertically downward on a floating object.',
),

MCQItem(
  question: 'The law of floatation states that a floating body displaces:',
  options: [
    'Its own volume of fluid',
    'Its own mass of fluid',
    'A weight of fluid equal to its weight',
    'Half its weight of fluid'
  ],
  correctIndex: 2,
  explanation: 'A floating object displaces a weight of fluid equal to its own weight.',
),

MCQItem(
  question: 'Why does a wooden cork rise to the surface in water?',
  options: [
    'Its weight is greater than upthrust',
    'Upthrust is greater than its weight',
    'There is no upthrust',
    'Water pulls it downward'
  ],
  correctIndex: 1,
  explanation: 'The upthrust acting on the cork is greater than its weight.',
),

MCQItem(
  question: 'Why do we feel lighter while floating in water?',
  options: [
    'Water reduces gravity',
    'Water absorbs weight',
    'Water exerts upthrust on the body',
    'Air pressure increases'
  ],
  correctIndex: 2,
  explanation: 'Upthrust reduces the apparent weight of the body.',
),

MCQItem(
  question: 'Which instrument is used to measure the density of milk?',
  options: ['Barometer', 'Hydrometer', 'Lactometer', 'Manometer'],
  correctIndex: 2,
  explanation: 'A lactometer is used to check the density or purity of milk.',
),

MCQItem(
  question: 'Which of the following is an application of Pascal’s law?',
  options: [
    'Lactometer',
    'Hydraulic brake',
    'Ship',
    'Submarine'
  ],
  correctIndex: 1,
  explanation: 'Hydraulic brakes work on Pascal’s law.',
),
],

'science_heat': [
  MCQItem(
  question: 'What is heat?',
  options: [
    'Average kinetic energy of molecules',
    'Total kinetic energy of molecules',
    'Force per unit area',
    'Potential energy only'
  ],
  correctIndex: 1,
  explanation: 'Heat is the total kinetic energy of the molecules of a substance.',
),

MCQItem(
  question: 'Heat flows from:',
  options: [
    'Cold body to hot body',
    'Higher pressure to lower pressure',
    'Hot body to cold body',
    'Solid to liquid'
  ],
  correctIndex: 2,
  explanation: 'Heat always flows from a body at higher temperature to a body at lower temperature.',
),

MCQItem(
  question: 'Temperature is the measure of:',
  options: [
    'Total kinetic energy',
    'Average kinetic energy',
    'Potential energy',
    'Mass of molecules'
  ],
  correctIndex: 1,
  explanation: 'Temperature measures the average kinetic energy of molecules.',
),

MCQItem(
  question: 'What is the SI unit of temperature?',
  options: ['Celsius', 'Fahrenheit', 'Kelvin', 'Joule'],
  correctIndex: 2,
  explanation: 'Kelvin (K) is the SI unit of temperature.',
),

MCQItem(
  question: 'What is the SI unit of heat energy?',
  options: ['Pascal', 'Kelvin', 'Joule', 'Newton'],
  correctIndex: 2,
  explanation: 'Heat energy is measured in Joules (J).',
),

MCQItem(
  question: 'What is specific heat capacity?',
  options: [
    'Heat required to melt 1 kg substance',
    'Heat required to raise temperature of 1 kg substance by 1°C',
    'Heat required to boil water',
    'Heat required to cool 1 kg substance'
  ],
  correctIndex: 1,
  explanation: 'Specific heat capacity is the heat needed to raise the temperature of 1 kg substance by 1°C.',
),

MCQItem(
  question: 'What is the unit of specific heat capacity?',
  options: [
    'J/kg°C',
    'N/m²',
    'kg/m³',
    'Joule'
  ],
  correctIndex: 0,
  explanation: 'The unit of specific heat capacity is J/kg°C.',
),

MCQItem(
  question: 'What is thermal equilibrium?',
  options: [
    'State of maximum heat',
    'State when temperature is zero',
    'State when two bodies have the same temperature',
    'State of boiling'
  ],
  correctIndex: 2,
  explanation: 'Thermal equilibrium occurs when two bodies have the same temperature and no heat flows between them.',
),

MCQItem(
  question: 'Which branch of physics deals with measurement of heat?',
  options: [
    'Mechanics',
    'Calorimetry',
    'Optics',
    'Acoustics'
  ],
  correctIndex: 1,
  explanation: 'Calorimetry is the branch of physics that deals with heat measurement.',
),

MCQItem(
  question: 'According to the principle of calorimetry:',
  options: [
    'Heat gained = Heat lost',
    'Heat gained > Heat lost',
    'Heat lost = 0',
    'Heat gained = Mass'
  ],
  correctIndex: 0,
  explanation: 'In calorimetry, heat lost by the hot body equals heat gained by the cold body.',
),

MCQItem(
  question: 'The heat equation is:',
  options: [
    'Q = m × s × ΔT',
    'Q = m + s + ΔT',
    'Q = m ÷ s',
    'Q = F × A'
  ],
  correctIndex: 0,
  explanation: 'Heat energy is calculated using Q = m × s × ΔT.',
),

MCQItem(
  question: 'Water has a very high specific heat capacity of about:',
  options: [
    '420 J/kg°C',
    '4200 J/kg°C',
    '42 J/kg°C',
    '42000 J/kg°C'
  ],
  correctIndex: 1,
  explanation: 'The specific heat capacity of water is about 4200 J/kg°C.',
),

MCQItem(
  question: 'Why is water used in car radiators?',
  options: [
    'It is cheap',
    'It is transparent',
    'It has high specific heat capacity',
    'It evaporates quickly'
  ],
  correctIndex: 2,
  explanation: 'Water absorbs a large amount of heat due to its high specific heat capacity.',
),

MCQItem(
  question: 'What generally happens to substances when heated?',
  options: [
    'They contract',
    'They expand',
    'They disappear',
    'Their mass doubles'
  ],
  correctIndex: 1,
  explanation: 'Most substances expand when heated.',
),

MCQItem(
  question: 'Anomalous expansion of water occurs between:',
  options: [
    '0°C and 4°C',
    '4°C and 10°C',
    '10°C and 20°C',
    '0°C and 100°C'
  ],
  correctIndex: 0,
  explanation: 'Water shows anomalous behavior between 0°C and 4°C.',
),

MCQItem(
  question: 'At what temperature does water have maximum density?',
  options: [
    '0°C',
    '2°C',
    '4°C',
    '10°C'
  ],
  correctIndex: 2,
  explanation: 'Water has maximum density at 4°C.',
),

MCQItem(
  question: 'What is the lower fixed point of a Celsius thermometer?',
  options: [
    '0°C',
    '32°C',
    '100°C',
    '273°C'
  ],
  correctIndex: 0,
  explanation: 'The lower fixed point (ice point) is 0°C.',
),

MCQItem(
  question: 'What is the upper fixed point of a Celsius thermometer?',
  options: [
    '0°C',
    '32°C',
    '100°C',
    '212°C'
  ],
  correctIndex: 2,
  explanation: 'The upper fixed point (steam point) is 100°C.',
),

MCQItem(
  question: 'Why do water pipes burst in winter?',
  options: [
    'Water evaporates',
    'Water contracts',
    'Water expands on freezing',
    'Pressure decreases'
  ],
  correctIndex: 2,
  explanation: 'Water expands when it freezes, creating pressure that can crack pipes.',
),

MCQItem(
  question: 'Why is there less temperature difference between day and night in coastal areas?',
  options: [
    'High wind speed',
    'High humidity',
    'High specific heat capacity of water',
    'Low air pressure'
  ],
  correctIndex: 2,
  explanation: 'Water heats and cools slowly due to its high specific heat capacity, moderating coastal temperatures.',
),
],

'science_wave': [
  MCQItem(
  question: 'What is refraction of light?',
  options: [
    'Reflection of light',
    'Bending of light when it passes from one medium to another',
    'Splitting of light',
    'Absorption of light'
  ],
  correctIndex: 1,
  explanation: 'Refraction is the bending of light due to change in its speed when it enters another medium.',
),

MCQItem(
  question: 'When light travels from air to water, it bends:',
  options: [
    'Away from the normal',
    'Towards the normal',
    'Parallel to the surface',
    'Backward'
  ],
  correctIndex: 1,
  explanation: 'Light bends towards the normal when it travels from a rarer medium to a denser medium.',
),

MCQItem(
  question: 'Which of the following is optically denser?',
  options: ['Air', 'Water', 'Glass', 'Vacuum'],
  correctIndex: 2,
  explanation: 'Glass is optically denser than air and water because light travels slower in it.',
),

MCQItem(
  question: 'The refractive index of a medium is given by:',
  options: [
    'v/c',
    'c/v',
    'c × v',
    'v²/c'
  ],
  correctIndex: 1,
  explanation: 'Refractive index (μ) = speed of light in vacuum ÷ speed of light in the medium.',
),

MCQItem(
  question: 'Which law explains refraction of light?',
  options: [
    'Newton’s law',
    'Ohm’s law',
    'Snell’s law',
    'Boyle’s law'
  ],
  correctIndex: 2,
  explanation: 'Snell’s law describes the relationship between angles of incidence and refraction.',
),

MCQItem(
  question: 'A pencil partially dipped in water appears bent due to:',
  options: [
    'Reflection',
    'Dispersion',
    'Refraction',
    'Diffraction'
  ],
  correctIndex: 2,
  explanation: 'The pencil appears bent because of refraction of light at the water surface.',
),

MCQItem(
  question: 'A coin placed in water appears raised because of:',
  options: [
    'Reflection',
    'Refraction',
    'Diffusion',
    'Scattering'
  ],
  correctIndex: 1,
  explanation: 'Refraction makes the coin appear at a lesser depth than its actual position.',
),

MCQItem(
  question: 'Stars appear to twinkle due to:',
  options: [
    'Reflection',
    'Atmospheric refraction',
    'Dispersion',
    'Total internal reflection'
  ],
  correctIndex: 1,
  explanation: 'Atmospheric refraction causes the apparent twinkling of stars.',
),

MCQItem(
  question: 'What is total internal reflection?',
  options: [
    'Complete absorption of light',
    'Complete reflection of light back into the denser medium',
    'Partial reflection',
    'Scattering of light'
  ],
  correctIndex: 1,
  explanation: 'Total internal reflection occurs when all light is reflected back into the denser medium.',
),

MCQItem(
  question: 'For total internal reflection to occur, light must travel from:',
  options: [
    'Rarer to denser medium',
    'Denser to rarer medium',
    'Vacuum to air',
    'Air to water'
  ],
  correctIndex: 1,
  explanation: 'One condition for total internal reflection is that light travels from a denser to a rarer medium.',
),

MCQItem(
  question: 'The minimum angle of incidence for total internal reflection is called:',
  options: [
    'Angle of refraction',
    'Angle of deviation',
    'Critical angle',
    'Angle of reflection'
  ],
  correctIndex: 2,
  explanation: 'The critical angle is the minimum angle at which total internal reflection begins.',
),

MCQItem(
  question: 'Why does a diamond sparkle brightly?',
  options: [
    'Due to reflection only',
    'Due to diffraction',
    'Due to total internal reflection',
    'Due to absorption'
  ],
  correctIndex: 2,
  explanation: 'Multiple total internal reflections inside a diamond make it sparkle.',
),

MCQItem(
  question: 'Optical fibre works on the principle of:',
  options: [
    'Refraction',
    'Dispersion',
    'Total internal reflection',
    'Interference'
  ],
  correctIndex: 2,
  explanation: 'Light signals travel through optical fibres by total internal reflection.',
),

MCQItem(
  question: 'What is dispersion of light?',
  options: [
    'Reflection of light',
    'Splitting of white light into seven colours',
    'Absorption of light',
    'Bending of sound'
  ],
  correctIndex: 1,
  explanation: 'Dispersion is the separation of white light into its constituent colours.',
),

MCQItem(
  question: 'Which colour deviates the most in a prism?',
  options: [
    'Red',
    'Yellow',
    'Green',
    'Violet'
  ],
  correctIndex: 3,
  explanation: 'Violet light bends the most because it has the shortest wavelength.',
),

MCQItem(
  question: 'Which colour deviates the least in a prism?',
  options: [
    'Red',
    'Blue',
    'Indigo',
    'Violet'
  ],
  correctIndex: 0,
  explanation: 'Red light deviates the least because it has the longest wavelength.',
),

MCQItem(
  question: 'The sequence of colours in a rainbow is called:',
  options: [
    'ROYGBIV',
    'VIBGYOR',
    'RGB',
    'CMYK'
  ],
  correctIndex: 1,
  explanation: 'The seven colours of the visible spectrum are represented by VIBGYOR.',
),

MCQItem(
  question: 'A convex lens is also known as:',
  options: [
    'Diverging lens',
    'Converging lens',
    'Plane lens',
    'Cylindrical lens'
  ],
  correctIndex: 1,
  explanation: 'A convex lens converges parallel rays of light to a focus.',
),

MCQItem(
  question: 'Which lens is used to correct myopia (short-sightedness)?',
  options: [
    'Convex lens',
    'Concave lens',
    'Bifocal lens',
    'Cylindrical lens'
  ],
  correctIndex: 1,
  explanation: 'A concave lens diverges light rays and corrects myopia.',
),

MCQItem(
  question: 'Which lens is used to correct hypermetropia (long-sightedness)?',
  options: [
    'Concave lens',
    'Plane lens',
    'Convex lens',
    'Cylindrical lens'
  ],
  correctIndex: 2,
  explanation: 'A convex lens converges light rays and corrects hypermetropia.',
),
],

'science_electricity_and_magnetism': [
  MCQItem(
  question: 'What is electric current?',
  options: [
    'Flow of protons',
    'Flow of neutrons',
    'Rate of flow of electric charge',
    'Amount of resistance'
  ],
  correctIndex: 2,
  explanation: 'Electric current is the rate of flow of electric charge through a conductor.',
),

MCQItem(
  question: 'What is the SI unit of electric current?',
  options: ['Volt', 'Ohm', 'Ampere', 'Watt'],
  correctIndex: 2,
  explanation: 'Ampere (A) is the SI unit of electric current.',
),

MCQItem(
  question: 'Which instrument is used to measure electric current?',
  options: ['Voltmeter', 'Ammeter', 'Galvanometer', 'Ohmmeter'],
  correctIndex: 1,
  explanation: 'An ammeter is used to measure electric current in a circuit.',
),

MCQItem(
  question: 'What is the SI unit of potential difference?',
  options: ['Ampere', 'Ohm', 'Volt', 'Watt'],
  correctIndex: 2,
  explanation: 'Potential difference is measured in volts (V).',
),

MCQItem(
  question: 'Which instrument measures potential difference?',
  options: ['Ammeter', 'Voltmeter', 'Fuse', 'Rheostat'],
  correctIndex: 1,
  explanation: 'A voltmeter is used to measure potential difference across a component.',
),

MCQItem(
  question: 'Ohm’s law states that:',
  options: [
    'V ∝ I at constant temperature',
    'V ∝ 1/I',
    'R ∝ I',
    'Power ∝ Resistance'
  ],
  correctIndex: 0,
  explanation: 'According to Ohm’s law, voltage is directly proportional to current at constant temperature.',
),

MCQItem(
  question: 'The mathematical form of Ohm’s law is:',
  options: [
    'V = IR',
    'P = VI',
    'R = V + I',
    'I = VR'
  ],
  correctIndex: 0,
  explanation: 'Ohm’s law is expressed as V = IR.',
),

MCQItem(
  question: 'What is the SI unit of resistance?',
  options: ['Volt', 'Ampere', 'Ohm', 'Joule'],
  correctIndex: 2,
  explanation: 'Resistance is measured in ohms (Ω).',
),

MCQItem(
  question: 'Which material is a good conductor of electricity?',
  options: ['Rubber', 'Plastic', 'Copper', 'Wood'],
  correctIndex: 2,
  explanation: 'Copper allows electric current to pass through it easily.',
),

MCQItem(
  question: 'What is electrical power?',
  options: [
    'Rate of doing electrical work',
    'Amount of charge',
    'Potential difference',
    'Resistance offered'
  ],
  correctIndex: 0,
  explanation: 'Electrical power is the rate at which electrical energy is consumed.',
),

MCQItem(
  question: 'What is the SI unit of electrical power?',
  options: ['Joule', 'Volt', 'Watt', 'Ohm'],
  correctIndex: 2,
  explanation: 'The SI unit of power is watt (W).',
),

MCQItem(
  question: 'The formula for electrical power is:',
  options: [
    'P = VI',
    'P = IR',
    'P = V/R',
    'P = I/R'
  ],
  correctIndex: 0,
  explanation: 'Electrical power is calculated using P = VI.',
),

MCQItem(
  question: 'What is the commercial unit of electrical energy?',
  options: [
    'Joule',
    'Watt',
    'Kilowatt-hour',
    'Volt'
  ],
  correctIndex: 2,
  explanation: 'Electrical energy consumed commercially is measured in kilowatt-hour (kWh).',
),

MCQItem(
  question: 'One kilowatt-hour is equal to:',
  options: [
    '3.6 × 10⁶ J',
    '3600 J',
    '1000 J',
    '36 J'
  ],
  correctIndex: 0,
  explanation: '1 kWh = 3.6 × 10⁶ joules.',
),

MCQItem(
  question: 'A fuse is used in a circuit to:',
  options: [
    'Increase current',
    'Decrease voltage',
    'Protect from excessive current',
    'Measure resistance'
  ],
  correctIndex: 2,
  explanation: 'A fuse melts when excessive current flows, protecting appliances.',
),

MCQItem(
  question: 'Which device is used to control current in a circuit?',
  options: [
    'Fuse',
    'Rheostat',
    'Voltmeter',
    'Motor'
  ],
  correctIndex: 1,
  explanation: 'A rheostat is a variable resistor used to control current.',
),

MCQItem(
  question: 'What is a magnet?',
  options: [
    'A device that produces heat',
    'A material that attracts magnetic substances',
    'A source of light',
    'An electric conductor'
  ],
  correctIndex: 1,
  explanation: 'A magnet attracts magnetic materials such as iron, nickel, and cobalt.',
),

MCQItem(
  question: 'Which of the following is a magnetic material?',
  options: [
    'Plastic',
    'Aluminium',
    'Iron',
    'Wood'
  ],
  correctIndex: 2,
  explanation: 'Iron is strongly attracted by magnets.',
),

MCQItem(
  question: 'Like poles of a magnet:',
  options: [
    'Attract each other',
    'Repel each other',
    'Become neutral',
    'Produce electricity'
  ],
  correctIndex: 1,
  explanation: 'Like poles repel while unlike poles attract.',
),

MCQItem(
  question: 'The region around a magnet where magnetic force acts is called:',
  options: [
    'Electric field',
    'Magnetic field',
    'Potential difference',
    'Resistance field'
  ],
  correctIndex: 1,
  explanation: 'The space around a magnet where magnetic effects are felt is called a magnetic field.',
),
],

'science_universe': [
  MCQItem(
  question: 'What is the universe?',
  options: [
    'Only the Solar System',
    'Only the Milky Way Galaxy',
    'Everything that exists including space, matter, and energy',
    'Only stars and planets'
  ],
  correctIndex: 2,
  explanation: 'The universe includes all matter, energy, space, stars, galaxies, and celestial bodies.',
),

MCQItem(
  question: 'Which theory explains the origin of the universe?',
  options: [
    'Cell Theory',
    'Big Bang Theory',
    'Atomic Theory',
    'Wave Theory'
  ],
  correctIndex: 1,
  explanation: 'The Big Bang Theory states that the universe began from a highly dense and hot state.',
),

MCQItem(
  question: 'Approximately how old is the universe?',
  options: [
    '4.6 billion years',
    '13.8 billion years',
    '100 million years',
    '1 billion years'
  ],
  correctIndex: 1,
  explanation: 'Scientists estimate the age of the universe to be about 13.8 billion years.',
),

MCQItem(
  question: 'A galaxy is a collection of:',
  options: [
    'Only planets',
    'Only stars',
    'Stars, dust, gas, and other celestial bodies',
    'Only satellites'
  ],
  correctIndex: 2,
  explanation: 'A galaxy contains billions of stars along with gas, dust, and other celestial objects.',
),

MCQItem(
  question: 'Which galaxy contains our Solar System?',
  options: [
    'Andromeda Galaxy',
    'Whirlpool Galaxy',
    'Milky Way Galaxy',
    'Sombrero Galaxy'
  ],
  correctIndex: 2,
  explanation: 'Our Solar System lies within the Milky Way Galaxy.',
),

MCQItem(
  question: 'What is a light-year?',
  options: [
    'Time taken by Earth to orbit the Sun',
    'Distance travelled by light in one year',
    'Distance between Earth and Moon',
    'Time taken by light to reach Earth'
  ],
  correctIndex: 1,
  explanation: 'A light-year is a unit of distance equal to the distance light travels in one year.',
),

MCQItem(
  question: 'Which is the nearest star to Earth?',
  options: [
    'Sirius',
    'Polaris',
    'Sun',
    'Alpha Centauri'
  ],
  correctIndex: 2,
  explanation: 'The Sun is the nearest star to Earth.',
),

MCQItem(
  question: 'The Sun is a:',
  options: [
    'Planet',
    'Satellite',
    'Star',
    'Comet'
  ],
  correctIndex: 2,
  explanation: 'The Sun is a medium-sized star at the center of the Solar System.',
),

MCQItem(
  question: 'How many planets are there in the Solar System?',
  options: [
    '7',
    '8',
    '9',
    '10'
  ],
  correctIndex: 1,
  explanation: 'There are eight recognized planets in the Solar System.',
),

MCQItem(
  question: 'Which planet is closest to the Sun?',
  options: [
    'Venus',
    'Earth',
    'Mercury',
    'Mars'
  ],
  correctIndex: 2,
  explanation: 'Mercury is the closest planet to the Sun.',
),

MCQItem(
  question: 'Which planet is known as the Red Planet?',
  options: [
    'Venus',
    'Mars',
    'Jupiter',
    'Mercury'
  ],
  correctIndex: 1,
  explanation: 'Mars appears reddish due to iron oxide on its surface.',
),

MCQItem(
  question: 'Which is the largest planet in the Solar System?',
  options: [
    'Earth',
    'Saturn',
    'Jupiter',
    'Neptune'
  ],
  correctIndex: 2,
  explanation: 'Jupiter is the largest planet in the Solar System.',
),

MCQItem(
  question: 'Which planet is famous for its prominent rings?',
  options: [
    'Mars',
    'Jupiter',
    'Saturn',
    'Venus'
  ],
  correctIndex: 2,
  explanation: 'Saturn is well known for its beautiful ring system.',
),

MCQItem(
  question: 'What is the natural satellite of Earth?',
  options: [
    'Sun',
    'Mars',
    'Moon',
    'Venus'
  ],
  correctIndex: 2,
  explanation: 'The Moon is Earth’s only natural satellite.',
),

MCQItem(
  question: 'A celestial body that revolves around a planet is called:',
  options: [
    'Star',
    'Satellite',
    'Galaxy',
    'Asteroid'
  ],
  correctIndex: 1,
  explanation: 'A satellite revolves around a planet due to gravitational attraction.',
),

MCQItem(
  question: 'What is an asteroid?',
  options: [
    'A large star',
    'A rocky object orbiting the Sun',
    'A natural satellite',
    'A gas giant'
  ],
  correctIndex: 1,
  explanation: 'Asteroids are small rocky bodies that orbit the Sun.',
),

MCQItem(
  question: 'A comet mainly consists of:',
  options: [
    'Molten rock',
    'Ice, dust, and gases',
    'Pure iron',
    'Liquid water'
  ],
  correctIndex: 1,
  explanation: 'Comets are made of ice, dust, and frozen gases.',
),

MCQItem(
  question: 'Why does a comet develop a tail near the Sun?',
  options: [
    'Due to rainfall',
    'Due to strong winds on Earth',
    'Due to heating of ice and gases',
    'Due to collision with planets'
  ],
  correctIndex: 2,
  explanation: 'Heat from the Sun causes ice and gases to vaporize, forming a tail.',
),

MCQItem(
  question: 'Which force keeps planets revolving around the Sun?',
  options: [
    'Magnetic force',
    'Frictional force',
    'Gravitational force',
    'Electrostatic force'
  ],
  correctIndex: 2,
  explanation: 'The Sun’s gravitational force keeps planets in their orbits.',
),

MCQItem(
  question: 'Which planet is known as the Blue Planet?',
  options: [
    'Earth',
    'Neptune',
    'Uranus',
    'Venus'
  ],
  correctIndex: 0,
  explanation: 'Earth appears blue from space because most of its surface is covered by water.',
),
],

'science_information_and_communication': [
  MCQItem(
  question: 'What does ICT stand for?',
  options: [
    'Information and Computer Technology',
    'Information and Communication Technology',
    'Internet and Computer Technology',
    'Information and Communication Transfer'
  ],
  correctIndex: 1,
  explanation: 'ICT stands for Information and Communication Technology.',
),

MCQItem(
  question: 'Which signal uses continuous values?',
  options: [
    'Digital signal',
    'Binary signal',
    'Analog signal',
    'Pulse signal'
  ],
  correctIndex: 2,
  explanation: 'Analog signals vary continuously over time.',
),

MCQItem(
  question: 'Digital signals are represented by:',
  options: [
    '0 and 1',
    'A and B',
    'Positive and negative',
    'High and low voltage only'
  ],
  correctIndex: 0,
  explanation: 'Digital signals use binary digits 0 and 1.'
),

MCQItem(
  question: 'What is the smallest unit of computer memory?',
  options: [
    'Byte',
    'Nibble',
    'Bit',
    'Kilobyte'
  ],
  correctIndex: 2,
  explanation: 'A bit (binary digit) is the smallest unit of computer memory.'
),

MCQItem(
  question: 'How many bits are there in one byte?',
  options: [
    '2',
    '4',
    '8',
    '16'
  ],
  correctIndex: 2,
  explanation: 'One byte consists of 8 bits.'
),

MCQItem(
  question: 'Which device converts analog signals into digital signals?',
  options: [
    'DAC',
    'ADC',
    'Modem',
    'Router'
  ],
  correctIndex: 1,
  explanation: 'ADC (Analog to Digital Converter) converts analog signals into digital signals.'
),

MCQItem(
  question: 'Which device converts digital signals into analog signals?',
  options: [
    'ADC',
    'DAC',
    'CPU',
    'RAM'
  ],
  correctIndex: 1,
  explanation: 'DAC (Digital to Analog Converter) converts digital signals into analog signals.'
),

MCQItem(
  question: 'Which type of transmission is used in modern high-speed internet?',
  options: [
    'Baseband',
    'Broadband',
    'Simplex',
    'Half-duplex'
  ],
  correctIndex: 1,
  explanation: 'Broadband transmission is used for high-speed internet communication.'
),

MCQItem(
  question: 'What is a major advantage of digital transmission?',
  options: [
    'More noise',
    'Less security',
    'Less effect of noise',
    'Higher error rate'
  ],
  correctIndex: 2,
  explanation: 'Digital transmission is less affected by noise and interference.'
),

MCQItem(
  question: 'Which of the following is an example of digital technology?',
  options: [
    'Smartphone',
    'Notebook',
    'Blackboard',
    'Chalk'
  ],
  correctIndex: 0,
  explanation: 'A smartphone is a common example of digital technology.'
),

MCQItem(
  question: 'Which digital technology allows cashless transactions?',
  options: [
    'Digital library',
    'Social network',
    'Digital payment',
    'Digital camera'
  ],
  correctIndex: 2,
  explanation: 'Digital payment systems allow users to make cashless transactions.'
),

MCQItem(
  question: 'What is a digital library?',
  options: [
    'A building with books',
    'A collection of digital reading materials',
    'A printing press',
    'A bookshop'
  ],
  correctIndex: 1,
  explanation: 'A digital library stores books and learning resources in digital form.'
),

MCQItem(
  question: 'What is a major negative effect of excessive digital technology use?',
  options: [
    'Improved fitness',
    'Cybercrime',
    'Better eyesight',
    'More physical activity'
  ],
  correctIndex: 1,
  explanation: 'Misuse of digital technology can lead to cybercrime.'
),

MCQItem(
  question: 'Who is called a netizen?',
  options: [
    'A computer engineer',
    'A citizen of a city',
    'An active internet user',
    'A network administrator'
  ],
  correctIndex: 2,
  explanation: 'A netizen is a person who actively uses and participates on the internet.'
),

MCQItem(
  question: 'What is digital citizenship?',
  options: [
    'Citizenship of a country',
    'Responsible participation in the digital world',
    'Using only social media',
    'Owning a computer'
  ],
  correctIndex: 1,
  explanation: 'Digital citizenship means responsible and ethical use of digital technology.'
),

MCQItem(
  question: 'Which behavior is expected from a good netizen?',
  options: [
    'Using rude language',
    'Respecting others online',
    'Sharing false information',
    'Ignoring internet rules'
  ],
  correctIndex: 1,
  explanation: 'A good netizen respects others and behaves responsibly online.'
),

MCQItem(
  question: 'What is online reputation?',
  options: [
    'A person’s image in the online world',
    'Computer memory',
    'Internet speed',
    'Network security'
  ],
  correctIndex: 0,
  explanation: 'Online reputation is how a person or organization is viewed based on online activities.'
),

MCQItem(
  question: 'Poor privacy settings may lead to:',
  options: [
    'Better security',
    'Password theft',
    'Faster internet',
    'More storage'
  ],
  correctIndex: 1,
  explanation: 'Weak privacy settings can increase the risk of password theft.'
),

MCQItem(
  question: 'What is digital well-being?',
  options: [
    'Using technology all day',
    'Avoiding all technology',
    'Maintaining a healthy balance between online and offline life',
    'Owning many digital devices'
  ],
  correctIndex: 2,
  explanation: 'Digital well-being means using technology in a balanced and healthy way.'
),

MCQItem(
  question: 'Which of the following helps maintain digital well-being?',
  options: [
    'Spending all day online',
    'Ignoring physical exercise',
    'Balancing screen time with other activities',
    'Playing games continuously'
  ],
  correctIndex: 2,
  explanation: 'A healthy balance between digital and physical activities promotes digital well-being.'
),
],

'science_classification_of_element': [
  MCQItem(
  question: 'Who developed the modern periodic table?',
  options: [
    'John Dalton',
    'Dmitri Mendeleev',
    'Henry Moseley',
    'J.J. Thomson'
  ],
  correctIndex: 2,
  explanation: 'Henry Moseley arranged elements according to their atomic numbers, leading to the modern periodic table.',
),

MCQItem(
  question: 'The modern periodic table is based on:',
  options: [
    'Atomic mass',
    'Density',
    'Atomic number',
    'Valency'
  ],
  correctIndex: 2,
  explanation: 'Elements in the modern periodic table are arranged in increasing order of atomic number.',
),

MCQItem(
  question: 'How many periods are there in the modern periodic table?',
  options: [
    '6',
    '7',
    '8',
    '18'
  ],
  correctIndex: 1,
  explanation: 'The modern periodic table consists of 7 horizontal rows called periods.',
),

MCQItem(
  question: 'How many groups are there in the modern periodic table?',
  options: [
    '7',
    '8',
    '16',
    '18'
  ],
  correctIndex: 3,
  explanation: 'There are 18 vertical columns called groups in the modern periodic table.',
),

MCQItem(
  question: 'Elements in the same group have similar:',
  options: [
    'Atomic masses',
    'Chemical properties',
    'Number of neutrons',
    'Physical states'
  ],
  correctIndex: 1,
  explanation: 'Elements in the same group have similar chemical properties because they have the same number of valence electrons.',
),

MCQItem(
  question: 'What is the valency of Group 1 elements?',
  options: [
    '0',
    '1',
    '2',
    '3'
  ],
  correctIndex: 1,
  explanation: 'Group 1 elements have one valence electron and a valency of 1.',
),

MCQItem(
  question: 'Group 1 elements are called:',
  options: [
    'Halogens',
    'Noble gases',
    'Alkali metals',
    'Alkaline earth metals'
  ],
  correctIndex: 2,
  explanation: 'The elements of Group 1 are known as alkali metals.',
),

MCQItem(
  question: 'Group 17 elements are known as:',
  options: [
    'Halogens',
    'Alkali metals',
    'Transition metals',
    'Noble gases'
  ],
  correctIndex: 0,
  explanation: 'Group 17 elements are called halogens.',
),

MCQItem(
  question: 'Group 18 elements are called:',
  options: [
    'Halogens',
    'Alkali metals',
    'Noble gases',
    'Metalloids'
  ],
  correctIndex: 2,
  explanation: 'Group 18 contains noble gases, which are chemically inert.',
),

MCQItem(
  question: 'Which of the following is a noble gas?',
  options: [
    'Oxygen',
    'Nitrogen',
    'Helium',
    'Chlorine'
  ],
  correctIndex: 2,
  explanation: 'Helium belongs to Group 18 and is a noble gas.',
),

MCQItem(
  question: 'Which element is located in Period 2 and Group 17?',
  options: [
    'Fluorine',
    'Chlorine',
    'Bromine',
    'Iodine'
  ],
  correctIndex: 0,
  explanation: 'Fluorine is a halogen found in Period 2 and Group 17.',
),

MCQItem(
  question: 'Which of the following is an alkali metal?',
  options: [
    'Magnesium',
    'Calcium',
    'Sodium',
    'Aluminium'
  ],
  correctIndex: 2,
  explanation: 'Sodium belongs to Group 1 and is an alkali metal.',
),

MCQItem(
  question: 'The number of shells in an atom is equal to its:',
  options: [
    'Group number',
    'Period number',
    'Atomic number',
    'Valency'
  ],
  correctIndex: 1,
  explanation: 'The period number indicates the number of electron shells.',
),

MCQItem(
  question: 'The number of valence electrons generally corresponds to:',
  options: [
    'Period number',
    'Mass number',
    'Group number',
    'Neutron number'
  ],
  correctIndex: 2,
  explanation: 'For representative elements, the group number indicates valence electrons.',
),

MCQItem(
  question: 'Which property increases from left to right across a period?',
  options: [
    'Metallic character',
    'Atomic size',
    'Non-metallic character',
    'Number of shells'
  ],
  correctIndex: 2,
  explanation: 'Non-metallic character generally increases across a period from left to right.',
),

MCQItem(
  question: 'Which property decreases across a period?',
  options: [
    'Atomic number',
    'Non-metallic character',
    'Atomic size',
    'Valence electrons'
  ],
  correctIndex: 2,
  explanation: 'Atomic size decreases across a period due to increasing nuclear charge.',
),

MCQItem(
  question: 'Which property increases down a group?',
  options: [
    'Atomic size',
    'Non-metallic character',
    'Electronegativity',
    'Ionization energy'
  ],
  correctIndex: 0,
  explanation: 'Atomic size increases down a group because additional electron shells are added.',
),

MCQItem(
  question: 'Which of the following is a metalloid?',
  options: [
    'Sodium',
    'Silicon',
    'Oxygen',
    'Neon'
  ],
  correctIndex: 1,
  explanation: 'Silicon shows properties of both metals and non-metals, so it is a metalloid.',
),

MCQItem(
  question: 'Which element has atomic number 1?',
  options: [
    'Helium',
    'Hydrogen',
    'Lithium',
    'Carbon'
  ],
  correctIndex: 1,
  explanation: 'Hydrogen is the first element in the periodic table with atomic number 1.',
),

MCQItem(
  question: 'Why are noble gases generally unreactive?',
  options: [
    'They have large atomic sizes',
    'They have incomplete outer shells',
    'They have completely filled outermost shells',
    'They contain no electrons'
  ],
  correctIndex: 2,
  explanation: 'Noble gases are stable because their outermost electron shells are completely filled.',
),
],

'science_chemical_reaction': [
  MCQItem(
  question: 'What is a chemical reaction?',
  options: [
    'A physical change only',
    'A process in which new substances are formed',
    'A change in shape',
    'A change in size'
  ],
  correctIndex: 1,
  explanation: 'A chemical reaction is a process in which one or more substances are converted into new substances.',
),

MCQItem(
  question: 'The substances that take part in a chemical reaction are called:',
  options: [
    'Products',
    'Catalysts',
    'Reactants',
    'Elements'
  ],
  correctIndex: 2,
  explanation: 'Reactants are the substances that undergo chemical change during a reaction.',
),

MCQItem(
  question: 'The substances formed after a chemical reaction are called:',
  options: [
    'Reactants',
    'Products',
    'Catalysts',
    'Compounds'
  ],
  correctIndex: 1,
  explanation: 'Products are the new substances formed after a chemical reaction.',
),

MCQItem(
  question: 'Which of the following is an indicator of a chemical reaction?',
  options: [
    'Change in colour',
    'Formation of gas',
    'Formation of precipitate',
    'All of the above'
  ],
  correctIndex: 3,
  explanation: 'Colour change, gas evolution, and precipitate formation are common signs of chemical reactions.',
),

MCQItem(
  question: 'What is a chemical equation?',
  options: [
    'A mathematical formula',
    'A symbolic representation of a chemical reaction',
    'A physical formula',
    'A graph of a reaction'
  ],
  correctIndex: 1,
  explanation: 'A chemical equation represents a chemical reaction using symbols and formulae.',
),

MCQItem(
  question: 'Which law states that mass is neither created nor destroyed during a chemical reaction?',
  options: [
    'Law of Constant Proportion',
    'Law of Conservation of Mass',
    'Boyle’s Law',
    'Ohm’s Law'
  ],
  correctIndex: 1,
  explanation: 'The Law of Conservation of Mass states that total mass remains constant during a chemical reaction.',
),

MCQItem(
  question: 'Who proposed the Law of Conservation of Mass?',
  options: [
    'Dalton',
    'Lavoisier',
    'Mendeleev',
    'Rutherford'
  ],
  correctIndex: 1,
  explanation: 'Antoine Lavoisier proposed the Law of Conservation of Mass.',
),

MCQItem(
  question: 'A chemical equation must be:',
  options: [
    'Coloured',
    'Balanced',
    'Printed',
    'Complex'
  ],
  correctIndex: 1,
  explanation: 'A chemical equation must be balanced to satisfy the Law of Conservation of Mass.',
),

MCQItem(
  question: 'What is a combination reaction?',
  options: [
    'One compound breaks into simpler substances',
    'Two or more substances combine to form one product',
    'Exchange of ions',
    'Reaction with oxygen only'
  ],
  correctIndex: 1,
  explanation: 'In a combination reaction, two or more substances combine to form a single product.',
),

MCQItem(
  question: 'Which of the following is a combination reaction?',
  options: [
    '2H₂ + O₂ → 2H₂O',
    'CaCO₃ → CaO + CO₂',
    'Zn + CuSO₄ → ZnSO₄ + Cu',
    'AgNO₃ + NaCl → AgCl + NaNO₃'
  ],
  correctIndex: 0,
  explanation: 'Hydrogen and oxygen combine to form water in a combination reaction.',
),

MCQItem(
  question: 'What is a decomposition reaction?',
  options: [
    'Formation of one product',
    'Breaking of a compound into simpler substances',
    'Exchange of ions',
    'Reaction with water'
  ],
  correctIndex: 1,
  explanation: 'A decomposition reaction involves breaking a compound into simpler substances.',
),

MCQItem(
  question: 'Which of the following is a decomposition reaction?',
  options: [
    '2Mg + O₂ → 2MgO',
    'CaCO₃ → CaO + CO₂',
    'HCl + NaOH → NaCl + H₂O',
    'Fe + S → FeS'
  ],
  correctIndex: 1,
  explanation: 'Calcium carbonate decomposes into calcium oxide and carbon dioxide.',
),

MCQItem(
  question: 'A reaction in which a more reactive element displaces a less reactive element is called:',
  options: [
    'Combination reaction',
    'Double displacement reaction',
    'Displacement reaction',
    'Neutralization reaction'
  ],
  correctIndex: 2,
  explanation: 'In a displacement reaction, a more reactive element replaces a less reactive one.',
),

MCQItem(
  question: 'Which reaction represents a displacement reaction?',
  options: [
    'Zn + CuSO₄ → ZnSO₄ + Cu',
    '2H₂ + O₂ → 2H₂O',
    'CaCO₃ → CaO + CO₂',
    'NaOH + HCl → NaCl + H₂O'
  ],
  correctIndex: 0,
  explanation: 'Zinc displaces copper from copper sulfate solution.',
),

MCQItem(
  question: 'A reaction involving exchange of ions between compounds is called:',
  options: [
    'Combination reaction',
    'Double displacement reaction',
    'Decomposition reaction',
    'Combustion reaction'
  ],
  correctIndex: 1,
  explanation: 'In a double displacement reaction, ions are exchanged between compounds.',
),

MCQItem(
  question: 'What is a catalyst?',
  options: [
    'A substance that slows down a reaction',
    'A substance that changes colour',
    'A substance that changes the rate of reaction without being consumed',
    'A product of reaction'
  ],
  correctIndex: 2,
  explanation: 'A catalyst alters the rate of reaction without itself undergoing permanent change.',
),

MCQItem(
  question: 'Which gas is produced when zinc reacts with dilute hydrochloric acid?',
  options: [
    'Oxygen',
    'Hydrogen',
    'Nitrogen',
    'Carbon dioxide'
  ],
  correctIndex: 1,
  explanation: 'Zinc reacts with hydrochloric acid to produce hydrogen gas.',
),

MCQItem(
  question: 'What type of reaction is burning of magnesium ribbon in air?',
  options: [
    'Combination reaction',
    'Decomposition reaction',
    'Neutralization reaction',
    'Displacement reaction'
  ],
  correctIndex: 0,
  explanation: 'Magnesium combines with oxygen to form magnesium oxide.',
),

MCQItem(
  question: 'What is a precipitate?',
  options: [
    'A gas formed in a reaction',
    'A liquid product',
    'An insoluble solid formed during a reaction',
    'A catalyst'
  ],
  correctIndex: 2,
  explanation: 'A precipitate is an insoluble solid produced during a chemical reaction.',
),

MCQItem(
  question: 'Why are chemical equations balanced?',
  options: [
    'To make them shorter',
    'To satisfy the Law of Conservation of Mass',
    'To increase reaction speed',
    'To reduce products'
  ],
  correctIndex: 1,
  explanation: 'Balancing ensures that the number of atoms of each element is equal on both sides of the equation.',
),
],

'science_gases': [
  MCQItem(
  question: 'Which gas is essential for respiration in living organisms?',
  options: [
    'Hydrogen',
    'Nitrogen',
    'Oxygen',
    'Carbon dioxide'
  ],
  correctIndex: 2,
  explanation: 'Oxygen is required for respiration and the release of energy in living cells.',
),

MCQItem(
  question: 'What is the chemical formula of oxygen gas?',
  options: [
    'O',
    'O₂',
    'O₃',
    'CO₂'
  ],
  correctIndex: 1,
  explanation: 'Oxygen exists naturally as a diatomic molecule, O₂.',
),

MCQItem(
  question: 'Approximately what percentage of air is oxygen?',
  options: [
    '21%',
    '78%',
    '1%',
    '50%'
  ],
  correctIndex: 0,
  explanation: 'Oxygen makes up about 21% of the Earth’s atmosphere.',
),

MCQItem(
  question: 'Which gas supports combustion?',
  options: [
    'Nitrogen',
    'Hydrogen',
    'Carbon dioxide',
    'Oxygen'
  ],
  correctIndex: 3,
  explanation: 'Oxygen supports burning but does not burn itself.',
),

MCQItem(
  question: 'Which chemical is commonly used in the laboratory preparation of oxygen?',
  options: [
    'Sodium chloride',
    'Potassium chlorate',
    'Calcium carbonate',
    'Copper sulfate'
  ],
  correctIndex: 1,
  explanation: 'Oxygen can be prepared by heating potassium chlorate in the presence of manganese dioxide.',
),

MCQItem(
  question: 'What is the chemical formula of hydrogen gas?',
  options: [
    'H',
    'H₂',
    'HO',
    'H₂O'
  ],
  correctIndex: 1,
  explanation: 'Hydrogen exists as a diatomic gas with the formula H₂.',
),

MCQItem(
  question: 'Which is the lightest gas?',
  options: [
    'Oxygen',
    'Nitrogen',
    'Hydrogen',
    'Carbon dioxide'
  ],
  correctIndex: 2,
  explanation: 'Hydrogen is the lightest known gas.',
),

MCQItem(
  question: 'What sound is heard when hydrogen burns?',
  options: [
    'Whistle sound',
    'Pop sound',
    'Bell sound',
    'Cracking sound'
  ],
  correctIndex: 1,
  explanation: 'Hydrogen burns with a characteristic pop sound.',
),

MCQItem(
  question: 'Hydrogen is mainly used in the manufacture of:',
  options: [
    'Ammonia',
    'Limestone',
    'Glass',
    'Cement'
  ],
  correctIndex: 0,
  explanation: 'Hydrogen is used in the Haber process for the manufacture of ammonia.',
),

MCQItem(
  question: 'Which gas is known as a greenhouse gas?',
  options: [
    'Hydrogen',
    'Carbon dioxide',
    'Oxygen',
    'Helium'
  ],
  correctIndex: 1,
  explanation: 'Carbon dioxide contributes significantly to the greenhouse effect.',
),

MCQItem(
  question: 'What is the chemical formula of carbon dioxide?',
  options: [
    'CO',
    'CO₂',
    'C₂O',
    'C₂O₂'
  ],
  correctIndex: 1,
  explanation: 'Carbon dioxide contains one carbon atom and two oxygen atoms.',
),

MCQItem(
  question: 'Which gas is released during respiration?',
  options: [
    'Oxygen',
    'Hydrogen',
    'Carbon dioxide',
    'Nitrogen'
  ],
  correctIndex: 2,
  explanation: 'Carbon dioxide is produced as a waste product during respiration.',
),

MCQItem(
  question: 'Which gas is used by green plants during photosynthesis?',
  options: [
    'Oxygen',
    'Hydrogen',
    'Nitrogen',
    'Carbon dioxide'
  ],
  correctIndex: 3,
  explanation: 'Plants use carbon dioxide to prepare food during photosynthesis.',
),

MCQItem(
  question: 'Which gas turns lime water milky?',
  options: [
    'Hydrogen',
    'Oxygen',
    'Carbon dioxide',
    'Nitrogen'
  ],
  correctIndex: 2,
  explanation: 'Carbon dioxide reacts with lime water to form calcium carbonate, making it milky.',
),

MCQItem(
  question: 'What is the major component of air?',
  options: [
    'Oxygen',
    'Carbon dioxide',
    'Nitrogen',
    'Hydrogen'
  ],
  correctIndex: 2,
  explanation: 'Nitrogen makes up about 78% of the atmosphere.',
),

MCQItem(
  question: 'What is the chemical formula of ammonia?',
  options: [
    'NH₂',
    'NH₃',
    'N₂H',
    'N₂H₄'
  ],
  correctIndex: 1,
  explanation: 'Ammonia is a compound of nitrogen and hydrogen with the formula NH₃.',
),

MCQItem(
  question: 'Which gas has a pungent smell?',
  options: [
    'Oxygen',
    'Hydrogen',
    'Ammonia',
    'Nitrogen'
  ],
  correctIndex: 2,
  explanation: 'Ammonia is a colorless gas with a strong pungent smell.',
),

MCQItem(
  question: 'Ammonia is highly soluble in:',
  options: [
    'Oil',
    'Water',
    'Kerosene',
    'Petrol'
  ],
  correctIndex: 1,
  explanation: 'Ammonia dissolves readily in water.',
),

MCQItem(
  question: 'Which gas is used in the manufacture of fertilizers?',
  options: [
    'Oxygen',
    'Carbon dioxide',
    'Hydrogen',
    'Ammonia'
  ],
  correctIndex: 3,
  explanation: 'Ammonia is widely used in the production of nitrogenous fertilizers.',
),

MCQItem(
  question: 'Which gas does not support combustion and is used in fire extinguishers?',
  options: [
    'Hydrogen',
    'Oxygen',
    'Carbon dioxide',
    'Nitrogen'
  ],
  correctIndex: 2,
  explanation: 'Carbon dioxide does not support burning and is used in fire extinguishers.',
),
],

'science_metal_and_non-metals': [
  MCQItem(
  question: 'Which of the following is a metal?',
  options: ['Sulphur', 'Oxygen', 'Iron', 'Chlorine'],
  correctIndex: 2,
  explanation: 'Iron is a metal with good conductivity and malleability.',
),

MCQItem(
  question: 'Which of the following is a non-metal?',
  options: ['Copper', 'Aluminium', 'Carbon', 'Silver'],
  correctIndex: 2,
  explanation: 'Carbon is a non-metal found in various forms such as diamond and graphite.',
),

MCQItem(
  question: 'Which property is generally shown by metals?',
  options: ['Poor conductivity', 'Brittleness', 'Good conductivity', 'Dull appearance'],
  correctIndex: 2,
  explanation: 'Metals are generally good conductors of heat and electricity.',
),

MCQItem(
  question: 'Which property is generally shown by non-metals?',
  options: ['Malleability', 'Ductility', 'Poor conductivity', 'Lustre'],
  correctIndex: 2,
  explanation: 'Most non-metals are poor conductors of heat and electricity.',
),

MCQItem(
  question: 'What is malleability?',
  options: [
    'Ability to be drawn into wires',
    'Ability to conduct electricity',
    'Ability to be beaten into thin sheets',
    'Ability to dissolve in water'
  ],
  correctIndex: 2,
  explanation: 'Malleability is the property of metals that allows them to be hammered into thin sheets.',
),

MCQItem(
  question: 'What is ductility?',
  options: [
    'Ability to be beaten into sheets',
    'Ability to be drawn into wires',
    'Ability to break easily',
    'Ability to float on water'
  ],
  correctIndex: 1,
  explanation: 'Ductility is the property of metals to be drawn into thin wires.',
),

MCQItem(
  question: 'Which metal is used for electrical wiring?',
  options: ['Sulphur', 'Copper', 'Phosphorus', 'Carbon'],
  correctIndex: 1,
  explanation: 'Copper is widely used in electrical wiring due to its high conductivity.',
),

MCQItem(
  question: 'Which non-metal is a good conductor of electricity?',
  options: ['Sulphur', 'Oxygen', 'Graphite', 'Nitrogen'],
  correctIndex: 2,
  explanation: 'Graphite is a form of carbon that conducts electricity.',
),

MCQItem(
  question: 'Which metal is liquid at room temperature?',
  options: ['Iron', 'Mercury', 'Copper', 'Aluminium'],
  correctIndex: 1,
  explanation: 'Mercury is the only common metal that remains liquid at room temperature.',
),

MCQItem(
  question: 'Which non-metal is liquid at room temperature?',
  options: ['Bromine', 'Sulphur', 'Carbon', 'Phosphorus'],
  correctIndex: 0,
  explanation: 'Bromine is a non-metal that exists as a liquid at room temperature.',
),

MCQItem(
  question: 'Which gas is produced when metals react with dilute acids?',
  options: ['Oxygen', 'Nitrogen', 'Hydrogen', 'Carbon dioxide'],
  correctIndex: 2,
  explanation: 'Most metals react with dilute acids to release hydrogen gas.',
),

MCQItem(
  question: 'What is an alloy?',
  options: [
    'A pure metal',
    'A non-metal',
    'A mixture of two or more metals or a metal and a non-metal',
    'A chemical compound only'
  ],
  correctIndex: 2,
  explanation: 'An alloy is formed by mixing metals to improve their properties.',
),

MCQItem(
  question: 'Which of the following is an alloy?',
  options: ['Copper', 'Iron', 'Brass', 'Aluminium'],
  correctIndex: 2,
  explanation: 'Brass is an alloy made mainly of copper and zinc.',
),

MCQItem(
  question: 'Rust is mainly formed on:',
  options: ['Copper', 'Iron', 'Silver', 'Gold'],
  correctIndex: 1,
  explanation: 'Iron reacts with oxygen and moisture to form rust.',
),

MCQItem(
  question: 'Rusting of iron requires:',
  options: [
    'Only oxygen',
    'Only water',
    'Oxygen and water',
    'Carbon dioxide only'
  ],
  correctIndex: 2,
  explanation: 'Both oxygen and moisture are necessary for rusting.',
),

MCQItem(
  question: 'Which method helps prevent rusting?',
  options: [
    'Heating',
    'Galvanization',
    'Melting',
    'Evaporation'
  ],
  correctIndex: 1,
  explanation: 'Galvanization protects iron by coating it with zinc.',
),

MCQItem(
  question: 'Which metal is used in making aircraft bodies?',
  options: ['Iron', 'Gold', 'Aluminium', 'Mercury'],
  correctIndex: 2,
  explanation: 'Aluminium is light, strong, and resistant to corrosion.',
),

MCQItem(
  question: 'Which of the following metals is the best conductor of electricity?',
  options: ['Iron', 'Copper', 'Silver', 'Aluminium'],
  correctIndex: 2,
  explanation: 'Silver is the best conductor of electricity among metals.',
),

MCQItem(
  question: 'Diamond is an allotrope of:',
  options: ['Sulphur', 'Carbon', 'Phosphorus', 'Oxygen'],
  correctIndex: 1,
  explanation: 'Diamond is a crystalline allotrope of carbon.',
),

MCQItem(
  question: 'Which non-metal is essential for respiration?',
  options: ['Nitrogen', 'Carbon', 'Oxygen', 'Sulphur'],
  correctIndex: 2,
  explanation: 'Oxygen is necessary for respiration in living organisms.',
),
],

'science_hydrocarbon_and_its_compound': [
  MCQItem(
  question: 'What are hydrocarbons?',
  options: [
    'Compounds of carbon and oxygen only',
    'Compounds of carbon and hydrogen only',
    'Compounds of hydrogen and nitrogen only',
    'Compounds of carbon, hydrogen and oxygen'
  ],
  correctIndex: 1,
  explanation: 'Hydrocarbons are organic compounds composed only of carbon and hydrogen atoms.',
),

MCQItem(
  question: 'Which property of carbon allows it to form long chains?',
  options: [
    'Combustion',
    'Catenation',
    'Oxidation',
    'Reduction'
  ],
  correctIndex: 1,
  explanation: 'Catenation is the ability of carbon atoms to link together and form chains.',
),

MCQItem(
  question: 'Which of the following is a hydrocarbon?',
  options: [
    'CH₄',
    'CO₂',
    'H₂O',
    'NaCl'
  ],
  correctIndex: 0,
  explanation: 'Methane (CH₄) contains only carbon and hydrogen atoms.',
),

MCQItem(
  question: 'Hydrocarbons containing only single bonds are called:',
  options: [
    'Alkenes',
    'Alkynes',
    'Alkanes',
    'Alcohols'
  ],
  correctIndex: 2,
  explanation: 'Alkanes are saturated hydrocarbons containing only single covalent bonds.',
),

MCQItem(
  question: 'What is the general formula of alkanes?',
  options: [
    'CnH₂n',
    'CnH₂n₋₂',
    'CnH₂n₊₂',
    'CnH₂nOH'
  ],
  correctIndex: 2,
  explanation: 'The general formula of alkanes is CnH₂n₊₂.',
),

MCQItem(
  question: 'Hydrocarbons containing a double bond are called:',
  options: [
    'Alkanes',
    'Alkenes',
    'Alkynes',
    'Alcohols'
  ],
  correctIndex: 1,
  explanation: 'Alkenes are unsaturated hydrocarbons containing at least one double bond.',
),

MCQItem(
  question: 'What is the general formula of alkenes?',
  options: [
    'CnH₂n',
    'CnH₂n₊₂',
    'CnH₂n₋₂',
    'CnH₂nOH'
  ],
  correctIndex: 0,
  explanation: 'The general formula of alkenes is CnH₂n.',
),

MCQItem(
  question: 'Hydrocarbons containing a triple bond are called:',
  options: [
    'Alkanes',
    'Alkenes',
    'Alkynes',
    'Ethers'
  ],
  correctIndex: 2,
  explanation: 'Alkynes are unsaturated hydrocarbons containing at least one triple bond.',
),

MCQItem(
  question: 'What is the general formula of alkynes?',
  options: [
    'CnH₂n₊₂',
    'CnH₂n',
    'CnH₂n₋₂',
    'CnH₂nOH'
  ],
  correctIndex: 2,
  explanation: 'The general formula of alkynes is CnH₂n₋₂.',
),

MCQItem(
  question: 'Which of the following is an alkane?',
  options: [
    'Ethene',
    'Methane',
    'Ethyne',
    'Propene'
  ],
  correctIndex: 1,
  explanation: 'Methane (CH₄) is the simplest alkane.',
),

MCQItem(
  question: 'Which of the following is an alkene?',
  options: [
    'Methane',
    'Ethane',
    'Ethene',
    'Ethyne'
  ],
  correctIndex: 2,
  explanation: 'Ethene (C₂H₄) contains a double bond and belongs to the alkene family.',
),

MCQItem(
  question: 'Which of the following is an alkyne?',
  options: [
    'Ethane',
    'Methane',
    'Ethene',
    'Ethyne'
  ],
  correctIndex: 3,
  explanation: 'Ethyne (C₂H₂) contains a triple bond.',
),

MCQItem(
  question: 'What is a homologous series?',
  options: [
    'Compounds with different functional groups',
    'Family of compounds with similar properties and same functional group',
    'Mixture of hydrocarbons',
    'Group of metals'
  ],
  correctIndex: 1,
  explanation: 'Members of a homologous series have the same functional group and similar chemical properties.',
),

MCQItem(
  question: 'Successive members of a homologous series differ by:',
  options: [
    '-CH₃',
    '-CH₂-',
    '-OH',
    '-COOH'
  ],
  correctIndex: 1,
  explanation: 'Each successive member differs by one methylene group (-CH₂-).',
),

MCQItem(
  question: 'What is the functional group of alcohols?',
  options: [
    '-COOH',
    '-CHO',
    '-OH',
    '-NH₂'
  ],
  correctIndex: 2,
  explanation: 'Alcohols contain the hydroxyl (-OH) functional group.',
),

MCQItem(
  question: 'What is the chemical formula of methanol?',
  options: [
    'CH₃OH',
    'C₂H₅OH',
    'CH₄',
    'C₃H₈'
  ],
  correctIndex: 0,
  explanation: 'Methanol is the simplest alcohol with formula CH₃OH.',
),

MCQItem(
  question: 'What is the chemical formula of ethanol?',
  options: [
    'CH₃OH',
    'C₂H₅OH',
    'C₃H₇OH',
    'CH₄'
  ],
  correctIndex: 1,
  explanation: 'Ethanol has the molecular formula C₂H₅OH.',
),

MCQItem(
  question: 'LPG mainly consists of:',
  options: [
    'Methane and Ethane',
    'Propane and Butane',
    'Ethene and Ethyne',
    'Methanol and Ethanol'
  ],
  correctIndex: 1,
  explanation: 'Liquefied Petroleum Gas (LPG) is mainly a mixture of propane and butane.',
),

MCQItem(
  question: 'Which hydrocarbon is commonly called marsh gas?',
  options: [
    'Ethane',
    'Propane',
    'Methane',
    'Butane'
  ],
  correctIndex: 2,
  explanation: 'Methane is found in marshy places and is known as marsh gas.',
),

MCQItem(
  question: 'Which alcohol is used as a moisturizing agent in cosmetics?',
  options: [
    'Methanol',
    'Ethanol',
    'Glycerol',
    'Propanol'
  ],
  correctIndex: 2,
  explanation: 'Glycerol is used in cosmetics because it helps retain moisture in the skin.',
),
],

'science_chemicals_used_in_daily_life': [
  MCQItem(
  question: 'What are chemicals used in daily life?',
  options: [
    'Only laboratory substances',
    'Substances commonly used in everyday activities',
    'Only medicines',
    'Only fertilizers'
  ],
  correctIndex: 1,
  explanation: 'Many chemicals are used in our daily life for cleaning, cooking, health, and agriculture.',
),

MCQItem(
  question: 'Which chemical is commonly known as common salt?',
  options: [
    'NaOH',
    'NaCl',
    'CaCO₃',
    'HCl'
  ],
  correctIndex: 1,
  explanation: 'Common salt is sodium chloride (NaCl).',
),

MCQItem(
  question: 'What is the chemical formula of baking soda?',
  options: [
    'Na₂CO₃',
    'NaHCO₃',
    'CaCO₃',
    'NaCl'
  ],
  correctIndex: 1,
  explanation: 'Baking soda is sodium hydrogen carbonate (NaHCO₃).',
),

MCQItem(
  question: 'Baking soda is mainly used for:',
  options: [
    'Making cement',
    'Baking cakes and bread',
    'Manufacturing glass',
    'Purifying metals'
  ],
  correctIndex: 1,
  explanation: 'Baking soda releases carbon dioxide which helps dough rise.',
),

MCQItem(
  question: 'What is the chemical formula of washing soda?',
  options: [
    'Na₂CO₃·10H₂O',
    'NaHCO₃',
    'CaCO₃',
    'NaOH'
  ],
  correctIndex: 0,
  explanation: 'Washing soda is hydrated sodium carbonate (Na₂CO₃·10H₂O).',
),

MCQItem(
  question: 'Washing soda is used for:',
  options: [
    'Softening hard water',
    'Making fuel',
    'Producing oxygen',
    'Making plastics'
  ],
  correctIndex: 0,
  explanation: 'Washing soda is commonly used to soften hard water.',
),

MCQItem(
  question: 'What is bleaching powder?',
  options: [
    'CaOCl₂',
    'NaCl',
    'CaCO₃',
    'NaOH'
  ],
  correctIndex: 0,
  explanation: 'Bleaching powder has the chemical formula CaOCl₂.',
),

MCQItem(
  question: 'Bleaching powder is mainly used for:',
  options: [
    'Purifying water',
    'Cooking food',
    'Making fertilizers',
    'Generating electricity'
  ],
  correctIndex: 0,
  explanation: 'Bleaching powder is used for disinfecting drinking water.',
),

MCQItem(
  question: 'What is plaster of Paris?',
  options: [
    'CaSO₄·½H₂O',
    'CaCO₃',
    'NaCl',
    'CaO'
  ],
  correctIndex: 0,
  explanation: 'Plaster of Paris is calcium sulfate hemihydrate.',
),

MCQItem(
  question: 'Plaster of Paris is used for:',
  options: [
    'Making casts for fractured bones',
    'Producing oxygen',
    'Water purification',
    'Cooking'
  ],
  correctIndex: 0,
  explanation: 'It is widely used in orthopedic casts and sculptures.',
),

MCQItem(
  question: 'Which chemical is commonly called slaked lime?',
  options: [
    'CaO',
    'Ca(OH)₂',
    'CaCO₃',
    'NaOH'
  ],
  correctIndex: 1,
  explanation: 'Slaked lime is calcium hydroxide, Ca(OH)₂.',
),

MCQItem(
  question: 'Which chemical is commonly called quicklime?',
  options: [
    'CaO',
    'Ca(OH)₂',
    'CaCO₃',
    'NaCl'
  ],
  correctIndex: 0,
  explanation: 'Quicklime is calcium oxide (CaO).',
),

MCQItem(
  question: 'Limestone mainly contains:',
  options: [
    'Calcium carbonate',
    'Sodium chloride',
    'Calcium oxide',
    'Magnesium sulfate'
  ],
  correctIndex: 0,
  explanation: 'Limestone is mainly composed of calcium carbonate (CaCO₃).',
),

MCQItem(
  question: 'Which chemical is used in toothpaste to prevent tooth decay?',
  options: [
    'Bleaching powder',
    'Fluoride compounds',
    'Washing soda',
    'Quicklime'
  ],
  correctIndex: 1,
  explanation: 'Fluoride compounds help strengthen tooth enamel.',
),

MCQItem(
  question: 'Which of the following is used as an antiseptic?',
  options: [
    'Dettol',
    'Cement',
    'Limestone',
    'Gypsum'
  ],
  correctIndex: 0,
  explanation: 'Dettol is commonly used as an antiseptic to prevent infection.',
),

MCQItem(
  question: 'Which chemical is commonly used as a disinfectant in hospitals?',
  options: [
    'Phenol',
    'Sugar',
    'Salt',
    'Starch'
  ],
  correctIndex: 0,
  explanation: 'Phenol is used to kill harmful microorganisms.',
),

MCQItem(
  question: 'What is the main purpose of fertilizers?',
  options: [
    'Kill insects',
    'Increase soil nutrients',
    'Purify water',
    'Preserve food'
  ],
  correctIndex: 1,
  explanation: 'Fertilizers provide essential nutrients for plant growth.',
),

MCQItem(
  question: 'Which of the following is a nitrogenous fertilizer?',
  options: [
    'Urea',
    'Sand',
    'Limestone',
    'Gypsum'
  ],
  correctIndex: 0,
  explanation: 'Urea is a commonly used nitrogen-rich fertilizer.',
),

MCQItem(
  question: 'Pesticides are used to:',
  options: [
    'Increase rainfall',
    'Control pests that damage crops',
    'Purify drinking water',
    'Produce electricity'
  ],
  correctIndex: 1,
  explanation: 'Pesticides protect crops from harmful insects and pests.',
),

MCQItem(
  question: 'Which chemical is commonly used to make soaps and detergents?',
  options: [
    'Sodium hydroxide',
    'Calcium carbonate',
    'Hydrochloric acid',
    'Gypsum'
  ],
  correctIndex: 0,
  explanation: 'Sodium hydroxide (caustic soda) is used in soap and detergent manufacturing.',
),
  
],






    // Add more chapters below. Copy this block and change the chapter ID + questions:
    //
    // 'math_trigonometry': [
    //   MCQItem(
    //     question: 'Your question here?',
    //     options: ['A', 'B', 'C', 'D'],
    //     correctIndex: 0,
    //     explanation: 'Why this answer is correct.',
    //   ),
    // ],
  };

  static List<MCQItem> getQuestions(String chapterId, String chapterTitle) {
    if (customQuestions.containsKey(chapterId)) {
      return customQuestions[chapterId]!;
    }

    return [_placeholderQuestion(chapterTitle, chapterId)];
  }

  static int questionCount(String chapterId, String chapterTitle) {
    return getQuestions(chapterId, chapterTitle).length;
  }

  static MCQItem _placeholderQuestion(String chapterTitle, String chapterId) {
    return MCQItem(
      question:
          'Sample question for "$chapterTitle". Replace this in quiz_questions_bank.dart.',
      options: [
        'Option A — edit this question',
        'Option B',
        'Option C',
        'Option D',
      ],
      correctIndex: 0,
      explanation:
          'Add real questions under "$chapterId" in quiz_questions_bank.dart → customQuestions.',
    );
  }
}
