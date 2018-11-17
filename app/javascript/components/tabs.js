function deactivateTabs(tabs) {
  tabs.forEach(tab => tab.classList.remove('active'))
}

function hideTabContents(contents) {
  contents.forEach((content) => {
    content.hidden = true
  })
}

const allContents = document.querySelectorAll('.tab-content');

function switchBookingTabsOnClick() {
  const allTabs = document.querySelectorAll('.tab');

  allTabs.forEach((tab) => {
   tab.addEventListener('click', (event)=> {
    deactivateTabs(allTabs)
    hideTabContents(allContents)
    event.currentTarget.classList.add("active")
    const contentId = event.currentTarget.dataset.target.toString();
    const relevantContent = document.getElementById(contentId);
    relevantContent.hidden = false
    });
  })
}

export { switchBookingTabsOnClick };
