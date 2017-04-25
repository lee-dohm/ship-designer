function deactivateAllTabs() {
  let tabs = document.querySelectorAll('ul.nav.nav-tabs li')
  tabs.forEach((element) => {
    element.classList.remove('active')
  })
}

function activateNavTab(path) {
  let tab

  deactivateAllTabs()

  if (path.startsWith('/modules')) {
    tab = document.querySelector('#modules-tab')
  } else {
    tab = document.querySelector('#home-tab')
  }

  tab.classList.add('active')
}

module.exports = activateNavTab
