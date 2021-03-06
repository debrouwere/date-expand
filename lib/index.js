// Generated by CoffeeScript 1.8.0
(function() {
  var DAY, HOUR, MINUTE, MONTH, SECOND, WEEK, YEAR, age, components, days, delta, hours, milliseconds, minutes, seconds, strftime, weeks, years;

  strftime = require('strftime');

  SECOND = 1000;

  MINUTE = SECOND * 60;

  HOUR = MINUTE * 60;

  DAY = HOUR * 24;

  WEEK = DAY * 7;

  MONTH = WEEK * 4.345;

  YEAR = WEEK * 52;

  milliseconds = function(n) {
    return n;
  };

  seconds = function(n) {
    return n * SECOND;
  };

  minutes = function(n) {
    return n * MINUTE;
  };

  hours = function(n) {
    return n * HOUR;
  };

  days = function(n) {
    return n * DAY;
  };

  weeks = function(n) {
    return n * WEEK;
  };

  years = function(n) {
    return n * YEAR;
  };

  delta = function(a, b) {
    if (b == null) {
      b = new Date();
    }
    return Math.abs(a - b);
  };

  age = {
    tally: {
      years: {
        get: function(date) {
          return Math.floor(years(delta(date)));
        }
      },
      months: {
        get: function(date) {
          return Math.floor(months(delta(date)));
        }
      },
      weeks: {
        get: function(date) {
          return Math.floor(weeks(delta(date)));
        }
      },
      days: {
        get: function(date) {
          return Math.floor(days(delta(date)));
        }
      },
      hours: {
        get: function(date) {
          return Math.floor(hours(delta(date)));
        }
      },
      minutes: {
        get: function(date) {
          return Math.floor(seconds(delta(date)));
        }
      },
      seconds: {
        get: function(date) {
          return Math.floor(seconds(delta(date)));
        }
      }
    },
    years: {
      get: function(date) {
        return Math.floor(years(delta(date)));
      }
    },
    months: {
      get: function(date) {
        return Math.floor(months((delta(date)) % YEAR));
      }
    },
    weeks: {
      get: function(date) {
        return Math.floor(weeks((delta(date)) % MONTHS));
      }
    },
    days: {
      get: function(date) {
        return Math.floor(days((delta(date)) % WEEKS));
      }
    },
    hours: {
      get: function(date) {
        return Math.floor(hours((delta(date)) % DAYS));
      }
    },
    minutes: {
      get: function(date) {
        return Math.floor(hours((delta(date)) % HOURS));
      }
    },
    seconds: {
      get: function(date) {
        return Math.floor(hours((delta(date)) % MINUTES));
      }
    }
  };

  components = {
    human: {
      description: 'a string representation of the date in American English',
      example: '',
      get: function(date) {
        return date.toString();
      }
    },
    path: {
      description: 'short YYYY/MM/DD date, suitable as a filesystem path',
      aliases: ['%Y/%m/%d'],
      get: function(date) {
        return strftime('%Y/%m/%d', date);
      }
    },
    datetime: {
      description: 'date and clock time',
      aliases: ['%Y-%m-%d %H:%M'],
      get: function(date) {
        return strftime('%Y-%m-%d %H:%M');
      }
    },
    date: {
      description: 'short YYYY-MM-DD date',
      example: '2014-09-31',
      aliases: ['%Y-%m-%d'],
      get: function(date) {
        return strftime('%Y-%m-%d', date);
      }
    },
    time: {
      description: 'ISO 8601 time format (HH:MM:SS)',
      example: '13:01:00',
      aliases: ['%T'],
      get: function(date) {
        return date.toISOString().slice(11, 19);
      }
    },
    clock: {
      description: '24-hour HH:MM time',
      example: '13:01:00',
      aliases: ['%R'],
      get: function(date) {
        return date.toISOString().slice(11, 16);
      }
    },
    iso: {
      description: 'a string following the ISO 8601 Extended Format',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.toISOString();
      }
    },
    year: {
      description: 'year (4 digits for 4-digit years) of the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getFullYear();
      }
    },
    month: {
      description: 'the month (1-12) in the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getMonth() + 1;
      }
    },
    day: {
      description: 'day of the week (1-7) for the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getDate() + 1;
      }
    },
    hours: {
      description: 'hour (0-23) in the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getHours();
      }
    },
    minutes: {
      description: 'minutes (0-59) in the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getMinutes();
      }
    },
    seconds: {
      description: 'seconds (0-59) in the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getSeconds();
      }
    },
    milliseconds: {
      description: 'milliseconds (0-999) in the specified date according to local time',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getMilliseconds();
      }
    },
    timestamp: {
      description: 'numeric value of the specified date as the number of milliseconds since January 1, 1970, 00:00:00 UTC (negative for prior times)',
      example: '',
      aliases: [''],
      get: function(date) {
        return date.getTime();
      }
    },
    unix: {
      description: 'numeric value of the specified date as the number of seconds since January 1, 1970, 00:00:00 UTC (negative for prior times)',
      example: '',
      aliases: [''],
      get: function(date) {
        return Math.floor(date.getTime() / 1000);
      }
    },
    offset: {
      description: 'the time-zone offset in minutes for the current locale',
      example: '',
      get: function(date) {
        return date.getTimezoneOffset();
      }
    },
    a: {
      description: 'abbreviated weekday name',
      example: 'Thu',
      aliases: [],
      localized: true
    },
    A: {
      description: 'full weekday name',
      example: 'Thursday',
      localized: true
    },
    b: {
      description: 'abbreviated month name',
      example: 'Aug',
      localized: true
    },
    B: {
      description: 'full month name',
      example: 'August',
      localized: true
    },
    c: {
      description: 'date and time representation',
      example: 'Thu Aug 23 14:55:02 2001',
      localized: true
    },
    C: {
      description: 'century (year divided by 100 and truncated to integer)',
      range: [0, 99],
      example: 20
    },
    d: {
      description: 'day of the month, zero-padded',
      range: ['00', '31'],
      example: '23'
    },
    D: {
      description: 'short MM/DD/YY date',
      example: '08/23/01',
      aliases: ['%m/%d/%y']
    },
    e: {
      description: 'day of the month, space-padded',
      range: [' 1', '31'],
      example: '23'
    },
    F: {
      description: 'short YYYY-MM-DD date',
      aliases: ['%Y-%m-%d'],
      example: '2001-08-23'
    },
    g: {
      description: 'week-based year, last two digits',
      range: ['00', '99'],
      example: '01'
    },
    G: {
      description: 'week-based year',
      example: '2001'
    },
    h: {
      description: 'abbreviated month name',
      aliases: ['%b'],
      example: 'Aug',
      localized: true
    },
    H: {
      description: 'hour in 24h format',
      range: ['00', '23'],
      example: '14'
    },
    I: {
      description: 'hour in 12h format',
      range: ['01', '12'],
      example: '02'
    },
    j: {
      description: 'day of the year',
      range: ['001', '366'],
      example: '235'
    },
    m: {
      description: 'month as a decimal number',
      range: ['01', '12'],
      example: '08'
    },
    M: {
      description: 'minute',
      range: ['00', '59'],
      example: '55'
    },
    n: {
      description: 'new-line character',
      example: '\n'
    },
    p: {
      description: 'AM or PM designation',
      example: 'PM'
    },
    r: {
      description: '12-hour clock time',
      example: '02:55:02 pm',
      localized: true
    },
    R: {
      description: '24-hour HH:MM time',
      example: '14:55',
      aliases: ['%H:%M']
    },
    S: {
      description: 'second',
      range: ['00', '61'],
      example: '02'
    },
    t: {
      description: 'horizontal-tab character',
      example: '\t'
    },
    T: {
      description: 'ISO 8601 time format (HH:MM:SS)',
      aliases: ['%H:%M:%S'],
      example: '14:55:02'
    },
    u: {
      description: 'ISO 8601 weekday as number with Monday as 1',
      range: [1, 7],
      example: 4
    },
    U: {
      description: 'week number with the first Sunday as the first day of week one',
      range: ['00', '53'],
      example: '33'
    },
    V: {
      description: 'ISO 8601 week number',
      range: ['00', '53'],
      example: '34'
    },
    w: {
      description: 'weekday as a decimal number with Sunday as 0',
      range: [0, 6],
      example: 4
    },
    W: {
      description: 'week number with the first Monday as the first day of week one',
      range: ['00', '53'],
      example: '34'
    },
    x: {
      description: 'date representation',
      example: '08/23/01',
      localized: true
    },
    X: {
      description: 'time representation',
      example: '14:55:02',
      localized: true
    },
    y: {
      description: 'year, last two digits',
      range: ['00', '99'],
      example: '01'
    },
    Y: {
      description: 'year',
      example: 2001
    },
    z: {
      description: 'ISO 8601 offset from UTC in timezone (1 minute=1, 1 hour=100)',
      example: '+100'
    },
    Z: {
      description: 'timezone name or abbreviation',
      example: 'CDT'
    }
  };

  module.exports = function(date) {
    var component, expansion, format, formatted, spec;
    date = date || this || new Date();
    expansion = {};
    for (component in components) {
      spec = components[component];
      format = '%' + component;
      formatted = (typeof spec.get === "function" ? spec.get(date) : void 0) || strftime(format, date);
      expansion[component] = formatted;
    }
    return expansion;
  };

  module.exports.components = components;

}).call(this);
