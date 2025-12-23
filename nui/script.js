
function nuiCallback(url, body){

    if(typeof mode !== "undefined" && mode === "dev") return false;

    return fetch(`https://${GetParentResourceName()}/${url}`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify(body)
    }).then(resp => resp.json());
}

function renderKeybind(d){

    let keybind="";
    let action="";

    let keybindaction="";

    if(d.hasOwnProperty("keybind") && d.keybind !== "") {
        keybindaction = 'data-key="'+d.keybind+'"';
        keybind = '<div class="keybind">' + d.keybind + '</div>';
    }
    if(d.hasOwnProperty("type") && d.type === "action") action='<div class="action"><span class="action-text">Action</span></div>';

    return `
            <div class="item" ${keybindaction} data-name="${d.name}" data-resource="${d.resource}">
                <div class="header">
                    <div class="title">/${d.name}</div>
                    ${keybind}
                </div>
                <div class="bottom">
                    <div class="resource">${d.resource}</div>
                    ${action}
                </div>
            </div>
    `;

}

function sortByResource(data) {
    return [...data].sort((a, b) =>
        a.resource.localeCompare(b.resource, undefined, { sensitivity: 'base' })
    );
}

function loadInitialData(data){

    document.querySelectorAll(".key").forEach(el => {
        const isSelected = el.classList.contains("selected");
        if(isSelected) el.click();
        el.classList.remove("selected");
    });

    const container = document.querySelector("#items");
    if (!container) return;

    const sorted = sortByResource(data);

    container.innerHTML = sorted
        .map(d => renderKeybind(d))
        .join("");
}

window.addEventListener('message', (event) => {

    if(event.data.debug === true){
        console.log("[Debug] Debug enabled!");
        console.log(event);
        DEBUG=true;
    }

    if (event.data.action === 'tgm:keybinds:show') {
        loadInitialData(event.data.kc);

        document.getElementById("app").style.display = "block";

    }
});

document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
        document.getElementById("app").style.display = "none";
        nuiCallback("closeUi");
    }
});

function expandKeyboard(){
    let type=document.getElementById("keyboard-container").style.display;
    let set="none";
    let height="70vh";
    if(type === "none" || type === ""){ set="flex"; height="42vh"; }

    document.querySelectorAll(".key").forEach(el => {
        const isSelected = el.classList.contains("selected");
        if(isSelected) el.click();
        el.classList.remove("selected");
    });

    document.getElementById("keyboard-container").style.display=set;
    document.getElementById("items").style.maxHeight=height;
}

document.querySelectorAll(".key").forEach(key => {
    key.addEventListener("click", () => {

        const isSelected = key.classList.contains("selected");
        const selectedKey = key.dataset.key;

        // Clear all key selections
        document.querySelectorAll(".key").forEach(el => {
            el.classList.remove("selected");
        });

        if (!isSelected && selectedKey) {
            // Select this key
            key.classList.add("selected");

            // Hide all items first
            document.querySelectorAll(".item").forEach(item => {
                item.style.display = "none";
            });

            // Show only matching items
            document
                .querySelectorAll(`.item[data-key='${selectedKey}']`)
                .forEach(item => {
                    item.style.display = "block";
                });

        } else {
            // No key selected → show all items
            document.querySelectorAll(".item").forEach(item => {
                item.style.display = "block";
            });
        }

        if (selectedKey) {
            console.log(selectedKey);
        }
    });
});

const input  = document.getElementById('search-form');

input.addEventListener('input', (event) => {
    const query = input.value.trim().toLowerCase();
    const items = document.querySelectorAll('.item');
    items.forEach(item => {
        const resource = item.dataset.resource.toLowerCase();
        const name = item.dataset.name.toLowerCase();

        const matches =
            resource.includes(query) || name.includes(query);

        item.style.display = query === '' || matches ? '' : 'none';
    });
});