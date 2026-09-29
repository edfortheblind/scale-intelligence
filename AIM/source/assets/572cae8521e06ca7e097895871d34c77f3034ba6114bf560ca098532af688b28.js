/*!
 * Copyright MadCap Software
 * http://www.madcapsoftware.com/
 * Unlicensed use is strictly prohibited
 *
 * v19.1.8677.41286
 */

(function () {
    var _FeedbackController = null;
    var _CommentLengthExceededMessage = null;
    var _AnonymousCommentsEnabled = false;
    var _HelpSystem = null;
    var _OutputAnalyticsTopicID = MadCap.Dom.Dataset(document.documentElement, "mcOutputAnalyticsTopicId");
    var _OutputAnalyticsController = null;

    MadCap.Topic = MadCap.CreateNamespace("Topic");

    MadCap.WebHelp.HelpSystem.LoadHelpSystemDefault().done(function (helpSystem) {
        _HelpSystem = helpSystem;

        if (_HelpSystem && _HelpSystem.LiveHelpEnabled) {
            // Request the CSHID from the parent frame
            MadCap.Utilities.MessageBus.PostMessageRequest(parent, "get-csh-id", null, function (data) {
                var cshid = data != null ? data[0] : null;

                if (_HelpSystem.IsCentralLiveHelpServerType()) {
                    _OutputAnalyticsController = MadCap.WebHelp.LoadOutputAnalyticsController(_HelpSystem.OutputAnalyticsServer);

                    if (_OutputAnalyticsTopicID != null) {
                        //Log the topic view
                        _OutputAnalyticsController.LogTopic(_OutputAnalyticsTopicID, cshid);
                    }
                }
                else {
                    InitFeedbackController(cshid);
                }
            });
        }
    });

    MadCap.Topic.ShowFeedback = ShowFeedback;

    function IsCommunityDisabled() {
        var communityFeatures = $(document.documentElement).attr('data-mc-community-features');
        return communityFeatures && communityFeatures.toLowerCase() == "disabled";
    }

    function ShowFeedback() {
        var $feedbackWrapper = $(".feedback-comments-wrapper");
        if (_HelpSystem && _HelpSystem.IsResponsive && parent != window) {
            $feedbackWrapper.addClass("feedback-embedded");
            MadCap.Utilities.MessageBus.PostMessageRequest(parent, "get-parent-window-width", null, function (data) {
                var width = parseInt(data[0]);

                if (_HelpSystem.IsTabletLayout(width)) {
                    if (!$feedbackWrapper.hasClass("responsive"))
                        $feedbackWrapper.addClass("responsive");
                }
                else {
                    if ($feedbackWrapper.hasClass("responsive"))
                        $feedbackWrapper.removeClass("responsive");
                }
            });
        }
        else {
            if ($feedbackWrapper.hasClass("responsive"))
                $feedbackWrapper.removeClass("responsive");
        }
    }

    function InitFeedbackController(cshid) {
        _FeedbackController = MadCap.WebHelp.LoadFeedbackController(_HelpSystem.LiveHelpServer);
        _FeedbackController.Init(function () {
            if (_FeedbackController.FeedbackActive) {

                if (_TopicID != null) {
                    $(document.documentElement).addClass('has-topic');

                    // Log the topic view
                    _FeedbackController.LogTopic(_TopicID, cshid, function () {
                        if (!MadCap.Topic.IsTopicPopup() && !MadCap.Topic.IsTemplateTopic() && !IsCommunityDisabled()) {
                            if (!_FeedbackController.PulseEnabled) { // using Feedback Server
                                InitNonPulseFeedback();
                            }
                            else if (_FeedbackController.PulseActive) {
                                InitPulseFeedback();
                            }
                        }
                    });
                }
            }
        });
        ShowFeedback();
    }

    function InitNonPulseFeedback() {
        var $feedbackWrapper = $(".feedback-comment-wrapper");
        $feedbackWrapper.removeClass("hidden");

        _CommentLengthExceededMessage = $("#new-comment-form").attr("data-comment-length-exceeded-message")
            || "The maximum comment length was exceeded by {n} characters.";

        // If anonymous comments are enabled, the username field will be displayed.
        _FeedbackController.GetAnonymousEnabled(_HelpSystem.LiveHelpOutputId, function (anonEnabled) {
            _AnonymousCommentsEnabled = anonEnabled;

            if (anonEnabled)
                $(document.documentElement).addClass("feedback-anonymous-enabled");
        });

        var username = MadCap.Utilities.Store.getItem("LiveHelpUsername");
        $(".username").val(username);

        // Hook up the comment submit button handler
        $(".comment-submit").click(CommentSubmit_Click);

        // Hook up the reply comment button handler (using event delegation)
        $(".feedback-comments-wrapper .comments").on("click", ".reply-comment-button", ReplyComment_Click);

        // Get topic comments
        RefreshComments();
    }

    function InitPulseFeedback() {
        GetPulsePath(function (path) {
            if (path) {
                var src = _FeedbackController.PulseServer + path;
                SetPulseFrameSrc(src);
            }
            else {
                _FeedbackController.GetPulseStreamID(_TopicID, function (streamID) {

                    if (streamID == "00000000-0000-0000-0000-000000000000") {
                        return;
                    }
                    var src = _FeedbackController.PulseServer + "streams/" + streamID + "/activities?frame=stream";
                    SetPulseFrameSrc(src);
                });
            }
        });

        var serverUrl = new MadCap.Utilities.Url(_FeedbackController.PulseServer);
        MadCap.Utilities.MessageBus.AddVerifiedOrigin(serverUrl.Origin);
    }

    function ReplyComment_Click(e) {
        e.preventDefault();

        var $formParent = $(this).closest(".comment");

        if ($formParent.children(".comment-form-wrapper")[0] != null)
            return;

        // create a copy of the new comment form and append it to the end of the current comment

        var $newForm = $("#new-comment-form").clone();
        $newForm.attr("id", null);
        $newForm.children(".comment-submit").click(CommentSubmit_Click);
        $formParent.children(".buttons").after($newForm);
        $newForm.hide().slideDown();
    }

    function CommentSubmit_Click(e) {
        var $form = $(this).closest(".comment-form-wrapper");
        var userGuid = null;
        var username = $form.children(".username-field").val();
        var subject = $form.children(".subject-field").val();
        var comment = $form.find(".body-field").val();
        var parentCommentID = null;
        var $formParent = $form.parent();

        if ($formParent.hasClass("comment"))
            parentCommentID = $formParent.attr("data-mc-comment-id");

        AddComment(username, subject, comment, parentCommentID);
    }

    function AddComment(username, subject, comment, parentCommentID) {
        if (_AnonymousCommentsEnabled) {
            MadCap.Utilities.Store.setItem("LiveHelpUsername", username);

            try {
                _FeedbackController.AddComment(_TopicID, null, username, subject, comment, parentCommentID, RefreshComments);
            }
            catch (ex) {
                var message = _CommentLengthExceededMessage.replace(/{n}/g, ex.Data.ExceedAmount);
                alert(message);
            }
        }
        else {
            MadCap.Utilities.MessageBus.PostMessageRequest(parent, "login-user", null, function (data) {
                var userGuid = data[0];

                if (userGuid != null) {
                    try {
                        _FeedbackController.AddComment(_TopicID, userGuid, username, subject, comment, parentCommentID, RefreshComments);
                    }
                    catch (ex) {
                        var message = _CommentLengthExceededMessage.replace(/{n}/g, ex.Data.ExceedAmount);
                        alert(message);
                    }
                }
            });
        }
    }

    function RefreshComments() {
        MadCap.Utilities.MessageBus.PostMessageRequest(parent, "get-user-guid", null, function (data) {
            var userGuid = data[0];

            _FeedbackController.GetTopicComments(_TopicID, userGuid, null, function (commentsXml) {
                var xmlDoc = MadCap.Utilities.Xhr.LoadXmlString(commentsXml);
                var $comments = $(".comments");
                $comments.children().not(".mc-template").remove();

                BuildComments(xmlDoc.documentElement, $comments);
            });
        });
    }

    function BuildComments(xmlNode, htmlContainerNode) {
        var $xmlCommentNodes = $(xmlNode).children("Comment");
        var $commentTemplate = $(".comments .comment.mc-template");

        for (var i = 0, length = $xmlCommentNodes.length; i < length; i++) {
            var $xmlCommentNode = $($xmlCommentNodes[i]);
            var xmlUsername = $xmlCommentNode.attr("User");
            var xmlTimestamp = $xmlCommentNode.attr("DateUTC") || $xmlCommentNode.attr("Date"); // Feedback V1 used "Date", V2 uses "DateUTC". We could do a version check, but simply checking for the attribute is easier.
            var xmlSubject = $xmlCommentNode.attr("Subject");
            var xmlCommentID = $xmlCommentNode.attr("CommentID");
            var xmlBody = $xmlCommentNode.children("Body").text();

            var $commentNode = $commentTemplate.clone();
            $commentNode.removeClass("mc-template");

            $commentNode.attr("data-mc-comment-id", xmlCommentID);
            $(".username", $commentNode).text(xmlUsername);
            $(".timestamp", $commentNode).text(xmlTimestamp);
            $(".subject", $commentNode).text(xmlSubject);
            $(".body", $commentNode).text(xmlBody);

            $(htmlContainerNode).append($commentNode);

            BuildComments($xmlCommentNode.children("Comments")[0], $commentNode);
        }
    }

    function GetPulsePath(onComplete) {
        MadCap.Utilities.MessageBus.PostMessageRequest(parent, "get-href", null, function (data) {
            var pulsePath = null;

            if (data) {
                var url = new MadCap.Utilities.Url(decodeURIComponent(data[0]));

                var href = new MadCap.Utilities.Url(url.Fragment.substring(1));
                pulsePath = url.QueryMap.GetItem('PulsePath');
            }

            onComplete(pulsePath);
        });
    }

    function SetPulseFrameSrc(src) {
        var $feedbackWrapper = $(".feedback-comments-wrapper");
        $feedbackWrapper.empty();

        var $pulseIframe = $("<iframe name='topiccomments-html5' class='pulse-frame pulse-loading' aria-label='Topic Comments' title='Topic Comments' frameborder='0'></iframe>");
        $pulseIframe.appendTo($feedbackWrapper);
        $pulseIframe.attr({
            "onload": "this.className='pulse-frame';",
            "src": src,
            "aria-label": MadCap.Accessibility.getPulseLabel()
        });

        if (!MadCap.Topic.GetHideComments())
            $feedbackWrapper.removeClass("hidden");
    }
})();