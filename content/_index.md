---
title: "~/home"
menu: "main"
weight: 1
---

A small website where I will add my things, little by little. Stay tuned!

visitor count: <span id="hits"></span>

<script>
function updateCounter(){
    fetch('https://nh7z1vrubc.execute-api.us-east-1.amazonaws.com/prod',{
        method: 'GET'
    })
    .then(response => {
        if (response.ok) {
            return response.json();
        } else {
            throw new Error('something went wrong');
        }
    })
    .then(data => document.getElementById("hits").innerText = data.Visit_Count);
}

// Call the function when the window loads
window.onload = updateCounter;
</script>