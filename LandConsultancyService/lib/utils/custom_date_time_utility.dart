import 'package:flutter/material.dart';

class CustomDateTimeUtility {
  dynamic correctedDay;
  dynamic correctedMonth;
  dynamic correctedYear;

  List<int> allDays = [];
  List<String> allMonths = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December",
  ];
  List<String> allMonthsShort = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
  ];
  List<int> allYears = [];
  var monthNumber = Map();

  CustomDateTimeUtility () {
    for(int i=1; i<32; i++) {
      allDays.add(i);
    }
    for(int i=0; i<12; i++) {
      monthNumber[allMonths[i]] = i+1;
      monthNumber[allMonthsShort[i]] = i+1;
      // print(allMonths[i].toString() + " " + monthNumber[allMonths[i]].toString());

    }
    for(int i=1981; i<2050; i++) {
      allYears.add(i);
    }
  }

  bool leapYear(int? year) {
    if(year==null) return true;
    if(year % 400 == 0) return true;
    if(year% 4 == 0 && year % 100 != 0) return true;
    return false;
  }

  int daysInMonth(int month, int? year) {
    if(month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12 ) {
      return 31;
    }
    else if (month==2) {
      if(year != null && !leapYear(year)) return 28;
      return 29;
    }
    return 30;
  }

  void validateDayMonthYear(int? day, dynamic month, int? year) {
    if(month.runtimeType == String) month = monthNumber[month];
    if(month==null || (month!=null && (day==null && year==null))) {
      // print(day.toString()+" "+month.toString()+" "+year.toString());
      correctedDay = day;
      correctedMonth = month;
      correctedYear = correctedYear;
      return;
    }

    int days_in_month = daysInMonth(month, year);
    if(day!=null) {
      if (day > days_in_month) {
        day = days_in_month;
      }
    }

    correctedDay = day;
    correctedMonth = month;
    correctedYear = correctedYear;
    return;
  }


}