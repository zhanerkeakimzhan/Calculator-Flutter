// ignore_for_file: import_of_legacy_library_into_null_safe
//home
import "package:math_expressions/math_expressions.dart";
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Basic calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // late int firstNum;
  // late int secondNum;
  // late String history = '';
  // late String textToDisplay = '';
  // late String result;
  // late String operation;

  // void btnOnClick(String btnVal){
  //   print(btnVal);
  //   if(btnVal == '1'){
  //
  //   }
  //   if(btnVal == 'C'){
  //     textToDisplay = '';
  //     firstNum = 0;
  //     secondNum = 0;
  //     result = '';
  //   } else if(btnVal == 'AC'){
  //     textToDisplay = '';
  //     firstNum = 0;
  //     secondNum = 0;
  //     result = '';
  //     history = '';
  //   } else if (btnVal == '+/-') {
  //     if(textToDisplay[0] != '-'){
  //       result = '-$textToDisplay';
  //     } else{
  //       result = textToDisplay.substring(1);
  //     }
  //   } else if(btnVal == '<'){
  //     result = textToDisplay.substring(0, textToDisplay.length -1);
  //   } else if(btnVal == '+' || btnVal == '-' || btnVal == 'x' || btnVal == '/'){
  //     firstNum = int.parse(textToDisplay);
  //     result = '';
  //     operation = btnVal;
  //   } else if(btnVal == '='){
  //     secondNum = int.parse(textToDisplay);
  //     if(operation == '+'){
  //       result = (firstNum + secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     if(operation == '-'){
  //       result = (firstNum + secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     if(operation == 'x'){
  //       result = (firstNum + secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     if(operation == '/'){
  //       result = (firstNum + secondNum).toString();
  //       history = firstNum.toString() + operation.toString() + secondNum.toString();
  //     }
  //     else{
  //       result = int.parse(textToDisplay + btnVal).toString();
  //     }
  //   }
  // }

  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                  _history,
                  style:const TextStyle(
                      fontSize: 24,
                      fontFamily: 'Times New Roman',
                      color: Colors.grey
                  )
              ),
            ),
          ),


          Container(
            alignment: const Alignment(1.0, 1.0),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                _expression,
                style: const TextStyle(
                    fontSize: 48,
                    color: Colors.white,
                    fontFamily: 'Times New Roman'
                  )
                ),
              ),
          ),

          Row(
            children: <Widget>[
              Container(
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => allClear('AC'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          'AC',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black54,
                            fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => clear('C'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          'C',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('%'),
                        backgroundColor: Colors.yellow,
                        child: const Text(
                          '%',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('/'),
                        backgroundColor: Colors.yellow,
                        child: const Text(
                          '/',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('7'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '7',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('8'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '8',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('9'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '9',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('*'),
                        backgroundColor: Colors.yellow,
                        child: const Text(
                          '*',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('4'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '4',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('5'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '5',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('6'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '6',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('-'),
                        backgroundColor: Colors.yellow,
                        child: const Text(
                          '-',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('1'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '1',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('2'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '2',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('3'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '3',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('+'),
                        backgroundColor: Colors.yellow,
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('.'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '.',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('0'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '0',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => numClick('00'),
                        backgroundColor: Colors.green,
                        child: const Text(
                          '00',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
              Container(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: FloatingActionButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        onPressed: () => evaluate('='),
                        backgroundColor: Colors.yellow,
                        child: const Text(
                          '=',
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.black54,
                              fontFamily: 'Times New Roman'
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}