import 'package:disaster_prevention/models/questions.dart';
import 'package:flutter/material.dart';
import 'quizscreens/masterquiz.dart';
import 'package:disaster_prevention/models/topics.dart' as Topics;

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map questionData = QData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 370,
              width: 500,
              child: Image.asset(
                "assets/images/quiz_photo.png",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: _expansionPanel(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _expansionPanel() {
    return ExpansionPanelList(
      animationDuration: Duration(milliseconds: 500),
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.symmetric(vertical: 5),
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          Topics.sampleTopics[index].isExpanded = !isExpanded;
        });
      },
      children: [
        for (int topicInd = 0;
            topicInd < Topics.sampleTopics.length;
            topicInd++) // Sample Topics is List of MainTopics
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.lightbulb_outline),
                  title: Text(Topics.sampleTopics[topicInd].mainTopic),
                  //subtitle: Text('This is a Major Topic'),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: Column(
                children: [
                  for (int subtopicInd = 0;
                      subtopicInd <
                          Topics.sampleTopics[topicInd].subTopics.length;
                      subtopicInd++)
                    ListTile(
                      leading: Icon(Icons.quiz),
                      title: Text(Topics.sampleTopics[topicInd]
                          .subTopics[subtopicInd].subTopicName),
                      //subtitle: Text('This is a minor section'),
                      contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      trailing: ElevatedButton(
                        child: Text("Attempt"),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainQuiz(
                                  Topics.sampleTopics[topicInd]
                                      .subTopics[subtopicInd].subTopicName,
                                  questionData[
                                      '$topicInd' + '_' + '$subtopicInd'])),
                        ),
                        //onTap: ()=>Navigator.of(context).pushNamed(subtopic.topicRouteName)
                      ),
                    ),
                ],
              ),
            ),
            isExpanded: Topics.sampleTopics[topicInd].isExpanded,
            canTapOnHeader: true,
          )
      ],
    );
  }
}
