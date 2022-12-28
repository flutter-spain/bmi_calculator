import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
   
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  late String result = "";

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController(); 

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          // Simple Navigation Bar
          appBar: AppBar(
            title: const Text('BMI Calculator', style: TextStyle(color: Colors.black),),
            elevation: 0.0,
            backgroundColor: const Color(0xfffafafa),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings, color: Colors.black,),
              )
            ],
          ),
          // Body
          body : SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Row(
                        children: [
                           radioButton("Man", Colors.blue, 0),
                           radioButton("Woman", Colors.pink, 1),
                        ],
                      ),
                      const SizedBox(height: 20.0,),
                      const Text('Your Height in Cm:', style: TextStyle(
                        fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                       TextField(
                        keyboardType: TextInputType.number,
                        controller: heightController,
                        textAlign: TextAlign.center ,
                        decoration: const InputDecoration(
                          hintText: 'Enter your height in cm',
                          filled: true,
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0,),


                      const Text('Your Weight in kg:', style: TextStyle(
                        fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(height: 8.0,),
                       TextField(
                        keyboardType: TextInputType.number,
                        controller: weightController,
                        textAlign: TextAlign.center ,
                        decoration: const InputDecoration(
                          hintText: 'Your Weight in kg',
                          filled: true,
                          
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0,),

                      Container(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            double height = double.parse(heightController.text);
                            double weight = double.parse(weightController.text);
                            CalculateBmi(height, weight);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text('Calculate', style: TextStyle(
                            fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20.0,),

                      const Center(
                        child: Text('Your BMI is:', 
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50.0,),

                       Center(
                        child: Text(
                          "$result", 
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0,),

                  ],
                )
            ),
          )
        )
    );
  }


  void CalculateBmi(double height, double weight) {
    print(height);
    print(weight);
    double finalresult = weight / (height * height) * 10000;
    print(finalresult);
    setState(() {
      result = finalresult.toStringAsFixed(2);
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }


  Widget radioButton(String value, Color color, int index) {
     return Expanded(
         child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            height: 80,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: currentindex == index ? color : Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),  
              ),
              onPressed: () {
                changeIndex(index);
              },
              child: Text(value, style: TextStyle(
                  color: currentindex == index ? Colors.white :  color,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                  ),
            ),
           )
         )
     );
  }
}