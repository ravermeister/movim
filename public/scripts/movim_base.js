/**
 * Movim Base
 *
 * Some basic functions essential for Movim
 */

var onloaders = [];
var onfocused = [];
var isFocused = false;
var isTouch = false;

/**
 * @brief Adds a function to the onload event
 * @param function func
 */
function movimAddOnload(func) {
    if (typeof(func) === "function") {
        onloaders.push(func);
    }
}

/**
 * @brief Adds a function to focus event
 * @param function func
 */
function movimAddFocus(func) {
    if (typeof(func) === "function") {
        onfocused.push(func);
    }
}

/**
 * @brief Function that is run once the page is loaded.
 */
document.addEventListener("DOMContentLoaded", () => {
    for (var i = 0; i < onloaders.length; i++) {
        onloaders[i]();
    }
});

/**
 * The focus event doesn't seems to be triggered all the time ¯\_(ツ)_/¯
 */
var onFocusedFunction = function() {
    if (isFocused) return;

    isFocused = true;
    for (var i = 0; i < onfocused.length; i++) {
        onfocused[i]();
    }
};

window.addEventListener('mouseover', onFocusedFunction);
window.addEventListener('focus', onFocusedFunction);
window.addEventListener('blur', function() { isFocused = false; });
window.addEventListener('ontouchstart', function() { isTouch = true; }, { once: true });