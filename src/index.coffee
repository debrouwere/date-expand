components = 
    datetime: 
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    date:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    time:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    iso: 
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    year:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    month:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    day:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    hours:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    seconds:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    milliseconds:
        description: ''
        example: ''
        aliases: ['']
        get: (date) ->
    a:
        description: 'abbreviated weekday name'
        example: 'Thu'
        aliases: []
        localized: yes
        get: (date) ->
    A:
        description: 'full weekday name'
        example: 'Thursday'
        localized: yes
        get: (date) ->        
    b:
        description: 'abbreviated month name'
        example: 'Aug'
        localized: yes
        get: (date) ->        
    B:
        description: 'full month name'
        example: 'August'
        localized: yes
        get: (date) ->
    c:
        description: 'date and time representation'
        example: 'Thu Aug 23 14:55:02 2001'
        localized: yes
        get: (date) ->
    C:
        description: 'century (year divided by 100 and truncated to integer)'
        range: [0, 99]
        example: 20
        get: (date) ->
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
        get: (date) ->
    F:
        description: 'short YYYY-MM-DD date'
        aliases: ['%Y-%m-%d']
        example: '2001-08-23'
        get: (date) ->
    g:
        description: 'week-based year, last two digits'
        range: ['00', '99']
        example: '01'
        get: (date) ->
    G:
        description: 'week-based year'
        example: '2001'
        get: (date) ->
    h:
        description: 'abbreviated month name'
        aliases: ['%b']
        example: 'Aug'
        localized: yes
        get: (date) ->
    H:
        description: 'hour in 24h format'
        range: ['00', '23']
        example: '14'
        get: (date) ->
    I:
        description: 'hour in 12h format'
        range: ['01', '12']
        example: '02'
        get: (date) ->
    j:
        description: 'day of the year'
        range: ['001', '366']
        example: '235'
        get: (date) ->
    m:
        description: 'month as a decimal number'
        range: ['01', '12']
        example: '08'
        get: (date) ->
    M:
        description: 'minute'
        range: ['00', '59']
        example: '55'
        get: (date) ->
    n:
        description: 'new-line character'
        example: '\n'
        get: (date) -> '\n'
    p:
        description: 'AM or PM designation'
        example: 'PM'
        get: (date) ->
    r:
        description: '12-hour clock time'
        example: '02:55:02 pm'
        localized: yes
        get: (date) ->
    R:
        description: '24-hour HH:MM time'
        example: '14:55'
        aliases: ['%H:%M']
        get: (date) ->
    S:
        description: 'second'
        range: ['00', '61']
        example: '02'
        get: (date) ->
    t:
        description: 'horizontal-tab character'
        example: '\t'
        get: (date) -> '\t'
    T:
        description: 'ISO 8601 time format (HH:MM:SS)'
        aliases: ['%H:%M:%S']
        example: '14:55:02'
        get: (date) ->
    u:
        description: 'ISO 8601 weekday as number with Monday as 1'
        range: [1, 7]
        example: 4
        get: (date) ->
    U:
        description: 'week number with the first Sunday as the first day of week one'
        range: ['00', '53']
        example: '33'
        get: (date) ->
    V:
        description: 'ISO 8601 week number'
        range: ['00', '53']
        example: '34'
        get: (date) ->
    w:
        description: 'weekday as a decimal number with Sunday as 0'
        range: [0, 6]
        example: 4
        get: (date) ->
    W:
        description: 'week number with the first Monday as the first day of week one'
        range: ['00', '53']
        example: '34'
        get: (date) ->
    x:
        description: 'date representation'
        example: '08/23/01'
        localized: yes
        get: (date) ->
    X:
        description: 'time representation'
        example: '14:55:02'
        localized: yes
        get: (date) ->
    y:
        description: 'year, last two digits'
        range: ['00', '99']
        example: '01'
        get: (date) ->
    Y:
        description: 'year'
        example: 2001
        get: (date) ->
    z:
        description: 'ISO 8601 offset from UTC in timezone (1 minute=1, 1 hour=100)'
        example: '+100'
        get: (date) ->
    Z:
        description: 'timezone name or abbreviation'
        example: 'CDT'
        get: (date) ->


module.exports = (date) ->
    date = date or this or new Date()
    expansion = {}
    for component, spec of components
        expansion[component] = spec.get date
    expansion


module.exports.components = components
