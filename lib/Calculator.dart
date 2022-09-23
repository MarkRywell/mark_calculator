import 'package:flutter/material.dart';
import 'package:mark_calculator/calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.title});

  final String title;

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var operator = '';
  var text = '0';

  insertNumber(value) {
    setState(() {
      if (text == '0' || text == 'Infinity') {
        text = value.toString();
      } else {
        text += value.toString();
      }
    });
  }

  setOperator(newOperator) {
    setState(() {
      if (operator != '') {
        calculate();
        text += newOperator.toString();
        operator = newOperator;
      } else {
        text += newOperator.toString();
        operator = newOperator;
      }
    });
  }

  clearOperator(){
    setState(() {
      text='';
      operator='';
    });
  }

  calculate() {
    var data = text.split(operator);

    var number1 = data[0];
    var number2 = data[1];

    setState(() {
      switch(operator) {
        case 'x':
          text = (double.parse(number1) * double.parse(number2)).toStringAsFixed(1);
          break;
        case '/':
          text = (double.parse(number1) / double.parse(number2)).toStringAsFixed(1);
          break;
        case '-':
          text = (double.parse(number1) - double.parse(number2)).toStringAsFixed(1);
          break;
        case '+':
          text = (double.parse(number1) + double.parse(number2)).toStringAsFixed(1);
          break;
      }
    });
  }
  DeleteOperator(){
    setState(() {
      if (text.isNotEmpty) {
        text = text.substring(0, text.length-1);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column
          (
          children: [
            Container(
              color: Colors.blue[200],
              width: size.width,
              height: size.height / 2.5,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.black, fontSize: 60, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
                      ),

                    ),
                  ]),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        CalculatorButton(
                          fontsize: 35,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: 'C',
                          buttontapped: () {clearOperator();},
                        ),

                        SizedBox(width: 180),
                        CalculatorButton(

                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: 'DEL',
                          buttontapped: () {DeleteOperator();},
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '7',
                          buttontapped: () {insertNumber(7);},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '8',
                          buttontapped: () {insertNumber(8);},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '9',
                          buttontapped: () {insertNumber(9);},
                        ),
                        CalculatorButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '/',
                          buttontapped: () {setOperator('/');},
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '4',
                          buttontapped: () {insertNumber(4);},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '5',
                          buttontapped: () {insertNumber(5);},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '6',
                          buttontapped: () {insertNumber(6);},
                        ),
                        CalculatorButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: 'X',
                          buttontapped: () {setOperator('x');},
                        ),
                      ])
                  ,
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '1',
                          buttontapped: () {insertNumber(1);},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '2',
                          buttontapped: () {insertNumber(2);},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '3',
                          buttontapped: () {insertNumber(3);},
                        ),
                        CalculatorButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '-',
                          buttontapped: () {setOperator('-');},
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '.',
                          buttontapped: () {},
                        ),
                        CalculatorButton(
                          fontsize: 40,
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '0',
                          buttontapped: () {insertNumber(0);},
                        ),
                        CalculatorButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '=',
                          buttontapped: () {calculate();},
                        ),
                        CalculatorButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          buttonText: '+',
                          buttontapped: () {setOperator('+');},
                        ),
                      ])
                ],
              ),
            ),
          ],
        ));
  }
}