const User = require('../model/userModel');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const Resume = require('../model/resumeModel');
const storageReference = require("../firebase");
const { promisify } = require('util');

exports.register = async (req,res) => {
  const fileBuffer = req.files.resume;
  const fileReference = storageReference.child(`resumes/${req.files.resume[0].originalname}`);
  await fileReference.put(fileBuffer, { contentType: 'application/pdf' });
  const fileDownloadURL = await fileReference.getDownloadURL(); 

  const newResume = new Resume({
      name: req.files.resume[0].originalname,
      url: fileDownloadURL
  });

  await newResume.save();

  const { 
    name,
    dob,
    age,
    gender,
    email,
    password,
    mobile,
    address,
    street,
    city,
    district,
    state,
    country,
    pincode,
    degree,
    graduation,
    experience,
    currentCTC,
    yearOfPassing,
    collegeName,
    collegeDistrict,
    collegeState,
    areaOfInterest
   } = req.body;

  try{
    let existingUser = await User.findOne({email});
    if(existingUser){
      return res.status(400).json({
        message: "User already exists"
      });
    }

    const user = new User({
      name,
      dob,
      age,
      gender,
      email,
      password,
      mobile,
      address,
      street,
      city,
      district,
      state,
      country,
      pincode,
      degree,
      graduation,
      experience,
      currentCTC,
      yearOfPassing,
      collegeName,
      collegeDistrict,
      collegeState,
      areaOfInterest,
      resume: fileDownloadURL
    });

    const salt = await bcrypt.genSalt(10);
    user.password = await bcrypt.hash(password, salt);

    await user.save();

    res.status(201).json({
      message: "User registration successfull"
    });
  } catch {
    res.status(500).json({
      message: "Enter proper Email ID"
    });
  }
}

exports.login = async (req, res, next) => {
  const { email, password } = req.body;

  try {
    let existingUser = await User.findOne({ email });

    if (!existingUser) {
      return res.status(400).json({
        message: "User does not exist"
      });
    }

    const isMatch = await bcrypt.compare(password, existingUser.password);
    if (isMatch) {
      const payload = {
        user: {
          id: existingUser._id
        }
      };

      jwt.sign(
        payload,
        "THOZHIL_MOBILE_APP_TOKEN",
        { expiresIn: '10d' },
        (err, token) => {
          if (err) {
            console.error(err);
            return res.status(500).json({
              message: 'Failed to generate token'
            });
          }
          req.user = existingUser;
          res.status(200).json({
            message: 'Passwords match',
            token
          });
        }
      );

    } else {
      res.status(400).json({
        message: 'Incorrect email or password'
      });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({
      message: 'Server error'
    });
  }
};

exports.auth = async (req, res, next) => {
  const token = req.header('Authorization')?.replace('Bearer ', '');

  

  try {
    const decoded = jwt.verify(token, "THOZHIL_MOBILE_APP_TOKEN");
    req.user = decoded.user;

    const user = await User.findById(req.user.id);
    if (!user) {
      return res.status(401).json({ message: 'User not found, authorization denied' });
    }
    req.user = user;
    
    next();
  } catch (err) {
    console.error(err);
    res.status(401).json({ message: 'Token is not valid' });
  }
};

exports.protect = async (req, res, next) => {
  //1. Get the token - the JWT is added to http header with authorization : Bearer <token>
  try{
    let token;
    if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
      token = req.headers.authorization.split(' ')[1];
    }

    if (!token) {
      return res.status(401).json({ message: 'No token, authorization denied' });
    }

    //2. Validate the token (Verification)
    const decoded = await promisify(jwt.verify)(token, "THOZHIL_MOBILE_APP_TOKEN");

    console.log(decoded);

    const currentUser = await User.findById(decoded.user.id);
    req.user = currentUser;
    next();
  } catch(err){
    return res.status(200).json({
      err
    });
  }
};

exports.userInfo = async (req,res) => {
  let users = await User.find({});

  res.status(200).json({
    users
  });
}