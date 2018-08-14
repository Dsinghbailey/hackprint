
//Date obj
function dateObj(dateStringP){
    //from 1 to 10
      this.year=parseInt(dateStringP.substr(dateStringP.length - 4));
      this.y1= Math.ceil(this.year/1000);
      this.y2=Math.ceil(this.year/100)%10 +1;
      this.y3=Math.ceil(this.year/10)%10 +1;
      this.y4= this.year%10 +1;
      this.y12= Math.ceil(this.year/100);
      this.y34 =(this.year%100)+1;
      this.y23= Math.ceil(this.year/10)%100 +1;
  //mm/dd/yyyy
      this.dd=parseInt(dateStringP.substr(3,5));
      this.mm=parseInt(dateStringP.substr(0,2));
      this.doy=getDOY(this);
    this.mZod=getmZodiacSign(this.dd,this.mm);
  }
    //gets leap year
   function isLeapYear(dateobj) {
    var year = dateObj.year;
    if((year & 3) != 0) return false;
    return ((year % 100) != 0 || (year % 400) == 0);
}

// Get Day of Year
  function getDOY(dateObj) {
    var dayCount = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    var dayOfYear = dayCount[dateObj.mm] +  dateObj.dd;
     if(dateObj.mm > 1 && this.isLeapYear()) 
      dayOfYear++;
    return dayOfYear;
}

/**
 * Return zodiac sugn by month and day
 *
 * @param day
 * @param month
 * @return {string} number of zodiac sign
 */
function getmZodiacSign(day, month) {

  var zodiacSigns = {
    'capricorn':1,
    'aquarius':2,
    'pisces':3,
    'aries':4,
    'taurus':5,
    'gemini':6,
    'cancer':7,
    'leo':8,
    'virgo':9,
    'libra':10,
    'scorpio':11,
    'sagittarius':12
  }

  if((month == 1 && day <= 20) || (month == 12 && day >=22)) {
    return zodiacSigns.capricorn;
  } else if ((month == 1 && day >= 21) || (month == 2 && day <= 18)) {
    return zodiacSigns.aquarius;
  } else if((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
    return zodiacSigns.pisces;
  } else if((month == 3 && day >= 21) || (month == 4 && day <= 20)) {
    return zodiacSigns.aries;
  } else if((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
    return zodiacSigns.taurus;
  } else if((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
    return zodiacSigns.gemini;
  } else if((month == 6 && day >= 22) || (month == 7 && day <= 22)) {
    return zodiacSigns.cancer;
  } else if((month == 7 && day >= 23) || (month == 8 && day <= 23)) {
    return zodiacSigns.leo;
  } else if((month == 8 && day >= 24) || (month == 9 && day <= 23)) {
    return zodiacSigns.virgo;
  } else if((month == 9 && day >= 24) || (month == 10 && day <= 23)) {
    return zodiacSigns.libra;
  } else if((month == 10 && day >= 24) || (month == 11 && day <= 22)) {
    return zodiacSigns.scorpio;
  } else if((month == 11 && day >= 23) || (month == 12 && day <= 21)) {
    return zodiacSigns.sagittarius;
  }
}