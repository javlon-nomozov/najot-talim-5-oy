const tagName = "G` ayfaef '\"";
const encodedTagName = encodeURIComponent(tagName);
const url = `https://example.com/tags/${encodedTagName}`;
console.log(url);