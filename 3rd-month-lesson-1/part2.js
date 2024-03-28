// 2.1-masala
// 1. Foydalanuvchidan yoshini so'rang
// 2. Agar foydalanuvchi son kiritmagan bo'lsa "Son kiritmadingiz" deb ayting
// 3. Agarda manfiy son kiritgan bo'lsa uni musbatga o'girib oling, ya'ni -10 kiritsa shu 10 ga aylantirib olishingiz kerak.
// 4. Yakunda "Siz " + yosh " yoshdasiz" deb javob qaytaring (3 -> "Siz 3 yoshdasiz", -4 -> "Siz 4 yoshdasiz")

// code:
// let yosh = Number(prompt("Son kiriting"));

// if (Number.isNaN(yosh)) {
//   alert("Son kiritmadingiz");
// } else if (yosh < 0) {
//   yosh = Math.abs(yosh);
//   alert(`Siz ${yosh} yoshdasiz`);
// }

// -----------------------------------------------------
// 2.2-masala
//     Shunday kod yozingki foydalanuvchi kiritgan qiymatga quidagicha javob qaytarsin
//     Loyihaga nima kiritilsa nima qaytarishi kerakligiga misollar
//     - 1.5 kiritsa 2 qaytarsin
//     - 9.99 kiritsa 10 qaytarsin
//     - 1 kiritilsa 1 qaytarsin
//     Ya'ni natural bo'lmagan ratsional sonni o'zidan yuqoridagi eng yagin natural songa yahlidlasin.

// code:
// let number = Number(prompt("Son kiriting"));

// if (Number.isNaN(number)) {
//   alert("Son kiritmadingiz");
// } else {
//   let result = String(
//     Math.floor(number - Math.floor(number) ? number + 1 : number)
//   );
//   alert(String(Math.floor(number - Math.floor(number) ? number + 1 : number)));
// }

// -----------------------------------------------------
// 2.3-masala
//     Muammo:
//     Maxsulot narxi 4.99 dollar.
//     Agarda shu maxsulotdan 5 dona sotib olinsa console.log(4.99 * 5); // -> 24.950000000000003
//     Lekin bilamizki "Sizdan 24.950000000000003 dollar bo'ldi." deya olmaymiz.

//     Yechim:
//     Maxsulot narxini foydalanuvchidan so'rang (bu butun bo'lmagan son bo'lishi mumkin)
//     Maxsulot miqdorini so'rang, agar 4.3 kiritilsa uni 4 qilib olib keting.
//     Maxsulot narxi va uning miqdori kiritilsa jami miqdorni chiqaradigan dastur tuzing

//     Qanday ishlaydi:
//     (narx 4.99, miqdor 5) kiritilsa "Jami: 24.95" ni qaytarsin
//     (narx 2.50, miqdor 3) kiritilsa "Jami: 7.50" ni qaytarsin
//     (narx 10.75, miqdor 2) kiritilsa "Jami: 21.50" ni qaytarsin
//     (narx 7.99, miqdor 4) kiritilsa "Jami: 31.96" ni qaytarsin
//     (narx 3.25, miqdor 6) kiritilsa "Jami: 19.50" ni qaytarsin

// code:
// function jamiMiqdor(narxI, miqdorI) {
//   let narx = Number(narxI);
//   let miqdor = Number(miqdorI);
//   let narxToq = Math.floor(narx * 100);
//   let jami = (narxToq * miqdor) / 100;
//   return `Jami: ${jami.toFixed(2)}`;
// }

// let narx = prompt("Maxsulot narxi:");
// let miqdor = prompt("Maxsulot midqori:");
// if (Number.isNaN(narx) || Number.isNaN(miqdor)) {
//   alert("Qiymatlardan biri son emas");
// } else {
//   alert(jamiMiqdor(narx, miqdor));
// }

