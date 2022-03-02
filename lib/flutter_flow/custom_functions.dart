import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

int getOrderOf(
  List<String> list,
  String value,
) {
  // get index from string list by value
  assert(list != null, "'list' is null");
  assert(value != null, "'value' is null");

  var order = list.indexOf(value);
  assert(
      list.isNotEmpty, "The result will not be positive if list.length is 0");
  assert(order != -1, "The string '$value' is not in the list of $list");
  return order;
}

bool isVerifyIDCardBannerShow(String status) {
  return status == "Waiting Verification";
}

double getPaidAmount(
  double productPrice,
  double convenienceFee,
) {
  return productPrice + convenienceFee;
}

bool isNeedSetSecurityCode(String securityCode) {
  return securityCode == null || securityCode == "";
}

bool isWelcomeOnboarding(
  String displayName,
  String email,
  String idCard,
) {
  return email == "" ||
      email == null ||
      displayName == "" ||
      displayName == null ||
      idCard == "" ||
      idCard == null;
}

bool isImagePathEmpty(String imagePath) {
  return imagePath == "" || imagePath == null;
}

bool isVerifyCardValid(
  String idCardImage,
  String selfieWithIdCard,
  String idCard,
) {
  if (idCard == null || idCardImage == null || selfieWithIdCard == null) {
    return false;
  } else {
    if (idCard.isNotEmpty &&
        idCardImage.isNotEmpty &&
        selfieWithIdCard.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}

bool isStringEmpty(String value) {
  return value.isEmpty;
}

bool isCurrentBalanceInsuficient(
  double currentBalance,
  double value,
) {
  return currentBalance < value;
}

String getRandomID() {
  // get random uuid
  math.Random random = math.Random();
  StringBuffer hexCode = StringBuffer();
  for (var j = 0;
      j < 16;
      hexCode.write(random.nextInt(256).toRadixString(16)), j = j + 1);
  String UUID = hexCode.toString();
  return UUID;
}

String getTransactionID() {
  // get random uuid
  math.Random random = math.Random();
  StringBuffer hexCode = StringBuffer();
  for (var j = 0;
      j < 16;
      hexCode.write(random.nextInt(256).toRadixString(16)), j = j + 1);
  DateTime result = new DateTime.now();
  String year = result.year.toString().substring(2, 4);
  String month = result.month.toString().padLeft(2, '0');
  String UUID = hexCode.toString().substring(0, 2).toUpperCase() +
      month +
      hexCode.toString().substring(3, 5).toUpperCase() +
      year +
      hexCode.toString().substring(6, 8).toUpperCase();
  return UUID;
}

double getEstimateRemainingBalance(
  double currentBalance,
  double grandTotal,
) {
  return currentBalance - grandTotal;
}

double getBalanceAfterTopup(
  double currentBalance,
  double topupAmount,
) {
  return currentBalance + topupAmount;
}

bool isMerchantTransactionValidToPayNow(
  String status,
  double remainingBalance,
) {
  return status == "Waiting Payment" && remainingBalance >= 0;
}

bool isMerchantTransactionInsufficientBalance(
  String status,
  double remainingBalance,
) {
  return status == "Waiting Payment" && remainingBalance < 0;
}

bool isMerchantTransactionPaid(String status) {
  return status == "Complete";
}

bool isUserHasMerchantRole(List<String> roles) {
  return roles.contains("Merchant");
}

bool isUserHasCashAgentRole(List<String> roles) {
  return roles.contains("Cash Agent");
}

bool isTwoBooleanOr(
  bool boolean1,
  bool boolean2,
) {
  return boolean1 || boolean2;
}

bool isCashAgentInsufficientBalanceForTransfer(
  String status,
  double currentBalance,
  double amount,
) {
  return status != "Complete" && currentBalance < amount;
}

bool isCashAgentAbleToTransfer(
  String status,
  double currentBalance,
  double amount,
) {
  return status != "Complete" && currentBalance >= amount;
}

bool isUserAbleToPaymentUsingBalance(
  String status,
  double currentBalance,
  double amount,
) {
  return status != "Complete" && currentBalance >= amount;
}
