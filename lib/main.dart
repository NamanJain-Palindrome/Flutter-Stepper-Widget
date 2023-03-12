import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
} //main()

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finance Tracker',
      debugShowCheckedModeBanner: false,
      home: StepperDemo(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.white),
          foregroundColor: Colors.white, //<-- SEE HERE
        ), //AppBarTheme
      ), //ThemeData
    ); //MaterialApp
  } //build
} //StatelessWidget

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() => _StepperDemoState();
} //StatefulWidget

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ), //AppBar
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  //Step 1--------------------STARTS-------------
                  Step(
                    title: new Text('Account'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Email Address'),
                        ), //TextFormField
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                        ), //TextFormField
                      ], //<Widget>[]
                    ), //Column
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ), //Step
                  //Step 1--------------------ENDS-------------

                  //

                  //Step 2--------------------STARTS-------------
                  Step(
                    title: new Text('Address'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Home Address'),
                        ), //TextFormField
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Postcode'),
                        ), //TextFormField
                      ], //<Widget>[]
                    ), //Column
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ), //Step
                  //Step 2--------------------ENDS-------------

                  //

                  //Step 3--------------------STARTS-------------
                  Step(
                    title: new Text('Mobile Number'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:
                              InputDecoration(labelText: 'Mobile Number'),
                        ), //TextFormField
                      ], //<Widget>[]
                    ), //Column
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ), //Step
                  //Step 3--------------------ENDS-------------

                  //
                ], ////<Step>[]
              ), //Stepper
            ), //Expanded
          ],
        ), //Column
      ), //Container

      //
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ), //FloatingActionButton

      //
    ); //Scaffold
  } //build

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  } //switchStepsType()

  tapped(int step) {
    setState(() => _currentStep = step);
  } //tapped()

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  } //continued()

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  } //cancel()
}//Stateful
