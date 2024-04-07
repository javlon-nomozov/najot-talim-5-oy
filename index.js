const tagName = "G` afaef '\"";
const encodedTagName = encodeURIComponent(tagName);
const url = `https://example.com/tags/${encodedTagName}`;
console.log(url);

console.log(decodeURIComponent(encodedTagName));