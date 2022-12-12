import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_tip_app_calculator/homepage.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff121617),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TIP CALCULATOR',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 80.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  //TODO: tip total amount per person section

                  Expanded(
                    flex: 3,
                    child: services(
                      cardchild: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Per Person',
                              style: GoogleFonts.poppins(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              '\$ 250',
                              style: GoogleFonts.poppins(
                                fontSize: 50.0,
                                fontWeight: FontWeight.w800,
                                color: const Color(
                                  0xff00ffb4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //TODO: tip calculator section
                  Expanded(
                    flex: 5,
                    child: services(
                      cardchild: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20.0,
                          ),
                          child: Column(
                            children: [
                              TextField(
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  hintText: 'Bill Amount',
                                  //labelText: 'Bill Amount',
                                  hintStyle: GoogleFonts.poppins(
                                    color: Colors.white.withOpacity(
                                      0.3,
                                    ),
                                    fontSize: 18.0,
                                  ),
                                  //prefixText: 'Bill Amount',
                                  prefixIcon: const Icon(
                                    Icons.attach_money,
                                    color: Color(
                                      0xff00ffb4,
                                    ),
                                  ),
                                ),
                                onChanged: (String value) {
                                  try {
                                    _billAmount = double.parse(value);
                                  } catch (exception) {
                                    _billAmount = 0.0;
                                  }
                                },
                              ),
                              //TODO: Split section
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Split',
                                      style: GoogleFonts.poppins(
                                        color: const Color(
                                          0xffffffff,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(
                                              () {
                                                if (_personCounter > 1) {
                                                  _personCounter--;
                                                }
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                7,
                                              ),
                                              color: const Color(
                                                0xff45545a,
                                              ),
                                            ),
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: Text(
                                                '-',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 30,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "$_personCounter",
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(
                                              () {
                                                _personCounter++;
                                              },
                                            );
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                7,
                                              ),
                                              color: const Color(0xff45545a),
                                            ),
                                            width: 40,
                                            height: 40,
                                            child: Center(
                                              child: Text(
                                                '+',
                                                style: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 30,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              //todo tip section

                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tip',
                                      style: GoogleFonts.poppins(
                                        color: const Color(
                                          0xffffffff,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    Text(
                                      '\$ ${calculateTotalTip(
                                        _billAmount,
                                        _personCounter,
                                        _tipPercentage,
                                      )}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xff00ffb4),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //todo suggested tip section

                              Text(
                                'Suggested Tip',
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                '$_tipPercentage%',
                                style: GoogleFonts.poppins(
                                  fontSize: 35.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                'Suggested tip is 15% which is \n a conventional rate for a lunch table service.',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),

                              //todo: slider section

                              Slider(
                                  min: 0,
                                  max: 30,
                                  activeColor: const Color(
                                    0xff00ffb4,
                                  ),
                                  inactiveColor: Colors.grey,
                                  thumbColor: const Color(
                                    0xff00ffb4,
                                  ),
                                  value: _tipPercentage.toDouble(),
                                  onChanged: (double newValue) {
                                    setState(() {
                                      _tipPercentage = newValue.round();
                                    });
                                  })
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  calculateTotalPerson(double totalTip, double billAmount, int splitBy) {
    var totalPerPerson = (totalTip + billAmount) / splitBy;
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
    } else {
      (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}
