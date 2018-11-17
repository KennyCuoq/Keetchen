function deactivateTabs(tabs) {
  tabs.forEach(tab => tab.classList.remove('active'))
}

function hideTabContents(contents) {
  contents.forEach((content) => {
    content.hidden = true
  })
}

const allDateContents = document.querySelectorAll('.date-tab-content');

function switchDateTabsOnClick() {
  const allTabs = document.querySelectorAll('.date-tab');

  allTabs.forEach((tab) => {
   tab.addEventListener('click', (event)=> {
    deactivateTabs(allTabs)
    hideTabContents(allDateContents)
    event.currentTarget.classList.add("active")
    const contentId = event.currentTarget.dataset.target.toString();
    const relevantContent = document.getElementById(contentId);
    relevantContent.hidden = false
    });
  })
}

const allOrderContents = document.querySelectorAll('.order-tab-content');

function switchOrderTabsOnClick() {
  const allTabs = document.querySelectorAll('.order-tab');
  allTabs.forEach((tab) => {
   tab.addEventListener('click', (event)=> {
    console.log("WHADDUP");
    deactivateTabs(allTabs)
    hideTabContents(allOrderContents)
    event.currentTarget.classList.add("active")
    const contentId = event.currentTarget.dataset.target.toString();
    const relevantContent = document.getElementById(contentId);
    relevantContent.hidden = false
    });
  })
}



export { switchDateTabsOnClick };
export { switchOrderTabsOnClick };
