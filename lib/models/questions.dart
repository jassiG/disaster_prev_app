class Question {
  Question({required this.question, required this.options, required this.ans});

  final String question;
  final List<String> options;
  final int ans;
}

Map QData = {
  '0_0': QuestionList_1_1,
  '0_1': QuestionList_1_2,
  '0_2': QuestionList_1_3,
  '1_0': QuestionList_2_1,
  '1_1': QuestionList_2_2,
  '1_2': QuestionList_2_3,
  '2_0': QuestionList_3_1,
  '2_1': QuestionList_3_2,
  '2_2': QuestionList_3_3
};

List<Question> QuestionList_1_1 = [
  Question(
      question: '洪水で避難するとき、道路には水があふれています。正しいのはどちらでしょう。\n 履くものは何がいいでしょうか',
      options: [
        '長靴',
        '運動靴',
        'はだし',
      ],
      ans: 1),
  Question(
      question: '道を歩くときはどこがいいでしょうか',
      options: [
        '真ん中',
        '端',
      ],
      ans: 0),
  Question(
      question: '歩ける深さの基準はなんでしょうか',
      options: [
        '1 m',
        '50 cm',
        '20 cm',
      ],
      ans: 1), //This Quiz only have 3 questions  // NOTE that 1 corresponds to option B
];
List<Question> QuestionList_1_2 = [
  Question(
      question: '震度は何段階あるでしょう？',
      options: [
        '９段階',
        '１０段階',
        '７段階',
        '上限はない',
      ],
      ans: 1),
  Question(
      question: '地震には縦揺れと横揺れがありますが、どちらの方が被害が大き くなるでしょう？',
      options: [
        '縦揺れ',
        '横揺れ',
      ],
      ans: 1),
  Question(
      question: '家で地震が起きた時、部揺れをしのぐのに最適な部屋はどこでし ょう？',
      options: [
        '風呂場',
        '玄関',
        'リビング',
        '寝室',
      ],
      ans: 0),
  Question(
      question: 'マグニチュードは何段階あるでしょう？',
      options: [
        '１０段階 ',
        '１２段階',
        '上限はない',
        '７段階'
      ],
      ans: 2),
  Question(
      question: '命の落とす可能性が１００％近くになる津波の高さはどれでしょ う？',
      options: [
        '3 m',
        '5 m',
        '7 m',
        '1 m'
      ],
      ans: 3), // This Quiz has 5 Questions
];
List<Question> QuestionList_1_3 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
List<Question> QuestionList_2_1 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
List<Question> QuestionList_2_2 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
List<Question> QuestionList_2_3 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
List<Question> QuestionList_3_1 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
List<Question> QuestionList_3_2 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
List<Question> QuestionList_3_3 = [
  Question(
      question: 'question 1',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 2',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 3',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 4',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 5',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 6',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
  Question(
      question: 'question 7',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 3),
  Question(
      question: 'question 8',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 4),
  Question(
      question: 'question 9',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 1),
  Question(
      question: 'question 10',
      options: [
        'this is option 1',
        'this is option 2',
        'this is option 3',
        'this is option 4',
      ],
      ans: 2),
];
