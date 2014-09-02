Expand a date into all the various representations of its constituent components, like 4-digit year, 2-digit year, month, two-digit month and so on. All strftime formats are included, and more. Use when you need serialized dates in logic-less templates.

Install with `npm install date-expand`.

Usage:

    var expandDate = require('date-expand');
    var date = new Date()
    console.log(expandDate(date));

Or monkey-patch instead:

    Object.defineProperty(Date, 'expand', {value: require('date-expand')});
    var date = new Date()
    console.log(date.expand());

Both will return an object containing various ways of representing that date: 

```javascript
{ human: 'Tue Sep 02 2014 11:10:51 GMT+0200 (CEST)',
  datetime: '2014-09-02 09:10:51',
  date: '2014-09-02',
  time: '09:10:51',
  clock: '09:10',
  iso: '2014-09-02T09:10:51.299Z',
  year: 2014,
  month: 9,
  day: 3,
  hours: 11,
  minutes: 10,
  seconds: 51,
  milliseconds: 299,
  timestamp: 1409649051299,
  unix: 1409649051,
  offset: -120,
  a: 'Tue',
  A: 'Tuesday',
  b: 'Sep',
  B: 'September',
  c: 'c',
  C: '20',
  d: '02',
  D: '09/02/14',
  e: ' 2',
  F: '2014-09-02',
  g: 'g',
  G: 'G',
  h: 'Sep',
  H: '11',
  I: '11',
  j: '245',
  m: '09',
  M: '10',
  n: '\n',
  p: 'AM',
  r: '11:10:51 AM',
  R: '11:10',
  S: '51',
  t: '\t',
  T: '11:10:51',
  u: '2',
  U: '35',
  V: 'V',
  w: '2',
  W: '35',
  x: 'x',
  X: 'X',
  y: '14',
  Y: '2014',
  z: '+0200',
  Z: 'CEST' }
```