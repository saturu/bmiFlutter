import 'package:flutter/material.dart';
class BMI extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new BMIState();
  }

}

class BMIState extends State<BMI> {
  int genderValue = 0;
  String result = "First Fill the form .. ";
  double BMI = 0.0;
  String imgResult="";
  TextEditingController userHeight = new TextEditingController();
  TextEditingController userWeight = new TextEditingController();
  void genderHandler(int gender){
    setState(() {
      genderValue = gender;
      print( " ${userHeight.text }"   );
    });
  }
  void calculateBMI(){
    setState(() {
      var paramB = ((double.parse(userHeight.text))/100)*((double.parse(userHeight.text))/100);
      BMI = double.parse(userWeight.text)/paramB;
      result = "Your BMI $BMI ";
      if(genderValue==0){

       if (BMI >18.5){
         print("Normal Erkek");
         imgResult="images/normal_erkek.png";
       }
       else {
         print("Zayıf Erkek");
         imgResult="images/zayif_erkek.png";
       }
      }
      else{
        if (BMI >18.5){
          print("Normal Erkek");
          imgResult="images/normal_kadin.png";
        }
        else {
          print("Zayıf Erkek");
          imgResult="images/zayif_kadin.png";
        }

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: new Container(
        alignment: Alignment.topCenter,
        child: new Container(
          margin: new EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: new Column(
            children: <Widget>[

                new Image.asset("images/bmilogo.png",height: 80.0,),
                new Text("First Select The Gender",style: new TextStyle(fontSize: 18.8),),
                new Padding(padding: const EdgeInsets.all(20.0)),
                new Row(
                  children: <Widget>[

                    new Radio(value: 0, groupValue: genderValue, onChanged: genderHandler),
                    new Image.asset("images/erkek.png"),
                    new Padding(padding: const EdgeInsets.only(left: 90.0)),
                    new Radio(value: 1, groupValue: genderValue, onChanged: genderHandler),
                    new Image.asset("images/kadin.png"),
                  ],
                ),
              new Padding(padding: const EdgeInsets.all(10.0)),
              new TextField(
                controller: userHeight,
                decoration: new InputDecoration(
                  icon: new Icon(Icons.arrow_upward),
                  hintText: "Enter Your Height"
                ),
              ),
              new Padding(padding: const EdgeInsets.all(10.0)),
          new TextField(
            controller: userWeight,
            decoration: new InputDecoration(
              icon: new Icon(Icons.kitchen),
              hintText: "Enter Your Heavy",
            ),),
                new Padding(padding: const EdgeInsets.all(10.0)),
             new FlatButton(onPressed: calculateBMI, child: new Text("Calculate", style: new TextStyle(color: Colors.white),),color: Colors.pinkAccent, ),
            new Padding(padding: const EdgeInsets.all(10.0)),
              new Text(result),
                new Padding(padding: const EdgeInsets.all(10.0)),
                new Image.asset(imgResult),

            ],
          ),
        ),
      ),
    );
  }
  
}