import '../utils/routes.dart';

class SubTopic{
  SubTopic({required this.subTopicName, required this.topicRouteName});
  String subTopicName;
  String topicRouteName;  // you MUST add route to both Route.dart and Main.dart
}

class Topic{
  Topic({required this.mainTopic, required this.subTopics, this.isExpanded=false});
  String mainTopic;
  List<SubTopic> subTopics;
  bool isExpanded;  //Has a use in Expanded Panel List.
}

class QuizTopic{
  QuizTopic({required this.title, required this.totalQuestions, required this.quizTime, required this.quizRouteName, this.isExpanded=false});
  String title;
  int totalQuestions;
  int quizTime; // This is the total allowed quiz time in MINUTES
  bool isExpanded; //Has a use in Expanded Panel List.
  String quizRouteName; // you MUST add route to both Route.dart and Main.dart
}

List<Topic> sampleTopics = [
  Topic(mainTopic: '1章　災害知識',
        subTopics: [
          SubTopic(subTopicName: '1-1　水害', topicRouteName: MyRoutes.knowledge_one_one),
          SubTopic(subTopicName: '1-2　地震', topicRouteName: MyRoutes.knowledge_one_two),
          SubTopic(subTopicName: '1-3　台風', topicRouteName: MyRoutes.knowledge_one_one),
        ],
  )
  ,
  Topic(mainTopic: '2章　防災知識',
      subTopics: [
        SubTopic(subTopicName: '2-1　地域消防隊', topicRouteName: MyRoutes.knowledge_one_one),
        SubTopic(subTopicName: '2-2　市消防隊', topicRouteName: MyRoutes.knowledge_one_one),
        SubTopic(subTopicName: '2-3　自治体', topicRouteName: MyRoutes.knowledge_one_one)
      ],
  )
  ,
  Topic(mainTopic: '3章　身の回りの危険',
      subTopics: [
        SubTopic(subTopicName: '3-1　崖', topicRouteName: MyRoutes.knowledge_one_one),
        SubTopic(subTopicName: '3-2　川', topicRouteName: MyRoutes.knowledge_one_one),
        SubTopic(subTopicName: '3-3　道路', topicRouteName: MyRoutes.knowledge_one_one)
      ],
  )
];

List<QuizTopic> sampleQuizTopics = [
  QuizTopic(title: 'Earthquake', totalQuestions: 10, quizTime: 15 ,quizRouteName: ''),
  QuizTopic(title: 'Tyfoon', totalQuestions: 15, quizTime: 20, quizRouteName: ''),
  QuizTopic(title: 'Fire', totalQuestions: 8, quizTime: 10, quizRouteName: ''),
  QuizTopic(title: 'General', totalQuestions: 10, quizTime: 15, quizRouteName: ''),
];
