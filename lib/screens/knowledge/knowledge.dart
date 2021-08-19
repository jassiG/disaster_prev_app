import 'package:flutter/material.dart';
import 'package:disaster_prevention/models/topics.dart' as Topics;
//import '../../utils/routes.dart';

class Knowledge extends StatefulWidget {
  @override
  _KnowledgeState createState() => _KnowledgeState();
}

class _KnowledgeState extends State<Knowledge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Knowledge"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.8,
            //   height: MediaQuery.of(context).size.height * 0.4,
            //   child: Container(
            //     color: Colors.grey,
            //   ),
            // ),
            Container(
              height: 400,
              width: 500,
              child: Image.asset(
                "assets/images/knowledge_image.png",
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
        for (Topics.Topic topic in Topics.sampleTopics)
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return Container(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(topic.mainTopic),
                  //subtitle: Text('This is a Major Topic'),
                ),
              );
            },
            body: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
              child: Column(
                children: [
                  for (Topics.SubTopic subtopic in topic.subTopics)
                    ListTile(
                        leading: Icon(Icons.library_books),
                        title: Text(subtopic.subTopicName),
                        //subtitle: Text('This is a minor section'),
                        contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () => Navigator.of(context)
                            .pushNamed(subtopic.topicRouteName)),
                ],
              ),
            ),
            isExpanded: topic.isExpanded,
            canTapOnHeader: true,
          )
      ],
    );
  }
}
