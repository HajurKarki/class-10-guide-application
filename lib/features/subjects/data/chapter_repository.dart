import 'chapter2_classification_note.dart';
import '../domain/chapter_content_model.dart';

class ChapterRepository {
  // Simulate database latency
  Future<ChapterContent?> getChapterContent(String chapterId) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final normalizedId = chapterId.toLowerCase();
    if (normalizedId == 'math_sets' || normalizedId == 'sets') {
      return _getSetsMockData();
    } else if (normalizedId == 'science_scientific_learning' || normalizedId == 'scientific_learning') {
      return _getScientificLearningMockData();
    } else if (normalizedId == 'science_classification_of_living_beings' || normalizedId == 'classification_of_living_beings') {
      return _getClassificationOfLivingBeingsMockData();
    }
    
    return null;
  }

  ChapterContent _getSetsMockData() {
    return const ChapterContent(
      chapterId: 'math_sets',
      title: 'Sets',
      introduction: 'A set is a well-defined collection of distinct objects. The objects belonging to a set are called its elements or members. Sets are represented using capital letters (A, B, C, etc.) and their elements are enclosed within curly braces {}.',
      notes: [
        NoteSection(
          title: '1. Ways to Represent a Set',
          content: 'There are two main methods to describe or specify a set:\n\n'
              '• Listing Method (Roster Method): Elements are listed separated by commas. Example: A = {2, 4, 6, 8}.\n'
              '• Set-Builder Method (Rule Method): A common property is stated. Example: B = {x : x is an even number less than 10}.',
        ),
        NoteSection(
          title: '2. Types of Sets',
          content: 'Understanding different types of sets is essential for solving set operations:\n\n'
              '• Empty Set (Null Set): A set containing no elements, denoted by ∅ or {}.\n'
              '• Singleton Set: A set containing exactly one element. Example: A = {5}.\n'
              '• Finite Set: A set with countable elements. Example: Vowels = {a, e, i, o, u}.\n'
              '• Infinite Set: A set with uncountable elements. Example: Natural Numbers N = {1, 2, 3, ...}.\n'
              '• Universal Set (U): A set that contains all possible elements under consideration.\n'
              '• Subset (⊆): Set A is a subset of B (A ⊆ B) if every element of A is also in B.',
        ),
        NoteSection(
          title: '3. Venn Diagrams',
          content: 'Venn Diagrams are pictorial representations of sets using closed geometrical figures (rectangles for Universal sets and circles for individual sets):\n\n'
              '• Union of Sets (A ∪ B): The set of all elements belonging to set A, set B, or both. In Venn diagrams, the entire circular regions of both A and B are shaded.\n'
              '• Intersection of Sets (A ∩ B): The set of elements common to both set A and set B. In Venn diagrams, only the overlapping middle section of circles A and B is shaded.\n'
              '• Difference of Sets (A - B): Elements that belong to set A but not to set B. Only the non-overlapping crescent of circle A is shaded.\n'
              '• Complement of a Set (A\'): Elements in the Universal set U that do not belong to set A. Everything outside circle A is shaded.',
          diagramType: 'venn_explanation',
        ),
      ],
      formulas: [
        FormulaItem(
          name: 'Cardinality of Union of Two Sets',
          formula: 'n(A ∪ B) = n(A) + n(B) - n(A ∩ B)',
          description: 'This is the fundamental formula of sets, showing that to find the union cardinality, we add individual cardinalities and subtract the intersection count to avoid double-counting.',
        ),
        FormulaItem(
          name: 'Cardinality of Difference of Sets',
          formula: 'n(A - B) = n(A) - n(A ∩ B)',
          description: 'Used to calculate the number of elements that are strictly in set A and not in set B.',
        ),
        FormulaItem(
          name: 'De Morgan\'s First Law',
          formula: '(A ∪ B)\' = A\' ∩ B\'',
          description: 'The complement of the union of two sets is equal to the intersection of their individual complements.',
        ),
      ],
      solvedExamples: [
        SolvedExample(
          question: 'If U = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, A = {1, 3, 5, 7, 9}, and B = {2, 3, 5, 7}, find A ∪ B and A ∩ B.',
          steps: [
            'Step 1: Write down sets A and B.',
            'Step 2: Combine elements of A and B to find the Union, making sure distinct elements are listed only once: A ∪ B = {1, 2, 3, 5, 7, 9}.',
            'Step 3: Identify the common elements in both A and B: A ∩ B = {3, 5, 7}.',
          ],
          finalAnswer: 'A ∪ B = {1, 2, 3, 5, 7, 9}, A ∩ B = {3, 5, 7}',
        ),
        SolvedExample(
          question: 'In a group of 50 students, 35 speak English, 25 speak Spanish, and 15 speak both languages. How many speak English only?',
          steps: [
            'Step 1: Let E represent English speakers and S represent Spanish speakers.',
            'Given: n(E) = 35, n(S) = 25, and n(E ∩ S) = 15.',
            'Step 2: To find English-only speakers, use the difference formula: n(E - S) = n(E) - n(E ∩ S).',
            'Step 3: Substitute values: n(E - S) = 35 - 15 = 20.',
          ],
          finalAnswer: '20 students speak English only.',
        ),
      ],
      questionsAndAnswers: [
        QAItem(
          question: 'What is the difference between a subset and a proper subset?',
          answer: 'If every element of set A is also an element of set B, A is a subset of B (A ⊆ B). If A is a subset of B and A is not equal to B (meaning B contains at least one element not in A), then A is a proper subset of B (A ⊂ B). For example, if B = {1, 2}, its subsets are ∅, {1}, {2}, and {1, 2}. Its proper subsets are ∅, {1}, and {2}.',
        ),
        QAItem(
          question: 'How do you find the number of subsets of a finite set?',
          answer: 'For a set containing "n" elements, the total number of subsets is given by the formula 2ⁿ, and the number of proper subsets is 2ⁿ - 1.',
        ),
      ],
      mcqs: [
        MCQItem(
          question: 'If set A has 4 elements, how many subsets does set A have?',
          options: ['8', '12', '16', '32'],
          correctIndex: 2,
          explanation: 'The formula for finding the number of subsets is 2ⁿ, where n is the number of elements. Here, n = 4, so 2⁴ = 2 × 2 × 2 × 2 = 16 subsets.',
        ),
        MCQItem(
          question: 'Which of the following represents the intersection of sets A and B?',
          options: ['A ∪ B', 'A ∩ B', 'A - B', 'A\''],
          correctIndex: 1,
          explanation: 'The intersection is represented by the ∩ symbol, showing elements common to both sets.',
        ),
        MCQItem(
          question: 'What is the complement of a universal set (U\')?',
          options: ['U', '∅ (Empty Set)', 'Set A', 'Set B'],
          correctIndex: 1,
          explanation: 'The complement of a set contains everything not in that set. Since the universal set contains all elements, there is nothing outside it, resulting in the empty set (∅).',
        ),
      ],
      exerciseSolutions: [
        ExerciseSolution(
          exerciseNumber: 'Ex 1.1 - Q1',
          question: 'Given A = {x : x is a prime number less than 10}. List the elements of A.',
          solution: 'The prime numbers less than 10 are 2, 3, 5, and 7. Therefore, the set in roster form is A = {2, 3, 5, 7}.',
        ),
        ExerciseSolution(
          exerciseNumber: 'Ex 1.1 - Q2',
          question: 'If P = {a, b, c} and Q = {b, c, d}, find P - Q.',
          solution: 'P - Q contains elements in P that are not in Q. Under comparison: "a" is only in P, "b" is in both, "c" is in both. Hence, P - Q = {a}.',
        ),
      ],
    );
  }

  ChapterContent _getScientificLearningMockData() {
    return const ChapterContent(
      chapterId: 'science_scientific_learning',
      title: 'Scientific Learning',
      introduction: '''Scientific learning is the foundation of all scientific inquiry and discovery. It is a systematic approach to understanding the natural world through observation, questioning, experimentation, and analysis.

In our daily lives, we encounter numerous situations that could be studied scientifically, but we often overlook them due to lack of awareness about proper scientific methodology.''',
      notes: [
                NoteSection(
          title: '1. Scientific Observation vs. Regular Observation',
          content: '''Scientific Observation
- Systematic and planned observation with a specific purpose
- Uses instruments and standardized methods for accuracy
- Recorded in an organized manner with precise details
- Reproducible and verifiable by others
- Free from personal bias and prejudice
- Follows scientific methodology

Examples of Scientific Observation
- A biologist using a microscope to count blood cells
- A chemist measuring the pH of soil samples using calibrated instruments
- A physicist measuring the time period of a pendulum using a stopwatch
- A geologist identifying rock types through systematic classification

Regular or Casual Observation
- Random, unplanned observations made without a specific purpose
- Based on sensory perception without instruments
- Often vague and lacks precise details
- Not necessarily reproducible
- Subject to personal bias and assumptions
- No systematic method followed

Examples of Regular Observation
- Noticing that the weather seems hot today
- Observing that plants need water without measurement
- Seeing that rocks are different colors without classification

Key Difference Table
Purpose: Scientific observation has a specific research aim; regular observation is for general awareness
Method: Scientific is systematic and standardized; regular is casual and random
Instruments: Scientific often uses instruments; regular uses only senses
Recording: Scientific uses detailed, organized notes; regular relies on vague memory
Reproducibility: Scientific can be repeated by others; regular observation may not be repeatable
Bias: Scientific minimizes bias through controls; regular observation is subject to personal bias
Verification: Scientific observation can be verified; regular observation is difficult to verify
Precision: Scientific observation has a high degree of accuracy; regular observation has low precision''',
        ),
                NoteSection(
          title: '2. Understanding Variables',
          content: '''What are Variables?
Variables are factors or conditions that can change or be changed in an experiment.

Types of Variables

Independent Variable
- The variable that is deliberately changed by the experimenter
- The cause in a cause-and-effect relationship
- What the experimenter manipulates
- Example: Temperature applied to a chemical reaction

Dependent Variable
- The variable that is measured or observed as a result
- Changes in response to the independent variable
- The effect in a cause-and-effect relationship
- Example: Speed of a chemical reaction

Controlled Variables
- Variables kept constant to ensure fair testing
- All factors except the independent variable that might affect results
- Must be controlled to isolate the effect of the independent variable
- Example: Pressure, light, and amount of reactants kept constant

Example of Variables in an Experiment
Research Question: Does temperature affect the rate at which sugar dissolves in water?
- Independent: Temperature of water
- Dependent: Time for sugar to dissolve
- Controlled: Amount of sugar, volume of water, type of sugar, stirring method, type of container

Why controlled variables matter:
- They ensure fair testing
- They isolate the effect of the independent variable
- They increase reliability
- They provide valid conclusions
- They enable comparison between experiments''',
        ),
                NoteSection(
          title: '3. Importance of Controlled Variables',
          content: '''Key Reasons to Control Variables

Ensures Fair Testing
- All tests are conducted under identical conditions except for the independent variable
- This guarantees that results are due to the independent variable only
- It prevents confusion from multiple changing factors

Isolates the Effect
- Allows us to see the true relationship between independent and dependent variables
- Separates the test variable from other influencing factors
- Ensures cause-and-effect clarity

Increases Reliability
- Reduces experimental errors
- Makes results more trustworthy
- Allows other scientists to reproduce and verify findings

Provides Valid Conclusions
- Lets us confidently attribute changes in the dependent variable to the independent variable
- Avoids false conclusions due to uncontrolled factors
- Makes scientific claims justified

Enables Comparison
- Results from different experiments can be compared fairly
- Establishes a basis for scientific standards
- Helps build general scientific principles

Example: Without controlled variables, temperature, sugar amount, water volume, and container type can all affect dissolving time, so the conclusion becomes invalid.

Example: With controlled variables, only temperature changes, so the effect can be seen clearly.''',
        ),
                NoteSection(
          title: '4. Steps in Scientific Learning',
          content: '''Scientific learning follows a systematic process called the Scientific Method.

Step 1: Observation
- Collect information about natural phenomena
- Use senses and scientific instruments
- Make systematic, planned observations
- Example: Notice that plants grow differently with different amounts of light

Step 2: Questioning
- Ask questions about observations
- Develop curiosity about phenomena
- Form research questions
- Example: Does light intensity affect plant growth rate?

Step 3: Hypothesis Formation
- Form an educated guess based on observations
- Should be testable and falsifiable
- Written in clear language
- Example: If light intensity increases, then plant growth rate will increase

Step 4: Experimentation
- Design controlled experiments
- Identify variables: independent, dependent, controlled
- Conduct experiment under controlled conditions
- Collect data systematically

Step 5: Data Collection and Analysis
- Record all observations and measurements
- Organize data in tables and graphs
- Analyze patterns in data
- Example: Create a graph showing the relationship between light and growth

Step 6: Conclusion
- Determine whether the hypothesis was supported or not
- Explain results based on scientific principles
- Discuss any unexpected findings

Step 7: Communication and Verification
- Share findings with other scientists
- Others reproduce the experiment to verify it
- Peer review and discussion help confirm results''',
        ),
                NoteSection(
          title: '5. Practical Applications & Confounding Factors',
          content: '''In Medicine
- Testing new drugs with controlled clinical trials
- Ensuring safety and efficacy before releasing to the public
- Controlled variables include patient age, health condition, dosage, and duration

In Agriculture
- Testing new crop varieties with different fertilizers
- Determining optimal growing conditions
- Controlled variables include soil type, water, temperature, and light

In Environmental Science
- Studying water quality at different locations
- Monitoring pollution effects systematically
- Controlled variables include sampling time, location, method, and containers

In Technology
- Testing new materials for durability
- Comparing product performance
- Controlled variables include temperature, pressure, time, and conditions

Confounding Variables in Real-World Cases
- When studying whether library study or home study improves performance, confounding variables like motivation, study duration, tutoring, sleep, and baseline academic ability must be controlled to prevent invalid conclusions.''',
        ),
      ],
      formulas: [
        FormulaItem(
          name: 'Variables Mnemonic (IDVC)',
          formula: 'I = Independent, D = Dependent, V = Variables, C = Constants',
          description: 'A helpful mnemonic to remember the types of variables and the need to keep constants constant.',
        ),
        FormulaItem(
          name: 'Scientific Method (OHEC)',
          formula: 'O = Observation, H = Hypothesis, E = Experiment, C = Conclusion',
          description: 'A quick way to remember the core sequential stages of scientific inquiry.',
        ),
        FormulaItem(
          name: 'Fair Testing Rule',
          formula: 'Change ONLY ONE independent variable; keep ALL others controlled.',
          description: 'The golden rule of experimental design to ensure valid cause-and-effect conclusions.',
        ),
      ],
      solvedExamples: [
        SolvedExample(
          question: 'Research Question: "Does temperature affect the rate at which sugar dissolves in water?" Identify variables and how to control them.',
          steps: [
            'Step 1: Identify the Independent Variable. This is water temperature. We can vary it (e.g., at 20°C, 40°C, 60°C).',
            'Step 2: Identify the Dependent Variable. This is the dissolving time of sugar (measured in seconds using a stopwatch).',
            'Step 3: Identify and control all other variables. Use exactly 10g of sugar, exactly 100mL of water, same brand of sugar, same container beaker, and same stirring speed/rate.',
            'Step 4: Conduct trials at each temperature and compare the dissolving times.',
          ],
          finalAnswer: 'Independent: Temperature; Dependent: Dissolving time; Controlled: Sugar mass, water volume, container, stirring.',
        ),
        SolvedExample(
          question: 'Design a scientific test for: "Studying in the library environment improves academic performance compared to studying at home."',
          steps: [
            'Step 1: Formulate the hypothesis: "If students study in the library versus at home, then library-study students will score higher on a standardized test, assuming study hours are controlled."',
            'Step 2: Define groups. Randomly divide 100 students of similar academic background into Group A (library study) and Group B (home study).',
            'Step 3: Control confounding variables. Both groups must study for exactly 6 hours per week, use the same textbook/chapters, have similar baseline grades, equal tutoring support, and similar sleep/diet patterns.',
            'Step 4: Administer an identical test after 4 weeks and compare the results.',
          ],
          finalAnswer: 'Controlled environment and time isolates the effect of the library setting from individual intelligence or study effort.',
        ),
      ],
      questionsAndAnswers: [
        QAItem(
          question: 'What are controlled variables?',
          answer: 'Controlled variables are factors or conditions in an experiment that are kept constant and unchanged throughout all trials. This ensures that any observed changes in the dependent variable are caused solely by the manipulation of the independent variable, ensuring a fair test.',
        ),
        QAItem(
          question: 'What would happen if you do not control variables in an experiment?',
          answer: 'If variables are not controlled, the experiment becomes invalid and unreliable. It becomes impossible to determine whether changes in the dependent variable were caused by the independent variable or by other uncontrolled factors that changed at the same time.',
        ),
        QAItem(
          question: 'Explain the difference between scientific observation and casual observation.',
          answer: 'Scientific observation is systematic, planned, uses standardized instruments for precision, and is recorded objectively for verification. Casual observation is random, relies on general sensory perception without tools, is documented poorly in memory, and is highly prone to personal bias.',
        ),
        QAItem(
          question: 'Why is repeatability important in scientific experiments?',
          answer: 'Repeatability ensures that results are consistent and not the result of random chance or experimental error. When other scientists can repeat an experiment and obtain the same results, it validates the conclusions and strengthens the scientific claim.',
        ),
      ],
      mcqs: [
        MCQItem(
          question: 'Which of the following is a characteristic of scientific observation?',
          options: [
            'Random and unplanned',
            'Uses only the five senses',
            'Systematic and purposeful with recorded data',
            'Based on personal feelings'
          ],
          correctIndex: 2,
          explanation: 'Scientific observation is systematic, planned, objective, uses instruments, and is recorded precisely.',
        ),
        MCQItem(
          question: 'What do we call a factor that is deliberately changed in an experiment?',
          options: [
            'Dependent variable',
            'Independent variable',
            'Controlled variable',
            'Constant variable'
          ],
          correctIndex: 1,
          explanation: 'The independent variable is the variable that the experimenter deliberately manipulates to observe its effects.',
        ),
        MCQItem(
          question: 'Why are controlled variables important in scientific experiments?',
          options: [
            'To make the experiment longer',
            'To ensure fair testing and isolate the effect of the independent variable',
            'To make the experiment more complicated',
            'To avoid taking measurements'
          ],
          correctIndex: 1,
          explanation: 'Controlled variables keep all other factors constant, ensuring that the results are due only to the independent variable.',
        ),
        MCQItem(
          question: 'If a student tests plant growth with different fertilizers but gives some plants extra water, the results are:',
          options: [
            'Very reliable',
            'Invalid because multiple variables were changed and not controlled',
            'Acceptable as long as they record it',
            'Confirms that fertilizer works'
          ],
          correctIndex: 1,
          explanation: 'Changing both fertilizer and water amount makes it impossible to know which factor caused the plant growth, making the experiment invalid.',
        ),
      ],
      exerciseSolutions: [
        ExerciseSolution(
          exerciseNumber: 'Case Study Analysis',
          question: 'A student conducts an experiment to test if pH affects bacterial growth. Critically analyze the procedure: "I prepared culture media at pH 3, 5, 7, and 9. I inoculated each with bacteria and observed growth. After 2 days, I counted bacteria. I used different volumes of media (100mL, 150mL, 200mL, 250mL) and exposed one plate to sunlight while others were in the dark."',
          solution: 'Critical Problems:\n'
              '1. Uncontrolled Media Volume: Using different volumes (100mL to 250mL) changes surface area and oxygen availability, introducing a major confounding factor. The volume must be identical (e.g., 100mL for all).\n'
              '2. Uncontrolled Light Exposure: Exposing only one plate to sunlight while keeping others in the dark introduces another uncontrolled variable that affects growth. All plates must be kept under the same light conditions.\n'
              '3. Lack of Inoculum Control: Standardize the amount and density of the bacterial culture added to each plate.\n'
              'Corrected Procedure: Use identical volumes of media (100mL), inoculate each with the same amount of bacterial culture (1mL), keep all in the dark, and incubate all at the same constant temperature (e.g., 37°C).',
        ),
        ExerciseSolution(
          exerciseNumber: 'Application Exercise',
          question: 'A farmer notices tomato plants treated with a new fertilizer grow faster. How would you design a controlled experiment to verify this?',
          solution: '1. Hypothesis: If tomato plants are treated with the new fertilizer, then they will grow faster than those treated with standard fertilizer under identical conditions.\n'
              '2. Independent Variable: Type of fertilizer (New vs. Standard/Control).\n'
              '3. Dependent Variable: Plant growth rate (measured as height in cm weekly).\n'
              '4. Controlled Variables: Same tomato seed variety, same soil type and volume, same pot size, same water amount (e.g., 200mL daily), same sunlight exposure, and same ambient temperature.\n'
              '5. Verification: Group A gets the new fertilizer, Group B gets the standard fertilizer. Observe for 6 weeks. Compare average growth rate of both groups to draw a valid conclusion.',
        ),
      ],
    );
  }

  ChapterContent _getClassificationOfLivingBeingsMockData() {
    return const ChapterContent(
      chapterId: 'science_classification_of_living_beings',
      title: 'Classification of Living Beings',
      introduction: '',
      notes: [
        NoteSection(
          title: 'Complete Study Guide',
          content: classificationOfLivingBeingsStudyGuide,
        ),
      ],
      formulas: [],
      solvedExamples: [],
      questionsAndAnswers: [],
      mcqs: [],
      exerciseSolutions: [],
    );
  }
}


