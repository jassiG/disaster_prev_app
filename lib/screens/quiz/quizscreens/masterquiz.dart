import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disaster_prevention/models/questions.dart';
import 'scorescreen.dart';


// This Screen Requires a List of Questions you doughnut

class MainQuiz extends StatefulWidget {
  //final List<int> answers;
  final List<Question> QList;
  final String Quiztitle;
  const MainQuiz(this.Quiztitle, this.QList );

  @override
  _MainQuizState createState() => _MainQuizState(QList.length);
}

class _MainQuizState extends State<MainQuiz> {
  int num = 0;
  _MainQuizState(this.num){
  }

  List<int> selected = List.filled(30,
      -1); //have no Idea why it's not taking 'num', so I am storing upto 30 responses, will not affect Score (dimaag kharab ho gya bhai)

  void clearSelected(int qIndex) {
    setState(() {
      selected[qIndex] = -1;
    });
    return;
  }
  void clearAll() {
    for(int i=0; i<20; i++)
      selected[i] = -1;
    setState(() {

    });
    return;
  }

  submitScore(){
    int score = 0;
    for(int k=0;k<widget.QList.length;k++){
      if(selected[k] == widget.QList[k].ans){
        score++;
      }
    }
    //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You scored $score out of $num')));
    //Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>  ScoreScreen(score, num)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(230, 230, 230, 1.0),
      appBar: AppBar(
        title: Text(widget.Quiztitle+'クイズ'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          children: [
            MyText(txt: widget.Quiztitle+'クイズ', sz: 32, isthick: true),
            for (int i = 0; i < num; i++)
              QuestionCard(questionObject: widget.QList[i], questionindex: i),
            Divider(height: 20, color: Colors.transparent),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: submitScore,
                  child: MyText(txt: 'Submit', sz: 16, isthick: true),
                ),
                SizedBox(
                  width: 10,
                  height: 1,
                ),
                ElevatedButton(
                  onPressed: clearAll,
                  child: MyText(txt: 'Clear All', sz: 16, isthick: true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget MyText({required String txt, required int sz, required bool isthick}) {
    String text = txt;
    int size = sz;
    bool isThick = isthick;
    return RichText(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontWeight: isThick ? FontWeight.w800 : FontWeight.w500,
          fontSize: size * 1.0,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget QuestionCard(
      {required Question questionObject, required int questionindex}) {
    Question ques;
    int ind;
    ques = questionObject;
    ind = questionindex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(height: 10, color: Colors.transparent),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            color: Colors.white70,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: MyText(txt: ques.question, sz: 18, isthick: true),
                    ),
                    ElevatedButton(onPressed: (){ clearSelected(ind);}, child: Text('Clear')),
                  ],
                ),
                Divider(height: 10, color: Colors.transparent),
                Column(
                  children: [
                    for (int j = 0; j < ques.options.length; j++)
                      OptionCard(
                          option: ques.options[j],
                          questionindex: ind,
                          optionindex: j),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget OptionCard(
      {required String option,
      required int questionindex,
      required int optionindex}) {
    String ops;
    int qInd = questionindex;
    int oInd = optionindex;
    ops = option;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(height: 5, color: Colors.transparent),
          Container(
            //width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            color: selected[qInd] == oInd ? Colors.lightBlue : Colors.white,
            child: InkWell(
              child: MyText(txt: ops, sz: 16, isthick: false),
              onTap: () {
                setState(() {
                  selected[qInd] = oInd;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
