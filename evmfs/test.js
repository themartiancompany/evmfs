#!/usr/bin/env node

// _list=[
//   "javascript",
//   "is",
//   "horrible"
// ]
// 
// for (_cursor in _list) {
//   console.log(
//     "cursor",
//     _cursor);
//   console.log(
//     "item",
//     _list[
//       _cursor]);
// }
// 
// const
//   _path_module =
//     require(
//       "path");
// _path_parse =
//   _path_module.parse;
// _path_join =
//   _path_module.join
// 
// _path =
//   "/ciao/orribile/javascript.420";
// 
// _dir =
//   _path_parse(
//     _path).dir;
// _filename =
//   _path_parse(
//     _path).name;
// _paths = [
//   _dir,
//   _filename
// ];
// console.log(
//   _path_join.apply(
//     null,
//     _paths));
// 
// _attempt =
//   1;
// while ( _attempt <= 100) {
//   console.log(
//     "attempt",
//     _attempt);
//   if ( _attempt <= 50 ) {
//     _attempt =
//       _attempt + 1;
//   }
//   else if ( _attempt > 50 ) {
//     break;
//   }
// }
// _printf =
//   process.stdout.write;
// 
// console.log(
//   _printf);
// _printf("test".toString());
// process.stdout.write(
//   "test");
// _printf(
//  "bleah");
//
function
  _test() {
  while (true) {
    try {
      console.error(
       "im not quitting");
      console.log(
        "So heres a message");
      throw "shit"
    } catch (e) {
      console.log(
        "console.error makes a try go to catch");
      throw e;
    }
  }
}

try {
  _test()
} catch (e) {
  console.error(
    e);
}
