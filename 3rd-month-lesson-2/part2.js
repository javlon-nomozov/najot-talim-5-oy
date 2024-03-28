// 2.1-masala
// 1. Foydalanuvchidan yoshini so'rang
// 2. Agar foydalanuvchi son kiritmagan bo'lsa "Son kiritmadingiz" deb ayting
// 3. Agarda manfiy son kiritgan bo'lsa uni musbatga o'girib oling, ya'ni -10 kiritsa shu 10 ga aylantirib olishingiz kerak.
// 4. Yakunda "Siz " + yosh " yoshdasiz" deb javob qaytaring (3 -> "Siz 3 yoshdasiz", -4 -> "Siz 4 yoshdasiz")

let yosh = Number(prompt("Son kiriting"));

if (Number.isNaN(yosh)) {
  alert("Son kiritmadingiz");
} else if (yosh < 0) {
  yosh = Math.abs(yosh);
  alert(`Siz ${yosh} yoshdasiz`);
}
