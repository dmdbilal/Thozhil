import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:file_picker/file_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _nameController;
  late TextEditingController _dateController;
  late TextEditingController _genderController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;
  late TextEditingController _countryController;
  late TextEditingController _stateController;
  late TextEditingController _cityController;
  late TextEditingController _pincodeController;
  late TextEditingController _degreeController;
  late TextEditingController _yearofpassingController;
  late TextEditingController _experienceController;
  late TextEditingController _collegeNameController;
  late TextEditingController _interestsController;

  List<String> roles = ["Select", "Candidate", "Employee"];
  List<String> genders = ["Male", "Female", "Prefer not to say"];
  late String _genderDropDownValue = genders[0];
  List<String> degrees = [
    "Select",
    "High School Diploma / GED",
    "Associate's Degree",
    "Bachelor's Degree",
    "Master's Degree",
    "Doctorate / PhD"
  ];
  late String _degreeDropDownValue = degrees[0];

  final _formKey = GlobalKey<FormState>();
  late PlatformFile resume;
  String resumeName = "";

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _nameController = TextEditingController();
    _genderController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _addressController = TextEditingController();
    _countryController = TextEditingController();
    _stateController = TextEditingController();
    _cityController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _pincodeController = TextEditingController();
    _degreeController = TextEditingController();
    _yearofpassingController = TextEditingController();
    _experienceController = TextEditingController();
    _collegeNameController = TextEditingController();
    _interestsController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width;
    double maxHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
        home: Scaffold(
        body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 0,
              child: Container(
                  color: Colors.white,
                  child: AppBar(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    centerTitle: true,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back,
                            color: Colors.blue, size: 30)),
                    title: Text(
                      "SIGN UP",
                      style: GoogleFonts.dmSans(
                          color: Colors.blue,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
            Flexible(
                flex: 10,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(70.00)),
                  child: Container(
                      padding: const EdgeInsets.all(30),
                      alignment: Alignment.center,
                      constraints: BoxConstraints(
                          maxWidth: maxWidth, maxHeight: maxHeight),
                      color: Colors.blue,
                      child: ListView(
                        children: [
                          registrationForm(context),
                          const SizedBox(height: 20),
                          const Text(
                              'By clicking register, you agree to Thozhil’s Terms and Conditions.',
                              style: TextStyle(
                                  fontSize: 13, color: Colors.white70)),
                          const SizedBox(height: 20),
                          ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {}
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  minimumSize: Size(maxWidth, 50)),
                              child: Text("Register",
                                  style: GoogleFonts.dmSans(
                                      color: Colors.blue,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold))),
                        ],
                      )),
                )),
          ],
        ),
      ),
    ));
  }

  Widget registrationForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          /** Name */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _nameController,
              validator: (value) {
                if (value == "") {
                  return "Enter your name !";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your name',
                labelText: 'Name',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** DOB */
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _dateController,
                decoration: const InputDecoration(
                  labelText: "Date of Birth",
                ),
                readOnly: true,
                onTap: () {
                  _selectDate();
                },
              )),
          const SizedBox(height: 20),

          /** Gender */
          Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: InputDecorator(
                decoration: const InputDecoration(labelText: "Gender"),
                child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                  value: _genderDropDownValue,
                  items: genders.map((String gender) {
                    return DropdownMenuItem<String>(
                        value: gender, child: Text(gender));
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _genderDropDownValue = value!;
                    });
                  },
                  isExpanded: true,
                )),
              )),
          const SizedBox(height: 20),

          /** Mail ID */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              validator: (value) {
                if (value == "") {
                  return "Enter your email id";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter mail id',
                labelText: 'Email',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Mobile */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: _phoneController,
              validator: (value) {
                if (value == "") {
                  return "Enter mobile number";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your mobile number',
                labelText: 'Mobile Number',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Address */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              controller: _addressController,
              maxLines: null,
              validator: (value) {
                if (value == "") {
                  return "Enter your address";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter address',
                labelText: 'Address',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Country */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CountryStateCityPicker(
                country: _countryController,
                state: _stateController,
                city: _cityController,
                dialogColor: Colors.grey.shade200,
                textFieldDecoration: const InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide.none))),
          ),
          const SizedBox(height: 20),

          /** Pin Code */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.number,
              controller: _pincodeController,
              validator: (value) {
                if (value == "") {
                  return "Enter pincode";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter pincode',
                labelText: 'Pincode',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Degree */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
              value: _degreeDropDownValue,
              items: degrees.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _degreeDropDownValue = value!;
                });
              },
              isExpanded: true,
            )),
          ),
          const SizedBox(height: 20),

          /** Year of passing */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: _yearofpassingController,
              validator: (value) {
                if (value == "") {
                  return "Enter Year of passing";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter year of passing',
                labelText: 'Year of passing',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Experience */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              keyboardType: TextInputType.multiline,
              controller: _experienceController,
              maxLines: null,
              validator: (value) {
                if (value == "") {
                  return "Enter your experience";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter experience',
                labelText: 'Experience',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** College Name */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _collegeNameController,
              validator: (value) {
                if (value == "") {
                  return "Enter college name";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter college name',
                labelText: 'College Name',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Area of interest */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _interestsController,
              validator: (value) {
                if (value == "") {
                  return "Enter area of interests";
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: 'Enter your interests',
                labelText: 'Area of interest',
              ),
            ),
          ),
          const SizedBox(height: 20),

          /** Resume */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    resume = result.files.first;
                    resumeName = resume.name;
                  });
                }
              },
              child: Text(resumeName.isEmpty ? "Upload Resume" : resumeName),
            )
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? _date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_date != null) {
      setState(() {
        _dateController.text = _date.toString().split(" ")[0];
      });
    }
  }
}
