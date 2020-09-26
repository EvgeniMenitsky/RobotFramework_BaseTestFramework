/*
for functions which have NO return value
*/

var utils = utils || {};

(function (arguments) {
    utils.addHtmlStyle = function (attribute, style) {
        var sheet = document.createElement('style');
        sheet.innerHTML = attribute+style;
        document.body.appendChild(sheet);
    }

    utils.scrollToElementVertically = function (locator) {
        var el = getJsElementByLocator(locator);

        var scrollableNode = getScrollParent(el);
        scrollableNode != null
            ? scrollableNode.scrollTop = el.getBoundingClientRect().top - scrollableNode.clientHeight / 2
            : window.scrollTop = el.getBoundingClientRect().top - window.clientHeight / 2;

        function hasScroll(el) {
            var currentScrollPos = getScrollTop(el);
            changeScrollTop(el);
            var newScrollPos = getScrollTop(el);
            return newScrollPos != currentScrollPos;

            function getScrollTop(el) {
                return el.scrollTop ? el.scrollTop : 0;
            }

            function changeScrollTop(el) {
                try {
                    el.scrollTop = 11;
                } catch (e) {
                    // do nothing
                }
            }
        }

        function getScrollParent(el) {
            return el == null
                ? null
                : hasScroll(el)
                    ? el
                    : getScrollParent(el.parentNode);
        }
    }

    utils.scrollElementVertically = function (locator, pixelCount) {
        var el = getJsElementByLocator(locator);
        el.scrollTop += pixelCount;
    }

    utils.scrollElementHorizontally = function (locator, pixelCount) {
        var el = getJsElementByLocator(locator);
        el.scrollLeft += pixelCount;
    }

    var functionName = [].shift.call(arguments);
    utils[functionName].apply(this, arguments);

    function getJsElementByLocator(locator) {
        var explicitLocatorStrategyRegex = /([^:]+):([^:]+)/;

        function isXPath(locator) {
            return locator.startsWith('//') || locator.startsWith('(//');
        }

        function isExplicitLocator(locator) {
            return explicitLocatorStrategyRegex.test(locator);
        }

        function getElementByXPath(locator) {
            return document
                .evaluate(locator, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null)
                .singleNodeValue;
        }

        function getElementByExplicitLocator(locator) {
            var matches = explicitLocatorStrategyRegex.exec(locator);
            var key = matches[1];
            var value = matches[2];
            if (key === 'id') {
                var el = document.getElementById(value);
            } else if (key === 'name') {
                var el = document.getElementsByName(value)[0];
            } else {
                throw "Locator '" + locator + "' has unexpected format. 'id:value' and 'name:value' are only supported.";
            }

            return el;
        }

        if (isXPath(locator)) {
            var el = getElementByXPath(locator);
        }
        else if (isExplicitLocator(locator)) {
            var el = getElementByExplicitLocator(locator);
        } else {
            throw "Locator '" + locator + "' has unexpected format. xPath and Explicit Locator Strategy are only supported.";
        }

        return el;
    }
})(arguments);