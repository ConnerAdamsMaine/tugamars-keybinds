
/**
 * Sends a callback message to the FiveM resource
 * @param {string} url - The callback name
 * @param {object} body - The data to send
 * @returns {Promise} Response from the resource
 */
function nuiCallback(url, body) {
     if (typeof mode !== "undefined" && mode === "dev") return false;

     return fetch(`https://${GetParentResourceName()}/${url}`, {
         method: 'POST',
         headers: {
             'Content-Type': 'application/json; charset=UTF-8',
         },
         body: JSON.stringify(body)
     }).then(resp => resp.json()).catch(err => {
         console.error(`NUI callback error for ${url}:`, err);
     });
 }

/**
 * Renders a command/keybind item as HTML
 * @param {object} data - Command data with name, resource, keybind, and type
 * @returns {string} HTML markup for the item
 */
function renderKeybind(data) {
     let keybind = "";
     let action = "";
     let keybindAttr = "";

     if (data.hasOwnProperty("keybind") && data.keybind) {
         keybindAttr = `data-key="${data.keybind}"`;
         keybind = `<div class="keybind">${data.keybind}</div>`;
     }

     if (data.hasOwnProperty("type") && data.type === "action") {
         action = '<div class="action"><span class="action-text">Action</span></div>';
     }

     return `
         <div class="item" ${keybindAttr} data-name="${data.name}" data-resource="${data.resource}">
             <div class="header">
                 <div class="title">/${data.name}</div>
                 ${keybind}
             </div>
             <div class="bottom">
                 <div class="resource">${data.resource}</div>
                 ${action}
             </div>
         </div>
     `;
 }

/**
 * Sorts commands by resource name
 * @param {array} data - Array of command objects
 * @returns {array} Sorted array
 */
function sortByResource(data) {
     return [...data].sort((a, b) =>
         a.resource.localeCompare(b.resource, undefined, { sensitivity: 'base' })
     );
 }

 /**
  * Loads and displays command data in the UI
  * @param {array} data - Array of command objects
  */
 function loadInitialData(data) {
     if (!data || data.length === 0) return;

     // Clear keyboard selection
     document.querySelectorAll(".key").forEach(el => {
         if (el.classList.contains("selected")) {
             el.click();
         }
         el.classList.remove("selected");
     });

     const container = document.querySelector("#items");
     if (!container) return;

     const sorted = sortByResource(data);
     container.innerHTML = sorted.map(d => renderKeybind(d)).join("");
 }

/**
 * Handles incoming messages from the FiveM resource
 */
window.addEventListener('message', (event) => {
     if (event.data.action === 'tgm:keybinds:show') {
         loadInitialData(event.data.kc);
         const appElement = document.getElementById("app");
         if (appElement) {
             appElement.style.display = "block";
         }
     }
 });

 /**
  * Close UI on Escape key
  */
 document.addEventListener("keydown", function (event) {
     if (event.key === "Escape") {
         const appElement = document.getElementById("app");
         if (appElement) {
             appElement.style.display = "none";
         }
         nuiCallback("closeUi", {});
     }
 });

/**
 * Toggles keyboard visibility and adjusts item container height
 */
function expandKeyboard() {
     const keyboardContainer = document.getElementById("keyboard-container");
     const itemsContainer = document.getElementById("items");
     
     if (!keyboardContainer || !itemsContainer) return;

     const isHidden = keyboardContainer.style.display === "none" || keyboardContainer.style.display === "";
     
     // Clear keyboard selection
     document.querySelectorAll(".key").forEach(el => {
         if (el.classList.contains("selected")) {
             el.click();
         }
         el.classList.remove("selected");
     });

     keyboardContainer.style.display = isHidden ? "flex" : "none";
     itemsContainer.style.maxHeight = isHidden ? "42vh" : "70vh";
 }

/**
 * Handle keyboard key selection to filter items
 */
document.querySelectorAll(".key").forEach(key => {
     key.addEventListener("click", () => {
         const isSelected = key.classList.contains("selected");
         const selectedKey = key.dataset.key;

         // Clear all key selections
         document.querySelectorAll(".key").forEach(el => {
             el.classList.remove("selected");
         });

         if (!isSelected && selectedKey) {
             // Select this key and filter items
             key.classList.add("selected");
             const allItems = document.querySelectorAll(".item");
             const matchingItems = document.querySelectorAll(`.item[data-key='${selectedKey}']`);

             allItems.forEach(item => item.style.display = "none");
             matchingItems.forEach(item => item.style.display = "block");
         } else {
             // Show all items
             document.querySelectorAll(".item").forEach(item => {
                 item.style.display = "block";
             });
         }
     });
 });

 /**
  * Handle search input to filter commands
  */
 const searchInput = document.getElementById('search-form');
 if (searchInput) {
     searchInput.addEventListener('input', (event) => {
         const query = searchInput.value.trim().toLowerCase();
         const items = document.querySelectorAll('.item');

         items.forEach(item => {
             const resource = item.dataset.resource.toLowerCase();
             const name = item.dataset.name.toLowerCase();
             const matches = resource.includes(query) || name.includes(query);

             item.style.display = query === '' || matches ? '' : 'none';
         });
     });
 }