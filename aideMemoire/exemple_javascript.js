function creationDiv(parent, n) {
    let d;
    for (let i=0; i<n; i++) {
        d = document.createElement("div");
        d.appendChild(parent);
    }
}
