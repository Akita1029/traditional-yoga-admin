const Validator = require("validator");
const isEmpty = require("./is-empty");

module.exports = function validateRegisterInput(data) {
  let errors = {};

  data.email = !isEmpty(data.email) ? data.email : "";
  data.password = !isEmpty(data.password) ? data.password : "";
  data.password2 = !isEmpty(data.password2) ? data.password2 : "";

  if (Validator.isEmpty(data.email)) {
    errors.email = "Email field is required";
  }

  if (!Validator.isEmail(data.email)) {
    errors.email = "Email is invalid";
  }

  if (Validator.isEmpty(data.password)) {
    errors.password = "Password field is required";
  }

  if (!Validator.isLength(data.password, { min: 6, max: 30 })) {
    errors.password = "Password must be at least 6 characters";
  }

  if (Validator.isEmpty(data.password2)) {
    errors.password2 = "Confirm Password field is required";
  }

  if (!Validator.equals(data.password, data.password2)) {
    errors.password2 = "Passwords must match";
  }

  if (Validator.isEmpty(data.first_name)) {
    errors.reg_first_name = "First name field is required";
  }
  if (Validator.isEmpty(data.last_name)) {
    errors.reg_last_name = "Last name field is required";
  }
  if (Validator.isEmpty(data.nick_name)) {
    errors.reg_nick_name = "Nick name field is required";
  }
  if (Validator.isEmpty(data.ryit_cert)) {
    errors.reg_ryit_cert = "You must select this";
  }
  if (Validator.isEmpty(data.birthday)) {
    errors.reg_birthday = "Birthday field is required";
  }
  if (Validator.isEmpty(data.whatsapp_phonenumber)) {
    errors.reg_whatsapp_phonenumber = "Whatsapp Phonenumber field is required";
  }
  if (Validator.isEmpty(data.gender)) {
    errors.reg_gender = "Gender field is required";
  }
  if (Validator.isEmpty(data.language)) {
    errors.reg_language = "Language field is required";
  }
  if (Validator.isEmpty(data.profession)) {
    errors.reg_profession = "Profession field is required";
  }
  if (Validator.isEmpty(data.education_detail)) {
    errors.reg_education_detail = "Education detail field is required";
  }
  if (Validator.isEmpty(data.country)) {
    errors.reg_country = "Country field is required";
  }
  if (Validator.isEmpty(data.street_address)) {
    errors.reg_street_address = "Street address field is required";
  }
  if (Validator.isEmpty(data.address_line_2)) {
    errors.reg_address_line_2 = "Address line 2 field is required";
  }
  if (Validator.isEmpty(data.city)) {
    errors.reg_city = "City field is required";
  }
  if (Validator.isEmpty(data.province)) {
    errors.reg_province = "Province field is required";
  }
  if (Validator.isEmpty(data.zip_code)) {
    errors.reg_zip_code = "Zip code field is required";
  }

  return {
    errors,
    isValid: isEmpty(errors),
  };
};
