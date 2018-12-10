function getThemeLink(name) {
  var link = document.getElementById("theme-link-" + name);

  if (link !== null) {
    return link.dataset.link;
  }
}

function setTheme() {
  var name = window.localStorage.getItem("theme");

  if (name === null) {
    return;
  }

  themes = document.getElementsByClassName("theme-css");
  var already_exists = false;

  for (var i = 0, theme; theme = themes[i]; i++) {
    if (theme.id !== ("theme-" + name)) {
      theme.remove();
    } else {
      already_exists = true;
    }
  }

  if (!already_exists) {
    if (name === "user") {
      var content = window.localStorage.getItem("themeContent");
      var theme = document.createElement("style");
      theme.innerHTML = content;
    } else {
      var link = getThemeLink(name);
      var theme = document.createElement("link");
      theme.setAttribute("rel", "stylesheet");
      theme.setAttribute("type", "text/css");
      theme.setAttribute("href", link);
    }
    theme.setAttribute("id", "theme-" + name);
    theme.setAttribute("class", "theme-css");

    hljs.initHighlighting();

    document.getElementsByTagName("head")[0].appendChild(theme);
  }
}

function changeTheme(name) {
  window.localStorage.setItem("theme", name);
  setTheme();
}

function setUserTheme() {
  window.localStorage.setItem("theme", "user");

  if (window.localStorage.getItem("themeContent") === null) {
    window.localStorage.setItem("themeContent", "");
  }

  setTheme();
}

window.addEventListener("load", setTheme);
