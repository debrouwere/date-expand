strftime = require 'strftime'


SECOND = 1000
MINUTE = SECOND * 60
HOUR = MINUTE * 60
DAY = HOUR * 24
WEEK = DAY * 7
MONTH = WEEK * 4.345
YEAR = WEEK * 52

milliseconds = (n) -> n
seconds      = (n) -> n * SECOND
minutes      = (n) -> n * MINUTE
hours        = (n) -> n * HOUR
days         = (n) -> n * DAY
weeks        = (n) -> n * WEEK
years        = (n) -> n * YEAR


delta = (a, b) ->
    b ?= new Date()
    Math.abs a - b


age =
    tally:
        years:
            get: (date) ->
                Math.floor years delta date
        months:
            get: (date) ->
                Math.floor months delta date
        weeks:
            get: (date) ->
                Math.floor weeks delta date
        days:
            get: (date) ->
                Math.floor days delta date
        hours:
            get: (date) ->
                Math.floor hours delta date
        minutes:
            get: (date) ->
                Math.floor seconds delta date
        seconds:
            get: (date) ->
                Math.floor seconds delta date
    years:
        get: (date) ->
            Math.floor years delta date
    months:
        get: (date) ->
            Math.floor months (delta date) % YEAR
    weeks:
        get: (date) ->
            Math.floor weeks (delta date) % MONTHS
    days:
        get: (date) ->
            Math.floor days (delta date) % WEEKS
    hours:
        get: (date) ->
            Math.floor hours (delta date) % DAYS
    minutes:
        get: (date) ->
            Math.floor hours (delta date) % HOURS
    seconds:
        get: (date) ->
            Math.floor hours (delta date) % MINUTES


components = 
    human: 
        description: 'a string representation of the date in American English'
        example: ''
        get: (date) -> date.toString()
    path:
        description: 'short YYYY/MM/DD date, suitable as a filesystem path'
        aliases: ['%Y/%m/%d']
        get: (date) -> strftime '%Y/%m/%d', date
    datetime:
        description: 'date and clock time'
        aliases: ['%Y-%m-%d %H:%M']
        get: (date) -> strftime '%Y-%m-%d %H:%M'
    date:
        description: 'short YYYY-MM-DD date'
        example: '2014-09-31'
        aliases: ['%Y-%m-%d']
        get: (date) -> strftime '%Y-%m-%d', date
    time:
        description: 'ISO 8601 time format (HH:MM:SS)'
        example: '13:01:00'
        aliases: ['%T']
        get: (date) -> date.toISOString()[11..18]
    clock:
        description: '24-hour HH:MM time'
        example: '13:01:00'
        aliases: ['%R']
        get: (date) -> date.toISOString()[11..15]        
    iso: 
        description: 'a string following the ISO 8601 Extended Format'
        example: ''
        aliases: ['']
        get: (date) -> date.toISOString()
    year:
        description: 'year (4 digits for 4-digit years) of the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getFullYear()
    month:
        description: 'the month (1-12) in the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getMonth() + 1
    day:
        description: 'day of the week (1-7) for the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getDate() + 1
    hours:
        description: 'hour (0-23) in the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getHours()
    minutes:
        description: 'minutes (0-59) in the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getMinutes()    
    seconds:
        description: 'seconds (0-59) in the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getSeconds()
    milliseconds:
        description: 'milliseconds (0-999) in the specified date according to local time'
        example: ''
        aliases: ['']
        get: (date) -> date.getMilliseconds()
    timestamp:
        description: 'numeric value of the specified date as the number of milliseconds since January 1, 1970, 00:00:00 UTC (negative for prior times)'
        example: ''
        aliases: ['']
        get: (date) -> date.getTime()
    unix:
        description: 'numeric value of the specified date as the number of seconds since January 1, 1970, 00:00:00 UTC (negative for prior times)'
        example: ''
        aliases: ['']
        get: (date) -> Math.floor date.getTime() / 1000
    offset:
        description: 'the time-zone offset in minutes for the current locale'
        example: ''
        get: (date) -> date.getTimezoneOffset()
    a:
        description: 'abbreviated weekday name'
        example: 'Thu'
        aliases: []
        localized: yes
    A:
        description: 'full weekday name'
        example: 'Thursday'
        localized: yes      
    b:
        description: 'abbreviated month name'
        example: 'Aug'
        localized: yes     
    B:
        description: 'full month name'
        example: 'August'
        localized: yes
    c:
        description: 'date and time representation'
        example: 'Thu Aug 23 14:55:02 2001'
        localized: yes
    C:
        description: 'century (year divided by 100 and truncated to integer)'
        range: [0, 99]
        example: 20
    d:
        description: 'day of the month, zero-padded'
        range: ['00', '31']
        example: '23'
    D:
        description: 'short MM/DD/YY date'
        example: '08/23/01'
        aliases: ['%m/%d/%y']
    e:
        description: 'day of the month, space-padded'
        range: [' 1', '31']
        example: '23'
    F:
        description: 'short YYYY-MM-DD date'
        aliases: ['%Y-%m-%d']
        example: '2001-08-23'
    g:
        description: 'week-based year, last two digits'
        range: ['00', '99']
        example: '01'
    G:
        description: 'week-based year'
        example: '2001'
    h:
        description: 'abbreviated month name'
        aliases: ['%b']
        example: 'Aug'
        localized: yes
    H:
        description: 'hour in 24h format'
        range: ['00', '23']
        example: '14'
    I:
        description: 'hour in 12h format'
        range: ['01', '12']
        example: '02'
    j:
        description: 'day of the year'
        range: ['001', '366']
        example: '235'
    m:
        description: 'month as a decimal number'
        range: ['01', '12']
        example: '08'
    M:
        description: 'minute'
        range: ['00', '59']
        example: '55'
    n:
        description: 'new-line character'
        example: '\n'
    p:
        description: 'AM or PM designation'
        example: 'PM'
    r:
        description: '12-hour clock time'
        example: '02:55:02 pm'
        localized: yes
    R:
        description: '24-hour HH:MM time'
        example: '14:55'
        aliases: ['%H:%M']
    S:
        description: 'second'
        range: ['00', '61']
        example: '02'
    t:
        description: 'horizontal-tab character'
        example: '\t'
    T:
        description: 'ISO 8601 time format (HH:MM:SS)'
        aliases: ['%H:%M:%S']
        example: '14:55:02'
    u:
        description: 'ISO 8601 weekday as number with Monday as 1'
        range: [1, 7]
        example: 4
    U:
        description: 'week number with the first Sunday as the first day of week one'
        range: ['00', '53']
        example: '33'
    V:
        description: 'ISO 8601 week number'
        range: ['00', '53']
        example: '34'
    w:
        description: 'weekday as a decimal number with Sunday as 0'
        range: [0, 6]
        example: 4
    W:
        description: 'week number with the first Monday as the first day of week one'
        range: ['00', '53']
        example: '34'
    x:
        description: 'date representation'
        example: '08/23/01'
        localized: yes
    X:
        description: 'time representation'
        example: '14:55:02'
        localized: yes
    y:
        description: 'year, last two digits'
        range: ['00', '99']
        example: '01'
    Y:
        description: 'year'
        example: 2001
    z:
        description: 'ISO 8601 offset from UTC in timezone (1 minute=1, 1 hour=100)'
        example: '+100'
    Z:
        description: 'timezone name or abbreviation'
        example: 'CDT'


module.exports = (date) ->
    date = date or this or new Date()
    expansion = {}
    for component, spec of components
        format = '%' + component
        formatted = (spec.get? date) or strftime format, date
        expansion[component] = formatted
    expansion


module.exports.components = components
