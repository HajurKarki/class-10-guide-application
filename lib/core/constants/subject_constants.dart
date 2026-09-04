class SubjectConstants {
  static const List<Map<String, String>> subjects = [
    {
      'id': 'math',
      'name': 'Mathematics',
      'description': 'Formulas, solved examples, and chapter PDFs',
      'icon': '📐',
    },
    {
      'id': 'science',
      'name': 'Science',
      'description': 'Physics, Chemistry, Biology, and chapter PDFs',
      'icon': '🧪',
    },
  ];

  static const Map<String, List<String>> chapters = {
    'math': [
      'Sets',
      'Compound Interest',
      'Growth and Depreciation',
      'Currency and Exchange Rate',
      'Area and Volume',
      'Sequence and Series',
      'Quadratic Equation',
      'Algebraic Fraction',
      'Indices',
      'Triangle and Quadrilaterals',
      'Construction',
      'Circle',
      'Statistics',
      'Probability',
      'Trigonometry',

    ],
    'science': [
      'Scientific Learning',
      'Classification of Living Beings',
      'Honey Bee',
      'Heredity',
      'Physiological Structure and Life Process',
      'Nature and Force',
      'Pressure',
      'Heat',
      'Wave',
      'Electricity and Magnetism',
      'Universe',
      'Information and Communication',
      'Classification of Element',
      'Chemical Reaction',
      'Gases',
      'Metal and Non-Metals',
      'Hydrocarbon and its Compound',
      'Chemicals used in Daily Life',
    ],
  };
}