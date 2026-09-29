/*!
 * Copyright MadCap Software
 * http://www.madcapsoftware.com/
 * Unlicensed use is strictly prohibited
 *
 * v19.1.8677.41286
 */

var _HelpSystem = null;
var _CommunityLoaded = false;
var _TocPane = null;
var _IndexPane = null;
var _GlossaryPane = null;
var _BrowseSequencesPane = null;

var isTriPane = false;
var isSkinPreview;
var $lastActiveTab = null;

(function () {
    isTriPane = MadCap.Utilities.HasRuntimeFileType("TriPane");
    isSkinPreview = MadCap.Utilities.HasRuntimeFileType("SkinPreview");
    if (!isTriPane)
        return;

    MadCap.TriPane = MadCap.CreateNamespace("TriPane");

    $.extend(MadCap.TriPane, {
        AdjustTabs: AdjustTabs,
        ShowPane: ShowPane,
        LoadFile: LoadFile,
        SetActivePane: SetActivePane,
        LoadPane: LoadPane
    });

    $.extend(MadCap.SkinHelper, {
        ApplySkin: ApplySkin,
        ApplyComponentSkin: ApplyComponentSkin,
        OnLayout: OnLayout,
        SwitchPanePosition: SwitchPanePosition,
        OnHelpSystemLoad: OnHelpSystemLoad
    });

    $(document).ready(function () {
        OnDocumentReady();
    });
})();

function OnHelpSystemLoad(helpSystem) {
    _HelpSystem = helpSystem;

    if (_HelpSystem.DefaultSkin != null && !MadCap.String.IsNullOrEmpty(_HelpSystem.DefaultSkin.Tabs))
        LoadDefaultPane();

    // default to collapsed tabs on load in responsive layouts
    if (!_HelpSystem.IsResponsive && _HelpSystem.IsTabletLayout()) {
        GoHome();
    }

    MadCap.SkinHelper.SetSize(_HelpSystem.DefaultSkin);
}

function OnDocumentReady() {
    var $title = $("title");
    $title.attr("data-title", document.title);

    $lastActiveTab = $($(document).find(".tab")[0]);

    // Set up buttons
    $(".print-button").on('click', function (e) {
        if (!isSkinPreview)
            MadCap.Utilities.MessageBus.PostMessageRequest(frames["topic"], "print");
    });

    $(".expand-all-button").on('click', function (e) {
        var $this = $(this);

        if ($this.hasClass("expand-all-button"))
            MadCap.Utilities.MessageBus.PostMessageRequest(frames["topic"], "expand-all");
        else if ($this.hasClass("collapse-all-button"))
            MadCap.Utilities.MessageBus.PostMessageRequest(frames["topic"], "collapse-all");

        MadCap.Utilities.ToggleButtonState(this);
    });

    $(".remove-highlight-button").on('click', function (e) {
        MadCap.Utilities.MessageBus.PostMessageRequest(frames["topic"], "remove-highlight");
    });

    // Set up navigation tabs click handlers
    $(".tabs .tabs-nav li").on('click', NavTabs_Click);

    // Set up home button
    $("#home").on('click', GoHome);

    // Set up the resize bar
    $("#navigationResizeBar").on('mousedown', NavigationResizeBar_MouseDown);
    $("#show-hide-navigation").on('click', ShowHideNavigation_Click);
    AdjustTabs(parseInt($("#navigation").css("width")));

    $("#topic").on('load', OnTopicLoad);
}

function OnTopicLoad() {
    MadCap.Utilities.MessageBus.PostMessageRequest(frames["topic"], "get-title", null, function (data) {
        var $title = $('title');
        var defaultTitle = $title.attr("data-title");
        var newTitle = defaultTitle;

        if (!MadCap.String.IsNullOrEmpty(defaultTitle))
            newTitle += " - ";

        document.title = newTitle + data[0];
    });

    _TopicID = null;
    MadCap.FeedbackHelper.UpdateRating();
    MadCap.FeedbackHelper.UpdateCommentsInTopic();
}

function LoadTopicContent(data) {
    // loads data into parent window
    var $topicContent = $("#topicContent");
    if ($topicContent.length == 0) {
        var iframeParent = $('#topic').parent();
        iframeParent.append("<div id='topicContent'></div>");
        $topicContent = $("#topicContent");
    }
    else {
        $topicContent.empty();
    }

    $topicContent.append(data[2]);

    var headArr = $(data[1]);
    var scripts = [], cssLinks = [], stylesheets = [];
    var topicUrl = new MadCap.Utilities.Url(data[0]);
    var documentUrl = new MadCap.Utilities.Url(document.location.href);
    var relUrl = documentUrl.ToFolder().ToRelative(topicUrl);

    $.each(headArr, function (index, item) {
        if (!MadCap.String.IsNullOrEmpty(item.localName)) {
            var localName = item.localName.toLowerCase();
            if (localName == 'script') {
                var scriptUrl = new MadCap.Utilities.Url($(item).attr('src'));

                if (!scriptUrl.IsAbsolute)
                    scriptUrl = scriptUrl.ToRelative(relUrl);

                scripts.push(scriptUrl.FullPath);
            }
            else if (localName == 'link') {
                stylesheets.push(item);
            }
        }
    });

    var relUrl2 = topicUrl.ToFolder().ToRelative(documentUrl.PlainPath);
    FixLinks(stylesheets, relUrl2, 'href'); // Find the correct url for these links, we want to go up as many levels as there are "../"'s
    $.each(stylesheets, function (index, item) {
        if ($(item).attr('mc-topic-css')) {
            var href = $(item).attr('href');
            href = href.replace('.css', '-topic.css');
            cssLinks.push(href);
        }
        else
            cssLinks.push($(item).attr('href'));
    });

    MadCap.Utilities.LoadStylesheets(cssLinks, $('link[href*="Styles.css"]')[0]);
    MadCap.Utilities.LoadScripts(scripts, function () { }, function () { }, $topicContent);

    // reverse relative url for content it links to
    var docLoc = new MadCap.Utilities.Url(document.location.href);
    relUrl = topicUrl.ToFolder().ToRelative(docLoc.PlainPath);

    // fix link hrefs
    var $linksToFix = $topicContent.find('a[href][href!="javascript:void(0);"]');
    $linksToFix = $linksToFix.not('[class*="MCPopupThumbnailLink"]').not('[class*="MCTopicPopup"]');
    var $topicPopups = $topicContent.find('[class*="MCTopicPopup"]');
    var $thumbnailsToFix = $topicContent.find('a[class="MCPopupThumbnailLink"]');
    var $imagesToFix = $topicContent.find('img[src]');
    var $imageMapsToFix = $topicContent.find('area[href]');

    FixLinks($linksToFix, relUrl, 'href', '#');
    FixLinks($topicPopups, relUrl, 'href');
    FixLinks($imagesToFix, relUrl, 'src');
    FixLinks($thumbnailsToFix, relUrl, 'href');
    FixLinks($imageMapsToFix, relUrl, 'href', '#');

    // Bug fix #89522 - Always hide navigation links in this case (loading into div#topicContent)
    $(".MCWebHelpFramesetLink", $topicContent).hide();
}

function FixLinks(links, relUrl, attribute, prefix) {
    $.each(links, function (index, item) {
        var $item = $(item);
        var href = new MadCap.Utilities.Url($item.attr(attribute));

        if (!href.IsAbsolute) {
            var path = MadCap.Utilities.FixLink(href, relUrl, prefix, _HelpSystem.ContentFolder);
            $item.attr(attribute, MadCap.Utilities.EncodeHtml(path));
        }
    });
}

function AdjustTabs(width) {
    var tabs = $(".tabs-nav li");
    if (CalculateTabsWidth() === 0) return;

    $.each(tabs, function (index, item) {
        var li = $(item);
        if (li.hasClass("tab-collapsed"))
            li.removeClass("tab-collapsed");
    });
    if (width < CalculateTabsWidth() + 4) {
        for (var index = tabs.length - 1; index >= 0; index--) {
            var li = $(tabs[index]);
            li.addClass("tab-collapsed");
            if (width > CalculateTabsWidth() + 18) {
                break;
            }
        }
    }
}

function CalculateTabsWidth() {
    var width = 0;
    var tabs = $(".tabs-nav li");
    tabs.each(function (index, li) {
        var tab = $(li);
        if (tab.is(':visible')) {
            width += parseInt(tab.css("width"));
        }
    });

    return width;
}

function LoadDefaultPane() {
    var name = _HelpSystem.DefaultSkin.DefaultTab;

    if (name == "TOC")
        LoadPane("Toc");
    else
        LoadPane(name);
}

function LoadPane(name) {
    var pane = null;
    if (name == "Toc")
        pane = LoadToc();
    else if (name == "Index")
        pane = LoadIndex();
    else if (name == "Glossary")
        pane = LoadGlossary();
    else if (name == "BrowseSequences")
        pane = LoadBrowseSequences();
    else if (name == "Community")
        pane = LoadCommunity();

    if (pane || (pane && _HelpSystem.IsResponsive && !_HelpSystem.IsTabletLayout())) {
        SetActivePane(name, pane);
    }
}


function SetActivePane(name, $tabsEl) {
    var $activeTabEl = $(".tabs-nav-active", $tabsEl);
    var $newActiveTab = $("#" + name + "Tab");
    var $currentActiveDiv = $activeTabEl.closest(".tab");
    var $newActiveDiv = $newActiveTab.closest(".tab");

    // set currently active tab to inactive
    $activeTabEl.removeClass("tabs-nav-active");
    $('.tabs-nav li').addClass('tabs-nav-inactive').attr("aria-expanded", false);

    // set currently active pane to inactive
    if ($currentActiveDiv != null)
        $currentActiveDiv.removeClass("active");

    // set new tab to active
    $newActiveTab.removeClass('tabs-nav-inactive');
    $newActiveTab.addClass("tabs-nav-active").attr("aria-expanded", true);

    // set new pane to active
    if ($newActiveDiv != null)
        $newActiveDiv.addClass("active");

    if (_HelpSystem.IsResponsive && name != "Search") {
        $lastActiveTab = $(".tab.active");
    }
    else {
        $lastActiveTab = null;
    }
}

function LoadToc() {
    if (_TocPane != null)
        return;

    var $pane = $("#toc");
    if (!$pane.length)
        return;

    $pane.addClass("loading");

    var $ul = $('<ul class="tree" />');
    $pane.append($ul);

    _TocPane = new MadCap.WebHelp.TocPane("Toc", _HelpSystem, $ul[0], true);
    _TocPane.Init(function () {
        $pane.removeClass("loading");
    });

    return $pane.parent();
}

function LoadIndex() {
    if (_IndexPane != null)
        return;

    var $pane = $("#index");
    $pane.addClass("loading");

    _IndexPane = new MadCap.WebHelp.IndexPane(_HelpSystem);
    _IndexPane.Init($("#index .index-wrapper")[0], function () {
        $pane.removeClass("loading");
    });

    return $pane.parent();
}

function LoadGlossary() {
    if (_GlossaryPane != null)
        return;

    var $pane = $("#glossary");
    $pane.addClass("loading");

    _GlossaryPane = new MadCap.WebHelp.GlossaryPane(_HelpSystem);
    _GlossaryPane.Init($pane[0], function () {
        $pane.removeClass("loading");
    });

    return $pane.parent();
}

function LoadBrowseSequences() {
    if (_BrowseSequencesPane != null)
        return;

    var $pane = $("#browseSequences");
    if (!$pane.length)
        return;

    $pane.addClass("loading");

    var $ul = $('<ul class="tree" />');
    $pane.append($ul);

    _BrowseSequencesPane = new MadCap.WebHelp.TocPane("BrowseSequences", _HelpSystem, $ul[0], true);
    _BrowseSequencesPane.Init(function () {
        $pane.removeClass("loading");
    });

    return $pane.parent();
}

// called in MadCapDefault.js
function OnLayout(lastWindowWidth, firstLayout) {
    if (_HelpSystem && _HelpSystem.IsResponsive) {
        var isTabletLayout = _HelpSystem.IsTabletLayout();
        var wasTabletLayout = _HelpSystem.IsTabletLayout(lastWindowWidth);

        if (!isTabletLayout) { // desktop mode
            $("#navigation").removeAttr("role");
            $("body").removeClass("active");
            $("body").addClass("web");

            // close menu when move to web
            $("#sidebarButton").attr("aria-expanded", "false");

            if (wasTabletLayout) {
                GoHome();
            }

            // Bug fix #83772. Fixed tabs losing active class in desktop layout
            if ($lastActiveTab) {
                var $activeTab = $($lastActiveTab);

                // check if any tab has 'active' on it
                if (!$activeTab.hasClass("active")) {
                    var $activeLi = $activeTab.find("li");
                    var $li = $($activeLi[0]);

                    $li.removeClass('tabs-nav-inactive');
                    $li.addClass("tabs-nav-active").attr("aria-expanded", "true");

                    $activeTab.addClass("active");
                }
            }
            else if (!$lastActiveTab && $(document).find(".tab.active").length == 0) {
                $lastActiveTab = $($(document).find(".tab")[0]);
                SetActivePane("Toc", $lastActiveTab);
            }
        }
        else { // tablet mode
            if ($("#navigation").attr("role") !== 'undefined')
                $("#navigation").attr("role", "complementary");

            if (!wasTabletLayout || firstLayout) {
                var $activeTab = $('.tab.active');
                $lastActiveTab = $activeTab.length && $activeTab.find('li').text() != "SearchTab" ? $('.tab.active') : $lastActiveTab;
                $('.tab .tabs-nav-active').removeClass('tabs-nav-active');
                $('.tabs-nav li').addClass('tabs-nav-inactive').attr("aria-expanded", "false");
                $('.tab.active').removeClass('active');
            }

            $("body").removeClass("web");
        }

        // only want to restore panes if it goes from desktop to mobile/tablet or vice versa
        if ((isTabletLayout && !wasTabletLayout) || (!isTabletLayout && wasTabletLayout)) {
            RestorePanes();
        }
    }
    AdjustTabs(parseInt($("#navigation").css("width")));

    if (MadCap.MicroContentHelper)
        MadCap.MicroContentHelper.AdjustMicroContentContainers();
}

function LoadCommunity() {
    if (_CommunityLoaded)
        return;

    _CommunityLoaded = true;
    MadCap.FeedbackHelper.SetCommunitySource($("#community-frame-html5"));
    return $comFrame.parent();
}

var currentSelection = null;
function NavTabs_Click(e) {
    var tabID = $(this).attr("id");
    var name = tabID.substring(0, tabID.length - "Tab".length);
    currentSelection = name;

    SetActivePane(name, $(this).closest('.tabs'));

    if (_HelpSystem.IsTabletLayout() && _HelpSystem.IsResponsive) {
        var tabs = $(document).find('.tab');
        for (var i = 0; i < tabs.length; i++) {
            var $tab = $(tabs[i]);
            if (!$tab.hasClass('active')) {
                $tab.hide();
            }
            else {
                $tab.show();
            }
        }

        var $searchSidebar = $('#search-sidebar');
        var activeSearchClass = name.toLowerCase();
        $searchSidebar.removeClass('index').removeClass('glossary');
        if (activeSearchClass == 'index' || activeSearchClass == 'glossary') {
            $searchSidebar.addClass(activeSearchClass);
        }

    }

    // Load the pane
    LoadPane(name);
}

function ShowPane(pane) {
    $("#topic").css("display", pane == "topic" ? "block" : "none");
    $("#topicContent").css("display", pane == "topic" ? "block" : "none");
    $("#pulse").css("display", pane == "pulse" ? "block" : "none");
    $("#search-results").css("display", pane == "search" ? "block" : "none");
}

function NavigationResizeBar_MouseDown(e) {
    MadCap.DEBUG.Log.AddLine("nav resizeBar : mousedown");

    if ($(e.target).attr("id") == "show-hide-navigation")
        return;

    if ($(this).hasClass("nav-closed"))
        return;

    var sheetEl = document.createElement("div");
    sheetEl.setAttribute("id", "mousemove-sheet");
    document.body.appendChild(sheetEl);

    $(document).mousemove(NavigationResizeBar_MouseMove);
    $(document).mouseup(NavigationResizeBar_MouseUp);
    $(document).bind("selectstart", NavigationResizeBar_SelectStart); // For IE 8 and below only. Prevent text selection.

    e.preventDefault(); // prevent text selection
}

function NavigationResizeBar_SelectStart(e) {
    return false;
}

function NavigationResizeBar_MouseMove(e) {
    MadCap.DEBUG.Log.AddLine("nav resizeBar : mousemove : " + e.pageX);

    var panePos = $(document.documentElement).hasClass("left-layout") ? "left" : $(document.documentElement).hasClass("right-layout") ? "right" : "left";
    var width = e.pageX;

    if (panePos == "right")
        width = window.innerWidth - e.pageX;

    ResizeNavigation(width);
}

function NavigationResizeBar_MouseUp(e) {
    MadCap.DEBUG.Log.AddLine("nav resizeBar : mouseup");

    $(document).off("mousemove", NavigationResizeBar_MouseMove);
    $(document).off("mouseup", NavigationResizeBar_MouseUp);
    $(document).off("selectstart", NavigationResizeBar_SelectStart);

    // IE needs this in a setTimeout(). Otherwise, you need to click the mouse again before you can select text, resize the resize bar, etc.
    var sheetEl = $("#mousemove-sheet")[0];
    window.setTimeout(function () { sheetEl.parentNode.removeChild(sheetEl); }, 1);
}

function ShowHideNavigation_Click(e) {
    var $navigation = $("#navigation");

    if (!$navigation.hasClass("nav-closed"))
        ShowHideNavigation("hide");
    else
        ShowHideNavigation("show");
}

function LoadFile(path, href) {
    /// <summary>Loads a file into the topic pane.</summary>
    /// <param name="path">The path of the file.</param>
    $(document.documentElement).addClass('has-topic');

    ShowPane("topic");

    // IE9 Bug for loading pdfs into a frame workaround
    // http://www.digiblog.de/2011/08/ie9-bug-loading-pdfs-into-frames-using-javascript/
    try {
        //conditional tries on msie fail due to the trident signature in newer IE
        frames["topic"].location.replace(path);
    } catch (err) {
        document.getElementById("topic").src = MadCap.Utilities.EncodeHtml(path);
    }

    var tocData = _HelpSystem.GetTocData(href);

    _HelpSystem.SetBrowseSequencePath(tocData.BrowseSequencesPath, tocData.Href);

    if (_HelpSystem.SyncTOC) {
        var win = isTriPane ? window : parent;
        MadCap.Utilities.MessageBus.PostMessageRequest(win, 'sync-toc', [tocData.TocType, tocData.TocType == 'Toc' ? tocData.TocPath : tocData.BrowseSequencesPath, tocData.Href.FullPath], null);
    }
}

function GoHome() {
    var tabs = $(document).find('.tab');
    for (var i = 0; i < tabs.length; i++) {
        var $tab = $(tabs[i]);
        $tab.show();
        $tab.removeClass('active');
    }

    // reset search bar
    $("#search-sidebar").removeClass("index").removeClass("glossary");
    $(".tabs-nav-active").removeClass("tabs-nav-active");
    $(".tabs-nav li").addClass("tabs-nav-inactive").attr("aria-expanded", false);

    // reset index popups
    $(".responsive-link-list").remove();
}

function ApplySkin(skin) {
    if (skin == null)
        return;

    MadCap.SkinHelper.SetSize(skin);

    if (!MadCap.String.IsNullOrEmpty(skin.Tabs)) {
        if (skin.WebHelpOptions != null && skin.WebHelpOptions.HideNavigationOnStartup != null && (MadCap.String.ToBool(skin.WebHelpOptions.HideNavigationOnStartup, false)))
            ShowHideNavigation("hide");

        if (skin.HideNavOnStartup != null) {
            if (MadCap.String.ToBool(skin.HideNavOnStartup, false)) {
                ShowHideNavigation("hide");
                $("#contentBody").attr("data-mc-last-width", "");
                $("#navigation").attr("data-mc-last-width", "");
                $("#navigationResizeBar").attr("data-mc-last-width", "");
            } else {
                ShowHideNavigation("show");
            }
        }

        if (MadCap.SkinHelper.GetPanePosition(skin) == "Right" && !isSkinPreview)
            $(document.documentElement).removeClass("left-layout").addClass("right-layout");

        if (skin.NavigationPaneWidth != null) {
            var navWidth = MadCap.String.ToInt(skin.NavigationPaneWidth, 300);

            ResizeNavigation(navWidth);
        }

        var tabs = skin.Tabs.split(",");
        var allTabs = ["Toc", "Index", "Glossary", "BrowseSequences", "Community"];
        var $tabsEl = $(".tabs");

        for (var i = 0, length = allTabs.length; i < length; i++) {
            var tab = allTabs[i];

            var $tab = $("#" + tab + "Tab");
            if ($tab.length == 0)
                continue;

            if (tab == "Toc") tab = "TOC";

            if ($.inArray(tab, tabs) >= 0) {
                $tab.css("display", "");
                continue;
            }

            $tab.css("display", "none");

            var tabIndex = $tabsEl.children(".tabs-nav").children("li").index($tab); // can't use $tab.index() because CSS3PIE adds elements between the <li> elements in IE 8.
            var $panelEl = $tabsEl.children(".tabs-panels").children(":eq(" + tabIndex + ")");
            $tab.remove();
            $panelEl.remove();
        }

        var defaultTab = skin.DefaultTab;
        if (defaultTab == "TOC") defaultTab = "Toc";
        SetActivePane(defaultTab, $tabsEl);
        LoadPane(defaultTab);
    }

    if (skin.Toolbar != null && MadCap.String.IsNullOrEmpty(skin.Toolbar.Buttons)) {
        $(".buttons").remove();
    }

    if (isTriPane && _HelpSystem && _HelpSystem.DefaultSkin != skin) {
        var currentLogoPath = $("a.homeLink").attr("href");
        currentLogoPath += ("?skinName=" + skin.SkinID);
        $("a.homeLink").attr("href", currentLogoPath);
    }

    MadCap.SkinHelper.ApplySkinClass(skin, _HelpSystem);
    MadCap.SkinHelper.ApplyLogoUrl(skin);
    MadCap.SkinHelper.SwitchPanePosition(skin);
}

function ApplyComponentSkin(skin) {
    if (skin == null) return;

    MadCap.SkinHelper.ApplyMicroContentSkin(skin);
}

function ShowHideNavigation(which) {
    var panePos = $(document.documentElement).hasClass("left-layout") ? "left" : $(document.documentElement).hasClass("right-layout") ? "right" : "left";

    var $navigation = $("#navigation");
    var $navigationResizeBar = $("#navigationResizeBar");
    var $contentBody = $("#contentBody");
    var $button = $("#show-hide-navigation");

    if (which == "show") {
        $navigationResizeBar.css(panePos, $navigationResizeBar.attr("data-mc-last-width"));
        var contentBodyPos = $contentBody.attr("data-mc-last-width");
        // case for switching to responsive when nav pane is hidden
        if (contentBodyPos == $contentBody.css('left')) {
            contentBodyPos = $navigation.innerWidth() + $navigationResizeBar.innerWidth() + 1; // 1 for padding
            $contentBody.attr("data-mc-last-width", contentBodyPos + "px");
        }
        else {
            $contentBody.css(panePos, contentBodyPos);
        }

        $navigation.removeClass("nav-closed");
        $navigationResizeBar.removeClass("nav-closed");
        $contentBody.removeClass("nav-closed");

        $button.attr("aria-expanded", "true");

        if (_HelpSystem.IsResponsive)
            RestorePanes();
    }
    else if (which == "hide") {
        $contentBody.attr("data-mc-last-width", $contentBody.css(panePos)); // store current position
        //$contentBody.css(panePos, "5px");
        $contentBody.removeAttr("style");

        $navigationResizeBar.attr("data-mc-last-width", $navigationResizeBar.css(panePos)); // store current position
        $navigationResizeBar.css(panePos, 0);

        $navigation.attr("data-mc-last-width", $navigation.css('width')); // store current width

        $navigation.addClass("nav-closed");
        $navigationResizeBar.addClass("nav-closed");
        $contentBody.addClass("nav-closed");

        $button.attr("aria-expanded", "false");
    }
}

function ResizeNavigation(width) {
    var panePos = $(document.documentElement).hasClass("left-layout") ? "left" : $(document.documentElement).hasClass("right-layout") ? "right" : "left";

    if (panePos == "left") {
        if (width < 175 || width > (window.innerWidth * 0.85))
            return;
    }
    else if (panePos == "right") {
        if (width < (window.innerWidth * 0.15) || width > (window.innerWidth - 175))
            return;
    }

    AdjustTabs(width);

    $("#navigationResizeBar").css(panePos, width + "px");
    $("#navigation").css("width", width + "px");
    $("#contentBody").css(panePos, (width + 5) + "px")
}

function RestorePanes() {
    var panePos = $(document.documentElement).hasClass("left-layout") ? "left" : $(document.documentElement).hasClass("right-layout") ? "right" : "left";

    var $navigation = $("#navigation");
    var $contentBody = $("#contentBody");
    var $navResizeBar = $("#navigationResizeBar");

    var noStyle = !$navigation.attr('style') || !$contentBody.attr('style');
    var noLastWidth = !$navigation.attr('data-mc-last-width') || !$contentBody.attr('data-mc-last-width');

    if (noStyle && noLastWidth)
        return;

    if (!_HelpSystem.IsTabletLayout()) {
        var navWidth = $navigation.attr("data-mc-last-width");
        if (navWidth) {
            $navigation.css("width", navWidth);

            var contentWidth = $contentBody.attr("data-mc-last-width");
            if (contentWidth)
                $contentBody.css(panePos, contentWidth);
        }
    }
    else {
        var navWidth = $navigation.css("width");
        if (navWidth) {
            $navigation.attr("data-mc-last-width", navWidth);

            $navigation.removeAttr("style");

            var contentWidth = $contentBody.css(panePos);
            if (contentWidth)
                $contentBody.attr("data-mc-last-width", contentWidth);

            $contentBody.removeAttr("style");
        }
    }
}

function SwitchPanePosition(skin) {
    var position = MadCap.SkinHelper.GetPanePosition(skin);
    if (isTriPane) {
        if (position == "Right") {
            $("html").removeClass("left-layout").addClass("right-layout");
        } else {
            $("html").removeClass("right-layout").addClass("left-layout");
        }
    }
}