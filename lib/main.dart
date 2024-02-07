import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Question {
  final String question;
  final List<String> choices;
  final String answer;

  Question({
    required this.question,
    required this.choices,
    required this.answer,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Quiz'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Question> questions = [
    Question(
      question: '.สนามบินนานาชาติแห่งแรกของประเทศไทยคืออะไร',
      choices: [' สนามบินสุวรรณภูมิ', 'สนามบินเชียงใหม่', 'สนามบินหาดใหญ่', 'สนามบินดอนเมือง'],
      answer: 'สนามบินดอนเมือง',
    ),
    Question(
      question: 'ภาษาอะไรเป็นภาษาที่ใช้ในราชสำนักไทยในสมัยโบราณ',
      choices: ['ภาษาไทย', 'ภาษาบาลี', 'ภาษาสันสกฤต', 'ภาษาเขมร'],
      answer: 'ภาษาสันสกฤต',
    ),
    Question(
      question: 'ดอกไม้ประจำชาติไทยคือดอกอะไร',
      choices: ['ดอกกล้วยไม้', 'ดอกบัวหลวง', 'ดอกดาวเรือง', 'ดอกกุหลาบ'],
      answer: 'ดอกบัวหลวง',
    ),
    Question(
      question: 'สัตว์ประจำชาติไทยคืออะไร',
      choices: ['ช้างเผือก', 'วัว', 'ม้า', 'ลิง'],
      answer: 'ช้างเผือก',
    ),
    Question(
      question: 'กรุงเทพมหานครมีกี่เขต',
      choices: ['51เขต', '77เขต', '50เขต', '78เขต'],
      answer: '50เขต',
    ),
    Question(
      question: 'ภาษาประจำชาติไทยคือภาษาอะไร',
      choices: ['ภาษาไทย', 'ภาษาอังกฤษ', 'ภาษาจีน', 'ภาษาฝรั่งเศส'],
      answer: 'ภาษาไทย',
    ),
    Question(
      question: 'ประเทศไทยมีกี่ภาค',
      choices: ['2 ภาค', '3 ภาค', '4 ภาค', '5 ภาค'],
      answer: '4 ภาค',
    ),
    Question(
      question: 'ภาคเหนือของประเทศไทยมีกี่จังหวัด',
      choices: ['14 จังหวัด', '16 จังหวัด', '17 จังหวัด', '18 จังหวัด'],
      answer: '17 จังหวัด',
    ),
    Question(
      question: 'สินค้าส่งออกหลักของประเทศไทยคืออะไร',
      choices: ['ข้าว', 'ยางพารา', 'ชิ้นส่วนรถยนต์', 'หนังสัตว์'],
      answer: 'ข้าว',
    ),
     Question(
      question: '.กีฬาประจำชาติไทยคืออะไร',
      choices: ['ตะกร้อ', 'มวยไทย', 'วอลเลย์บอล', 'แบตมินตัน'],
      answer: 'มวยไทย',
    ),
    // ... (additional questions)
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  void nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ผลคะแนน'),
            content: Text('คุณตอบถูก $score จาก ${questions.length} ข้อ'),
            actions: <Widget>[
              TextButton(
                child: Text('ปิด'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void checkAnswer(String answer) {
    if (answer == questions[currentQuestionIndex].answer) {
      score++;
    }
    nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[currentQuestionIndex].question,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Column(
            children: questions[currentQuestionIndex].choices.map((choice) {
              return ElevatedButton(
                onPressed: () {
                  checkAnswer(choice);
                },
                child: Text(choice),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
