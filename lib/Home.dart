import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  int _currentStep=0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      appBar: new AppBar(
        title: new Text(
          "Flutter Stepper",
          style: TextStyle(fontSize: 18.0),
        ),
        backgroundColor: Colors.deepOrange,
      ),

      body: Stepper(
          steps: _mytep(),
        currentStep: this._currentStep,
        onStepTapped: (step){
           setState(() {
             this._currentStep=step;
           });
        },
        onStepContinue: (){
          setState(() {
            if(this._currentStep<this._mytep().length-1){
              this._currentStep=this._currentStep+1;
            }else{
              print("Completed...")
            }

          });
        },
        onStepCancel: (){
          setState(() {

            if(this._currentStep>0){
              this._currentStep=this._currentStep-1
            }else{
              this._currentStep=0;
            }

          });
        },
      ),

    );
  }

  List<Step>_mytep(){

    List<Step>step=[
      Step(
          title: Text("Step 1"),
          content: Text("Hello we are working here for some other stuff.."),
          isActive: this._currentStep>0
      ),
      Step(
          title: Text("Step 2"),
          content: TextField(),
          isActive: this._currentStep>1
      ),
      Step(
          title: Text("Step 3"),
          content: TextField(),
          isActive: this._currentStep>2
      ),
      Step(
          title: Text("Step 4"),
          content: Text("Hello we are working here for some other stuff.."),
          isActive: this._currentStep>3
      )
    ];
    return step;
  }

}
