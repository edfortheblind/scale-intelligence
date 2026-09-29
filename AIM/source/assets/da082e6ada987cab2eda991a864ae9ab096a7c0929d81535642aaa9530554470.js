/*!
 * Copyright MadCap Software
 * http://www.madcapsoftware.com/
 * Unlicensed use is strictly prohibited
 *
 * v19.1.8677.41286
 */

(function () {
    var MessageBus = MadCap.Utilities.MessageBus;
    MessageBus._SafeList = [];

    var MESSAGE_SEPARATOR = "%%%%%";
    var DATA_SEPARATOR = "^^^^^";

    if (window.postMessage !== "undefined") {
        $(window).on("message", function (ev) {
            MessageBus.OnCrossFrameMessage(ev);
        });
    }

    MessageBus.PostMessageRequest = function (win, message, dataValues, callbackFunc) {
        MessageBus._MessageInfos[MessageBus._MessageID] = callbackFunc;

        var requestEnvelope = CreateRequestEnvelope("request", message, dataValues, MessageBus._MessageID);
        PostMessage(win, requestEnvelope);
        MessageBus._MessageID++;
    };

    MessageBus._PostMessageResponse = function (win, message, dataValues, messageID) {
        var requestEnvelope = CreateRequestEnvelope("response", message, dataValues, messageID);
        PostMessage(win, requestEnvelope);
        MessageBus._MessageID++;
    };

    MessageBus.GetIsCrossFrame = function () {
        return true;
    }

    MessageBus.OnCrossFrameMessage = function (ev) {
        var e = ev.originalEvent;

        // Check and refuse cross-origin message
        if (!MessageBus.CheckMessageOrigin(e)) {
            console.warn("Refusing to handle cross-origin message: %s", e.data);
            return;
        }

        var eInfo = GetCrossFrameEventInfo(e);
        var dataValues = GetDataValuesFromDataString(eInfo.messageDataString);

        MessageBus._OnMessage(eInfo.messageType, eInfo.message, dataValues, e.source, eInfo.messageID);
    };

    MessageBus.AddVerifiedOrigin = function (origin) {
        MessageBus._SafeList.push(origin);
    };

    MessageBus.CheckMessageOrigin = function (evt) {
        return (evt.origin === window.origin) ||
            (evt.origin === location.origin) ||
            (evt.origin === "file:" && (evt.origin === location.origin.replace(/\//g, ''))) ||
            MessageBus._SafeList.indexOf(evt.origin) > -1;
    };

    function PostMessage(win, message) {
        if (typeof win === "undefined" || win === null)
            return;

        if (win.postMessage != null) {
            win.postMessage(message, "*");
            return;
        }

        var e = { dataString: message, source: window };
        win.MadCap.Utilities.MessageBus.OnCrossFrameMessage(e);
    }

    function GetCrossFrameEventInfo(e) {
        var parts = e.data.split(MESSAGE_SEPARATOR);
        return {
            messageType: parts[0],
            message: parts[1],
            messageDataString: parts[2],
            messageID: parts[3]
        };
    }

    function GetDataValuesFromDataString(dataString) {
        var dataValues = null;
        if (!MadCap.String.IsNullOrEmpty(dataString)) {
            dataValues = dataString.split(DATA_SEPARATOR);

            for (var i = 0, length = dataValues.length; i < length; i++) {
                if (dataValues[i] == "null")
                    dataValues[i] = null;
            }
        }
        return dataValues;
    }

    function CreateDataString(dataValues) {
        var dataString = "";
        if (dataValues != null) {
            for (var i = 0, length = dataValues.length; i < length; i++) {
                if (i > 0)
                    dataString += DATA_SEPARATOR;

                dataString += dataValues[i];
            }
        }
        return dataString;
    }

    function CreateRequestEnvelope(requestType, message, dataValues, messageID) {
        var dataString = CreateDataString(dataValues);
        return requestType + MESSAGE_SEPARATOR + message + MESSAGE_SEPARATOR + dataString + MESSAGE_SEPARATOR + messageID;
    }
})();