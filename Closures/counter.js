/**
 * @param {number} n
 * @return {Function} counter
 */
var createCounter = function (n) {
  let result;
  return function () {
    result = result !== undefined ? 1 + result : n;
    return result;
  };
};

/**
 * const counter = createCounter(10)
 * counter() // 10
 * counter() // 11
 * counter() // 12
 */
